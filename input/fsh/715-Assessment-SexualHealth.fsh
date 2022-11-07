Alias: $LNC = http://loinc.org
Alias: $SCT = http://snomed.info/sct
Alias: $UCUM = http://unitsofmeasure.org

Instance: 715AssessmentSexualHealth
InstanceOf: Questionnaire
Usage: #definition
Title: "715 Assessment Sexual Health"
Description: "Sub-questionnaire for Aboriginal and Torres Strait Islander Health Checks"

* contained[+] = PrePopQuery
* contained[+] = YesNoNA
* contained[+] = YesNo


* extension[sdc-questionnaire-assemble-expectation].valueCode = #assemble-child
* extension[sdc-questionnaire-launchContext].extension[name].valueCoding = http://hl7.org/fhir/uv/sdc/CodeSystem/launchContext#patient
* extension[sdc-questionnaire-launchContext].extension[type].valueCode = #Patient
* extension[sdc-questionnaire-launchContext].extension[description].valueString = "The patient that is to be used to pre-populate the form"
* extension[sdc-questionnaire-sourceQueries].valueReference = Reference(PrePopQuery)

* meta.profile[+] = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-render"
* meta.profile[+] = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-modular"
//* meta.profile[+] = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-pop-obsn"
//* meta.profile[+] = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-extr-obsn"
* url = "http://www.health.gov.au/assessments/mbs/715/715AssessmentSexualHealth"
* name = "715AssessmentSexualHealth"
* title = "715 Assessment Sexual Health"
* status = #draft
* experimental = true
* subjectType[+] = #Patient
* date = "2022-05-24"
* jurisdiction.coding = urn:iso:std:iso:3166#AU

// Adolescents
* item[+]
  * extension[questionnaire-itemControl].valueCodeableConcept = https://aehrc.csiro.au/fhir/CodeSystem/QuestionnaireItemControlExtended#tab
  * extension[sdc-questionnaire-shortText].valueString = "Sexual health"
  * linkId = "4b49c291-6e93-4b7e-be3b-15ef8bc207ad"
  * text = "Sexual health (sexual activity, contraception, safe sex/protection, sexual orientation, gender identity, pressure to have sex, STIs)"
  * type = #group
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
    * linkId = "e5aeda89-b820-4bb3-8fbd-d4f662207b7d"
    * text = "Puberty and sexual health concerns"
    * type = #group
    * repeats = false
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#radio-button
      * linkId = "1d20138a-caf3-4c43-9693-04c08d37a84a"
      * text = "Is there anything that you are worried about in relation to puberty/your sexual health?"
      * type = #choice
      * repeats = false
      * answerValueSet = "#YesNo"
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
      * linkId = "d7b92cad-4aa8-47d3-975c-92563f132325"
      * text = "Details"
      * type = #text
      * repeats = false
      * enableWhen[+]
        * question = "1d20138a-caf3-4c43-9693-04c08d37a84a"
        * operator = #=
        * answerCoding = http://terminology.hl7.org/CodeSystem/v2-0136#Y
  * item[+]
    * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
    * extension[sdc-questionnaire-shortText].valueString = "Consider discussing items relevant to age/sex/gender"
    * linkId = "0fba3972-faa3-4f40-940c-c2f1c9b55329"
    * text = "Consider discussing as relevant to age/sex/gender: \n- menstruation (including risk of anaemia)\n- current sexual activity\n- contraception\n- safe sex practice (eg use of condoms)\n- sexually transmitted infection symptoms and screening\n- blood-borne virus screening"
    * type = #text
    * repeats = false

  * item[+]
    * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
    * linkId = "b41572ba-cf36-4cec-addf-cb0b47fea63f"
    * text = "Health priorities, actions and follow-up"
    * type = #text
    * repeats = false
  
