Instance: SHCHostFHIRServerCapabilityStatement
InstanceOf: CapabilityStatement
Usage: #definition
* name = "SHCHostFHIRServer"
* title = "SHC Host FHIR Server"
* description = "This CapabilityStatement describes the expected capabilities for systems to launch and exchange data with the [SHC App](CapabilityStatement-SHCAppCapabilityStatement.html) to support the [Aboriginal and Torres Strait Islander Health Check](Questionnaire-AboriginalTorresStraitIslanderHealthCheck.html). It lists the server's conformance expectations for the resource types required as a launch context, resource types required to support prepopulation of the form, resource types required to support writing back to the patient record, and QuestionnaireResponse requirements for managing form responses. These expectations include supported FHIR profiles, RESTful operations, and search parameters."
* status = #draft
* experimental = false
* date = "2025-04-16"
* publisher = "AEHRC CSIRO"
* jurisdiction = urn:iso:std:iso:3166#AU
* kind = #requirements
* fhirVersion = #4.0.1
* format[+] = #json
* format[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* format[=].extension[0].valueCode = #SHALL
* patchFormat[+] = #application/fhir+json
* patchFormat[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* patchFormat[=].extension[0].valueCode = #SHALL

* implementationGuide[+] = "http://hl7.org/fhir/smart-app-launch/ImplementationGuide/hl7.fhir.uv.smart-app-launch|2.2.0"
* implementationGuide[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* implementationGuide[=].extension[0].valueCode = #SHALL
* implementationGuide[+] = "http://hl7.org/fhir/uv/sdc/ImplementationGuide/hl7.fhir.uv.sdc"
* implementationGuide[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* implementationGuide[=].extension[0].valueCode = #SHOULD

* rest.mode = #server
* rest.documentation = "Smart Forms Launcher Server **SHALL**:
1. Support the [Smart Health Checks AllergyIntolerance resource profile](StructureDefinition-SHCAllergyIntolerance.html)
1. Support the [Smart Health Checks Condition resource profile](StructureDefinition-SHCCondition.html)
1. Support the [Smart Health Checks Encounter resource profile](StructureDefinition-SHCEncounter.html)
1. Support the [Smart Health Checks Immunization resource profile](StructureDefinition-SHCImmunization.html)
1. Support the [Smart Health Checks Medication profile](StructureDefinition-SHCMedication.html)
1. Support the [Smart Health Checks MedicationStatement profile](StructureDefinition-SHCMedicationStatement.html)
1. Support the [Smart Health Checks Observation resource profiles](profiles-and-extensions.html#observation)
1. Support the [Smart Health Checks Patient resource profile](StructureDefinition-SHCPatient.html)
1. Support the [Smart Health Checks Practitioner resource profile](StructureDefinition-SHCPractitioner.html)
1. Support the [Smart Health Checks QuestionnaireResponse resource profile](StructureDefinition-SHCQuestionnaireResponse.html)
1. Support the [Smart Health Checks Patch AllergyIntolerance profile](StructureDefinition-SHCPatchAllergyIntolerance.html)
1. Support the [Smart Health Checks Patch Condition profile](StructureDefinition-SHCPatchCondition.html)
1. Support the [Smart Health Checks Patch MedicationStatement profile](StructureDefinition-SHCPatchMedicationStatement.html)
1. Support the [Smart Health Checks Extract Bundle resource profile](StructureDefinition-SHCExtractBundle.html)
1. Implement the RESTful behavior according to the FHIR specification
1. Support JSON source formats for all interactions"

* rest.security.cors = true
* rest.security.cors.extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.security.cors.extension[0].valueCode = #SHALL
* rest.security.service = http://terminology.hl7.org/CodeSystem/restful-security-service#SMART-on-FHIR
* rest.security.service.extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.security.service.extension[0].valueCode = #SHALL
* rest.security.description = "Smart Forms Launcher Server **SHALL**:
1. Support CORS headers
1. Support SMART on FHIR security services

Also see the [AU Core Security and Privacy](https://hl7.org.au/fhir/core/1.0.0/security.html) section for general considerations and recommendations."

//AllergyIntolerance
* rest.resource[+].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].extension[0].valueCode = #SHALL
* rest.resource[=].type = #AllergyIntolerance
* rest.resource[=].supportedProfile[+] = "https://smartforms.csiro.au/ig/StructureDefinition/SHCAllergyIntolerance"
* rest.resource[=].supportedProfile[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].supportedProfile[=].extension[0].valueCode = #SHALL
* rest.resource[=].documentation = "The server **SHALL** support the AllergyIntolerance resource, the Smart Health Checks profile and the conformance expectations for the AllergyIntolerance resource."
* rest.resource[=].interaction[0].code = #search-type
* rest.resource[=].interaction[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction[0].extension[0].valueCode = #SHALL
* rest.resource[=].interaction[+].code = #create
* rest.resource[=].interaction[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction[=].extension[0].valueCode = #SHALL
* rest.resource[=].interaction[+].code = #patch
* rest.resource[=].interaction[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction[=].extension[0].valueCode = #SHALL
* rest.resource[=].searchParam[+].name = "patient"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/clinical-patient"
* rest.resource[=].searchParam[=].type = #reference
* rest.resource[=].searchParam[=].documentation = "The client **SHALL** provide at least a id value and **MAY** provide both the Type and id values. 

The server **SHALL** support both."
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[0].valueCode = #SHALL

//Bundle
* rest.resource[+].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].extension[=].valueCode = #SHALL
* rest.resource[=].type = #Bundle
* rest.resource[=].supportedProfile[+] = "https://smartforms.csiro.au/ig/StructureDefinition/SHCExtractBundle"
* rest.resource[=].supportedProfile[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].supportedProfile[=].extension[0].valueCode = #SHALL
* rest.resource[=].documentation = "The server **SHALL** support the Bundle resource, the Smart Health Checks profile listed and the conformance expectations for the Bundle resource."

//Condition
* rest.resource[+].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].extension[0].valueCode = #SHALL
* rest.resource[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest.resource[=].extension[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].extension[=].extension[=].valueCode = #SHALL
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "patient"
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "category"
* rest.resource[=].type = #Condition
* rest.resource[=].supportedProfile[+] = "https://smartforms.csiro.au/ig/StructureDefinition/SHCCondition"
* rest.resource[=].supportedProfile[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].supportedProfile[=].extension[0].valueCode = #SHALL
* rest.resource[=].documentation = "The server **SHALL** support the Condition resource, the Smart Health Checks profile and the conformance expectations for the Condition resource."
* rest.resource[=].interaction[0].code = #search-type
* rest.resource[=].interaction[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction[0].extension[0].valueCode = #SHALL
* rest.resource[=].interaction[+].code = #create
* rest.resource[=].interaction[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction[=].extension[0].valueCode = #SHALL
* rest.resource[=].interaction[+].code = #patch
* rest.resource[=].interaction[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction[=].extension[0].valueCode = #SHALL
* rest.resource[=].searchParam[+].name = "patient"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/clinical-patient"
* rest.resource[=].searchParam[=].type = #reference
* rest.resource[=].searchParam[=].documentation = "The client **SHALL** provide at least a id value and **MAY** provide both the Type and id values. 

The server **SHALL** support both."
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[0].valueCode = #MAY
* rest.resource[=].searchParam[+].name = "category"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Condition-category"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].documentation = "The client **SHALL** provide at least a code value and **MAY** provide both the system and code values. 

The server **SHALL** support both."
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[0].valueCode = #MAY

//Encounter
* rest.resource[+].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].extension[0].valueCode = #SHALL
* rest.resource[=].type = #Encounter
* rest.resource[=].supportedProfile[+] = "https://smartforms.csiro.au/ig/StructureDefinition/SHCEncounter"
* rest.resource[=].supportedProfile[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].supportedProfile[=].extension[0].valueCode = #SHALL
* rest.resource[=].documentation = "The server **SHALL** support the Encounter resource, Smart Health Checks profile and the conformance expectations for the Encounter resource."
* rest.resource[=].interaction[0].code = #read
* rest.resource[=].interaction[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction[0].extension[0].valueCode = #SHALL

//Immunization
* rest.resource[+].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].extension[0].valueCode = #SHALL
* rest.resource[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest.resource[=].extension[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].extension[=].extension[=].valueCode = #SHALL
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "patient"
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "status"
* rest.resource[=].type = #Immunization
* rest.resource[=].supportedProfile[+] = "https://smartforms.csiro.au/ig/StructureDefinition/SHCImmunization"
* rest.resource[=].supportedProfile[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].supportedProfile[=].extension[0].valueCode = #SHALL
* rest.resource[=].documentation = "The server **SHALL** support the Immunization resource, the Smart Health Checks profile and the conformance expectations for the Immunization resource."
* rest.resource[=].interaction[0].code = #search-type
* rest.resource[=].interaction[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction[0].extension[0].valueCode = #SHALL
* rest.resource[=].interaction[+].code = #create
* rest.resource[=].interaction[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction[=].extension[0].valueCode = #SHALL
* rest.resource[=].searchParam[+].name = "patient"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/clinical-patient"
* rest.resource[=].searchParam[=].type = #reference
* rest.resource[=].searchParam[=].documentation = "The client **SHALL** provide at least a id value and **MAY** provide both the Type and id values. 

The server **SHALL** support both."
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[0].valueCode = #MAY
* rest.resource[=].searchParam[+].name = "status"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Immunization-status"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].documentation = "The client **SHALL** provide at least a code value and **MAY** provide both the system and code values. 

The server **SHALL** support both."
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[0].valueCode = #MAY

//Medication
* rest.resource[+].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].extension[0].valueCode = #MAY
* rest.resource[=].type = #Medication
* rest.resource[=].supportedProfile[+] = "https://smartforms.csiro.au/ig/StructureDefinition/SHCMedication"
* rest.resource[=].supportedProfile[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].supportedProfile[=].extension[0].valueCode = #SHALL
* rest.resource[=].documentation = "If an external reference to a Medication resource is used in MedicationStatement, then the server **SHALL** support the Medication resource, the Smart Health Checks profile and the conformance expectations for the Medication resource."
* rest.resource[=].interaction[0].code = #read
* rest.resource[=].interaction[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction[0].extension[0].valueCode = #SHALL

//MedicationStatement
* rest.resource[+].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].extension[0].valueCode = #SHALL
* rest.resource[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest.resource[=].extension[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].extension[=].extension[=].valueCode = #SHALL
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "patient"
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "status"
* rest.resource[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest.resource[=].extension[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].extension[=].extension[=].valueCode = #MAY
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "patient"
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "status"
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "_include"
* rest.resource[=].type = #MedicationStatement
* rest.resource[=].supportedProfile[+] = "https://smartforms.csiro.au/ig/StructureDefinition/SHCMedicationStatement"
* rest.resource[=].supportedProfile[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].supportedProfile[=].extension[0].valueCode = #SHALL
* rest.resource[=].documentation = "The server **SHALL** support the MedicationStatement resource, the Smart Health Checks profile and the conformance expectations for the MedicationStatement resource.

If a medication in a MedicationStatement resource is represented as an external Medication resource reference, the server **SHALL** support the `_include` parameter for searching this element (`MedicationStatement:medication`)
"
* rest.resource[=].interaction[0].code = #search-type
* rest.resource[=].interaction[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction[0].extension[0].valueCode = #SHALL
* rest.resource[=].interaction[+].code = #create
* rest.resource[=].interaction[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction[=].extension[0].valueCode = #SHALL
* rest.resource[=].interaction[+].code = #patch
* rest.resource[=].interaction[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction[=].extension[0].valueCode = #SHALL
* rest.resource[=].searchInclude[+] = "MedicationStatement:medication"
* rest.resource[=].searchParam[+].name = "patient"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/clinical-patient"
* rest.resource[=].searchParam[=].type = #reference
* rest.resource[=].searchParam[=].documentation = "The client **SHALL** provide at least a id value and **MAY** provide both the Type and id values. 

The server **SHALL** support both."
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[0].valueCode = #MAY
* rest.resource[=].searchParam[+].name = "status"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/medications-status"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].documentation = "The client **SHALL** provide at least a code value and **MAY** provide both the system and code values.

The server **SHALL** support both.

The client **SHALL** support `multipleOr`.

The server **SHALL** support `multipleOr`."
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[0].valueCode = #MAY
* rest.resource[=].searchParam[+].name = "_include"
* rest.resource[=].searchParam[=].type = #reference
* rest.resource[=].searchParam[=].documentation = "If a medication in a MedicationStatement resource is represented as an external Medication resource reference, the server **SHALL** support the `_include` parameter for searching this element (`MedicationStatement:medication`).

The client **SHALL** support this method."
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[0].valueCode = #MAY

//Observation
* rest.resource[+].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].extension[=].valueCode = #SHALL
* rest.resource[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest.resource[=].extension[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].extension[=].extension[=].valueCode = #SHALL
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "patient"
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "code"
/** rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "_count"*/
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "_sort"

* rest.resource[=].type = #Observation
* rest.resource[=].supportedProfile[+] = "https://smartforms.csiro.au/ig/StructureDefinition/SHCBloodPressure"
* rest.resource[=].supportedProfile[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].supportedProfile[=].extension[0].valueCode = #SHALL
* rest.resource[=].supportedProfile[+] = "https://smartforms.csiro.au/ig/StructureDefinition/SHCBodyHeight"
* rest.resource[=].supportedProfile[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].supportedProfile[=].extension[0].valueCode = #SHALL
* rest.resource[=].supportedProfile[+] = "https://smartforms.csiro.au/ig/StructureDefinition/SHCBodyWeight"
* rest.resource[=].supportedProfile[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].supportedProfile[=].extension[0].valueCode = #SHALL
* rest.resource[=].supportedProfile[+] = "https://smartforms.csiro.au/ig/StructureDefinition/SHCHeadCircumference"
* rest.resource[=].supportedProfile[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].supportedProfile[=].extension[0].valueCode = #SHALL
* rest.resource[=].supportedProfile[+] = "https://smartforms.csiro.au/ig/StructureDefinition/SHCHeartRate"
* rest.resource[=].supportedProfile[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].supportedProfile[=].extension[0].valueCode = #SHALL
* rest.resource[=].supportedProfile[+] = "https://smartforms.csiro.au/ig/StructureDefinition/SHCHeartRhythm"
* rest.resource[=].supportedProfile[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].supportedProfile[=].extension[0].valueCode = #SHALL
* rest.resource[=].supportedProfile[+] = "https://smartforms.csiro.au/ig/StructureDefinition/SHCPathologyResult"
* rest.resource[=].supportedProfile[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].supportedProfile[=].extension[0].valueCode = #SHALL
* rest.resource[=].supportedProfile[+] = "https://smartforms.csiro.au/ig/StructureDefinition/SHCSmokingStatus"
* rest.resource[=].supportedProfile[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].supportedProfile[=].extension[0].valueCode = #SHALL
* rest.resource[=].supportedProfile[+] = "https://smartforms.csiro.au/ig/StructureDefinition/SHCWaistCircumference"
* rest.resource[=].supportedProfile[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].supportedProfile[=].extension[0].valueCode = #SHALL
* rest.resource[=].documentation = "The server **SHALL** support the Observation resource, the Smart Health Checks profiles listed and the conformance expectations for the Observation resource."
* rest.resource[=].interaction[0].code = #search-type
* rest.resource[=].interaction[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction[0].extension[0].valueCode = #SHALL
* rest.resource[=].interaction[+].code = #create
* rest.resource[=].interaction[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction[=].extension[0].valueCode = #SHALL
* rest.resource[=].searchParam[+].name = "patient"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/clinical-patient"
* rest.resource[=].searchParam[=].type = #reference
* rest.resource[=].searchParam[=].documentation = "The client **SHALL** provide at least a id value and **MAY** provide both the Type and id values. 

The server **SHALL** support both. "
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[0].valueCode = #MAY
* rest.resource[=].searchParam[+].name = "code"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/clinical-code"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].documentation = "The client **SHALL** provide at least a code value and **MAY** provide both the code and system values. 

The server **SHALL** support both."
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[0].valueCode = #MAY
/** rest.resource[=].searchParam[+].name = "_count"
* rest.resource[=].searchParam[=].type = #number
* rest.resource[=].searchParam[=].documentation = "The client and server **SHALL** support search result limiting."
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[0].valueCode = #SHALL*/
* rest.resource[=].searchParam[+].name = "_sort"
* rest.resource[=].searchParam[=].type = #string
* rest.resource[=].searchParam[=].documentation = "The client and server **SHALL** support search result sorting by date and **MAY** support other values."
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[0].valueCode = #MAY

//Parameters
* rest.resource[+].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].extension[=].valueCode = #SHALL
* rest.resource[=].type = #Parameters
* rest.resource[=].supportedProfile[+] = "https://smartforms.csiro.au/ig/StructureDefinition/SHCPatchAllergyIntolerance"
* rest.resource[=].supportedProfile[+] = "https://smartforms.csiro.au/ig/StructureDefinition/SHCPatchCondition"
* rest.resource[=].supportedProfile[+] = "https://smartforms.csiro.au/ig/StructureDefinition/SHCPatchMedicationStatement"
* rest.resource[=].supportedProfile[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].supportedProfile[=].extension[0].valueCode = #SHALL
* rest.resource[=].documentation = "The server **SHALL** support the Parameters resource, the Smart Health Checks profile and the conformance expectations for the Parameters resource."

//Patient
* rest.resource[+].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].extension[0].valueCode = #SHALL
* rest.resource[=].type = #Patient
* rest.resource[=].supportedProfile[+] = "https://smartforms.csiro.au/ig/StructureDefinition/SHCPatient"
* rest.resource[=].supportedProfile[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].supportedProfile[=].extension[0].valueCode = #SHALL
* rest.resource[=].documentation = "The server **SHALL** support the Patient resource, Smart Health Checks profile and the conformance expectations for the Patient resource."
* rest.resource[=].interaction[0].code = #read
* rest.resource[=].interaction[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction[0].extension[0].valueCode = #SHALL

//Practitioner
* rest.resource[+].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].extension[0].valueCode = #SHALL
* rest.resource[=].type = #Practitioner
* rest.resource[=].supportedProfile[+] = "https://smartforms.csiro.au/ig/StructureDefinition/SHCPractitioner"
* rest.resource[=].supportedProfile[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].supportedProfile[=].extension[0].valueCode = #SHALL
* rest.resource[=].documentation = "The server **SHALL** support the Practitioner resource, Smart Health Checks profile and the conformance expectations for the Practitioner resource."
* rest.resource[=].interaction[0].code = #read
* rest.resource[=].interaction[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction[0].extension[0].valueCode = #SHALL

//QuestionnaireResponse
* rest.resource[+].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].extension[=].valueCode = #SHALL
* rest.resource[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest.resource[=].extension[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].extension[=].extension[=].valueCode = #SHALL
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "patient"
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "_count"
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "_sort"
* rest.resource[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest.resource[=].extension[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].extension[=].extension[=].valueCode = #SHALL
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "patient"
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "_count"
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "_sort"
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "questionnaire"
* rest.resource[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest.resource[=].extension[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].extension[=].extension[=].valueCode = #SHALL
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "patient"
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "_count"
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "_sort"
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "status"
* rest.resource[=].type = #QuestionnaireResponse
* rest.resource[=].supportedProfile[+] = "https://smartforms.csiro.au/ig/StructureDefinition/SHCQuestionnaireResponse"
* rest.resource[=].supportedProfile[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].supportedProfile[=].extension[0].valueCode = #SHALL
* rest.resource[=].documentation = "The server **SHALL** support the QuestionnaireResponse resource, Smart Health Checks profile and the conformance expectations for the QuestionnaireResponse resource."
* rest.resource[=].interaction[+].code = #read
* rest.resource[=].interaction[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction[=].extension[0].valueCode = #SHALL
* rest.resource[=].interaction[+].code = #search-type
* rest.resource[=].interaction[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction[=].extension[0].valueCode = #SHALL
* rest.resource[=].interaction[+].code = #create
* rest.resource[=].interaction[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction[=].extension[0].valueCode = #SHALL
* rest.resource[=].interaction[+].code = #update
* rest.resource[=].interaction[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction[=].extension[0].valueCode = #SHALL
* rest.resource[=].versioning = #versioned-update
* rest.resource[=].versioning.extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].versioning.extension[0].valueCode = #SHALL
* rest.resource[=].searchParam[+].name = "patient"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/QuestionnaireResponse-patient"
* rest.resource[=].searchParam[=].type = #reference
* rest.resource[=].searchParam[=].documentation = "The client **SHALL** provide at least a id value and **MAY** provide both the Type and id values. 

The server **SHALL** support both. "
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[0].valueCode = #MAY
* rest.resource[=].searchParam[+].name = "questionnaire"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/QuestionnaireResponse-questionnaire"
* rest.resource[=].searchParam[=].type = #reference
* rest.resource[=].searchParam[=].documentation = "The client **SHALL** provide at least a id value and **MAY** provide both the Type and id values. 

The server **SHALL** support both.

The client and server **SHALL** support chained search questionnaire.title using the :contains modifier."
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[0].valueCode = #MAY
* rest.resource[=].searchParam[+].name = "status"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/QuestionnaireResponse-status"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].documentation = "The client **SHALL** provide at least a code value and **MAY** provide both the code and system values. 

The server **SHALL** support both."
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[0].valueCode = #MAY
* rest.resource[=].searchParam[+].name = "_count"
* rest.resource[=].searchParam[=].type = #number
* rest.resource[=].searchParam[=].documentation = "The client and server **SHALL** support search result limiting."
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[0].valueCode = #MAY
* rest.resource[=].searchParam[+].name = "_sort"
* rest.resource[=].searchParam[=].type = #string
* rest.resource[=].searchParam[=].documentation = "The client and server **SHALL** support search result sorting by authored and **MAY** support other values."
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[0].valueCode = #MAY

* rest.interaction[+].code = #transaction
* rest.interaction[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.interaction[=].extension[0].valueCode = #SHALL
* rest.interaction[=].documentation = "The server **SHALL** support the transaction interaction for all resources."


/*Remove this role
Instance: SmartFormsServer
InstanceOf: CapabilityStatement
Usage: #definition
* name = "SmartFormsServer"
* title = "Smart Forms Server"
* description = "This CapabilityStatement describes the capabilities of the Smart Forms Server. The Smart Forms Server provides a definitional repository of resources that a client application can retrieve for use in a Smart Forms context. The capabilities listed include supported FHIR profiles, RESTful operations, and search parameters."
* status = #draft
* experimental = false
* date = "2025-04-16"
* publisher = "AEHRC CSIRO"
* kind = #capability
* instantiates[+] = "http://hl7.org/fhir/uv/sdc/CapabilityStatement/sdc-form-manager"
* software
  * name = "Smart Forms Server"
* fhirVersion = #4.0.1
* format[0] = #json
* format[1] = #xml

* rest.mode = #server
* rest.documentation = "The Smart Forms Server provides interactions for hosting Questionnaire resources and the assembly of modular Questionnaires."


* rest.resource[+].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "url"
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "version"
* rest.resource[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "_count"
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "_sort"
* rest.resource[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "title"
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "_count"
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "_sort"
* rest.resource[=].type = #Questionnaire
* rest.resource[=].profile = "http://hl7.org/fhir/StructureDefinition/Questionnaire"
* rest.resource[=].supportedProfile = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire"
* rest.resource[=].supportedProfile = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-modular"
* rest.resource[=].interaction[+].code = #read
* rest.resource[=].interaction[=].code = #search-type
* rest.resource[=].searchParam[+].name = "url"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Questionnaire-url"
* rest.resource[=].searchParam[=].type = #uri
* rest.resource[=].searchParam[+].name = "version"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Questionnaire-version"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[+].name = "title"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Questionnaire-title"
* rest.resource[=].searchParam[=].type = #string
* rest.resource[=].searchParam[=].documentation = "The client supports search using the :contains modifier."
* rest.resource[=].searchParam[+].name = "_count"
* rest.resource[=].searchParam[=].type = #number
* rest.resource[=].searchParam[=].documentation = "The server supports search result limiting."
* rest.resource[=].searchParam[+].name = "_sort"
* rest.resource[=].searchParam[=].type = #string
* rest.resource[=].searchParam[=].documentation = "The server supports search result sorting by date and **MAY** support other values."
* rest.resource[=].operation[0].name = "assemble"
* rest.resource[=].operation[0].definition = "http://hl7.org/fhir/uv/sdc/OperationDefinition/Questionnaire-assemble"
*/

Instance: SHCAppCapabilityStatement
InstanceOf: CapabilityStatement
Usage: #definition
* name = "SHCApp"
* title = "SHC App"
* description = "This CapabilityStatement describes the capabilities of the SHC App. These capabilities include supported FHIR profiles, RESTful operations, and search parameters. It covers supported tasks such as SMART App launch context, prepopulation, write-back of extracted resources and completion of forms."
* status = #draft
* experimental = false
* date = "2025-04-16"
* publisher = "AEHRC CSIRO"
* kind = #capability
* instantiates[+] = "http://hl7.org/fhir/uv/sdc/CapabilityStatement/sdc-form-filler"
* instantiates[+] = "http://hl7.org.au/fhir/core/CapabilityStatement/au-core-requester"
* software.name = "Smart Health Checks Application"
* fhirVersion = #4.0.1
* format[0] = #json
* patchFormat[0] = #application/fhir+json
* implementationGuide[+] = "http://hl7.org/fhir/smart-app-launch/ImplementationGuide/hl7.fhir.uv.smart-app-launch|2.2.0"

* rest.mode = #client
* rest.documentation = "The SHC App performs interactions to support SMART App Launch, form prepopulation, write-back of extracted resources and form filling."
* rest.security.cors = true
* rest.security.service = http://terminology.hl7.org/CodeSystem/restful-security-service#SMART-on-FHIR
* rest.security.description = "SMART App Launch supported to allow secure data exchange."

//AllergyIntolerance
* rest.resource[+].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "patient"
* rest.resource[=].type = #AllergyIntolerance
* rest.resource[=].supportedProfile[+] = "https://smartforms.csiro.au/ig/StructureDefinition/SHCAllergyIntolerance"
* rest.resource[=].documentation = "The client supports the AllergyIntolerance resource, the Smart Health Checks profile and the conformance expectations for the AllergyIntolerance resource."
* rest.resource[=].interaction[0].code = #search-type
* rest.resource[=].interaction[+].code = #create
* rest.resource[=].interaction[+].code = #patch
* rest.resource[=].searchParam[+].name = "patient"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/clinical-patient"
* rest.resource[=].searchParam[=].type = #reference
* rest.resource[=].searchParam[=].documentation = "The client **SHALL** provide at least a id value and **MAY** provide both the Type and id values. 

The server **SHALL** support both."

//Bundle
* rest.resource[+].type = #Bundle
* rest.resource[=].supportedProfile[+] = "https://smartforms.csiro.au/ig/StructureDefinition/SHCExtractBundle"
* rest.resource[=].documentation = "The client supports the Bundle resource, the Smart Health Checks profile listed and the conformance expectations for the Bundle resource."

//Condition
* rest.resource[+].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "patient"
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "category"
* rest.resource[=].type = #Condition
* rest.resource[=].supportedProfile[+] = "https://smartforms.csiro.au/ig/StructureDefinition/SHCCondition"
* rest.resource[=].documentation = "The client supports the Condition resource, the Smart Health Checks and the conformance expectations for the Condition resource."
* rest.resource[=].interaction[0].code = #search-type
* rest.resource[=].interaction[+].code = #create
* rest.resource[=].interaction[+].code = #patch
* rest.resource[=].searchParam[+].name = "patient"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/clinical-patient"
* rest.resource[=].searchParam[=].type = #reference
* rest.resource[=].searchParam[=].documentation = "The client **SHALL** provide at least a id value and **MAY** provide both the Type and id values. 

The server **SHALL** support both."
* rest.resource[=].searchParam[+].name = "category"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Condition-category"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].documentation = "The client **SHALL** provide at least a code value and **MAY** provide both the system and code values. 

The server **SHALL** support both."

//Encounter
* rest.resource[+].type = #Encounter
* rest.resource[=].supportedProfile[+] = "https://smartforms.csiro.au/ig/StructureDefinition/SHCEncounter"
* rest.resource[=].documentation = "The client supports the Encounter resource, the Smart Health Checks profile and the conformance expectations for the Encounter resource."
* rest.resource[=].interaction[0].code = #read


//Immunization
* rest.resource[+].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "patient"
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "status"
* rest.resource[=].type = #Immunization
* rest.resource[=].supportedProfile[+] = "https://smartforms.csiro.au/ig/StructureDefinition/SHCImmunization"
* rest.resource[=].documentation = "The client supports the Immunization resource, the Smart Health Checks profile and the conformance expectations for the Immunization resource."
* rest.resource[=].interaction[0].code = #search-type
* rest.resource[=].interaction[+].code = #create
* rest.resource[=].searchParam[+].name = "patient"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/clinical-patient"
* rest.resource[=].searchParam[=].type = #reference
* rest.resource[=].searchParam[=].documentation = "The client **SHALL** provide at least a id value and **MAY** provide both the Type and id values. 

The server **SHALL** support both."
* rest.resource[=].searchParam[+].name = "status"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Immunization-status"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].documentation = "The client **SHALL** provide at least a code value and **MAY** provide both the system and code values. 

The server **SHALL** support both."

//Medication
* rest.resource[+].type = #Medication
* rest.resource[=].supportedProfile[+] = "https://smartforms.csiro.au/ig/StructureDefinition/SHCMedication"
* rest.resource[=].documentation = "The client supports the Medication resource, the Smart Health Checks profile and the conformance expectations for the Medication resource."
* rest.resource[=].interaction[0].code = #read

//MedicationStatement
* rest.resource[+].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "patient"
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "status"
* rest.resource[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "patient"
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "status"
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "_include"
* rest.resource[=].type = #MedicationStatement
* rest.resource[=].supportedProfile[+] = "https://smartforms.csiro.au/ig/StructureDefinition/SHCMedicationStatement"
* rest.resource[=].documentation = "The client supports the MedicationStatement resource, the Smart Health Checks profile and the conformance expectations for the MedicationStatement resource."
* rest.resource[=].interaction[0].code = #search-type
* rest.resource[=].interaction[+].code = #create
* rest.resource[=].interaction[+].code = #patch
* rest.resource[=].searchInclude[+] = "MedicationStatement:medication"
* rest.resource[=].searchParam[+].name = "patient"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/clinical-patient"
* rest.resource[=].searchParam[=].type = #reference
* rest.resource[=].searchParam[=].documentation = "The client **SHALL** provide at least a id value and **MAY** provide both the Type and id values. 

The server **SHALL** support both."
* rest.resource[=].searchParam[+].name = "status"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/medications-status"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].documentation = "The client **SHALL** provide at least a code value and **MAY** provide both the system and code values.

The server **SHALL** support both.

The client **SHALL** support `multipleOr`.

The server **SHALL** support `multipleOr`."
* rest.resource[=].searchParam[+].name = "_include"
* rest.resource[=].searchParam[=].type = #reference
* rest.resource[=].searchParam[=].documentation = "If a medication in a MedicationStatement resource is represented as an external Medication resource reference, the server **SHALL** support the `_include` parameter for searching this element (`MedicationStatement:medication`).

The client **SHALL** support this method."

//Observation
* rest.resource[+].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "patient"
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "code"
/** rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "_count"*/
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "_sort"

* rest.resource[=].type = #Observation
* rest.resource[=].supportedProfile[+] = "https://smartforms.csiro.au/ig/StructureDefinition/SHCBloodPressure"
* rest.resource[=].supportedProfile[+] = "https://smartforms.csiro.au/ig/StructureDefinition/SHCBodyHeight"
* rest.resource[=].supportedProfile[+] = "https://smartforms.csiro.au/ig/StructureDefinition/SHCBodyWeight"
* rest.resource[=].supportedProfile[+] = "https://smartforms.csiro.au/ig/StructureDefinition/SHCHeadCircumference"
* rest.resource[=].supportedProfile[+] = "https://smartforms.csiro.au/ig/StructureDefinition/SHCHeartRate"
* rest.resource[=].supportedProfile[+] = "https://smartforms.csiro.au/ig/StructureDefinition/SHCHeartRhythm"
* rest.resource[=].supportedProfile[+] = "https://smartforms.csiro.au/ig/StructureDefinition/SHCPathologyResult"
* rest.resource[=].supportedProfile[+] = "https://smartforms.csiro.au/ig/StructureDefinition/SHCSmokingStatus"
* rest.resource[=].supportedProfile[+] = "https://smartforms.csiro.au/ig/StructureDefinition/SHCWaistCircumference"
* rest.resource[=].documentation = "The client supports the Observation resource, the Smart Health Checks profiles listed and the conformance expectations for the Observation resource."
* rest.resource[=].interaction[0].code = #search-type
* rest.resource[=].interaction[+].code = #create
* rest.resource[=].searchParam[+].name = "patient"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/clinical-patient"
* rest.resource[=].searchParam[=].type = #reference
* rest.resource[=].searchParam[=].documentation = "The client **SHALL** provide at least a id value and **MAY** provide both the Type and id values. 

The server **SHALL** support both. "
* rest.resource[=].searchParam[+].name = "code"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/clinical-code"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].documentation = "The client **SHALL** provide at least a code value and **MAY** provide both the code and system values. 

The server **SHALL** support both."
/** rest.resource[=].searchParam[+].name = "_count"
* rest.resource[=].searchParam[=].type = #number
* rest.resource[=].searchParam[=].documentation = "The client and server **SHALL** support search result limiting."
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[0].valueCode = #SHALL*/
* rest.resource[=].searchParam[+].name = "_sort"
* rest.resource[=].searchParam[=].type = #string
* rest.resource[=].searchParam[=].documentation = "The client and server **SHALL** support search result sorting by date and **MAY** support other values."
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[0].valueCode = #SHALL

//Parameters
* rest.resource[+].type = #Parameters
* rest.resource[=].supportedProfile[+] = "https://smartforms.csiro.au/ig/StructureDefinition/SHCPatchAllergyIntolerance"
* rest.resource[=].supportedProfile[+] = "https://smartforms.csiro.au/ig/StructureDefinition/SHCPatchCondition"
* rest.resource[=].supportedProfile[+] = "https://smartforms.csiro.au/ig/StructureDefinition/SHCPatchMedicationStatement"
* rest.resource[=].supportedProfile[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].supportedProfile[=].extension[0].valueCode = #SHALL
* rest.resource[=].documentation = "The client supports the Parameters resource, the Smart Health Checks profiles listed and the conformance expectations for the Parameters resource."

//Patient
* rest.resource[+].type = #Patient
* rest.resource[=].supportedProfile[+] = "https://smartforms.csiro.au/ig/StructureDefinition/SHCPatient"
* rest.resource[=].documentation = "The client supports the Patient resource, Smart Health Checks profile and the conformance expectations for the Patient resource."
* rest.resource[=].interaction[0].code = #read

//Practitioner
* rest.resource[+].type = #Practitioner
* rest.resource[=].supportedProfile[+] = "https://smartforms.csiro.au/ig/StructureDefinition/SHCPractitioner"
* rest.resource[=].documentation = "The client supports the Practitioner resource, Smart Health Checks profile and the conformance expectations for the Practitioner resource."
* rest.resource[=].interaction[0].code = #read

//Questionnaire
* rest.resource[+].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "url"
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "version"
* rest.resource[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "_count"
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "_sort"
* rest.resource[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "title"
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "_count"
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "_sort"
* rest.resource[=].type = #Questionnaire
* rest.resource[=].profile = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire"
//Add more SDC profiles?
* rest.resource[=].documentation = "The client supports the Questionnaire resource, Structured Data Capture profile and the conformance expectations for the Questionnaire resource."
* rest.resource[=].interaction[+].code = #search-type
* rest.resource[=].interaction[+].code = #create
* rest.resource[=].searchParam[+].name = "url"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Questionnaire-url"
* rest.resource[=].searchParam[=].type = #uri
* rest.resource[=].searchParam[+].name = "version"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Questionnaire-version"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[+].name = "title"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Questionnaire-title"
* rest.resource[=].searchParam[=].type = #string
* rest.resource[=].searchParam[=].documentation = "The client supports search using the :contains modifier."
* rest.resource[=].searchParam[+].name = "_count"
* rest.resource[=].searchParam[=].type = #number
* rest.resource[=].searchParam[=].documentation = "The client supports search result limiting."
* rest.resource[=].searchParam[+].name = "_sort"
* rest.resource[=].searchParam[=].type = #string
* rest.resource[=].searchParam[=].documentation = "The client supports search result sorting by date and **MAY** support other values."
* rest.resource[=].operation[+].name = "assemble"
* rest.resource[=].operation[=].definition = "http://hl7.org/fhir/uv/sdc/OperationDefinition/Questionnaire-assemble"
* rest.resource[=].operation[+].name = "populate"
* rest.resource[=].operation[=].definition = "http://hl7.org/fhir/uv/sdc/OperationDefinition/Questionnaire-populate"

//QuestionnaireResponse
* rest.resource[+].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "patient"
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "_count"
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "_sort"
* rest.resource[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "patient"
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "_count"
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "_sort"
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "questionnaire"
* rest.resource[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "patient"
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "_count"
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "_sort"
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "status"
* rest.resource[=].type = #QuestionnaireResponse
* rest.resource[=].profile = "https://smartforms.csiro.au/ig/StructureDefinition/SHCQuestionnaireResponse"
* rest.resource[=].documentation = "The client supports the QuestionnaireResponse resource, Smart Health Checks profile and the conformance expectations for the QuestionnaireResponse resource."
* rest.resource[=].interaction[+].code = #read
* rest.resource[=].interaction[+].code = #search-type
* rest.resource[=].interaction[+].code = #create
* rest.resource[=].interaction[+].code = #update
* rest.resource[=].versioning = #versioned-update
* rest.resource[=].searchParam[+].name = "patient"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/QuestionnaireResponse-patient"
* rest.resource[=].searchParam[=].type = #reference
* rest.resource[=].searchParam[=].documentation = "The client **SHALL** provide at least a id value and **MAY** provide both the Type and id values. 

The server **SHALL** support both. "
* rest.resource[=].searchParam[+].name = "questionnaire"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/QuestionnaireResponse-questionnaire"
* rest.resource[=].searchParam[=].type = #reference
* rest.resource[=].searchParam[=].documentation = "The client **SHALL** provide at least a id value and **MAY** provide both the Type and id values. 

The server **SHALL** support both.

The client and server **SHALL** support chained search questionnaire.title using the :contains modifier."
* rest.resource[=].searchParam[+].name = "status"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/QuestionnaireResponse-status"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].documentation = "The client **SHALL** provide at least a code value and **MAY** provide both the code and system values. 

The server **SHALL** support both."
* rest.resource[=].searchParam[+].name = "_count"
* rest.resource[=].searchParam[=].type = #number
* rest.resource[=].searchParam[=].documentation = "The client and server **SHALL** support search result limiting."
* rest.resource[=].searchParam[+].name = "_sort"
* rest.resource[=].searchParam[=].type = #string
* rest.resource[=].searchParam[=].documentation = "The client and server **SHALL** support search result sorting by authored and **MAY** support other values."

//ValueSet
* rest.resource[+].type = #ValueSet
* rest.resource[=].documentation = "The client supports the ValueSet resource and the conformance expectations for the ValueSet resource."
* rest.resource[=].operation[0].name = "expand"
* rest.resource[=].operation[0].definition = "http://hl7.org/fhir/OperationDefinition/ValueSet-expand"

* rest.interaction[+].code = #transaction
* rest.interaction[+].code = #batch

