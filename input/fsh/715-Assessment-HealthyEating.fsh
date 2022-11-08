Alias: $LNC = http://loinc.org
Alias: $SCT = http://snomed.info/sct
Alias: $UCUM = http://unitsofmeasure.org

Instance: 715AssessmentHealthyEating
InstanceOf: Questionnaire
Usage: #definition
Title: "715 Assessment Healthy Eating"
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
* url = "http://www.health.gov.au/assessments/mbs/715/715AssessmentHealthyEating"
* name = "715AssessmentHealthyEating"
* title = "715 Assessment Healthy Eating"
* status = #draft
* experimental = true
* subjectType[+] = #Patient
* date = "2022-05-24"
* jurisdiction.coding = urn:iso:std:iso:3166#AU


* item[+]
  * extension[questionnaire-itemControl].valueCodeableConcept = https://aehrc.csiro.au/fhir/CodeSystem/QuestionnaireItemControlExtended#tab
  * linkId = "ae7a3801-9491-4b1f-820c-678236d18f56"
  * text = "Healthy eating"
  * type = #group
  * repeats = false
  * item[+]
    * linkId = "9ac8c78d-9c36-4bf5-8c6e-e48109902dfa"
    * text = "Child eating concerns"
    * type = #group
    * repeats = false
    * enableWhen[+]
      * question = "e2a16e4d-2765-4b61-b286-82cfc6356b30" // age item which has initial population from variable
      * operator = #<=
      * answerInteger = 12
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#radio-button
      * linkId = "e2942894-5537-47a6-ab43-06eb6761f9b5"
      * text = "Is there anything that you are worried about with your child's feeding/eating?"
      * type = #choice
      * repeats = false
      * enableWhen[+]
        * question = "e2a16e4d-2765-4b61-b286-82cfc6356b30" // age item which has initial population from variable
        * operator = #<=
        * answerInteger = 5
      * answerValueSet = "#YesNo"
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#radio-button
      * linkId = "69d92a26-95ac-4556-94da-5b0e09940bfd"
      * text = "Is there anything that you are worried about with your child's eating?"
      * type = #choice
      * repeats = false
      * enableWhen[+]
        * question = "e2a16e4d-2765-4b61-b286-82cfc6356b30" // age item which has initial population from variable
        * operator = #>
        * answerInteger = 5
      * answerValueSet = "#YesNo"
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
      * linkId = "f6907808-3e42-4206-9bf8-ca4082ea4814"
      * text = "Details"
      * type = #text
      * repeats = false
      * enableWhen[+]
        * question = "e2942894-5537-47a6-ab43-06eb6761f9b5"
        * operator = #=
        * answerCoding = http://terminology.hl7.org/CodeSystem/v2-0136#Y
      * enableWhen[+]
        * question = "69d92a26-95ac-4556-94da-5b0e09940bfd"
        * operator = #=
        * answerCoding = http://terminology.hl7.org/CodeSystem/v2-0136#Y
      * enableBehavior = #any    
  * item[+]
    * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
    * linkId = "ff6a46e6-0812-4718-a854-489b24805925"
    * text = "Breastfeeding history"
    * type = #text
    * repeats = false
    * enableWhen[+]
      * question = "e2a16e4d-2765-4b61-b286-82cfc6356b30" // age item which has initial population from variable
      * operator = #<=
      * answerInteger = 5
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#prompt
      * linkId = "87f4277a-0af8-4bb9-ba2d-cb4e4f3a4548"
      * text = "Details"
      * type = #display
  * item[+]
    * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
    * linkId = "b5f748d2-1874-4949-a7df-6e233f03135d"
    * text = "Bottle feeding history"
    * type = #text
    * repeats = false
    * enableWhen[+]
      * question = "e2a16e4d-2765-4b61-b286-82cfc6356b30" // age item which has initial population from variable
      * operator = #<=
      * answerInteger = 5
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#prompt
      * linkId = "1792a4b0-640f-4d41-8704-c069179539bb"
      * text = "Details"
      * type = #display
  
  * item[+]
    * linkId = "9266b946-74b3-4fc2-91ce-df557692e600"
    * text = "Diet or weight concerns"
    * type = #group
    * repeats = false
    * enableWhen[+]
      * question = "e2a16e4d-2765-4b61-b286-82cfc6356b30" // age item which has initial population from variable
      * operator = #>
      * answerInteger = 12
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#radio-button
      * linkId = "646302e9-d384-4943-99bc-11e638641703"
      * text = "Do you have any worries about your diet or weight?"
      * type = #choice
      * repeats = false
      * answerValueSet = "#YesNo"
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
      * linkId = "1d5c3354-6780-4b6a-b9af-7a17b0386781"
      * text = "Details"
      * type = #text
      * repeats = false
      * enableWhen[+]
        * question = "646302e9-d384-4943-99bc-11e638641703"
        * operator = #=
        * answerCoding = http://terminology.hl7.org/CodeSystem/v2-0136#Y
  * item[+]
    * linkId = "c4c51d01-7acf-4551-a652-82f9fdf58a6d"
    * text = "Unintended weight loss"
    * type = #group
    * repeats = false
    * enableWhen[+]
      * question = "e2a16e4d-2765-4b61-b286-82cfc6356b30" // age item which has initial population from variable
      * operator = #>=
      * answerInteger = 50
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#radio-button
      * linkId = "6dc96b26-cbc5-4434-8f6b-0260196311c2"
      * text = "Have you lost weight without trying to in the last three months?"
      * type = #choice
      * repeats = false
      * answerValueSet = "#YesNo"
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
      * linkId = "ce71f016-c5e4-4121-abe5-fe0c974c1bba"
      * text = "Details"
      * type = #text
      * repeats = false
      * enableWhen[+]
        * question = "6dc96b26-cbc5-4434-8f6b-0260196311c2"
        * operator = #=
        * answerCoding = http://terminology.hl7.org/CodeSystem/v2-0136#Y
  * item[+]
    * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
    * linkId = "9f6adf74-f240-41a2-a509-d216d5308911"
    * text = "Document conversation about age-appropriate healthy eating, which could include:\n- current diet\n- transition to solids\n- dietary recommendations re fruit and vegetable intake, iron-rich foods, avoiding sugary drinks"
    * type = #text
    * repeats = false
    * enableWhen[+]
      * question = "e2a16e4d-2765-4b61-b286-82cfc6356b30" // age item which has initial population from variable
      * operator = #<=
      * answerInteger = 5
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#prompt
      * linkId = "d3c0033f-20d0-40ab-b4d5-6eb3f67be492"
      * text = "details"
      * type = #display
  * item[+]
    * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
    * linkId = "7a22a4c4-6611-4687-af00-37c80c3f8fc0"
    * text = "Document conversation about health eating which could include:\n- current diet including food and drinks\n- recommendations about fruit and vegetable intake, water as the main drink, avoiding sugary drinks, avoiding highly processed foods (including supermarket-bought and take-away like KFC, Maccas, etc)"
    * type = #text
    * repeats = false
    * enableWhen[+]
      * question = "e2a16e4d-2765-4b61-b286-82cfc6356b30" // age item which has initial population from variable
      * operator = #>
      * answerInteger = 5
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#prompt
      * linkId = "579a1e9e-c679-4411-b78f-0468cd45e1a2"
      * text = "details"
      * type = #display
  * item[+]
    * linkId = "71e39493-f0b0-4074-934b-604155b349e1"
    * text = "Food availability issues"
    * type = #group
    * repeats = false 
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#radio-button
      * linkId = "12a41538-5dbd-4c1d-af69-52c59c48b1a9"
      * text = "Are there any issues about availability of food?"
      * type = #choice
      * repeats = false
      * answerValueSet = "#YesNo"
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
      * linkId = "92908e91-9453-4d22-99eb-23dad580c1cb"
      * text = "Details"
      * type = #text
      * repeats = false
      * enableWhen[+]
        * question = "12a41538-5dbd-4c1d-af69-52c59c48b1a9"
        * operator = #=
        * answerCoding = http://terminology.hl7.org/CodeSystem/v2-0136#Y

  * item[+]
    * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
    * linkId = "301789b0-8c6a-470d-8787-0ac6597e3bea"
    * text = "Health priorities, actions and follow-up"
    * type = #text
    * repeats = false