//Adults
* item[+]
  * extension[questionnaire-itemControl].valueCodeableConcept = https://aehrc.csiro.au/fhir/CodeSystem/QuestionnaireItemControlExtended#tab
  * linkId = "589b53a4-ceb2-41c0-850a-69438f9fd1cc"
  * text = "Genitourinary and sexual health"
  * type = #group
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
    * linkId = "5f5d4886-ce06-47fa-a4d8-f6808b9081c0"
    * text = "Sexual health concerns"
    * type = #group
    * repeats = false
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#radio-button
      * linkId = "e56e79e5-8fbb-43f0-b2a3-018b55750bd0"
      * text = "Is there anything that you are worried about in relation to your sexual health?"
      * type = #choice
      * repeats = false
      * answerValueSet = "#YesNo"
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
      * linkId = "5148c6c6-c99f-480d-bb05-569064ba7118"
      * text = "Details"
      * type = #text
      * repeats = false
      * enableWhen[+]
        * question = "e56e79e5-8fbb-43f0-b2a3-018b55750bd0"
        * operator = #=
        * answerCoding = http://terminology.hl7.org/CodeSystem/v2-0136#Y  
  * item[+]
    * linkId = "d844a31e-8e51-420b-855c-4f485a180a57"
    * text = "Cervical screening"
    * type = #group
    * repeats = false       
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#check-box
      * linkId = "37dbd343-6d02-477c-89bf-59ba022efbb7"
      * text = "Cervical screening status"
      * type = #choice
      * repeats = false
      * answerOption[+].valueCoding = $SCT#736595007 "Declined"
      * answerOption[+].valueCoding = http://snomed.info/sct#410527000 "Offered" // a better concept is required
      * answerOption[+].valueCoding = $SCT#171154002 "Not required"
      * answerOption[+].valueCoding = $SCT#171155001 "Up to date"
    * item[+]
      * linkId = "f93eb998-1502-4d8a-88a4-986117a387c5"
      * text = "Next due"
      * type = #date
      * repeats = false
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
      * linkId = "862fc298-5b5e-4a46-badc-900c6ba1ff50"
      * text = "Details"
      * type = #text
      * repeats = false
  * item[+]
    * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
    * extension[sdc-questionnaire-shortText].valueString = "Consider discussing items relevant to age/sex/gender"
    * linkId = "39b02169-ea34-4af9-aa35-1c47f7f39333"
    * text = "Consider discussing as relevant to age/sex/gender:\n- contraception\n- menstruation\n- sexually transmitted infection symptoms and screening\n- blood-borne virus screening\n- continence\n- menopause\n- erectile dysfunction"
    * type = #text
    * repeats = false

  * item[+]
    * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
    * linkId = "efd0735c-c379-471f-83bb-93b0392093aa"
    * text = "Health priorities, actions and follow-up"
    * type = #text
    * repeats = false

//Older people
* item[+]
  * extension[questionnaire-itemControl].valueCodeableConcept = https://aehrc.csiro.au/fhir/CodeSystem/QuestionnaireItemControlExtended#tab
  * linkId = "02048954-e9d7-424e-8c7b-6a3c495d7ce4"
  * text = "Genitourinary and sexual health"
  * type = #group
  * repeats = false
  * enableWhen[+]
    * question = "e2a16e4d-2765-4b61-b286-82cfc6356b30" // age item which has initial population from variable
    * operator = #>=
    * answerInteger = 50
  * item[+]
    * linkId = "8172aaac-81c4-4b06-b4cd-6a891a227e9f"
    * text = "Sexual health concerns"
    * type = #group
    * repeats = false
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#radio-button
      * linkId = "1c40a720-bdb7-4386-a9f6-be82b7349bf7"
      * text = "Consider asking when appropriate: Is there anything that you are worried about in relation to your sexual health?"
      * type = #choice
      * repeats = false
      * answerValueSet = "#YesNo"
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
      * linkId = "f93fe768-9215-4a15-9376-686e9530ea79"
      * text = "Details"
      * type = #text
      * repeats = false
      * enableWhen[+]
        * question = "1c40a720-bdb7-4386-a9f6-be82b7349bf7"
        * operator = #=
        * answerCoding = http://terminology.hl7.org/CodeSystem/v2-0136#Y
  * item[+]
    * linkId = "2e1ea1cc-1f74-4b2e-bfda-f6a1d41e1e50"
    * text = "Continence issues"
    * type = #group
    * repeats = false
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#radio-button
      * linkId = "64fd0f79-7e09-4934-905d-9bff6715f9ba"
      * text = "Do you have problems with urine leaking?"
      * type = #choice
      * repeats = false
      * answerValueSet = "#YesNo"
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
      * linkId = "4fc14fd9-4c7e-48ec-90c0-c406523400fa"
      * text = "Details"
      * type = #text
      * repeats = false
      * enableWhen[+]
        * question = "64fd0f79-7e09-4934-905d-9bff6715f9ba"
        * operator = #=
        * answerCoding = http://terminology.hl7.org/CodeSystem/v2-0136#Y
  * item[+]
    * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
    * extension[sdc-questionnaire-shortText].valueString = "Consider discussing items relevant to age/sex/gender"
    * linkId = "8d75d1f1-290b-41fc-8e32-ad0681c650bb"
    * text = "Consider discussing as relevant to age/sex/gender:\n- menopause\n- erectile dysfunction\n- prostatic symptoms"
    * type = #text
    * repeats = false
  
  * item[+]
    * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
    * linkId = "e9936322-e6fe-4cf7-ab61-22846a8fbb95"
    * text = "Health priorities, actions and follow-up"
    * type = #text
    * repeats = false



