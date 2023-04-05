import json
import os
import requests

formsServerEndpoint = "https://api.smartforms.io/fhir"

resourceDirectory = "fsh-generated/resources"
implementationGuideFileName = "ImplementationGuide-csiro.fhir.au.smartforms.json"

# Define assembly instructions and
assemblyInstructionsReference = "Questionnaire/AssemblyInstructions"
assembledQuestionnaireReference = (
    "Questionnaire/AboriginalTorresStraitIslanderHealthCheck"
)


# Get questionnaire resources from a defined resource directory
def getQuestionnairesFromDirectory():
    questionnaires = {}
    for filename in os.listdir(resourceDirectory):
        if filename.startswith("Questionnaire") and filename.endswith(".json"):
            file_path = os.path.join(resourceDirectory, filename)

            with open(file_path, "r") as file:
                resource = json.load(file)

                # Construct reference name
                reference = filename.replace(
                    "Questionnaire-", "Questionnaire/"
                ).replace(".json", "")

                # Store reference and resource in dict
                questionnaires[reference] = resource
    return questionnaires


# update server's root and subquestionnaire with PUT requests
def updateRootAndSubquestionnaires(questionnaires):
    headers = {"Content-Type": "application/json"}

    with open(f"{resourceDirectory}/{implementationGuideFileName}", "r") as file:
        implementationGuide = json.load(file)

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
                            f"PUT request for {reference} successful at {formsServerEndpoint}:",
                            response.status_code,
                        )
                    else:
                        print(
                            f"PUT request for {reference} failed with status code at {formsServerEndpoint}:",
                            response.status_code,
                        )

                except KeyError as e:
                    print(
                        f"ERROR: Fail to find {reference} in local files, questionnaire not updated in server."
                    )
                except requests.exceptions.HTTPError as e:
                    print(e)
                except Exception as e:
                    print(f"An error occured, details:", e)


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
            try:
                assembledQuestionnaire = assembleOutputParams["parameter"][0][
                    "resource"
                ]
                return assembledQuestionnaire
            except Exception as e:
                print(
                    f"Unable to retrieve assembled questionnaire from output parameters",
                    e,
                )

        else:
            print(
                f"$assemble failed with status code at {formsServerEndpoint}:",
                response.status_code,
            )

    except requests.exceptions.HTTPError as e:
        print(e)
    except Exception as e:
        print(f"An error occured, details:", e)

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
                f"PUT request for {assembledQuestionnaireReference} successful at {formsServerEndpoint}:",
                response.status_code,
            )
        else:
            print(
                f"PUT request for {assembledQuestionnaireReference} failed at {formsServerEndpoint}:",
                response.status_code,
            )

    except requests.exceptions.HTTPError as e:
        print(e)
    except Exception as e:
        print(f"An error occured, details:", e)


# Main function
def main():
    # get questionnaires from directory
    questionnaires = getQuestionnairesFromDirectory()

    # update server's root and subquestionnaire with PUT requests
    updateRootAndSubquestionnaires(questionnaires)

    # assemble questionnaire
    assembledQuestionnaire = assembleQuestionnaire(questionnaires)

    if assembledQuestionnaire != None:
        updateAssembledQuestionnaire(assembledQuestionnaire)


# Entry point of script
if __name__ == "__main__":
    main()
