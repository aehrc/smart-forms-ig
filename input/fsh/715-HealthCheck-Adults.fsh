Alias: $LNC = http://loinc.org
Alias: $SCT = http://snomed.info/sct
Alias: $UCUM = http://unitsofmeasure.org

Instance: 715-HealthCheck-Adults
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
* url = "http://www.health.gov.au/assessments/mbs/715/715-HealthCheck-Adults"
* name = "715-HealthCheck-Adults"
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
/*  //variables
  * extension[+][http://hl7.org/fhir/StructureDefinition/variable].valueExpression
    * name = "weight"
    * language = #text/fhirpath
    * expression = "item.where(linkId='ac1559c8-f03a-43a6-818f-9b31892ec2a7').item.where(linkId='f5308669-d1f9-49a1-bedd-7420946e7288').answer.value"
  * extension[+][http://hl7.org/fhir/StructureDefinition/variable].valueExpression
    * name = "height"
    * language = #text/fhirpath
    * expression = "item.where(linkId='ac1559c8-f03a-43a6-818f-9b31892ec2a7').item.where(linkId='29644716-433e-45ec-a805-8043f35a85e1').answer.value"
  * extension[+][http://hl7.org/fhir/StructureDefinition/variable].valueExpression
    * name = "female"
    * language = #text/fhirpath
    * expression = "iif(item.where(linkId='0db82ad3-fd45-4c0c-a603-9fbe6bbb9aca').item.where(linkId='3a98ac7a-9313-4222-a853-edd0415bfc48').answer.value.code='female', 1, 0)"
  * extension[+][http://hl7.org/fhir/StructureDefinition/variable].valueExpression
    * name = "age"
    * language = #text/fhirpath
    * expression = "item.where(linkId='c1e0184b-d656-4fab-a478-ca3235ab2c1c').answer.value"
  * extension[+][http://hl7.org/fhir/StructureDefinition/variable].valueExpression
    * name = "cvdAge"
    * language = #text/fhirpath
    * expression = "iif(%age > 74, 74, iif(%age < 35, 35, %age))"
  * extension[+][http://hl7.org/fhir/StructureDefinition/variable].valueExpression
    * name = "systolicBP"
    * language = #text/fhirpath
    * expression = "item.where(linkId='7845504e-859d-4834-a264-127bcbee8759').item.where(linkId='systolic-bp').answer.value"
  * extension[+][http://hl7.org/fhir/StructureDefinition/variable].valueExpression
    * name = "smoker"
    * language = #text/fhirpath
    * expression = "iif(item.where(linkId='14a9fb5f-5b0e-4862-b143-08a11cd3ebf0').item.where(linkId='b639a3a8-f476-4cc8-b5c7-f5d2abb23511').answer.value.code='77176002', 1, 0)"
  * extension[+][http://hl7.org/fhir/StructureDefinition/variable].valueExpression
    * name = "totalCh"
    * language = #text/fhirpath
    * expression = "item.where(linkId='7845504e-859d-4834-a264-127bcbee8759').item.where(linkId='tot-chol').answer.value"
  * extension[+][http://hl7.org/fhir/StructureDefinition/variable].valueExpression
    * name = "hdl"
    * language = #text/fhirpath
    * expression = "item.where(linkId='7845504e-859d-4834-a264-127bcbee8759').item.where(linkId='hdl-chol').answer.value"
  * extension[+][http://hl7.org/fhir/StructureDefinition/variable].valueExpression
    * name = "diabetes"
    * language = #text/fhirpath
    * expression = "iif(item.where(linkId='7845504e-859d-4834-a264-127bcbee8759').item.where(linkId='has-diabetes').answer.value = true,1,0)"
  * extension[+][http://hl7.org/fhir/StructureDefinition/variable].valueExpression
    * name = "ecgLvh"
    * language = #text/fhirpath
    * expression = "iif(item.where(linkId='7845504e-859d-4834-a264-127bcbee8759').item.where(linkId='ecg-lvh').answer.value = true,1,0)"
  * extension[+][http://hl7.org/fhir/StructureDefinition/variable].valueExpression
    * name = "cBase"
    * language = #text/fhirpath
    * expression = "18.8144"
  * extension[+][http://hl7.org/fhir/StructureDefinition/variable].valueExpression
    * name = "cFemale"
    * language = #text/fhirpath
    * expression = "%female * -1.2146"
  * extension[+][http://hl7.org/fhir/StructureDefinition/variable].valueExpression
    * name = "cAge"
    * language = #text/fhirpath
    * expression = "%cvdAge.ln() * -1.8443"
  * extension[+][http://hl7.org/fhir/StructureDefinition/variable].valueExpression
    * name = "cAgeFemale"
    * language = #text/fhirpath
    * expression = "%female * %cvdAge.ln() * 0.3668"
  * extension[+][http://hl7.org/fhir/StructureDefinition/variable].valueExpression
    * name = "cSBP"
    * language = #text/fhirpath
    * expression = "%systolicBP.ln() * -1.4032"
  * extension[+][http://hl7.org/fhir/StructureDefinition/variable].valueExpression
    * name = "cSmoker"
    * language = #text/fhirpath
    * expression = "%smoker * -0.3899"
  * extension[+][http://hl7.org/fhir/StructureDefinition/variable].valueExpression
    * name = "cTcHdl"
    * language = #text/fhirpath
    * expression = "(%totalCh / %hdl).ln() * -0.539"
  * extension[+][http://hl7.org/fhir/StructureDefinition/variable].valueExpression
    * name = "cDiabetes"
    * language = #text/fhirpath
    * expression = "%diabetes * -0.3036"
  * extension[+][http://hl7.org/fhir/StructureDefinition/variable].valueExpression
    * name = "cDiabetesFemale"
    * language = #text/fhirpath
    * expression = "%female * %diabetes * -0.1697"
  * extension[+][http://hl7.org/fhir/StructureDefinition/variable].valueExpression
    * name = "cEcgLvh"
    * language = #text/fhirpath
    * expression = "%ecgLvh * -0.3362"
  * extension[+][http://hl7.org/fhir/StructureDefinition/variable].valueExpression
    * name = "sumOfCoeffs"
    * language = #text/fhirpath
    * expression = "%cBase + %cFemale + %cAge + %cAgeFemale + %cSBP + %cSmoker + %cTcHdl + %cDiabetes + %cDiabetesFemale + %cEcgLvh"
  * extension[+][http://hl7.org/fhir/StructureDefinition/variable].valueExpression
    * name = "cvdScale"
    * language = #text/fhirpath
    * expression = "(0.6536 + (%sumOfCoeffs * -0.2402)).exp()"
  * extension[+][http://hl7.org/fhir/StructureDefinition/variable].valueExpression
    * name = "cvdU"
    * language = #text/fhirpath
    * expression = "(5.ln()-%sumOfCoeffs)/%cvdScale"
  * extension[+][http://hl7.org/fhir/StructureDefinition/variable].valueExpression
    * name = "cvdScore"
    * language = #text/fhirpath
    * expression = "(1 - (%cvdU.exp()*-1).exp()) * 100"
  // end variables
  */
  * item[+]
    * extension[sdc-questionnaire-initialExpression].valueExpression
      * language = #text/fhirpath
      * expression = "iif(today().toString().substring(4,4).toInteger > %patient.birthDate.toString().substring(4,4).toInteger, today().toString().substring(0,4).toInteger() - %patient.birthDate.toString().substring(0,4).toInteger(), today().toString().substring(0,4).toInteger() - %patient.birthDate.toString().substring(0,4).toInteger() - 1)"
    * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-hidden].valueBoolean = true
    * linkId = "c1e0184b-d656-4fab-a478-ca3235ab2c1c"
    * text = "Age of patient"
    * type = #integer
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
 