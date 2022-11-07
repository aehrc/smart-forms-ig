Alias: $LNC = http://loinc.org
Alias: $SCT = http://snomed.info/sct
Alias: $UCUM = http://unitsofmeasure.org

Instance: 715AssessmentImmunisation
InstanceOf: Questionnaire
Usage: #definition
Title: "715 Assessment Immunisation"
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
* url = "http://www.health.gov.au/assessments/mbs/715/715AssessmentImmunisation"
* name = "715AssessmentImmunisation"
* title = "715 Assessment Immunisation"
* status = #draft
* experimental = true
* subjectType[+] = #Patient
* date = "2022-05-24"
* jurisdiction.coding = urn:iso:std:iso:3166#AU

* item[+]
  * extension[questionnaire-itemControl].valueCodeableConcept = https://aehrc.csiro.au/fhir/CodeSystem/QuestionnaireItemControlExtended#tab
  * linkId = "205677d6-17c7-4285-a7c4-61aa02b6c816"
  * text = "Immunisation"
  * type = #group
  * repeats = false
  * item[+]
    * linkId = "54de7714-b917-4426-acb4-29d48648a2d8"
    * text = "Check Child Health Record/Book and Australian Immunisation Register"
    * type = #display
    * repeats = false
    * enableWhen[+]
      * question = "e2a16e4d-2765-4b61-b286-82cfc6356b30" // age item which has initial population from variable
      * operator = #<=
      * answerInteger = 12
  * item[+]
    * linkId = "d77c527d-6fde-4ed7-97b9-c71acf817f39"
    * text = "Eligibility for funded vaccines may vary across jurisdictions"
    * type = #display
    * repeats = false
    * enableWhen[+]
      * question = "e2a16e4d-2765-4b61-b286-82cfc6356b30" // age item which has initial population from variable
      * operator = #>
      * answerInteger = 12
  * item[+]
    * linkId = "77d87581-d4d7-4267-9f3c-ad6541ad0f46"
    * text = "Check Australian Immunisation Register"
    * type = #display
    * repeats = false
    * enableWhen[+]
      * question = "e2a16e4d-2765-4b61-b286-82cfc6356b30" // age item which has initial population from variable
      * operator = #>
      * answerInteger = 12
    * enableWhen[+]
      * question = "e2a16e4d-2765-4b61-b286-82cfc6356b30" // age item which has initial population from variable
      * operator = #<=
      * answerInteger = 24
    * enableBehavior = #all
  * item[+]
    * linkId = "a2631d2c-2b5c-4147-9aca-05ae655a56a5"
    * text = "Check recommended primary vaccinations completed and provide catch-up if required"
    * type = #display
    * repeats = false
    * enableWhen[+]
      * question = "e2a16e4d-2765-4b61-b286-82cfc6356b30" // age item which has initial population from variable
      * operator = #>
      * answerInteger = 24
    * enableWhen[+]
      * question = "e2a16e4d-2765-4b61-b286-82cfc6356b30" // age item which has initial population from variable
      * operator = #<=
      * answerInteger = 49
    * enableBehavior = #all
  * item[+]
    * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
    * linkId = "69a4a459-196b-4931-8336-ea76ab3fccd1"
    * text = "Immunisations up to date and recorded on Australian Immunisation Register (as per Australian immunisation handbook)?"
    * type = #choice
    * repeats = false
    * answerValueSet = "#YesNo"
  * item[+]
    * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
    * linkId = "08e8ca54-9af8-4028-be83-aab20bccecc3"
    * text = "Immunisations due"
    * type = #text
    * repeats = false
  * item[+]
    * linkId = "cc522cb1-b553-48c7-9028-61d15dd60845"
    * text = "Vaccines given today"
    * type = #group
    * repeats = false
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#radio-button
      * linkId = "9f5787e6-8ece-46a4-8d67-e7c3e14daf18"
      * text = "Vaccines recorded on Australian Immunisation Register?"
      * type = #choice
      * repeats = false
      * answerValueSet = "#YesNo"
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
      * linkId = "c8da01ec-de58-46e3-81a1-2c49aed8c28e"
      * text = "Details"
      * type = #text
      * repeats = false
      * enableWhen[+]
        * question = "9f5787e6-8ece-46a4-8d67-e7c3e14daf18"
        * operator = #=
        * answerCoding = http://terminology.hl7.org/CodeSystem/v2-0136#Y

  * item[+]
    * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
    * linkId = "bcd1c9f2-889e-41e5-8c2b-a70221c5cec5"
    * text = "Health priorities, actions and follow-up"
    * type = #text
    * repeats = false