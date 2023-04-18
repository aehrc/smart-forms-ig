Instance: SmartFormsApplicationInteractionRequirement
InstanceOf: CapabilityStatement
Title: "Smart Forms Application Interaction Requirement"
Usage: #definition
* name = "SmartFormsApplicationInteractionRequirement"
* description = "Requirements for a system interacting with the Smart Forms Application."
* status = #draft
* experimental = false
* date = "2023-01-31"
* jurisdiction = urn:iso:std:iso:3166#AU
* kind = #requirements
* fhirVersion = #4.0.1
* format[0] = #json

* rest.mode = #server

* rest.security.cors = true
* rest.security.service = http://terminology.hl7.org/CodeSystem/restful-security-service#SMART-on-FHIR
* rest.security.description = "SMART App Launch required for secure data exchange."

* rest.resource[+].type = #Patient
* rest.resource[=].profile = "http://hl7.org.au/fhir/core/StructureDefinition/au-core-patient"
* rest.resource[=].interaction[0].code = #read
* rest.resource[=].interaction[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction[0].extension[0].valueCode = #SHALL

* rest.resource[+].type = #Practitioner
* rest.resource[=].profile = "http://hl7.org.au/fhir/core/StructureDefinition/au-core-practitioner"
* rest.resource[=].interaction[0].code = #read
* rest.resource[=].interaction[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction[0].extension[0].valueCode = #SHALL

* rest.resource[+].type = #Condition
* rest.resource[=].profile = "http://hl7.org.au/fhir/core/StructureDefinition/au-core-condition"
* rest.resource[=].interaction[0].code = #search-type
* rest.resource[=].interaction[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction[0].extension[0].valueCode = #SHOULD
* rest.resource[=].searchParam[0].name = "patient"
* rest.resource[=].searchParam[0].definition = "http://hl7.org/fhir/SearchParameter/clinical-patient"
* rest.resource[=].searchParam[0].type = #reference
* rest.resource[=].searchParam[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[0].extension[0].valueCode = #SHOULD
/*
* rest.resource[+].type = #FamilyMemberHistory
* rest.resource[=].profile = "https://aehrc.com/fhir/StructureDefinition/AUPrimaryCareFamilyMemberHistory"
* rest.resource[=].interaction[0].code = #search-type
* rest.resource[=].interaction[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction[0].extension[0].valueCode = #SHOULD
* rest.resource[=].searchParam[0].name = "patient"
* rest.resource[=].searchParam[0].definition = "http://hl7.org/fhir/SearchParameter/clinical-patient"
* rest.resource[=].searchParam[0].type = #reference
* rest.resource[=].searchParam[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[0].extension[0].valueCode = #SHOULD
*/
* rest.resource[+].type = #Observation
* rest.resource[=].supportedProfile[0] = "http://hl7.org.au/fhir/core/StructureDefinition/au-core-smokingstatus"
* rest.resource[=].supportedProfile[+] = "http://hl7.org.au/fhir/core/StructureDefinition/au-core-bodyheight"
* rest.resource[=].supportedProfile[+] = "http://hl7.org.au/fhir/core/StructureDefinition/au-core-bodyweight"
* rest.resource[=].supportedProfile[+] = "http://hl7.org.au/fhir/core/StructureDefinition/au-core-bmi"
* rest.resource[=].supportedProfile[+] = "http://hl7.org.au/fhir/core/StructureDefinition/au-core-headcircum"
* rest.resource[=].supportedProfile[+] = "http://hl7.org.au/fhir/core/StructureDefinition/au-core-waistcircum"
* rest.resource[=].supportedProfile[+] = "http://hl7.org.au/fhir/core/StructureDefinition/au-core-bloodpressure"
* rest.resource[=].supportedProfile[+] = "http://hl7.org.au/fhir/core/StructureDefinition/au-core-heartrate"
* rest.resource[=].supportedProfile[+] = "http://hl7.org.au/fhir/core/StructureDefinition/au-core-lipid-result"
* rest.resource[=].interaction[0].code = #search-type
* rest.resource[=].interaction[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction[0].extension[0].valueCode = #SHOULD
* rest.resource[=].searchParam[0].name = "patient"
* rest.resource[=].searchParam[0].definition = "http://hl7.org/fhir/SearchParameter/clinical-patient"
* rest.resource[=].searchParam[0].type = #reference
* rest.resource[=].searchParam[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[0].extension[0].valueCode = #SHOULD
* rest.resource[=].searchParam[1].name = "code"
* rest.resource[=].searchParam[1].definition = "http://hl7.org/fhir/SearchParameter/clinical-code"
* rest.resource[=].searchParam[1].type = #token
* rest.resource[=].searchParam[1].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[1].extension[0].valueCode = #SHOULD

* rest.resource[+].type = #QuestionnaireResponse
* rest.resource[=].profile = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaireresponse"
* rest.resource[=].interaction[0].code = #read
* rest.resource[=].interaction[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction[0].extension[0].valueCode = #SHALL
* rest.resource[=].interaction[1].code = #search-type
* rest.resource[=].interaction[1].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction[1].extension[0].valueCode = #SHALL
* rest.resource[=].interaction[2].code = #create
* rest.resource[=].interaction[2].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction[2].extension[0].valueCode = #SHALL
* rest.resource[=].interaction[3].code = #update
* rest.resource[=].interaction[3].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction[3].extension[0].valueCode = #SHALL
* rest.resource[=].searchParam[0].name = "patient"
* rest.resource[=].searchParam[0].definition = "http://hl7.org/fhir/SearchParameter/QuestionnaireResponse-patient"
* rest.resource[=].searchParam[0].type = #reference
* rest.resource[=].searchParam[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[0].extension[0].valueCode = #SHALL

* rest.interaction[0].code = #transaction
//For the batch query
//* rest.interaction[1].code = #batch

Instance: SmartFormsServer
InstanceOf: CapabilityStatement
Title: "Smart Forms Server System Capabilities"
Usage: #definition

* name = "SmartFormsServerSystemCapabilities"
* description = "Capabilities of the Smart Forms Server."
* status = #draft
* experimental = false
* date = "2023-01-31"
// * instantiates
* kind = #capability
* software
  * name = "Smart Forms Server"
* fhirVersion = #4.0.1
* format[0] = #json
* format[1] = #xml

* rest.mode = #server

* rest.resource[+].type = #Questionnaire
* rest.resource[=].interaction[0].code = #read
* rest.resource[=].interaction[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction[0].extension[0].valueCode = #SHALL
* rest.resource[=].interaction[1].code = #search-type
* rest.resource[=].interaction[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction[0].extension[0].valueCode = #SHALL

// * rest.resource[=].operation[0].name = "populate"
// * rest.resource[=].operation[0].definition = "http://hl7.org/fhir/uv/sdc/OperationDefinition/Questionnaire-populate"
* rest.resource[=].operation[0].name = "assemble"
* rest.resource[=].operation[0].definition = "http://hl7.org/fhir/uv/sdc/OperationDefinition/Questionnaire-assemble"

* rest.interaction[0].code = #transaction


Instance: SmartFormsApplication
InstanceOf: CapabilityStatement
Title: "Smart Forms Application Capabilities"
Usage: #definition
* name = "SmartFormsApplicationCapabilities"
* description = "Capabilities of the Smart Forms Application."
* status = #draft
* experimental = false
* date = "2023-01-31"
* jurisdiction = urn:iso:std:iso:3166#AU
* kind = #capability
// * instantiates
* software
  * name = "Smart Forms Application"
* fhirVersion = #4.0.1
* format[0] = #json

* rest.mode = #client

* rest.security.cors = true
* rest.security.service = http://terminology.hl7.org/CodeSystem/restful-security-service#SMART-on-FHIR
* rest.security.description = "SMART App Launch supported to allow secure data exchange."

* rest.resource[+].type = #Patient
// * rest.resource[=].profile = "http://hl7.org.au/fhir/core/StructureDefinition/au-core-patient"
* rest.resource[=].interaction[0].code = #read
* rest.resource[=].interaction[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction[0].extension[0].valueCode = #SHALL

* rest.resource[+].type = #Practitioner
// * rest.resource[=].profile = "http://hl7.org.au/fhir/core/StructureDefinition/au-core-practitioner"
* rest.resource[=].interaction[0].code = #read
* rest.resource[=].interaction[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction[0].extension[0].valueCode = #SHALL

* rest.resource[+].type = #Condition
// * rest.resource[=].profile = "http://hl7.org.au/fhir/core/StructureDefinition/au-core-condition"
* rest.resource[=].interaction[0].code = #search-type
* rest.resource[=].interaction[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction[0].extension[0].valueCode = #SHOULD
* rest.resource[=].searchParam[0].name = "patient"
* rest.resource[=].searchParam[0].definition = "http://hl7.org/fhir/SearchParameter/clinical-patient"
* rest.resource[=].searchParam[0].type = #reference
* rest.resource[=].searchParam[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[0].extension[0].valueCode = #SHOULD

* rest.resource[+].type = #Observation
// * rest.resource[=].supportedProfile[0] = "http://hl7.org.au/fhir/core/StructureDefinition/au-core-smokingstatus"
// * rest.resource[=].supportedProfile[+] = "http://hl7.org.au/fhir/core/StructureDefinition/au-core-bodyheight"
// * rest.resource[=].supportedProfile[+] = "http://hl7.org.au/fhir/core/StructureDefinition/au-core-bodyweight"
// * rest.resource[=].supportedProfile[+] = "http://hl7.org.au/fhir/core/StructureDefinition/au-core-bmi"
// * rest.resource[=].supportedProfile[+] = "http://hl7.org.au/fhir/core/StructureDefinition/au-core-headcircum"
// * rest.resource[=].supportedProfile[+] = "http://hl7.org.au/fhir/core/StructureDefinition/au-core-waistcircum"
// * rest.resource[=].supportedProfile[+] = "http://hl7.org.au/fhir/core/StructureDefinition/au-core-bloodpressure"
// * rest.resource[=].supportedProfile[+] = "http://hl7.org.au/fhir/core/StructureDefinition/au-core-heartrate"
// * rest.resource[=].supportedProfile[+] = "https://aehrc.com/fhir/StructureDefinition/AUItem715Cholesterol"
// * rest.resource[=].supportedProfile[+] = "https://aehrc.com/fhir/StructureDefinition/AUItem715HDLCholesterol"
* rest.resource[=].interaction[0].code = #search-type
* rest.resource[=].interaction[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction[0].extension[0].valueCode = #SHOULD
* rest.resource[=].searchParam[0].name = "patient"
* rest.resource[=].searchParam[0].definition = "http://hl7.org/fhir/SearchParameter/clinical-patient"
* rest.resource[=].searchParam[0].type = #reference
* rest.resource[=].searchParam[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[0].extension[0].valueCode = #SHOULD
* rest.resource[=].searchParam[1].name = "code"
* rest.resource[=].searchParam[1].definition = "http://hl7.org/fhir/SearchParameter/clinical-code"
* rest.resource[=].searchParam[1].type = #token
* rest.resource[=].searchParam[1].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[1].extension[0].valueCode = #SHOULD

* rest.resource[+].type = #QuestionnaireResponse
// * rest.resource[=].profile = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaireresponse"
* rest.resource[=].interaction[0].code = #read
* rest.resource[=].interaction[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction[0].extension[0].valueCode = #SHALL
* rest.resource[=].interaction[1].code = #search-type
* rest.resource[=].interaction[1].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction[1].extension[0].valueCode = #SHALL
* rest.resource[=].interaction[2].code = #create
* rest.resource[=].interaction[2].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction[2].extension[0].valueCode = #SHALL
* rest.resource[=].interaction[3].code = #update
* rest.resource[=].interaction[3].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction[3].extension[0].valueCode = #SHALL
* rest.resource[=].interaction[4].code = #delete
* rest.resource[=].interaction[4].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction[4].extension[0].valueCode = #SHALL
* rest.resource[=].searchParam[0].name = "patient"
* rest.resource[=].searchParam[0].definition = "http://hl7.org/fhir/SearchParameter/QuestionnaireResponse-patient"
* rest.resource[=].searchParam[0].type = #reference
* rest.resource[=].searchParam[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[0].extension[0].valueCode = #SHALL

* rest.interaction[0].code = #transaction
//For the batch query
//* rest.interaction[1].code = #batch