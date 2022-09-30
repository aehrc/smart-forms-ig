Alias: $LNC = http://loinc.org
Alias: $SCT = http://snomed.info/sct
Alias: $UCUM = http://unitsofmeasure.org

Instance: 715-Assessment-MemoryAndThinking
InstanceOf: Questionnaire
Usage: #definition
Title: "715 Assessment Memory And Thinking"
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
* url = "http://www.health.gov.au/assessments/mbs/715/715-Assessment-MemoryAndThinking"
* name = "715-Assessment-MemoryAndThinking"
* title = "715 Assessment Memory And Thinking"
* status = #draft
* experimental = true
* subjectType[+] = #Patient
* date = "2022-05-24"
* jurisdiction.coding = urn:iso:std:iso:3166#AU

* item[+]
  * extension[questionnaire-itemControl].valueCodeableConcept = https://aehrc.csiro.au/fhir/CodeSystem/QuestionnaireItemControlExtended#tab
  * linkId = "1bd58e7b-2cb7-45fb-965f-d5fa33d0bb4c"
  * text = "Memory and thinking"
  * type = #group
  * repeats = false
  * enableWhen[+]
    * question = "e2a16e4d-2765-4b61-b286-82cfc6356b30" // age item which has initial population from variable
    * operator = #>=
    * answerInteger = 50
  * item[+]
    * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#radio-button
    * linkId = "e29701be-2b79-471d-a42e-7e3830459080"
    * text = "Do you have any worries about your memory or thinking?"
    * type = #choice
    * repeats = false
    * answerValueSet = "https://aehrc.csiro.au/fhir/ValueSet/YesNo"
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
      * linkId = "69985e2e-4619-42fa-a111-e6fb3118ef74"
      * text = "Details"
      * type = #text
      * repeats = false
      * enableWhen[+]
        * question = "e29701be-2b79-471d-a42e-7e3830459080"
        * operator = #=
        * answerCoding = http://terminology.hl7.org/CodeSystem/v2-0136#Y
  * item[+]
    * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#radio-button
    * linkId = "06a67326-9e3d-4c4c-b271-af5b168d077c"
    * text = "Does anyone in your family have any worries about your memory or thinking?"
    * type = #choice
    * repeats = false
    * answerValueSet = "https://aehrc.csiro.au/fhir/ValueSet/YesNo"
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
      * linkId = "43d2cb6c-29a7-4293-a6c8-87a228a82e19"
      * text = "Details"
      * type = #text
      * repeats = false
      * enableWhen[+]
        * question = "06a67326-9e3d-4c4c-b271-af5b168d077c"
        * operator = #=
        * answerCoding = http://terminology.hl7.org/CodeSystem/v2-0136#Y
  * item[+]
    * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
    * linkId = "4ebb3c30-936b-4932-a330-f1e643b5ccd4"
    * text = "If any concerns are raised and/or high risk for cognitive impairment identified, follow up with cognitive screening (eg clock test, GPCOG, KICA-Cog, MMSE)"
    * type = #text
    * repeats = false
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#prompt
      * linkId = "c563f52d-d3cc-4687-9863-0f1b7d00d942"
      * text = "Details"
      * type = #display


  * item[+]
    * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
    * linkId = "1f0e7fde-e964-4f36-9151-dbdc5e145f94"
    * text = "Health priorities, actions and follow-up"
    * type = #text
    * repeats = false