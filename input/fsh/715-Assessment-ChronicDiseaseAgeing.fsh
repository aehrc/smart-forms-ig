Alias: $LNC = http://loinc.org
Alias: $SCT = http://snomed.info/sct
Alias: $UCUM = http://unitsofmeasure.org

Instance: 715AssessmentChronicDiseaseAgeing
InstanceOf: Questionnaire
Usage: #definition
Title: "715 Assessment Chronic Disease Ageing"
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
* url = "http://www.health.gov.au/assessments/mbs/715/715AssessmentChronicDiseaseAgeing"
* name = "715AssessmentChronicDiseaseAgeing"
* title = "715 Assessment Chronic Disease Ageing"
* status = #draft
* experimental = true
* subjectType[+] = #Patient
* date = "2022-05-24"
* jurisdiction.coding = urn:iso:std:iso:3166#AU

* item[+]
  * extension[questionnaire-itemControl].valueCodeableConcept = https://aehrc.csiro.au/fhir/CodeSystem/QuestionnaireItemControlExtended#tab
  * linkId = "c5da020c-c4f3-437c-b658-ea7e7667514d"
  * text = "Chronic disease associated with ageing"
  * type = #group
  * repeats = false
  * enableWhen[+]
    * question = "e2a16e4d-2765-4b61-b286-82cfc6356b30" // age item which has initial population from variable
    * operator = #>=
    * answerInteger = 50
  * item[+]
    * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
    * extension[sdc-questionnaire-shortText].valueString = "Assessment of chronic disease associated with ageing"
    * linkId = "12e244c0-2887-4230-8792-9521d4f1ab33"
    * text = "For older people with chronic disease and/or conditions associated with ageing, consider assessing:\n- Osteoporosis risk\n- Falls risk\n- Balance, coordination and mobility\n- Pain\n- Nutrition\n- Regularity of chronic disease management and review"
    * type = #text
    * repeats = false
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#prompt
      * linkId = "d6337ce3-ec9a-44e2-a69a-2355025b3e8c"
      * text = "Details"
      * type = #display

  * item[+]
    * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
    * linkId = "7292070b-8944-4a40-bcf6-9aaf1721e986"
    * text = "Health priorities, actions and follow-up"
    * type = #text
    * repeats = false