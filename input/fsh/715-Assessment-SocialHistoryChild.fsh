Alias: $LNC = http://loinc.org
Alias: $SCT = http://snomed.info/sct
Alias: $UCUM = http://unitsofmeasure.org

Instance: 715AssessmentSocialHistoryChild
InstanceOf: Questionnaire
Usage: #definition
Title: "715 Assessment Social History Child"
Description: "Sub-questionnaire for Aboriginal and Torres Strait Islander Health Checks"

* contained[+] = PrePopQuery

* extension[sdc-questionnaire-assemble-expectation].valueCode = #assemble-child
* extension[sdc-questionnaire-launchContext].extension[name].valueCoding = http://hl7.org/fhir/uv/sdc/CodeSystem/launchContext#patient
* extension[sdc-questionnaire-launchContext].extension[type].valueCode = #Patient
* extension[sdc-questionnaire-launchContext].extension[description].valueString = "The patient that is to be used to pre-populate the form"
* extension[sdc-questionnaire-sourceQueries].valueReference = Reference(PrePopQuery)

* meta.profile[+] = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-render"
* meta.profile[+] = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-modular"
//* meta.profile[+] = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-pop-obsn"
//* meta.profile[+] = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-extr-obsn"
* url = "http://www.health.gov.au/assessments/mbs/715/715AssessmentSocialHistoryChild"
* name = "715AssessmentSocialHistoryChild"
* title = "715 Assessment Social History Child"
* status = #draft
* experimental = true
* subjectType[+] = #Patient
* date = "2022-05-24"
* jurisdiction.coding = urn:iso:std:iso:3166#AU

* item[+]
  * extension[questionnaire-itemControl].valueCodeableConcept = https://aehrc.csiro.au/fhir/CodeSystem/QuestionnaireItemControlExtended#tab
  * extension[sdc-questionnaire-shortText].valueString = "Social history"
  * linkId = "a5cc8a8f-89cf-470c-a6bd-ce9da2f64ee9"
  * text = "Social history: Information about family and child's living arrangements"
  * type = #group
  * repeats = false
  * enableWhen[+]
    * question = "e2a16e4d-2765-4b61-b286-82cfc6356b30" // age item which has initial population from variable
    * operator = #<=
    * answerInteger = 12
  * item[+]
    * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
    * linkId = "1bb673a4-40f9-41c3-ad04-66c9f38fdc1b"
    * text = "Who lives in your household? / Who does the child live with?"
    * type = #text
    * repeats = false
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#prompt
      * linkId = "5b8134d2-f87e-4449-bfc1-eac1d8d3d58b"
      * text = "Details"
      * type = #display 
  * item[+]
    * linkId = "934d105e-a4d6-4926-9b64-55bb1049d839"
    * text = "Stressful life events"
    * type = #group
    * repeats = false
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#radio-button
      * linkId = "062f5234-686a-4bf3-afcd-3fcd988afd6c"
      * text = "Have there been any stressful life events that would cause you or your child to be upset?"
      * type = #choice
      * repeats = false
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
      * linkId = "1ea0a898-d680-4a5d-a0f1-91b57eb77a91"
      * text = "Details"
      * type = #text
      * repeats = false
      * enableWhen[+]
        * question = "062f5234-686a-4bf3-afcd-3fcd988afd6c"
        * operator = #=
        * answerCoding = http://terminology.hl7.org/CodeSystem/v2-0136#Y
  * item[+]
    * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
    * linkId = "272af1cb-4309-4227-bab4-a6cc9fb47635"
    * text = "If indicated, ask about depression and other mental health concerns"
    * type = #text
    * repeats = false
    * enableWhen[+]
      * question = "e2a16e4d-2765-4b61-b286-82cfc6356b30" // age item which has initial population from variable
      * operator = #>
      * answerInteger = 5
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#prompt
      * linkId = "4048e200-1c09-441d-b25d-f8a946fac411"
      * text = "Details"
      * type = #display

  * item[+]
    * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
    * linkId = "76d51512-b94a-4092-b3ae-a656fbb9c360"
    * text = "Health priorities, actions and follow-up"
    * type = #text
    * repeats = false