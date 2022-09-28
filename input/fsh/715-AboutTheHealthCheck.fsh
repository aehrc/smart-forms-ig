//Identical across all ages

Alias: $LNC = http://loinc.org
Alias: $SCT = http://snomed.info/sct
Alias: $UCUM = http://unitsofmeasure.org

Instance: 715-AboutTheHealthCheck
InstanceOf: Questionnaire
Usage: #definition
Title: "715 About The Health Check"
Description: "Sub-questionnaire for Aboriginal and Torres Strait Islander Health Checks"

* contained[+] = PrePopQuery
// * contained[+] = YesNoNA

* extension[sdc-questionnaire-assemble-expectation].valueCode = #assemble-child
* extension[sdc-questionnaire-launchContext].extension[name].valueCoding = http://hl7.org/fhir/uv/sdc/CodeSystem/launchContext#patient
* extension[sdc-questionnaire-launchContext].extension[type].valueCode = #Patient
* extension[sdc-questionnaire-launchContext].extension[description].valueString = "The patient that is to be used to pre-populate the form"
* extension[sdc-questionnaire-sourceQueries].valueReference = Reference(PrePopQuery)

* meta.profile[+] = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-render"
* meta.profile[+] = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-modular"
//* meta.profile[+] = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-pop-obsn"
//* meta.profile[+] = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-extr-obsn"
* url = "http://www.health.gov.au/assessments/mbs/715/715-AboutTheHealthCheck"
* name = "715-AboutTheHealthCheck"
* title = "715 About The Health Check"
* status = #draft
* experimental = true
* subjectType[+] = #Patient
* date = "2022-05-24"
* jurisdiction.coding = urn:iso:std:iso:3166#AU

* item[+]
  * extension[questionnaire-itemControl].valueCodeableConcept = https://aehrc.csiro.au/fhir/CodeSystem/QuestionnaireItemControlExtended#tab
  * linkId = "2e82032a-dc28-45f2-916e-862303d39fe5"
  * text = "About the health check"
  * type = #group
  * repeats = false
  * item[+]
    * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#radio-button
    * linkId = "3da318f1-a5dd-4c8f-b258-99d83872a4f2"
    * text = "Eligible for health check"
    * type = #choice
    * repeats = false
    * answerValueSet = "https://aehrc.csiro.au/fhir/ValueSet/YesNoNA"   
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#prompt
      * linkId = "04f00512-888b-424e-ba76-9bd6fd8da682"
      * text = "not claimed 715 or 228 in past nine months"
      * type = #display
  * item[+]
    * linkId = "5960c096-d5f7-4745-bd74-44ff2775bde9"
    * text = "Date of last health check"
    * type = #date
    * repeats = false
    





