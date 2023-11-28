import json
import os
import requests
import subprocess
import sys
import platform

formsServerEndpoint = "https://smartforms.csiro.au/api/fhir"
implementationGuideOutputDirectory = "output"

# Define assembly instructions and
assemblyInstructionsReference = "Questionnaire/AssemblyInstructions"
assembledQuestionnaireReference = (
    "Questionnaire/AboriginalTorresStraitIslanderHealthCheck"
)

if platform.system() == "Windows":
    # ANSI doesn't work on Windows
    HEADER = ''
    ERROR_RED = ''
    WARNING_YELLOW = ''
    OK_GREEN = ''
    INFO_BLUE = ''
    END_C = ''
else:
    # Define colors for console output
    HEADER = '\033[95m'
    ERROR_RED = '\033[91m'
    WARNING_YELLOW = '\033[93m'
    OK_GREEN = '\033[92m'
    INFO_BLUE = '\033[94m'
    END_C = '\033[0m'


HEADERS = {"Content-Type": "application/json"}

# Get questionnaire resources from a defined output directory
def getQuestionnairesFromLocalIg():
    questionnaires = {}
    implementationGuide = None

    for file in os.listdir(implementationGuideOutputDirectory):
        if file.startswith("Questionnaire") and file.endswith(".json"):
            file_path = os.path.join(implementationGuideOutputDirectory, file)

            # Open and process the JSON file
            with open(file_path, "r", encoding="utf-8") as json_file:
                resource = json.load(json_file)

                # Construct reference name
                reference = file.replace(
                    "Questionnaire-", "Questionnaire/"
                ).replace(".json", "")

                # Store reference and resource in dict
                questionnaires[reference] = resource

        if file.startswith("ImplementationGuide-") and file.endswith(".json"):
            file_path = os.path.join(implementationGuideOutputDirectory, file)

            # Open and process the JSON file
            with open(file_path, "r", encoding="utf-8") as json_file:
                implementationGuide = json.load(json_file)
    return questionnaires, implementationGuide

# update server's root and subquestionnaire with PUT requests
def updateRootAndSubquestionnaires(questionnaires, implementationGuide):
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
                    headers=HEADERS,
                )
                response.raise_for_status()

                # Check the response status code
                if str(response.status_code).startswith("2"):
                    print(
                        f"{OK_GREEN}PUT request for {reference} successful at {formsServerEndpoint}: {response.status_code} OK{END_C}"
                    )
                else:
                    print(
                        f"{ERROR_RED}ERROR: PUT request for {reference} failed at {formsServerEndpoint}: {response.status_code} ERR {END_C}"
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
            print(
                f"{OK_GREEN}POST request Questionnaire/$assemble successful at {formsServerEndpoint}: {response.status_code} OK{END_C}"
            )
            assembleOutputParams = response.json()
            print(assembleOutputParams)

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
            headers=HEADERS,
        )
        response.raise_for_status()

        # Check the response status code
        if str(response.status_code).startswith("2"):
            print(
                f"{OK_GREEN}PUT request for {assembledQuestionnaireReference} successful at {formsServerEndpoint}: {response.status_code} OK{END_C}"
            )
        else:
            print(
                f"{ERROR_RED}ERROR: PUT request for {assembledQuestionnaireReference} failed at {formsServerEndpoint}: {response.status_code} ERR{END_C}"
            )

    except requests.exceptions.HTTPError as e:
        print(f"{ERROR_RED}ERROR: HTTP ERROR THROWN:{END_C}",e, '\n')
    except Exception as e:
        print(f"{ERROR_RED}ERROR: An error occurred, details:", e, '\n')


# Main function
def main():
    if len(sys.argv) != 2 or (sys.argv[1] != "skip" and sys.argv[1] != "build"):
        print(f"Run {INFO_BLUE}python bulk-import-ci.py build{END_C} to run _genonce.sh before running the bulk import.")
        print(f"Run {INFO_BLUE}python bulk-import-ci.py skip{END_C} to run the bulk import only.")
        return


    if (sys.argv[1] == "skip"):
        print(f"{HEADER}Skipping IG build...{END_C}")
    else:
        print(f"{HEADER}Running _genonce.sh...{END_C}")
        subprocess.run(["./_genonce.sh"], shell=True)
        print(f"New IG built locally in /output.\n")

    # get questionnaires from directory
    print(f"{HEADER}Reading questionnaires from /output...{END_C}")
    questionnaires, implementationGuide = getQuestionnairesFromLocalIg()

    if len(questionnaires) == 0:
        print(f"{WARNING_YELLOW}WARNING: No questionnaires found, exiting.{END_C}")
        return


    # update server's root and subquestionnaire with PUT requests
    print(f"{HEADER}Uploading subquestionnaires...{END_C}")
    updateRootAndSubquestionnaires(questionnaires, implementationGuide)

    # assemble questionnaire
    print(f"{HEADER}Asssembling subquestionnaires...{END_C}")
    assembledQuestionnaire = assembleQuestionnaire(questionnaires)

    # update assembled questionnaire
    print(f"{HEADER}Uploading assembled questionnaire...{END_C}")
    if assembledQuestionnaire != None:
        updateAssembledQuestionnaire(assembledQuestionnaire)
    print(f"{HEADER}Bulk import done. Exiting.{END_C}")


# Entry point of script
if __name__ == "__main__":
    main()
