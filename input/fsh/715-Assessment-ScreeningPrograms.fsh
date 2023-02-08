Alias: $LNC = http://loinc.org
Alias: $SCT = http://snomed.info/sct
Alias: $UCUM = http://unitsofmeasure.org

Instance: 715AssessmentScreeningPrograms
InstanceOf: Questionnaire
Usage: #definition
Title: "715 Assessment Screening Programs"
Description: "Screening Programs sub-questionnaire for Aboriginal and Torres Strait Islander Health Checks."

//assemble expectation
* extension[+]
  * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-assemble-expectation"
  * valueCode = #assemble-child

//launch context
* extension[+]
  * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext"
  * extension[+]
    * url = "name"
    * valueCoding = http://hl7.org/fhir/uv/sdc/CodeSystem/launchContext#patient
  * extension[+]
    * url = "type"
    * valueCode = #Patient
  * extension[+]
    * url = "description"
    * valueString = "The patient that is to be used to pre-populate the form"

* meta.profile[+] = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-render"
* meta.profile[+] = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-modular"
* meta.profile[+] = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-pop-exp"
* url = "http://www.health.gov.au/assessments/mbs/715/715AssessmentScreeningPrograms"
* name = "715AssessmentScreeningPrograms"
* title = "715 Assessment Screening Programs"
* status = #draft
* experimental = true
* subjectType[+] = #Patient
* date = "2022-05-24"
* jurisdiction.coding = urn:iso:std:iso:3166#AU


// should this group be only for >=74?
* item[+]
  * extension[questionnaire-itemControl].valueCodeableConcept = https://aehrc.csiro.au/fhir/CodeSystem/QuestionnaireItemControlExtended#tab
  * linkId = "9674ffa0-2ad9-4ca3-80e6-e8bb0670a802"
  * text = "Participation in screening programs"
  * type = #group
  * repeats = false
  * enableWhen[+]
    * question = "e2a16e4d-2765-4b61-b286-82cfc6356b30" // age item which has initial population from variable
    * operator = #exists
    * answerBoolean = true
  * enableWhen[+]
    * question = "e2a16e4d-2765-4b61-b286-82cfc6356b30" // age item which has initial population from variable
    * operator = #>=
    * answerInteger = 50
  * enableWhen[+]
    * question = "e2a16e4d-2765-4b61-b286-82cfc6356b30" // age item which has initial population from variable
    * operator = #<=
    * answerInteger = 74
  * enableBehavior = #all
// following items require coded answers. Either <|Context values for actions (qualifier value)| or <|Chronic disease monitoring status (finding)|
  * item[+]
    * linkId = "ed15e82b-803a-4d21-9344-9110b57b2313"
    * text = "Cervical screening (age <=74 years)"
    * type = #group
    * repeats = false
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#radio-button
      * linkId = "c1cf9c00-15ef-4b98-bab0-20a5f01b4932"
      * text = "Cervical screening status"
      * type = #choice
      * repeats = false
      * answerOption[+].valueString = "Up to date"
      * answerOption[+].valueString = "Discussed today"
      * answerOption[+].valueString = "Not required"
      * answerOption[+].valueString = "Declined"
      * answerOption[+].valueString = "Next due" 
    * item[+]
      * linkId = "4e0c55a0-c559-45fd-b165-5aaea3451423"
      * text = "Cervical screening details"
      * type = #text
      * repeats = false
  * item[+]
    * linkId = "17ff5354-fe9c-429c-a752-c27a871d4ee7"
    * text = "Breast screening (age <=74 years)"
    * type = #group
    * repeats = false
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#radio-button
      * linkId = "29fada07-f981-44cf-8092-61c86365a965"
      * text = "Breast screening status"
      * type = #choice
      * repeats = false
      * answerOption[+].valueString = "Up to date"
      * answerOption[+].valueString = "Discussed today"
      * answerOption[+].valueString = "Not required"
      * answerOption[+].valueString = "Declined"
      * answerOption[+].valueString = "Next due" 
    * item[+]
      * linkId = "b63a03c8-2c7b-46a5-8f13-ebc7fb8b91ee"
      * text = "Breast screening details"
      * type = #text
      * repeats = false
  * item[+]
    * linkId = "bb5d56e3-efb9-45fe-854d-e4550b327d26"
    * text = "Bowel cancer screening (age <=74 years)"
    * type = #group
    * repeats = false
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#radio-button
      * linkId = "521df1b1-ff36-458b-8f99-e41c2b1685c8"
      * text = "Bowel cancer screening status"
      * type = #choice
      * repeats = false
      * answerOption[+].valueString = "Up to date"
      * answerOption[+].valueString = "Discussed today"
      * answerOption[+].valueString = "Not required"
      * answerOption[+].valueString = "Declined"
      * answerOption[+].valueString = "Next due" 
    * item[+]
      * linkId = "0d59513c-7a77-4752-9c4e-492a54412731"
      * text = "Bowel cancer screening details"
      * type = #text
      * repeats = false


  * item[+]
    * linkId = "70f82c4b-d1f9-44d5-9903-bd7097799c05"
    * text = "Health priorities, actions and follow-up"
    * type = #text
    * repeats = false