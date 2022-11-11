Alias: $LNC = http://loinc.org
Alias: $SCT = http://snomed.info/sct
Alias: $UCUM = http://unitsofmeasure.org

Instance: 715HealthCheckAdults
InstanceOf: Questionnaire
Usage: #definition
Title: "715 Health Check for Adults"
Description: "Root questionnaire for Aboriginal and Torres Strait Islander Health Checks - Adults (25-49 years)"

* contained[+] = PrePopQuery

* extension[sdc-questionnaire-assemble-expectation].valueCode = #assemble-root
* extension[sdc-questionnaire-launchContext].extension[name].valueCoding = http://hl7.org/fhir/uv/sdc/CodeSystem/launchContext#patient
* extension[sdc-questionnaire-launchContext].extension[type].valueCode = #Patient
* extension[sdc-questionnaire-launchContext].extension[description].valueString = "The patient that is to be used to pre-populate the form"
* extension[sdc-questionnaire-sourceQueries].valueReference = Reference(PrePopQuery)

* meta.profile[+] = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-render"
* meta.profile[+] = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-modular"
//* meta.profile[+] = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-pop-obsn"
//* meta.profile[+] = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-extr-obsn"
* url = "http://www.health.gov.au/assessments/mbs/715/715HealthCheckAdults"
* name = "715HealthCheckAdults"
* title = "715 Health Check for Adults"
* status = #draft
* experimental = true
* subjectType[+] = #Patient
* date = "2022-05-24"
* jurisdiction.coding = urn:iso:std:iso:3166#AU

