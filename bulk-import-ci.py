import json
import os
import requests
import tempfile
import io
import tarfile

formsServerEndpoint = "https://api.smartforms.io/fhir"

ig_package_url = "http://build.fhir.org/ig/aehrc/smart-forms-ig/package.tgz"

implementationGuideFileName = "ImplementationGuide-csiro.fhir.au.smartforms.json"

# Define assembly instructions and
assemblyInstructionsReference = "Questionnaire/AssemblyInstructions"
assembledQuestionnaireReference = (
    "Questionnaire/AboriginalTorresStraitIslanderHealthCheck"
)

# Define colors for console output
ERROR_RED = '\033[91m'
WARNING_YELLOW = '\033[93m'
OK_GREEN = '\033[92m'

END_C = '\033[0m'

def getQuestionnairesFromPackage():
    questionnaires = {}
    implementationGuide = None

    # Download the zip file
    response = requests.get(ig_package_url)

    if response.status_code != 200:
        print(f"{ERROR_RED}ERROR: Failed to download the .tgz file. Status code: {response.status_code} {END_C}")
        return questionnaires, implementationGuide

    with tempfile.TemporaryDirectory() as temp_dir:
        # Create a BytesIO object to work with the zip data
        tgz_data = io.BytesIO(response.content)

        # Extract the zip file to the temporary directory
        with tarfile.open(fileobj=tgz_data, mode="r:gz") as tar_ref:
            tar_ref.extractall(temp_dir)

            # List the files in the temporary directory
            for root, dirs, files in os.walk(temp_dir):
                for file in files:
                    if file.startswith("Questionnaire") and file.endswith(".json"):
                        file_path = os.path.join(root, file)

                        # Open and process the JSON file
                        with open(file_path, "r", encoding="utf-8") as json_file:
                            resource = json.load(json_file)

                            # Construct reference name
                            reference = file.replace(
                                "Questionnaire-", "Questionnaire/"
                            ).replace(".json", "")

                            # Store reference and resource in dict
                            questionnaires[reference] = resource

                    if file == implementationGuideFileName:
                        file_path = os.path.join(root, file)

                        # Open and process the JSON file
                        with open(file_path, "r", encoding="utf-8") as json_file:
                            implementationGuide = json.load(json_file)
    return questionnaires, implementationGuide

# update server's root and subquestionnaire with PUT requests
def updateRootAndSubquestionnaires(questionnaires, implementationGuide):
    headers = {"Content-Type": "application/json"}

    # Iterate all resources in implementation guide
    for resource in implementationGuide["definition"]["resource"]:
        reference = resource["reference"]["reference"]

        if reference.startswith("Questionnaire"):
            # skip assembled questionnaire's reference because it doesn't exist yet
            if reference == assembledQuestionnaireReference:
                continue

            # use resources' reference from IG as key to access earlier stored questionaires
            questionnaireToBeUpdated = questionnaires[reference]

            try:
                response = requests.put(
                    f"{formsServerEndpoint}/{reference}",
                    json=questionnaireToBeUpdated,
                    headers=headers,
                )
                response.raise_for_status()

                # Check the response status code
                if str(response.status_code).startswith("2"):
                    print(
                        f"{OK_GREEN}PUT request for {reference} successful at {formsServerEndpoint}: {response.status_code} OK{END_C}"
                    )
                else:
                    print(
                        f"{ERROR_RED}ERROR: PUT request for {reference} failed with status code at {formsServerEndpoint}: {response.status_code} ERR {END_C}"
                    )

            except KeyError as e:
                print(
                    f"{ERROR_RED}ERROR: Fail to find {reference} in local files, questionnaire not updated in server. {END_C}"
                )
            except requests.exceptions.HTTPError as e:
                print(f"{ERROR_RED}ERROR: HTTP ERROR THROWN:{END_C}", e, '\n')
            except Exception as e:
                print(f"{ERROR_RED}ERROR: An error occurred, details:{END_C}", e, '\n')




def assembleQuestionnaire(questionnaires):
    rootQuestionnaire = questionnaires[assemblyInstructionsReference]
    assembleInputParams = {
        "resourceType": "Parameters",
        "parameter": [{"name": "questionnaire", "resource": rootQuestionnaire}],
    }

    try:
        response = requests.post(
            f"{formsServerEndpoint}/Questionnaire/$assemble", json=assembleInputParams
        )
        response.raise_for_status()

        # Check the response status code
        if str(response.status_code).startswith("2"):
            assembleOutputParams = response.json()

            # Return bare questionnaire
            if assembleOutputParams["resourceType"] == "Questionnaire":
                return assembleOutputParams

            # Output params is not a bare questionnaire
            try:
                assembledQuestionnaire = assembleOutputParams["parameter"][0][
                    "resource"
                ]
                return assembledQuestionnaire
            except Exception as e:
                print(
                    f"{ERROR_RED}ERROR: Unable to retrieve assembled questionnaire from output parameters{END_C}",
                    e, '\n'
                )

        else:
            print(
                f"{ERROR_RED}ERROR: $assemble failed with status code at {formsServerEndpoint}: {response.status_code} ERR {END_C}"
            )

    except requests.exceptions.HTTPError as e:
        print(f"{ERROR_RED}ERROR: HTTP ERROR THROWN:{END_C}",e, '\n')
    except Exception as e:
        print(f"{ERROR_RED}ERROR: An error occurred, details:", e, '\n')

    return None


# update assembled questionnaire on server
def updateAssembledQuestionnaire(questionnaire):
    headers = {"Content-Type": "application/json"}

    questionnaire["id"] = assembledQuestionnaireReference.replace("Questionnaire/", "")

    try:
        response = requests.put(
            f"{formsServerEndpoint}/{assembledQuestionnaireReference}",
            json=questionnaire,
            headers=headers,
        )
        response.raise_for_status()

        # Check the response status code
        if str(response.status_code).startswith("2"):
            print(
                f"{OK_GREEN} PUT request for {assembledQuestionnaireReference} successful at {formsServerEndpoint}: {response.status_code} OK{END_C}"
            )
        else:
            print(
                f"{OK_GREEN} PUT request for {assembledQuestionnaireReference} failed at {formsServerEndpoint}: {response.status_code} OK{END_C}"
            )

    except requests.exceptions.HTTPError as e:
        print(f"{ERROR_RED}ERROR: HTTP ERROR THROWN:{END_C}",e, '\n')
    except Exception as e:
        print(f"{ERROR_RED}ERROR: An error occurred, details:", e, '\n')


# Main function
def main():
    # get questionnaires from directory
    questionnaires, implementationGuide = getQuestionnairesFromPackage()

    if len(questionnaires) == 0:
        print(f"{WARNING_YELLOW}WARNING: No questionnaires found, exiting.{END_C}")
        return

    # update server's root and subquestionnaire with PUT requests
    updateRootAndSubquestionnaires(questionnaires, implementationGuide)

    # assemble questionnaire
    assembledQuestionnaire = assembleQuestionnaire(questionnaires)

    if assembledQuestionnaire != None:
        updateAssembledQuestionnaire(assembledQuestionnaire)


# Entry point of script
if __name__ == "__main__":
    main()
