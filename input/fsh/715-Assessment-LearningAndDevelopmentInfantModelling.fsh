Alias: $LNC = http://loinc.org
Alias: $SCT = http://snomed.info/sct
Alias: $UCUM = http://unitsofmeasure.org

Instance: 715-Assessment-LearningAndDevelopment-InfantModelling
InstanceOf: Questionnaire
Usage: #definition
Title: "715 Assessment Learning And development"
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
* url = "http://www.health.gov.au/assessments/mbs/715/715-Assessment-LearningAndDevelopment-InfantModelling"
* name = "715-Assessment-LearningAndDevelopment"
* title = "715 Assessment Learning And development"
* status = #draft
* experimental = true
* subjectType[+] = #Patient
* date = "2022-05-24"
* jurisdiction.coding = urn:iso:std:iso:3166#AU

* item[+]
  * extension[questionnaire-itemControl].valueCodeableConcept = https://aehrc.csiro.au/fhir/CodeSystem/QuestionnaireItemControlExtended#tab
  * linkId = "da599e46-740a-4875-9d99-86103ee797bc"
  * text = "Learning and development"
  * type = #group
  * repeats = false
  * enableWhen[+]
    * question = "e2a16e4d-2765-4b61-b286-82cfc6356b30" // age item which has initial population from variable
    * operator = #<=
    * answerInteger = 5
  * item[+]
    * linkId = "8dd21e7d-7c3d-4efe-982b-fe5c5948781f"
    * text = "Child's development"
    * type = #group
    * repeats = false  
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#radio-button
      * linkId = "c55ecbfd-b38f-42b0-86bb-94cd0c6ffaea"
      * text = "Is there anything that you are worried about with your child's development?"
      * type = #choice
      * repeats = false
      * answerValueSet = "https://aehrc.csiro.au/fhir/ValueSet/YesNo"
      * item[+]
        * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
        * linkId = "714a512a-8319-463e-a677-2a44afc0292a"
        * text = "Details"
        * type = #text
        * repeats = false
        * enableWhen[+]
          * question = "c55ecbfd-b38f-42b0-86bb-94cd0c6ffaea"
          * operator = #=
          * answerCoding = http://terminology.hl7.org/CodeSystem/v2-0136#Y
  * item[+]
    * linkId = "7cd3c9d7-61cf-42ba-bc52-ad801c643846"
    * text = "Child's behaviour"
    * type = #group
    * repeats = false  
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#radio-button
      * linkId = "e757f62e-be25-4c2c-9056-85ab9ee1ef0d"
      * text = "Is there anything that you are worried about with your child's behaviour?"
      * type = #choice
      * repeats = false
      * answerValueSet = "https://aehrc.csiro.au/fhir/ValueSet/YesNo"
      * item[+]
        * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
        * linkId = "4f72d71d-6587-40a5-8bd0-e02540c16f65"
        * text = "Details"
        * type = #text
        * repeats = false
        * enableWhen[+]
          * question = "e757f62e-be25-4c2c-9056-85ab9ee1ef0d"
          * operator = #=
          * answerCoding = http://terminology.hl7.org/CodeSystem/v2-0136#Y
  * item[+]
    * linkId = "69b325cd-35e7-41d4-88b9-8c69b524a1f3"
    * text = "Child's sleep"
    * type = #group
    * repeats = false  
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#radio-button
      * linkId = "21548530-ada4-495d-a132-172eb7b6e8cf"
      * text = "Is there anything that you are worried about with your child's sleep?"
      * type = #choice
      * repeats = false
      * answerValueSet = "https://aehrc.csiro.au/fhir/ValueSet/YesNo"
      * item[+]
        * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
        * linkId = "45c0647a-63e1-48b8-9f01-c653aabba554"
        * text = "Details"
        * type = #text
        * repeats = false
        * enableWhen[+]
          * question = "21548530-ada4-495d-a132-172eb7b6e8cf"
          * operator = #=
          * answerCoding = http://terminology.hl7.org/CodeSystem/v2-0136#Y

  * item[+]
    * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
    * linkId = "c932cb2d-ca61-4a90-b64e-fc9d3570e1e9"
    * text = "What childcare/early learning centre/kindergarten does your child go to? How often?"
    * type = #text
    * repeats = false
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#prompt
      * linkId = "166b2451-8e07-435b-a111-b066aba22a40"
      * text = "details"
      * type = #display
  * item[+]
    * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
    * linkId = "7d491dd8-fd03-41b4-8ba3-ea00ad0a74a1"
    * text = "How often does your child miss childcare/early learning centre/kindergarten?"
    * type = #text
    * repeats = false
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#prompt
      * linkId = "6f4ce59c-5cc9-4071-857c-dd2e996fc052"
      * text = "details"
      * type = #display