Alias: $LNC = http://loinc.org
Alias: $SCT = http://snomed.info/sct
Alias: $UCUM = http://unitsofmeasure.org

Instance: 715-Assessment
InstanceOf: Questionnaire
Usage: #definition
Title: "715 Assessment"
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
* url = "http://www.health.gov.au/assessments/mbs/715/715-Assessment"
* status = #draft
* experimental = true
* subjectType[+] = #Patient
* date = "2022-05-24"
* jurisdiction.coding = urn:iso:std:iso:3166#AU

* item[+]
/* variables expression paths not recognised as they point to QuestionnaireResponse
  * extension[+][http://hl7.org/fhir/StructureDefinition/variable].valueExpression
    * name = "weight"
    * language = #text/fhirpath
    * expression = "item.where(linkId='ac1559c8-f03a-43a6-818f-9b31892ec2a7').item.where(linkId='f5308669-d1f9-49a1-bedd-7420946e7288').answer.value"
  * extension[+][http://hl7.org/fhir/StructureDefinition/variable].valueExpression
    * name = "height"
    * language = #text/fhirpath
    * expression = "item.where(linkId='ac1559c8-f03a-43a6-818f-9b31892ec2a7').item.where(linkId='29644716-433e-45ec-a805-8043f35a85e1').answer.value"
  * extension[+][http://hl7.org/fhir/StructureDefinition/variable].valueExpression
    * name = "female"
      * language = #text/fhirpath
      * expression = "iif(item.where(linkId='0db82ad3-fd45-4c0c-a603-9fbe6bbb9aca').item.where(linkId='3a98ac7a-9313-4222-a853-edd0415bfc48').answer.value.code='female', 1, 0)"
    * extension[+][http://hl7.org/fhir/StructureDefinition/variable].valueExpression
    * name = "age"
    * language = #text/fhirpath
    * expression = "item.where(linkId='age').answer.value"
  * extension[+][http://hl7.org/fhir/StructureDefinition/variable].valueExpression
    * name = "cvdAge"
    * language = #text/fhirpath
    * expression = "iif(%age > 74, 74, iif(%age < 35, 35, %age))"
  * extension[+][http://hl7.org/fhir/StructureDefinition/variable].valueExpression
    * name = "systolicBP"
    * language = #text/fhirpath
    * expression = "item.where(linkId='7845504e-859d-4834-a264-127bcbee8759').item.where(linkId='systolic-bp').answer.value"
  * extension[+][http://hl7.org/fhir/StructureDefinition/variable].valueExpression
    * name = "smoker"
    * language = #text/fhirpath
    * expression = "iif(item.where(linkId='14a9fb5f-5b0e-4862-b143-08a11cd3ebf0').item.where(linkId='b639a3a8-f476-4cc8-b5c7-f5d2abb23511').answer.value.code='77176002', 1, 0)"
  * extension[+][http://hl7.org/fhir/StructureDefinition/variable].valueExpression
    * name = "totalCh"
    * language = #text/fhirpath
    * expression = "item.where(linkId='7845504e-859d-4834-a264-127bcbee8759').item.where(linkId='tot-chol').answer.value"
  * extension[+][http://hl7.org/fhir/StructureDefinition/variable].valueExpression
    * name = "hdl"
    * language = #text/fhirpath
    * expression = "item.where(linkId='7845504e-859d-4834-a264-127bcbee8759').item.where(linkId='hdl-chol').answer.value"
  * extension[+][http://hl7.org/fhir/StructureDefinition/variable].valueExpression
    * name = "diabetes"
    * language = #text/fhirpath
    * expression = "iif(item.where(linkId='7845504e-859d-4834-a264-127bcbee8759').item.where(linkId='has-diabetes').answer.value = true,1,0)"
  * extension[+][http://hl7.org/fhir/StructureDefinition/variable].valueExpression
    * name = "ecgLvh"
    * language = #text/fhirpath
    * expression = "iif(item.where(linkId='7845504e-859d-4834-a264-127bcbee8759').item.where(linkId='ecg-lvh').answer.value = true,1,0)"
  * extension[+][http://hl7.org/fhir/StructureDefinition/variable].valueExpression
    * name = "cBase"
    * language = #text/fhirpath
    * expression = "18.8144"
  * extension[+][http://hl7.org/fhir/StructureDefinition/variable].valueExpression
    * name = "cFemale"
    * language = #text/fhirpath
    * expression = "%female * -1.2146"
  * extension[+][http://hl7.org/fhir/StructureDefinition/variable].valueExpression
    * name = "cAge"
    * language = #text/fhirpath
    * expression = "%cvdAge.ln() * -1.8443"
  * extension[+][http://hl7.org/fhir/StructureDefinition/variable].valueExpression
    * name = "cAgeFemale"
    * language = #text/fhirpath
    * expression = "%female * %cvdAge.ln() * 0.3668"
  * extension[+][http://hl7.org/fhir/StructureDefinition/variable].valueExpression
    * name = "cSBP"
    * language = #text/fhirpath
    * expression = "%systolicBP.ln() * -1.4032"
  * extension[+][http://hl7.org/fhir/StructureDefinition/variable].valueExpression
    * name = "cSmoker"
    * language = #text/fhirpath
    * expression = "%smoker * -0.3899"
  * extension[+][http://hl7.org/fhir/StructureDefinition/variable].valueExpression
    * name = "cTcHdl"
    * language = #text/fhirpath
    * expression = "(%totalCh / %hdl).ln() * -0.539"
  * extension[+][http://hl7.org/fhir/StructureDefinition/variable].valueExpression
    * name = "cDiabetes"
    * language = #text/fhirpath
    * expression = "%diabetes * -0.3036"
  * extension[+][http://hl7.org/fhir/StructureDefinition/variable].valueExpression
    * name = "cDiabetesFemale"
    * language = #text/fhirpath
    * expression = "%female * %diabetes * -0.1697"
  * extension[+][http://hl7.org/fhir/StructureDefinition/variable].valueExpression
    * name = "cEcgLvh"
    * language = #text/fhirpath
    * expression = "%ecgLvh * -0.3362"
  * extension[+][http://hl7.org/fhir/StructureDefinition/variable].valueExpression
    * name = "sumOfCoeffs"
    * language = #text/fhirpath
    * expression = "%cBase + %cFemale + %cAge + %cAgeFemale + %cSBP + %cSmoker + %cTcHdl + %cDiabetes + %cDiabetesFemale + %cEcgLvh"
  * extension[+][http://hl7.org/fhir/StructureDefinition/variable].valueExpression
    * name = "cvdScale"
    * language = #text/fhirpath
    * expression = "(0.6536 + (%sumOfCoeffs * -0.2402)).exp()"
  * extension[+][http://hl7.org/fhir/StructureDefinition/variable].valueExpression
    * name = "cvdU"
    * language = #text/fhirpath
    * expression = "(5.ln()-%sumOfCoeffs)/%cvdScale"
  * extension[+][http://hl7.org/fhir/StructureDefinition/variable].valueExpression
    * name = "cvdScore"
    * language = #text/fhirpath
    * expression = "(1 - (%cvdU.exp()*-1).exp()) * 100"
*/

  * linkId = "6a3f3e40-e917-436f-80a2-dcf6f2886592"
  * text = "Assessment"
  * type = #group
  * repeats = false
  * item[+]
    * linkId = "b3a3eee2-f340-452e-9d05-d1f54f677b81"
    * text = "Current health/patient priorities"
    * type = #group
    * repeats = false
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
      * linkId = "dcf182c0-a2bf-46ac-a19b-72e4d24ef24d"
      * text = "What are the important things for you in this health check today?"
      * type = #text
      * repeats = false
      * item[+]
        * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#prompt
        * linkId = "3ac0c629-9acc-48af-bafe-6b05dfd06281"
        * text = "details"
        * type = #display
        
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
      * linkId = "a0c06f8d-3210-480b-9031-7b5eb5bf1dda"
      * text = "Is there anything you are worried about?"
      * type = #text
      * repeats = false
      * item[+]
        * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#prompt
        * linkId = "43fb3316-64a4-41dc-b12c-2f3fcee3eb84"
        * text = "details"
        * type = #display
        
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
      * linkId = "35b3f6d8-2907-4134-ae55-1e321b908f70"
      * text = "Do you have any specific health goals? Is there anything in particular about your health and wellbeing that you would like to improve?"
      * type = #text
      * repeats = false
      * item[+]
        * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#prompt
        * linkId = "bb176839-5cc8-4fb5-a919-0904968418be"
        * text = "details"
        * type = #display
        
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
      * linkId = "1d7ae8a1-4efa-47a5-a50f-5cc9216278ee"
      * text = "Health priorities, actions and follow-up"
      * type = #text
      * repeats = false
  * item[+]
    * linkId = "bed04e86-0c47-4691-b894-c484df51cb61"
    * text = "Medical history and current problems"
    * type = #group
    * repeats = false
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#check-box
      * linkId = "73678315-58d5-4e3d-ba57-523dfa0542f8"
      * text = "Condition"
      * type = #choice
      * repeats = false      
      * answerValueSet = "https://aehrc.csiro.au/fhir/ValueSet/MedicalHistoryShortListAdults"
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#autocomplete
      * extension[sdc-questionnaire-initialExpression].valueExpression
        * language = #text/fhirpath
        * expression = "%PrePopQuery.entry[21].resource.entry.resource.code.coding.select((coding.where(system='http://snomed.info/sct') | coding.where(system!='http://snomed.info/sct').first() | text ).first())"      
      * linkId = "5d51b29c-2aaa-48ae-add0-086c7b91d5e3"
      * text = "Other relevant medical history, operations, hospital admissions, etc"
      * extension[sdc-questionnaire-shortText].valueString = "Other relevant medical history"
      * type = #choice
      * repeats = true
      * answerValueSet = "https://aehrc.csiro.au/fhir/ValueSet/MedicalHistory"
      * item[+]
        * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#prompt
        * linkId = "dde630ba-0827-4087-b7bb-946756e0fc17"
        * text = "details"
        * type = #display
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
      * linkId = "f6473377-7537-483a-a9b7-78d5ccfa5c6c"
      * text = "Health priorities, actions and follow-up"
      * type = #text
      * repeats = false
  * item[+]    
    * linkId = "e0ac4c04-1f98-4fd5-9c62-28711a422576"
    * text = "Regular medications: check if still required, appropriate dose, understanding of medication and adherence"
    * extension[sdc-questionnaire-shortText].valueString = "Regular medications"
    * type = #group
    * repeats = false
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#check-box
      * linkId = "da1f3068-4de6-4cd5-ae25-5082e7c20ae2"
      * text = "Do you take any regular medications (prescribed, over-the-counter, traditional, complementary and alternative)?"
      * extension[sdc-questionnaire-shortText].valueString = "Do you take any regular medications?"
      * type = #choice
      * repeats = false
      * answerOption[+].valueString = "None"
      * answerOption[+].valueString = "Yes, up to date in health record"
      * answerOption[+].valueString = "Understanding and adherence checked"
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
      * linkId = "6d7525c8-b3d5-402e-8500-6373c99c0184"
      * text = "Health priorities, actions and follow-up"
      * type = #text
      * repeats = false
  * item[+]
    * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#check-box    
    * linkId = "d6fecb8f-4715-4578-9f4c-88248cda49f6"
    * text = "Allergies/adverse reactions"
    * type = #group
    * repeats = false
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#check-box    
      * linkId = "6fb913c4-a0c2-4448-bd5f-421125da606d"
      * text = "Health record"
      * type = #choice
      * repeats = false
      * answerOption[+].valueString = "Up to date in health record"
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
      * linkId = "2818498b-d277-4cdc-b49f-25d4684cc212"
      * text = "Health priorities, actions and follow-up"
      * type = #text
      * repeats = false
  * item[+]
    * linkId = "51aa5ba2-ecec-46c7-bf15-4cb4829649a4"
    * text = "Relevant family history"
    * type = #group
    * repeats = false
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
      * extension[sdc-questionnaire-initialExpression].valueExpression
        * language = #text/fhirpath
        * expression = "%PrePopQuery.entry[0].resource.entry.resource.select(relationship.coding.display + ' - ' + condition.code.coding.display).join('\r\n ')"    
      * linkId = "c6f36139-e805-48e9-a123-21be16dc8d9d"
      * text = "Relevant family history (including diabetes, heart disease, cancer, mental health)"
      * extension[sdc-questionnaire-shortText].valueString = "Relevant family history"
      * type = #text
      * repeats = true
      * item[+]
        * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#prompt
        * linkId = "a3c3c7e5-f9da-4fc6-a7f0-fa0e95a1ef0b"
        * text = "details"
        * type = #display
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
      * linkId = "28f0df74-30d1-4ebc-bd64-784381adb46c"
      * text = "Health priorities, actions and follow-up"
      * type = #text
      * repeats = false
  * item[+]
    * linkId = "0233a2bb-7973-42db-9873-08792a762983"
    * text = "Social and emotional wellbeing"
    * type = #group
    * repeats = false
    * item[+]
      * linkId = "f6f5bedc-3083-40d0-add8-b5e39ead2101"
      * text = "General"
      * type = #group
      * repeats = false
      * item[+]
        * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#radio-button
        * linkId = "2c77df54-b4d0-4997-9d49-0660ca6ab64c"
        * text = "Have there been any particular stressful life events that are impacting on you/your health lately?"
        * extension[sdc-questionnaire-shortText].valueString = "Any stressful life events lately?"
        * type = #choice
        * repeats = false
        * answerValueSet = "https://aehrc.csiro.au/fhir/ValueSet/YesNo"
      * item[+]
        * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
        * linkId = "c003980c-6daa-4360-8099-c92540475b23"
        * text = "Stressful life event details"
        * type = #text
        * enableWhen[+]
          * question = "2c77df54-b4d0-4997-9d49-0660ca6ab64c"
          * operator = #=
          * answerCoding = http://terminology.hl7.org/CodeSystem/v2-0136#Y
        * repeats = false        
      * item[+]
        * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
        * linkId = "7240e1fc-02fd-4761-92be-0fbbad99ca93"
        * text = "Consider conversation about social connection, which could include questions about sports/hobbies/clubs/other activities"
        * extension[sdc-questionnaire-shortText].valueString = "Consider conversation about social connection"
        * type = #text
        * repeats = false
        * item[+]
          * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#prompt
          * linkId = "45eb36b2-651d-4611-b978-cc4cfacbade7"
          * text = "details"
          * type = #display
      * item[+]
        * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
        * linkId = "855633b8-48f6-4b97-8f9d-be7f4723b16f"
        * text = "Health priorities, actions and follow-up"
        * type = #text
        * repeats = false
    * item[+]
      * linkId = "fac48974-9c6e-41b3-a9c3-bfb4f9b5e2d9"
      * text = "Home and family"
      * type = #group
      * repeats = false       
      * item[+]
        * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
        * linkId = "84262b9a-7687-4396-a662-4da1ed936abf"
        * text = "Who do you live with?"
        * type = #text
        * repeats = false
        * item[+]
          * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#prompt
          * linkId = "9091d6d1-4e2b-41b3-a06a-cc205e7a703b"
          * text = "details"
          * type = #display
      * item[+]
        * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#radio-button
        * linkId = "4be80243-225c-48ff-b7a1-1b86fd0af7b7"
        * text = "Do you have stable housing?"
        * type = #choice
        * repeats = false
        * answerValueSet = "https://aehrc.csiro.au/fhir/ValueSet/YesNo"
      * item[+]
        * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
        * linkId = "8e840276-7c59-48a3-9ec5-d268009714d8"
        * text = "Stable housing details"
        * type = #text
        * enableWhen[+]
          * question = "4be80243-225c-48ff-b7a1-1b86fd0af7b7"
          * operator = #=
          * answerCoding = http://terminology.hl7.org/CodeSystem/v2-0136#Y
        * repeats = false
      * item[+]
        * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#radio-button
        * linkId = "e7d2d2fb-8d05-41f7-b063-a21fdd5fec8f"
        * text = "Do you feel safe at home?"
        * type = #choice
        * repeats = false
        * answerValueSet = "https://aehrc.csiro.au/fhir/ValueSet/YesNo"
      * item[+]
        * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
        * linkId = "2663620c-6de2-44fa-b247-7296f472c620"
        * text = "Safe at home details?"
        * type = #text
        * enableWhen[+]
          * question = "e7d2d2fb-8d05-41f7-b063-a21fdd5fec8f"
          * operator = #=
          * answerCoding = http://terminology.hl7.org/CodeSystem/v2-0136#Y
        * repeats = false
      * item[+]
        * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
        * linkId = "600aac7c-6fc9-45aa-9d8a-588813c3cf01"
        * text = "Health priorities, actions and follow-up"
        * type = #text
        * repeats = false      
    * item[+]
      * linkId = "aee3f82e-4130-4b6b-bd65-ec278554aca2"
      * text = "Learning and work"
      * type = #group
      * repeats = false       
      * item[+]
        * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#radio-button
        * linkId = "17615813-cf79-42de-a52b-e9734e5ca415"
        * text = "Are you studying?"
        * type = #choice
        * repeats = false
        * answerValueSet = "https://aehrc.csiro.au/fhir/ValueSet/YesNo"
      * item[+]
        * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
        * linkId = "8f178bb2-b449-43ef-9af1-e0f53c172db5"
        * text = "Study details"
        * type = #text
        * enableWhen[+]
          * question = "17615813-cf79-42de-a52b-e9734e5ca415"
          * operator = #=
          * answerCoding = http://terminology.hl7.org/CodeSystem/v2-0136#Y
        * repeats = false
      * item[+]
        * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#radio-button
        * linkId = "808b862d-ba4f-47bb-9c1b-ef81b5e78f58"
        * text = "Are you working?"
        * type = #choice
        * repeats = false
        * answerValueSet = "https://aehrc.csiro.au/fhir/ValueSet/YesNoNA"
      * item[+]
        * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
        * linkId = "9a413036-c428-4a69-8a7e-a858a7ef8ab7"
        * text = "Work details (occupation including occupational hazards, study, training, disability, etc)"
        * type = #text
        * enableWhen[+]
          * question = "17615813-cf79-42de-a52b-e9734e5ca415"
          * operator = #=
          * answerCoding = http://terminology.hl7.org/CodeSystem/v2-0136#Y
      * item[+]
        * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
        * linkId = "31fbe265-1fc5-4bca-9152-13a53bee923c"
        * text = "Health priorities, actions and follow-up"
        * type = #text
        * repeats = false
    * item[+]
      * linkId = "ea6388b6-33d1-4e8c-929b-83cb91911b33"
      * text = "Mood"
      * type = #group
      * repeats = false       
      * item[+]
        * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
        * linkId = "f8a1e9a7-383e-4bbb-9b1b-9335e6a854b4"
        * text = "How have you been feeling lately?"
        * type = #text
        * repeats = false
        * item[+]
          * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#prompt
          * linkId = "b12176b1-883f-491c-9d51-98c04029dd2c"
          * text = "details"
          * type = #display
      * item[+]
        * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
        * linkId = "042be36e-c590-47ea-8156-d6cb24bed802"
        * text = "If indicated, ask about depression (consider screening tools, eg aPHQ-9, K5 or K10) and complete risk assessment."
        * extension[sdc-questionnaire-shortText].valueString = "Ask about depression"
        * type = #text
        * repeats = false
        * item[+]
          * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#prompt
          * linkId = "7e4a6488-c811-4190-9cac-532e54191789"
          * text = "details"
          * type = #display
      * item[+]
        * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
        * linkId = "667f072e-a0e9-4781-ad02-f23658a79376"
        * text = "Explore other mental health concerns as indicated."
        * extension[sdc-questionnaire-shortText].valueString = "Other mental health concerns"
        * type = #text
        * repeats = false
        * item[+]
          * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#prompt
          * linkId = "98da5283-ae0d-4f07-846f-67107b48f369"
          * text = "details"
          * type = #display
      * item[+]
        * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
        * linkId = "8095da55-4a01-4257-a391-bd06dc3e5fee"
        * text = "Health priorities, actions and follow-up"
        * type = #text
        * repeats = false
  * item[+]
    * linkId = "7cd4290c-d6a1-4156-8943-1a4b1bc84c8b"
    * text = "Healthy eating"
    * type = #group
    * repeats = false       
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#radio-button
      * linkId = "92b5240c-0c9e-40f0-b315-3ef58cb8f3ab"
      * text = "Do you have any worries about your diet or weight?"
      * type = #choice
      * repeats = false
      * answerValueSet = "https://aehrc.csiro.au/fhir/ValueSet/YesNo"
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
      * linkId = "695eebb6-3b8a-4883-8da5-b305ea0678d0"
      * text = "Diet or weight concern details"
      * type = #text
      * repeats = false
      * enableWhen[+]
        * question = "92b5240c-0c9e-40f0-b315-3ef58cb8f3ab"
        * operator = #=
        * answerCoding = http://terminology.hl7.org/CodeSystem/v2-0136#Y
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
      * linkId = "54eaeb4b-240d-41b2-a341-c74eedb0b214"
      * text = "Document conversation about health eating which could include:\n- current diet including food and drinks\n- recommendations about fruit and vegetable intake, water as the main drink, avoiding sugary drinks, avoiding highly processed foods (including supermarket-bought and take-away like KFC, Maccas, etc)"
      * type = #text
      * repeats = false
      * item[+]
        * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#prompt
        * linkId = "13485b7d-487b-46ed-8885-cfea2a85d9f8"
        * text = "details"
        * type = #display      
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#radio-button
      * linkId = "844faad6-d982-4e49-a353-f50e3c40ceb5"
      * text = "Are there any issues about availability of food?"
      * type = #choice
      * repeats = false
      * answerValueSet = "https://aehrc.csiro.au/fhir/ValueSet/YesNo"
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
      * linkId = "e94663b7-0ef3-45bc-8d87-af2b6fcf8cf7"
      * text = "Food availability details"
      * type = #text
      * repeats = false
      * enableWhen[+]
        * question = "844faad6-d982-4e49-a353-f50e3c40ceb5"
        * operator = #=
        * answerCoding = http://terminology.hl7.org/CodeSystem/v2-0136#Y
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
      * linkId = "a537a2a9-fae3-467b-9d59-100ecb843700"
      * text = "Health priorities, actions and follow-up"
      * type = #text
      * repeats = false
  * item[+]
    * linkId = "fe16d7ba-8586-445a-afcc-c23c832441b3"
    * text = "Physical activity, exercise and screen time"
    * type = #group
    * repeats = false
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#radio-button
      * linkId = "0124ce25-a877-48b9-ad80-0fac6ca135e5"
      * text = "Do you have any worries about physical activity or screen time?"
      * type = #choice
      * repeats = false
      * answerValueSet = "https://aehrc.csiro.au/fhir/ValueSet/YesNo"
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
      * linkId = "403dd0e0-801e-4db8-80f4-46d1d317a25e"
      * text = "Food availability issues details"
      * type = #text
      * repeats = false
      * enableWhen[+]
        * question = "0124ce25-a877-48b9-ad80-0fac6ca135e5"
        * operator = #=
        * answerCoding = http://terminology.hl7.org/CodeSystem/v2-0136#Y
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
      * linkId = "2dcedb1a-fba9-4637-8503-5a0b36b6ca7d"
      * text = "Document conversation about recommendations re physical activity, exercise and screen time"
      * type = #text
      * repeats = false
      * item[+]
        * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#prompt
        * linkId = "0881d8d2-08ce-4530-a430-b8da0d423b56"
        * text = "details"
        * type = #display
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
      * linkId = "e2edf58f-ca9a-48ab-ac16-6072434700e2"
      * text = "Health priorities, actions and follow-up"
      * type = #text
      * repeats = false
  * item[+]
    * linkId = "14a9fb5f-5b0e-4862-b143-08a11cd3ebf0"
    * text = "Substance use, including tobacco"
    * type = #group
    * repeats = false
    * item[+]
      * extension[sdc-questionnaire-initialExpression].valueExpression
        * language = #text/fhirpath
        * expression = "%PrePopQuery.entry[1].resource.entry.resource.valueCodeableConcept.coding"
      * linkId = "b639a3a8-f476-4cc8-b5c7-f5d2abb23511"
      * text = "Smoking"
      * type = #choice
      * repeats = false
      * answerOption[+].valueCoding = http://snomed.info/sct#266919005 "Never smoked"
      * answerOption[+].valueCoding = http://snomed.info/sct#77176002 "Smoker"
      * answerOption[+].valueCoding = http://snomed.info/sct#8517006 "Ex-Smoker"
      * answerOption[+].valueCoding = http://snomed.info/sct#48031000119106 "Quit ≥12 months"
      * answerOption[+].valueCoding = http://snomed.info/sct#735128000 "Quit <12 months"
      * answerOption[+].valueCoding = http://snomed.info/sct#16090371000119103 "Environmental exposure to tobacco smoke (home, car, etc)"
      * answerOption[+].valueString = "Wants to quit"
      * answerOption[+].valueString = "Other tobacco use"
    * item[+]
      * linkId = "9e86387d-1be4-4c26-9047-9dd6b03e1ee0"
      * text = "How many?"
      * type = #string
      * repeats = false
      * enableWhen[+]
        * question = "b639a3a8-f476-4cc8-b5c7-f5d2abb23511"
        * operator = #=
        * answerCoding = http://snomed.info/sct#77176002
      * enableWhen[+]
        * question = "b639a3a8-f476-4cc8-b5c7-f5d2abb23511"
        * operator = #=
        * answerCoding = http://snomed.info/sct#48031000119106
      * enableWhen[+]
        * question = "b639a3a8-f476-4cc8-b5c7-f5d2abb23511"
        * operator = #=
        * answerCoding = http://snomed.info/sct#8517006
      * enableWhen[+]
        * question = "b639a3a8-f476-4cc8-b5c7-f5d2abb23511"
        * operator = #=
        * answerCoding = http://snomed.info/sct#735128000
      * enableWhen[+]
        * question = "b639a3a8-f476-4cc8-b5c7-f5d2abb23511"
        * operator = #=
        * answerString = "Wants to quit"
      * enableBehavior = #any
    * item[+]
      * linkId = "32e71641-f660-4ca2-af99-dff8917f07be"
      * text = "How long since start?"
      * type = #string
      * enableWhen[+]
        * question = "b639a3a8-f476-4cc8-b5c7-f5d2abb23511"
        * operator = #=
        * answerCoding = http://snomed.info/sct#77176002
      * enableWhen[+]
        * question = "b639a3a8-f476-4cc8-b5c7-f5d2abb23511"
        * operator = #=
        * answerCoding = http://snomed.info/sct#48031000119106
      * enableWhen[+]
        * question = "b639a3a8-f476-4cc8-b5c7-f5d2abb23511"
        * operator = #=
        * answerCoding = http://snomed.info/sct#8517006
      * enableWhen[+]
        * question = "b639a3a8-f476-4cc8-b5c7-f5d2abb23511"
        * operator = #=
        * answerCoding = http://snomed.info/sct#735128000
      * enableWhen[+]
        * question = "b639a3a8-f476-4cc8-b5c7-f5d2abb23511"
        * operator = #=
        * answerString = "Wants to quit"
      * enableBehavior = #any
    * item[+]
      * linkId = "51593f4b-316e-4615-8be8-f855283d4783"
      * text = "How long since quit?"
      * type = #string
      * enableWhen[+]
        * question = "b639a3a8-f476-4cc8-b5c7-f5d2abb23511"
        * operator = #=
        * answerCoding = http://snomed.info/sct#77176002
      * enableWhen[+]
        * question = "b639a3a8-f476-4cc8-b5c7-f5d2abb23511"
        * operator = #=
        * answerCoding = http://snomed.info/sct#48031000119106
      * enableWhen[+]
        * question = "b639a3a8-f476-4cc8-b5c7-f5d2abb23511"
        * operator = #=
        * answerCoding = http://snomed.info/sct#8517006
      * enableWhen[+]
        * question = "b639a3a8-f476-4cc8-b5c7-f5d2abb23511"
        * operator = #=
        * answerCoding = http://snomed.info/sct#735128000
      * enableWhen[+]
        * question = "b639a3a8-f476-4cc8-b5c7-f5d2abb23511"
        * operator = #=
        * answerString = "Wants to quit"
      * enableBehavior = #any
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
      * linkId = "ea73d52c-f831-46be-a45d-2c42250a5210"
      * text = "Quantity and frequency of:\n- alcohol\n- caffeine (coffee, soft drinks, iced coffee)\n- cannabis/yarndi/gunja\nother substance use: IVDU, methamphetamine, opiates, solvents, other"
      * type = #text
      * repeats = false
      * item[+]
        * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#prompt
        * linkId = "232cf24c-db60-4601-869d-525fb6e05988"
        * text = "details"
        * type = #display
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
      * linkId = "f8e1cc1f-f1a1-4eb3-8255-77d600f52831"
      * text = "Health priorities, actions and follow-up"
      * type = #text
      * repeats = false     
  * item[+]
    * linkId = "dfdd0362-5653-4628-8f61-b492d20624a2"
    * text = "Gambling"
    * type = #group
    * repeats = false 
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#radio-button
      * linkId = "a930b541-4f94-4ca3-8a57-f1034a59989d"
      * text = "Have you or someone close to you ever had issues with gambling?"
      * type = #choice
      * repeats = false
      * answerValueSet = "https://aehrc.csiro.au/fhir/ValueSet/YesNo"
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
      * linkId = "92c54259-9c63-460c-b014-370994f665c8"
      * text = "details"
      * type = #text
      * enableWhen[+]
        * question = "a930b541-4f94-4ca3-8a57-f1034a59989d"
        * operator = #=
        * answerCoding = http://terminology.hl7.org/CodeSystem/v2-0136#Y
      * repeats = false
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
      * linkId = "95933b16-2d6a-478b-b1cd-45935fdedba6"
      * text = "Health priorities, actions and follow-up"
      * type = #text
      * repeats = false
  * item[+]
    * linkId = "84986fad-ece9-441c-b29e-f946f47e7926"
    * text = "Genitourinary and sexual health"
    * type = #group
    * repeats = false 
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#radio-button
      * linkId = "50fd6bc3-66a5-4f1d-b9c6-2b139d7c845d"
      * text = "Is there anything that you are worried about in relation to your sexual health?"
      * type = #choice
      * repeats = false
      * answerValueSet = "https://aehrc.csiro.au/fhir/ValueSet/YesNo"
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
      * linkId = "27b58c6f-3d92-4f7a-9da2-a8e5e2dc90ed"
      * text = "details"
      * type = #text
      * enableWhen[+]
        * question = "50fd6bc3-66a5-4f1d-b9c6-2b139d7c845d"
        * operator = #=
        * answerCoding = http://terminology.hl7.org/CodeSystem/v2-0136#Y
      * repeats = false
    * item[+]
      * linkId = "63dc034e-5c84-4734-ac82-898cc236fb5f"
      * text = "Cervical screening"
      * type = #group
      * repeats = false       
      * item[+]
        * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#check-box
        * linkId = "f16db2c9-6dd2-4d5d-ade0-f8b20d06c815"
        * text = "Cervical screening status"
        * type = #choice
        * repeats = false
        * answerOption[+].valueCoding = $SCT#736595007 "Declined"
        * answerOption[+].valueCoding = http://snomed.info/sct#410527000 "Offered" // a better concept is required
        * answerOption[+].valueCoding = $SCT#171154002 "Not required"
        * answerOption[+].valueCoding = $SCT#171155001 "Up to date"
      * item[+]
        * linkId = "8484a366-b2b5-45b8-a0ec-b1f8de095f98"
        * text = "Next due"
        * type = #date
        * repeats = false
      * item[+]
        * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
        * linkId = "7e76c69e-279b-47d7-80e6-057f54af32fb"
        * text = "Details"
        * type = #text
        * repeats = false
    * item[+]
      * linkId = "64d293b7-d1a6-406f-a818-69371c4d9629"
      * text = "Consider discussing as relevant to age/sex/gender:\n- contraception\n- menstruation\n- sexually transmitted infection symptoms and screening\n- blood-borne virus screening\n- continence\n- menopause\n- erectile dysfunction"
      * type = #text
      * repeats = false
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
      * linkId = "2a803861-0d4d-4017-a423-ddcef77f9ef9"
      * text = "Health priorities, actions and follow-up"
      * type = #text
      * repeats = false
  * item[+]
    * linkId = "3a7337b7-e600-4962-b05e-c55d75f7f969"
    * text = "Immunisation (eligibility for funded vaccines may vary across jurisdictions)"
    * extension[sdc-questionnaire-shortText].valueString = "Immunisation"
    * type = #group
    * repeats = false
    * item[+]
      * linkId = "6feea080-bc5f-4e58-a497-6a06df32bb98"
      * text = "Check recommended primary vaccinations completed and provide catch-up if required"
      * type = #display
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#radio-button
      * linkId = "2c39df2f-f775-482b-be4c-da5ae1b364b9"
      * text = "Immunisations up to date and recorded on Australian Immunisation Register (as per Australian Immunisation Handbook)?"
      * extension[sdc-questionnaire-shortText].valueString = "Immunisations up to date and recorded on AIR"
      * type = #choice
      * repeats = false
      * answerValueSet = "https://aehrc.csiro.au/fhir/ValueSet/YesNo"
      * item[+]
        * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
        * linkId = "09ae3deb-c828-4980-96a4-c803e7974e8d"
        * text = "Immunisations due"
        * type = #string
        * enableWhen[+]
          * question = "2c39df2f-f775-482b-be4c-da5ae1b364b9"
          * operator = #=
          * answerCoding = http://terminology.hl7.org/CodeSystem/v2-0136#N
        * repeats = true 
    * item[+]
      * linkId = "041568d2-8d80-4655-b42c-e9c11e8230af"
      * text = "Vaccines given today"
      * type = #group
      * repeats = false
      * item[+]
        * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#radio-button
        * linkId = "63753657-0700-48cf-8e63-0556693275f2"
        * text = "Vaccines given today recorded on Australian Immunisation Register?"
        * type = #choice
        * repeats = false
        * answerValueSet = "https://aehrc.csiro.au/fhir/ValueSet/YesNo"
      * item[+]
        * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
        * linkId = "1e863414-4f86-421c-aa06-5d691f506211"
        * text = "details"
        * type = #text
        * repeats = false
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
      * linkId = "1a2e5043-066b-480e-9b9a-b09bc79d4033"
      * text = "Health priorities, actions and follow-up"
      * type = #text
      * repeats = false
  * item[+]
    * linkId = "b3fc12ed-ae45-4b0d-a21b-315d309de8dd"
    * text = "Eye health"
    * type = #group
    * repeats = false
    * item[+]
      * linkId = "e535d235-3400-40f8-9d9d-428b4c5f51b1"
      * text = "Concerns"
      * type = #group
      * repeats = false
      * item[+]
        * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#radio-button
        * linkId = "16d69c29-12c9-4cce-a83e-74c6c3ef79fd"
        * text = "Is there anything that you are worried about with your vision?"
        * extension[sdc-questionnaire-shortText].valueString = "Any vision worries?"
        * type = #choice
        * repeats = false
        * answerValueSet = "https://aehrc.csiro.au/fhir/ValueSet/YesNo"
        * item[+]
          * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
          * linkId = "af0a3437-4e76-470d-a00e-bd7350b9e28c"
          * text = "Details"
          * type = #text
          * enableWhen[+]
            * question = "16d69c29-12c9-4cce-a83e-74c6c3ef79fd"
            * operator = #=
            * answerCoding = http://terminology.hl7.org/CodeSystem/v2-0136#Y
          * repeats = false 
    * item[+]
      * linkId = "523c0a6d-30be-46f5-b70d-898b40ab8210"
      * text = "Eye examination"
      * type = #group
      * repeats = false
      * item[+]
        * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
        * linkId = "15dde9d9-9cd6-4bfb-a503-21103a8aafd9"
        * text = "Visual acuity (R)"
        * type = #string
        * repeats = false
      * item[+]
        * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
        * linkId = "c1c1d787-f1a5-479d-b7a8-8d1607f7f4a2"
        * text = "Visual acuity (L)"
        * type = #string
        * repeats = false
      * item[+]
        * linkId = "50144dab-2e5f-4e23-ba6b-ea3f84b839d5"
        * text = "Trachoma Check (endemic areas)"
        * type = #group
        * repeats = false
        * item[+]
          * linkId = "e6f22299-7bc4-4dee-a338-77cfd7c72120"
          * text = "R"
          * type = #group
          * repeats = false
          * answerOption[+].valueCoding = $SCT#60332004 "Trichiasis"
          * answerOption[+].valueCoding = $SCT#95726001 "Corneal scarring"
        * item[+]  
          * linkId = "514c2c2d-1d86-45a3-88bd-1f9352dde321"
          * text = "L"
          * type = #group
          * repeats = false
          * answerOption[+].valueCoding = $SCT#60332004 "Trichiasis"
          * answerOption[+].valueCoding = $SCT#95726001 "Corneal scarring"
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
      * linkId = "8b3788b9-f91e-4d91-b40d-5cdf211d477e"
      * text = "Health priorities, actions and follow-up"
      * type = #text
      * repeats = false  
  * item[+]
    * linkId = "e296acdc-e378-4a78-b81d-bb7f86ff4de5"
    * text = "Ear health and hearing"
    * type = #group
    * repeats = false    
    * item[+]
      * linkId = "ba173cdb-34a0-40d2-9f4d-e7bd6f389289"
      * text = "Concerns"
      * type = #group
      * repeats = false
      * item[+]
        * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#radio-button
        * linkId = "ffec07ab-8e41-4069-a14c-04a9cbeb0fd4"
        * text = "Is there anything that you are worried about with your hearing?"
        * extension[sdc-questionnaire-shortText].valueString = "Any hearing worries?"
        * type = #choice
        * repeats = false
        * answerValueSet = "https://aehrc.csiro.au/fhir/ValueSet/YesNo"
        * item[+]
          * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
          * linkId = "0e5228c1-a13e-4bc5-9b91-6a933cd005f4"
          * text = "Details"
          * type = #text
          * enableWhen[+]
            * question = "ffec07ab-8e41-4069-a14c-04a9cbeb0fd4"
            * operator = #=
            * answerCoding = http://terminology.hl7.org/CodeSystem/v2-0136#Y
          * repeats = false
    * item[+]
      * linkId = "f41a2fab-bacb-4a14-ab20-6a14f34c9d12"
      * text = "Last hearing test (audiology)"
      * type = #date
      * repeats = false
    * item[+]
      * linkId = "7c61f573-b981-4bdd-9161-a428e965ec4f"
      * text = "Ear examination"
      * type = #group
      * repeats = false
      * item[+]
        * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#check-box
        * extension[sdc-questionnaire-openLabel].valueString = "Other, please specify"
        * linkId = "4243acfd-ee95-4020-b000-fbb9c75e7a01"
        * text = "Otoscopy findings: L"
        * type = #open-choice
        * repeats = false
        // potential for coding with additional SCTAU content
        * answerOption[+].valueString = "Clear and intact"
        * answerOption[+].valueString = "Dull and intact"
        * answerOption[+].valueString = "Discharge"
        * answerOption[+].valueString = "Retracted"
        * answerOption[+].valueString = "Unable to view eardrum"
        * answerOption[+].valueString = "Wax"
      * item[+]
        * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#check-box
        * extension[sdc-questionnaire-openLabel].valueString = "Other, please specify"
        * linkId = "e2bf7839-97cf-4a7a-85a0-041ddfd68926"
        * text = "Otoscopy findings: R"
        * type = #open-choice
        * repeats = false
        // potential for coding with additional SCTAU content
        * answerOption[+].valueString = "Clear and intact"
        * answerOption[+].valueString = "Dull and intact"
        * answerOption[+].valueString = "Discharge"
        * answerOption[+].valueString = "Retracted"
        * answerOption[+].valueString = "Unable to view eardrum"
        * answerOption[+].valueString = "Wax"
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
      * linkId = "fdc69de5-a801-44bb-8062-f970ca3d5489"
      * text = "Health priorities, actions and follow-up"
      * type = #text
      * repeats = false
  * item[+]
    * linkId = "86103809-161e-4029-a208-4470b0bf3ac0"
    * text = "Oral and dental health"
    * type = #group
    * repeats = false
    * item[+]
      * linkId = "3d8ac082-f8b0-4ebc-90b8-46ae1b7941bc"
      * text = "Concerns"
      * type = #group
      * repeats = false
      * item[+]
        * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#radio-button
        * linkId = "a5760eac-cbeb-4423-acdf-6de1e17aeba0"
        * text = "Is there anything that you are worried about with your teeth?"
        * extension[sdc-questionnaire-shortText].valueString = "Any dental worries?"
        * type = #choice
        * repeats = false
        * answerValueSet = "https://aehrc.csiro.au/fhir/ValueSet/YesNo"
        * item[+]
          * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
          * linkId = "b292931b-0b4c-4a55-a305-d3bdef7f4ff5"
          * text = "Details"
          * type = #text
          * enableWhen[+]
            * question = "a5760eac-cbeb-4423-acdf-6de1e17aeba0"
            * operator = #=
            * answerCoding = http://terminology.hl7.org/CodeSystem/v2-0136#Y
          * repeats = false
    * item[+]
      * linkId = "b232518b-3a7b-4820-a572-dd58d931daa5"
      * text = "Last dental checkup"
      * type = #date
      * repeats = false
    * item[+]
      * linkId = "cca7057f-e48f-40b8-afa1-b4ca737f947f"
      * text = "Teeth and mouth check"
      * type = #group
      * repeats = false
      * item[+]
        * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
        * linkId = "7df8b1db-f161-4639-bb9f-c01134b0e518"
        * text = "Examination findings"
        * type = #text
        * repeats = false
      * item[+]
        * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
        * linkId = "5855cf8d-7e43-469f-b0f1-b46c3e1fbc3d"
        * text = "Document conversation about oral health and care of teeth"
        * type = #text
        * repeats = false
        * item[+]
          * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#prompt
          * linkId = "62a06e87-a1f5-4df2-9ab3-8a76ec280823"
          * text = "details"
          * type = #display
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
      * linkId = "817b9569-27f5-4720-9e6e-25d432084253"
      * text = "Health priorities, actions and follow-up"
      * type = #text
      * repeats = false
  * item[+]
    * linkId = "ac1559c8-f03a-43a6-818f-9b31892ec2a7"
    * text = "Examination"
    * type = #group
    * repeats = false
    * item[+]
      * extension[sdc-questionnaire-initialExpression].valueExpression
        * language = #text/fhirpath
        * expression = "%PrePopQuery.entry[2].resource.entry.resource.value.value"
      * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unit].valueCoding = $UCUM#cm
      * linkId = "29644716-433e-45ec-a805-8043f35a85e1"
      * text = "Height (cm)"
      * type = #decimal
      * repeats = false
    * item[+]
      * extension[sdc-questionnaire-initialExpression].valueExpression
        * language = #text/fhirpath
        * expression = "%PrePopQuery.entry[4].resource.entry.resource.value.value"
      * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unit].valueCoding = $UCUM#kg
      * linkId = "f5308669-d1f9-49a1-bedd-7420946e7288"
      * text = "Weight (kg)"
      * type = #decimal
      * repeats = false
    * item[+]
      * extension[sdc-questionnaire-initialExpression].valueExpression
        * language = #text/fhirpath
        * expression = "%PrePopQuery.entry[6].resource.entry.resource.value.value"
      * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unit].valueCoding = $UCUM#kg/m2
      * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression].valueExpression
        * description = "BMI calculation"
        * language = #text/fhirpath
        * expression = "(%weight/((%height/100).power(2))).round(1)"
      * linkId = "d9306be3-fedf-45ca-8b91-71e6f7f6c6f5"
      * text = "BMI (kg/^2)"
      * type = #decimal
      * repeats = false
    * item[+]
      * extension[sdc-questionnaire-initialExpression].valueExpression
        * language = #text/fhirpath
        * expression = "%PrePopQuery.entry[3].resource.entry.resource.value.value"
      * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unit].valueCoding = $UCUM#cm
      * linkId = "aadc1e74-8523-41e4-beaf-a4487bf79606"
      * text = "Waist circumference (cm)"
      * type = #decimal
      * repeats = false
    * item[+]
      * extension[sdc-questionnaire-initialExpression].valueExpression
        * language = #text/fhirpath
        * expression = "%PrePopQuery.entry[7].resource.entry.resource.select(component[0].value.select(value.toString()) + '/' + component[1].value.select(value.toString()) )"
      * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unit].valueCoding = $UCUM#mm/[Hg]
      * linkId = "8b2f93a9-564f-4229-9522-2a4e145badc9"
      * text = "Blood pressure"
      * type = #string
      * repeats = false
    * item[+]
      * extension[sdc-questionnaire-initialExpression].valueExpression
        * language = #text/fhirpath
        * expression = "%PrePopQuery.entry[5].resource.entry.resource.value.value"
      * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unit].valueCoding = $UCUM#/min
      * linkId = "0c6fe11b-1fd4-482f-a805-d17aef2b8d6b"
      * text = "Heart rate"
      * type = #decimal
      * repeats = false
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#radio-button
      * linkId = "37cc9bd4-9050-4e8d-b15f-871c7bd18602"
      * text = "Heart rhythm"
      * type = #choice
      * answerOption[+].valueCoding = $SCT#271636001 "Pulse Regular"
      * answerOption[+].valueCoding = $SCT#61086009 "Pulse Irregular"
      * repeats = false
  * item[+]
    * linkId = "7845504e-859d-4834-a264-127bcbee8759"
    * text = "Absolute cardiovascular risk calculation"
    * type = #group
    * repeats = false
    * item[+]
      * extension[+][sdc-questionnaire-initialExpression].valueExpression
        * language = #text/fhirpath
        * expression = "%PrePopQuery.entry[7].resource.entry.resource.component.where(code.coding.where(code='8459-0')).value.value"
      * linkId = "systolic-bp"
      * text = "Systolic Blood Pressure"
      * type = #decimal
      * item[+]
        * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#prompt
        * linkId = "812aa6b6-dea0-4e12-a4e7-009b975088f1"
        * text = "75 or more"
        * type = #display
    * item[+]        
      * extension[+][sdc-questionnaire-initialExpression].valueExpression
        * language = #text/fhirpath
        * expression = "%PrePopQuery.entry[23].resource.entry.resource.value.value"
      * linkId = "tot-chol"
      * text = "Total Cholesterol"
      * type = #decimal
      * item[+]
        * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#prompt
        * linkId = "9242d928-9fe0-49a7-818a-314fe9fc63a6"
        * text = "2 or more"
        * type = #display
    * item[+]
      * extension[+][sdc-questionnaire-initialExpression].valueExpression
        * language = #text/fhirpath
        * expression = "%PrePopQuery.entry[24].resource.entry.resource.value.value"
      * linkId = "hdl-chol"
      * text = "HDL Cholesterol"
      * type = #decimal
      * item[+]
        * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#prompt
        * linkId = "fd5f6677-dd35-41a1-9f3b-3e30b3130847"
        * text = "Between 0.2 - 5"
        * type = #display
    * item[+]
      * extension[+][sdc-questionnaire-initialExpression].valueExpression
        * language = #text/fhirpath
        * expression = "%PrePopQuery.entry[21].resource.entry.resource.code.coding.where(system='http://snomed.info/sct' and code='44054006').exists()"
      * linkId = "has-diabetes"
      * text = "Diabetes"
      * type = #boolean
      * repeats = false
    *  item[+]
      * linkId = "ecg-lvh"
      * text = "ECG LVH"
      * type = #boolean
      * repeats = false
        //  * item[=].item[+].extension[0].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-instruction"
        // * item[=].item[=].extension[=].valueString = "auscvdrisk.com.au/risk-calculator/"
    * item[+]
      * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unit].valueCoding = http://unitsofmeasure.org#%
      // * extension[sdc-questionnaire-observationExtract].valueBoolean = true
      * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression].valueExpression
        * description = "CVD Risk Score"
        * language = #text/fhirpath
        * expression = "%cvdScore.round(0)"
      * linkId = "09c2de87-614f-4e5c-a496-387cab577ae5"
      * text = "Cardiovascular risk calculated, details"
      // * code = $SCT#827181004 "Risk of cardiovascular disease"
      * type = #decimal
  * item[+]
    * linkId = "42b1e8b9-9393-4de2-8439-1f15fdc383ac"
    * text = "Investigations"
    * type = #group
    * repeats = false
    * item[+]
      * linkId = "2715df61-d70b-468f-bb24-2cdf30c2112c"
      * text = "Full blood count, HbA1c or blood glucose level, serum lipids, Kidney function including eGFR, Liver function tests, ACR"
      * type = #text
    * item[+]
      * linkId = "fa26f1da-c445-45a7-b443-450952e664a9"
      * text = "Chlamydia, gonorrhoea: <=30, first void urine (male and female) and/or endocervical swab or self-administered vaginal swab (female) or throat and anal swab (men who have sex with men [MSM])"
      * type = #text
    * item[+]
      * linkId = "75f21ab7-f053-46ae-a6bb-484c8904f984"
      * text = "Syphilis (endemic areas, MSM, others at high risk)"
      * type = #text
    * item[+]
      * linkId = "66d0aa03-4d7a-49e1-b4eb-990ec800bd91"
      * text = "Trichomoniasis (<=30, male and female, remote areas and other endemic areas, first void urine and/or endocervical swab or self-administered vaginal swab)"
      * type = #text
    * item[+]
      * linkId = "4bed1c5f-5fc3-443c-a264-fd4b21bef0aa"
      * text = "Blood-borne virus screening: HBV if status not known/not recorded on file, HCV if risk factors, HIV if risk factors"
      * type = #text
        
