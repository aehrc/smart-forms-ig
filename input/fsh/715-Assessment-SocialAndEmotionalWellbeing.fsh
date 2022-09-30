Alias: $LNC = http://loinc.org
Alias: $SCT = http://snomed.info/sct
Alias: $UCUM = http://unitsofmeasure.org

Instance: 715-Assessment-SocialAndEmotionalWellbeing
InstanceOf: Questionnaire
Usage: #definition
Title: "715 Assessment Social And Emotional Wellbeing"
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
* url = "http://www.health.gov.au/assessments/mbs/715/715-Assessment-SocialAndEmotionalWellbeing"
* name = "715-Assessment-SocialAndEmotionalWellbeing"
* title = "715 Assessment Social And Emotional Wellbeing"
* status = #draft
* experimental = true
* subjectType[+] = #Patient
* date = "2022-05-24"
* jurisdiction.coding = urn:iso:std:iso:3166#AU

* item[+]
  * extension[questionnaire-itemControl].valueCodeableConcept = https://aehrc.csiro.au/fhir/CodeSystem/QuestionnaireItemControlExtended#tab
  * linkId = "0a3c9c93-5836-4a5b-93e5-d7de559e053a"
  * text = "Social and emotional wellbeing"
  * type = #group
  * repeats = false
  * enableWhen[+]
    * question = "e2a16e4d-2765-4b61-b286-82cfc6356b30" // age item which has initial population from variable
    * operator = #>
    * answerInteger = 12
  * item[+]
    * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#radio-button
    * linkId = "e7297156-cfed-4437-b877-c345f744168b"
    * text = "Have there been any particular stressful life events that are impacting on you/your health lately?"
    * type = #choice
    * repeats = false
    * answerValueSet = "https://aehrc.csiro.au/fhir/ValueSet/YesNo"
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
      * linkId = "4c3427ce-062f-4f62-b566-2decb506a9cb"
      * text = "Details"
      * type = #text
      * repeats = false
      * enableWhen[+]
        * question = "e7297156-cfed-4437-b877-c345f744168b"
        * operator = #=
        * answerCoding = http://terminology.hl7.org/CodeSystem/v2-0136#Y
  * item[+]
    * linkId = "7d783b71-7303-441b-822a-14e11a740038"
    * text = "Social and emotional wellbeing assessment: consider tools such as Aboriginal and Torres Strait Islander Youth Social Emotional Wellbeing assessment question guide or HEEADSSS"
    * type = #display
    * repeats = false
    * enableWhen[+]
      * question = "e2a16e4d-2765-4b61-b286-82cfc6356b30" // age item which has initial population from variable
      * operator = #<=
      * answerInteger = 24
  * item[+]
    * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
    * linkId = "9e991b80-7080-40d5-9ad9-447dc47e3a68"
    * text = "Consider conversation about social connection, which could include questions about sports/hobbies/clubs/other activities"
    * type = #text
    * repeats = false
    * enableWhen[+]
      * question = "e2a16e4d-2765-4b61-b286-82cfc6356b30" // age item which has initial population from variable
      * operator = #>
      * answerInteger = 24
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#prompt
      * linkId = "2740f866-2cd7-41a1-912c-ba29cbe7a582"
      * text = "Details"
      * type = #display

  * item[+]
    * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
    * linkId = "b5a00aad-2a8b-4ac3-87b2-4a5920ca22ee"
    * text = "Health priorities, actions and follow-up"
    * type = #text
    * repeats = false