// Root 
* item[+] 
  * linkId = "fd5af92e-c248-497a-8007-ee0952ccd4d9"
  * text = "Aboriginal and Torres Strait Islander health check"
  * type = #group
 //variables
  * extension[http://hl7.org/fhir/StructureDefinition/variable][+].valueExpression
    * name = "weight"
    * language = #text/fhirpath
    * expression = "item.where(linkId='c587e3b6-b91a-40dc-9a16-179342d001e9').item.where(linkId='2136abeb-d75d-475d-9cc7-eeda8d131b95').answer.value"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][+].valueExpression
    * name = "height"
    * language = #text/fhirpath
    * expression = "item.where(linkId='c587e3b6-b91a-40dc-9a16-179342d001e9').item.where(linkId='2d68889b-88c1-4c6d-8b00-db4178dc1f52').answer.value"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][+].valueExpression
    * name = "female"
    * language = #text/fhirpath
    * expression = "iif(item.where(linkId='5b224753-9365-44e3-823b-9c17e7394005').item.where(linkId='418e4a02-de77-48a0-a92a-fe8fcc52b1aa').answer.value.code='female', 1, 0)"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][+].valueExpression
    * name = "age"
    * language = #text/fhirpath
    * expression = "item.where(linkId='5b224753-9365-44e3-823b-9c17e7394005').item.where(linkId='e2a16e4d-2765-4b61-b286-82cfc6356b30').answer.value"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][+].valueExpression
    * name = "cvdAge"
    * language = #text/fhirpath
    * expression = "iif(%age > 74, 74, iif(%age < 35, 35, %age))"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][+].valueExpression
    * name = "systolicBP"
    * language = #text/fhirpath
    * expression = "item.where(linkId='d95abe99-8ef2-4b97-bc88-a2901e2ebc9c').item.where(linkId='4b98f514-2f6a-41f3-ad9d-185abc68ae34').answer.value"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][+].valueExpression
    * name = "smoker"
    * language = #text/fhirpath
    * expression = "iif(item.where(linkId='14a9fb5f-5b0e-4862-b143-08a11cd3ebf0').item.where(linkId='515eda6e-973a-4b10-910a-0d4bf4f2efff').item.where(linkId='b639a3a8-f476-4cc8-b5c7-f5d2abb23511').answer.value.code='77176002', 1, 0)"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][+].valueExpression
    * name = "totalCh"
    * language = #text/fhirpath
    * expression = "item.where(linkId='d95abe99-8ef2-4b97-bc88-a2901e2ebc9c').item.where(linkId='f11feebc-fc4a-40d5-8481-b87d9f5a89aa').answer.value"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][+].valueExpression
    * name = "hdl"
    * language = #text/fhirpath
    * expression = "item.where(linkId='d95abe99-8ef2-4b97-bc88-a2901e2ebc9c').item.where(linkId='c47a7fae-0c60-40f8-8426-1019b1f0dd8f').answer.value"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][+].valueExpression
    * name = "diabetes"
    * language = #text/fhirpath
    * expression = "iif(item.where(linkId='d95abe99-8ef2-4b97-bc88-a2901e2ebc9c').item.where(linkId='e8fed84e-6c15-4f62-bc95-cd08033af3f7').answer.value = true,1,0)"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][+].valueExpression
    * name = "ecgLvh"
    * language = #text/fhirpath
    * expression = "iif(item.where(linkId='d95abe99-8ef2-4b97-bc88-a2901e2ebc9c').item.where(linkId='b980624c-e91a-44d4-80ba-a9f34c0e1188').answer.value = true,1,0)"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][+].valueExpression
    * name = "cBase"
    * language = #text/fhirpath
    * expression = "18.8144"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][+].valueExpression
    * name = "cFemale"
    * language = #text/fhirpath
    * expression = "%female * -1.2146"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][+].valueExpression
    * name = "cAge"
    * language = #text/fhirpath
    * expression = "%cvdAge.ln() * -1.8443"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][+].valueExpression
    * name = "cAgeFemale"
    * language = #text/fhirpath
    * expression = "%female * %cvdAge.ln() * 0.3668"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][+].valueExpression
    * name = "cSBP"
    * language = #text/fhirpath
    * expression = "%systolicBP.ln() * -1.4032"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][+].valueExpression
    * name = "cSmoker"
    * language = #text/fhirpath
    * expression = "%smoker * -0.3899"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][+].valueExpression
    * name = "cTcHdl"
    * language = #text/fhirpath
    * expression = "(%totalCh / %hdl).ln() * -0.539"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][+].valueExpression
    * name = "cDiabetes"
    * language = #text/fhirpath
    * expression = "%diabetes * -0.3036"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][+].valueExpression
    * name = "cDiabetesFemale"
    * language = #text/fhirpath
    * expression = "%female * %diabetes * -0.1697"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][+].valueExpression
    * name = "cEcgLvh"
    * language = #text/fhirpath
    * expression = "%ecgLvh * -0.3362"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][+].valueExpression
    * name = "sumOfCoeffs"
    * language = #text/fhirpath
    * expression = "%cBase + %cFemale + %cAge + %cAgeFemale + %cSBP + %cSmoker + %cTcHdl + %cDiabetes + %cDiabetesFemale + %cEcgLvh"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][+].valueExpression
    * name = "cvdScale"
    * language = #text/fhirpath
    * expression = "(0.6536 + (%sumOfCoeffs * -0.2402)).exp()"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][+].valueExpression
    * name = "cvdU"
    * language = #text/fhirpath
    * expression = "(5.ln()-%sumOfCoeffs)/%cvdScale"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][+].valueExpression
    * name = "cvdScore"
    * language = #text/fhirpath
    * expression = "(1 - (%cvdU.exp()*-1).exp()) * 100"
  // end variables
  
 /* * item[+]
    * extension[sdc-questionnaire-initialExpression].valueExpression
      * language = #text/fhirpath
      * expression = "iif(today().toString().substring(4,4).toInteger > %patient.birthDate.toString().substring(4,4).toInteger, today().toString().substring(0,4).toInteger() - %patient.birthDate.toString().substring(0,4).toInteger(), today().toString().substring(0,4).toInteger() - %patient.birthDate.toString().substring(0,4).toInteger() - 1)"
    * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-hidden].valueBoolean = true
    * linkId = "c1e0184b-d656-4fab-a478-ca3235ab2c1c"
    * text = "Age of patient"
    * type = #integer
    */
  // About The Health Check
  * item[+] 
    * extension[sdc-questionnaire-subQuestionnaire].valueCanonical = "http://www.health.gov.au/assessments/mbs/715/715-AboutTheHealthCheck|0.1.0"
    * linkId = "cd3303a6-e3b6-4732-80e8-54d2bd740beb"
    * text = "Sub-questionnaire [http://www.health.gov.au/assessments/mbs/715/715-AboutTheHealthCheck|0.1.0] not available. Unable to display all questions."
    * type = #display
  // Consent
  * item[+] 
    * extension[sdc-questionnaire-subQuestionnaire].valueCanonical = "http://www.health.gov.au/assessments/mbs/715/715-Consent|0.1.0"
    * linkId = "fab52f87-22a6-4a54-9797-0bb6b0f5d2a2"
    * text = "Sub-questionnaire [http://www.health.gov.au/assessments/mbs/715/715-Consent|0.1.0] not available. Unable to display all questions."
    * type = #display
  // Patient Details
  * item[+] 
    * extension[sdc-questionnaire-subQuestionnaire].valueCanonical = "http://www.health.gov.au/assessments/mbs/715/715-PatientDetails|0.1.0"
    * linkId = "1d10910d-c195-4964-bdc6-98310a44719e"
    * text = "Sub-questionnaire [http://www.health.gov.au/assessments/mbs/715/715-PatientDetails|0.1.0] not available. Unable to display all questions."
    * type = #display
  // Assessment
  * item[+] 
    * extension[sdc-questionnaire-subQuestionnaire].valueCanonical = "http://www.health.gov.au/assessments/mbs/715/715-Assessment|0.1.0"
    * linkId = "7692f28c-7c0a-48ea-b27d-a8489974377d"
    * text = "Sub-questionnaire [http://www.health.gov.au/assessments/mbs/715/715-Assessment|0.1.0] not available. Unable to display all questions."
    * type = #display
  // Finalising the Health Check
  * item[+] 
    * extension[sdc-questionnaire-subQuestionnaire].valueCanonical = "http://www.health.gov.au/assessments/mbs/715/715-FinalisingHealthCheck|0.1.0"
    * linkId = "15f83d80-f49a-4852-a20f-18db9b951e53"
    * text = "Sub-questionnaire [http://www.health.gov.au/assessments/mbs/715/715-FinalisingHealthCheck|0.1.0] not available. Unable to display all questions."
    * type = #display
 