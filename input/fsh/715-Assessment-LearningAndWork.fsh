Alias: $LNC = http://loinc.org
Alias: $SCT = http://snomed.info/sct
Alias: $UCUM = http://unitsofmeasure.org

Instance: 715-Assessment-LearningAndWork
InstanceOf: Questionnaire
Usage: #definition
Title: "715 Assessment Learning And Work"
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
* url = "http://www.health.gov.au/assessments/mbs/715/715-Assessment-LearningAndWork"
* name = "715-Assessment-LearningAndWork"
* title = "715 Assessment Learning And Work"
* status = #draft
* experimental = true
* subjectType[+] = #Patient
* date = "2022-05-24"
* jurisdiction.coding = urn:iso:std:iso:3166#AU

// adolescents and adults
* item[+]
  * extension[questionnaire-itemControl].valueCodeableConcept = https://aehrc.csiro.au/fhir/CodeSystem/QuestionnaireItemControlExtended#tab
  * linkId = "5437e30d-8a0a-4785-974e-00a10d2a1df0"
  * text = "Learning And Work"
  * type = #group
  * repeats = false
  * enableWhen[+]
    * question = "e2a16e4d-2765-4b61-b286-82cfc6356b30" // age item which has initial population from variable
    * operator = #>
    * answerInteger = 12
  * enableWhen[+]
    * question = "e2a16e4d-2765-4b61-b286-82cfc6356b30" // age item which has initial population from variable
    * operator = #<
    * answerInteger = 50
  * enableBehavior = #all
  * item[+]
    * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#radio-button
    * linkId = "0cd9e27b-1e98-41af-917b-0c6ee21c0819"
    * text = "Are you studying at school/uni?"
    * type = #choice
    * repeats = false
    * enableWhen[+]
      * question = "e2a16e4d-2765-4b61-b286-82cfc6356b30" // age item which has initial population from variable
      * operator = #<
      * answerInteger = 25
    * answerValueSet = "https://aehrc.csiro.au/fhir/ValueSet/YesNoNA"
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
      * linkId = "18bdfa42-9845-4c6e-b737-843b14d54641"
      * text = "Details"
      * type = #text
      * repeats = false
      * enableWhen[+]
        * question = "0cd9e27b-1e98-41af-917b-0c6ee21c0819"
        * operator = #=
        * answerCoding = http://terminology.hl7.org/CodeSystem/v2-0136#Y
  * item[+]
    * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#radio-button
    * linkId = "4a81afc0-f0da-49e1-b8cc-c19cb0f5f4e9"
    * text = "Are you studying?"
    * type = #choice
    * repeats = false
    * enableWhen[+]
      * question = "e2a16e4d-2765-4b61-b286-82cfc6356b30" // age item which has initial population from variable
      * operator = #>=
      * answerInteger = 25
    * answerValueSet = "https://aehrc.csiro.au/fhir/ValueSet/YesNoNA"
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
      * linkId = "1c648524-558e-4d24-bd83-c9f5cd35e97b"
      * text = "Details"
      * type = #text
      * repeats = false
      * enableWhen[+]
        * question = "4a81afc0-f0da-49e1-b8cc-c19cb0f5f4e9"
        * operator = #=
        * answerCoding = http://terminology.hl7.org/CodeSystem/v2-0136#Y
  * item[+]
    * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#radio-button
    * linkId = "aaead1e2-ea54-4979-be0a-647e61ab59a9"
    * text = "Are you working?"
    * type = #choice
    * repeats = false
    * answerValueSet = "https://aehrc.csiro.au/fhir/ValueSet/YesNoNA"
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
      * extension[sdc-questionnaire-shortText].valueString = "Details"
      * linkId = "749a4e1e-35ab-4f37-ab28-cb3f0830bb2a"
      * text = "Details (occupation including occupational hazards, study, training, disability, etc)"
      * type = #text
      * repeats = false
      * enableWhen[+]
        * question = "aaead1e2-ea54-4979-be0a-647e61ab59a9"
        * operator = #=
        * answerCoding = http://terminology.hl7.org/CodeSystem/v2-0136#Y



// older people
* item[+]
  * extension[questionnaire-itemControl].valueCodeableConcept = https://aehrc.csiro.au/fhir/CodeSystem/QuestionnaireItemControlExtended#tab
  * linkId = "dec713ae-246a-4961-95c9-0626bfebfed2"
  * text = "Work"
  * type = #group
  * repeats = false
  * enableWhen[+]
    * question = "e2a16e4d-2765-4b61-b286-82cfc6356b30" // age item which has initial population from variable
    * operator = #>=
    * answerInteger = 50
  * item[+]
    * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#radio-button
    * linkId = "4c68ff3e-0e73-4ea2-b295-5057deaa590e"
    * text = "Are you working?"
    * type = #choice
    * repeats = false
    * answerValueSet = "https://aehrc.csiro.au/fhir/ValueSet/YesNo"
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
      * extension[sdc-questionnaire-shortText].valueString = "Details"
      * linkId = "794fc001-6799-4a51-9a80-f2ed7c685a42"
      * text = "Details (occupation including occupational hazards, study, training, disability, etc)"
      * type = #text
      * repeats = false
      * enableWhen[+]
        * question = "4c68ff3e-0e73-4ea2-b295-5057deaa590e"
        * operator = #=
        * answerCoding = http://terminology.hl7.org/CodeSystem/v2-0136#Y

// continue
  * item[+]
    * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
    * linkId = "ed6f7800-e22a-4639-9d11-faf845513500"
    * text = "Health priorities, actions and follow-up"
    * type = #text
    * repeats = false