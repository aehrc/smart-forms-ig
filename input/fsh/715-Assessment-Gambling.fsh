Alias: $LNC = http://loinc.org
Alias: $SCT = http://snomed.info/sct
Alias: $UCUM = http://unitsofmeasure.org

Instance: 715AssessmentGambling
InstanceOf: Questionnaire
Usage: #definition
Title: "715 Assessment Gambling"
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
* url = "http://www.health.gov.au/assessments/mbs/715/715AssessmentGambling"
* name = "715AssessmentGambling"
* title = "715 Assessment Gambling"
* status = #draft
* experimental = true
* subjectType[+] = #Patient
* date = "2022-05-24"
* jurisdiction.coding = urn:iso:std:iso:3166#AU

* item[+]
  * extension[questionnaire-itemControl].valueCodeableConcept = https://aehrc.csiro.au/fhir/CodeSystem/QuestionnaireItemControlExtended#tab
  * linkId = "a7bb0dd2-4b2d-49c2-9da6-3cb0a4dd9240"
  * text = "Gambling"
  * type = #group
  * repeats = false
  * enableWhen[+]
    * question = "e2a16e4d-2765-4b61-b286-82cfc6356b30" // age item which has initial population from variable
    * operator = #>
    * answerInteger = 12 
  * item[+]
    * linkId = "fb489c43-f311-41f5-9d6a-1b61748e165f"
    * text = "Gambling issues"
    * type = #group
    * repeats = false
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#radio-button
      * extension[questionnaire-choiceOrientation].valueCode = #horizontal
      * linkId = "a233c01e-a72e-474b-9a26-bab1504491fa"
      * text = "Have you or someone close to you ever had issues with gambling?"
      * type = #choice
      * repeats = false
      * answerValueSet = "#YesNo"
    * item[+]
      * linkId = "d1b68cfc-77cf-464e-83ce-0e8517bed9f3"
      * text = "Details"
      * type = #text
      * repeats = false
      * enableWhen[+]
        * question = "a233c01e-a72e-474b-9a26-bab1504491fa"
        * operator = #=
        * answerCoding = http://terminology.hl7.org/CodeSystem/v2-0136#Y

  * item[+]
    * linkId = "2ab74c97-55d9-4fd9-968f-8962d62ea573"
    * text = "Health priorities, actions and follow-up"
    * type = #text
    * repeats = false