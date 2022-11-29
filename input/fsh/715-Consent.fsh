// Conditional questions supporting all age groups

Alias: $LNC = http://loinc.org
Alias: $SCT = http://snomed.info/sct
Alias: $UCUM = http://unitsofmeasure.org

Instance: 715Consent
InstanceOf: Questionnaire
Usage: #definition
Title: "715 Consent"
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
* url = "http://www.health.gov.au/assessments/mbs/715/715Consent"
* name = "715Consent"
* title = "715 Consent"
* status = #draft
* experimental = true
* subjectType[+] = #Patient
* date = "2022-05-24"
* jurisdiction.coding = urn:iso:std:iso:3166#AU

* item[+]
  * extension[questionnaire-itemControl].valueCodeableConcept = https://aehrc.csiro.au/fhir/CodeSystem/QuestionnaireItemControlExtended#tab
  * linkId = "1016f79d-9756-4daf-b6ee-29add134b34f"
  * text = "Consent"
  * type = #group
  * repeats = false
  * item[+]
    * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#radio-button
    * extension[questionnaire-choiceOrientation].valueCode = #horizontal
    * linkId = "d1e1ab3d-1c6c-430b-8ae7-af56b8f0af55"
    * text = "Consent given after discussion of process and benefits of a health check"
    * type = #choice
    * repeats = false
    * answerValueSet = "#YesNoNA"
    * enableWhen[+]
      * question = "e2a16e4d-2765-4b61-b286-82cfc6356b30" // age item which has initial population from variable
      * operator = #>
      * answerInteger = 12
  * item[+]
    * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#radio-button
    * extension[questionnaire-choiceOrientation].valueCode = #horizontal
    * linkId = "7fa8bc57-f3f9-4ddc-bf9b-12a9b9885dbd"
    * text = "Consent given by parent/primary carer after discussion of process and benefits of a health check"
    * type = #choice
    * repeats = false
    * answerValueSet = "#YesNoNA"
    * enableWhen[+]
      * question = "e2a16e4d-2765-4b61-b286-82cfc6356b30" // age item which has initial population from variable
      * operator = #<=
      * answerInteger = 12
  * item[+]
    * linkId = "80a6a405-49a4-44fb-bff3-212902096b95"
    * text = "Parent/primary caregiver present"
    * type = #group
    * repeats = false
    * enableWhen[+]
      * question = "e2a16e4d-2765-4b61-b286-82cfc6356b30" // age item which has initial population from variable
      * operator = #<=
      * answerInteger = 24
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#radio-button
      * extension[questionnaire-choiceOrientation].valueCode = #horizontal
      * linkId = "c72933c7-349f-4fef-94ff-c424c69da6f3"
      * text = "Parent/primary caregiver is present for health check?"
      * type = #choice
      * repeats = false
      * answerValueSet = "#YesNoNA"
    * item[+]
      * linkId = "b7d116f9-0425-4cf1-8cde-fbf4dfaee550"
      * text = "Relationship to child"
      * type = #string // should be a coded answer - possibly add a constrained answerValueSet https://healthterminologies.gov.au/fhir/ValueSet/related-person-relationship-type-1. Prototype uses http://snomed.info/sct?fhir_vs=refset/32570591000036107
      * enableWhen[+]
        * question = "c72933c7-349f-4fef-94ff-c424c69da6f3"
        * operator = #=
        * answerCoding = http://terminology.hl7.org/CodeSystem/v2-0136#Y 
      * repeats = true
  * item[+]
    * linkId = "d8c88bff-75ea-476f-8f83-e9b72fc9e1a0"
    * text = "Consent for sharing of information"
    * type = #group
    * repeats = false
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#radio-button
      * extension[questionnaire-choiceOrientation].valueCode = #horizontal
      * linkId = "057483ce-f265-46df-a1c5-7a18d492c1ba"
      * text = "Consent given for sharing of information with relevant healthcare providers?"
      * type = #choice
      * repeats = false
      * answerValueSet = "#YesNoNA"
    * item[+]
      * linkId = "43517c44-5cd2-4d9a-9f18-d6bf8124f4ae"
      * text = "Who/details"
      * type = #text
      * enableWhen[+]
        * question = "057483ce-f265-46df-a1c5-7a18d492c1ba"
        * operator = #=
        * answerCoding = http://terminology.hl7.org/CodeSystem/v2-0136#Y 
      * repeats = true
  * item[+]
    * extension[sdc-questionnaire-initialExpression].valueExpression
      * language = #text/fhirpath
      * expression = "today()"
    * linkId = "84162f36-f4af-4509-b178-ef2a3849d0b6"
    * text = "Date"
    * type = #date
    * repeats = false
    * required = true
  * item[+]
    * linkId = "0f92eb2d-4629-4215-96f8-46722a2efa73"
    * text = "Doctor"
    * type = #string
    * repeats = false
  * item[+]
    * linkId = "8b94a129-3aab-4d13-bb6d-7a748f5c41e5"
    * text = "Nurse"
    * type = #string
    * repeats = false
  * item[+]
    * linkId = "2a517291-e2f1-4f66-ad1f-ae5b091d2f8a"
    * text = "Aboriginal and/or Torres Strait Islander Health Worker / Health Practitioner"
    * type = #string
    * repeats = false
  * item[+]
    * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#radio-button
    * extension[sdc-questionnaire-openLabel].valueString = "Other, please specify"
    * linkId = "5bbfb4a3-a667-4ef2-98c2-76e76da55c03"
    * text = "Location of health check"
    * type = #open-choice
    * repeats = false
    * answerOption[+].valueCoding = $SCT#257585005 "Clinic"
    * answerOption[+].valueCoding = $SCT#264362003 "Home"
    * answerOption[+].valueCoding = $SCT#257698009 "School"
    * enableWhen[+]
      * question = "e2a16e4d-2765-4b61-b286-82cfc6356b30" // age item which has initial population from variable
      * operator = #>
      * answerInteger = 5 
  * item[+]
    * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#radio-button
    * extension[sdc-questionnaire-openLabel].valueString = "Other, please specify"
    * linkId = "9a51c056-021d-445d-8eaa-2123a69aa9c2"
    * text = "Location of health check"
    * type = #open-choice
    * repeats = false
    * answerOption[+].valueCoding = $SCT#257585005 "Clinic"
    * answerOption[+].valueCoding = $SCT#264362003 "Home"
    * answerOption[+].valueCoding = $SCT#413817003 "Early learning centre" //concept id for child day care. Would be better with a new specific SCTAU concept. Could even remove conditional questioning and create a single value set to support the answer. 
    * enableWhen[+]
      * question = "e2a16e4d-2765-4b61-b286-82cfc6356b30" // age item which has initial population from variable
      * operator = #<=
      * answerInteger = 5





