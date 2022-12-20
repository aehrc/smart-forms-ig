Alias: $LNC = http://loinc.org
Alias: $SCT = http://snomed.info/sct
Alias: $UCUM = http://unitsofmeasure.org

Instance: 715AssessmentMedicalHistory
InstanceOf: Questionnaire
Usage: #definition
Title: "715 Assessment Medical History"
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
* url = "http://www.health.gov.au/assessments/mbs/715/715AssessmentMedicalHistory"
* name = "715AssessmentMedicalHistory"
* title = "715 Assessment Medical History"
* status = #draft
* experimental = true
* subjectType[+] = #Patient
* date = "2022-05-24"
* jurisdiction.coding = urn:iso:std:iso:3166#AU

* item[+]
  * extension[questionnaire-itemControl].valueCodeableConcept = https://aehrc.csiro.au/fhir/CodeSystem/QuestionnaireItemControlExtended#tab
  * linkId = "28d5dbe4-1e65-487c-847a-847f544a6a91"
  * text = "Medical history and current problems"
  * type = #group
  * repeats = false
  * item[+]
    * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unit].valueCoding = $UCUM#wk
    * linkId = "a10a7375-e9d3-4e71-a47a-282e9ba38ec1"
    * text = "Gestation at birth"
    * type = #decimal
    * repeats = false
    * enableWhen[+]
      * question = "e2a16e4d-2765-4b61-b286-82cfc6356b30" // age item which has initial population from variable
      * operator = #<=
      * answerInteger = 5 
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#unit
      * linkId = "f3899852-36c4-441f-9a7d-544ef1617f08"
      * text = "weeks"
      * type = #display
  * item[+]
    * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unit].valueCoding = $UCUM#kg
    * linkId = "29b6d8ea-23b2-4a69-98d9-899198692de7"
    * text = "Birth weight"
    * type = #decimal
    * repeats = false
    * enableWhen[+]
      * question = "e2a16e4d-2765-4b61-b286-82cfc6356b30" // age item which has initial population from variable
      * operator = #<=
      * answerInteger = 5 
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#unit
      * linkId = "87cf1ecd-6d1b-4de1-894d-58bd77dcfde1"
      * text = "kg"
      * type = #display
  
  // for infants 0-5
  * item[+]
    * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#check-box
    * linkId = "033db7b3-80da-43e2-9838-88f3d51e5913"
    * text = "Problems"
    * type = #choice
    * repeats = true
    * enableWhen[+]
      * question = "e2a16e4d-2765-4b61-b286-82cfc6356b30" // age item which has initial population from variable
      * operator = #<=
      * answerInteger = 5       
    * answerValueSet = "#MedicalHistoryShortListInfants"

  // for Primary School Children 5-12
  * item[+]
    * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#check-box
    * linkId = "384ab440-10ed-4ac1-89da-cd7d24f87a95"
    * text = "Problems"
    * type = #choice
    * repeats = true
    * enableWhen[+]
      * question = "e2a16e4d-2765-4b61-b286-82cfc6356b30" // age item which has initial population from variable
      * operator = #>
      * answerInteger = 5   
    * enableWhen[+]
      * question = "e2a16e4d-2765-4b61-b286-82cfc6356b30" // age item which has initial population from variable
      * operator = #<=
      * answerInteger = 12
    * enableBehavior = #all 
    * answerValueSet = "#MedicalHistoryShortListPrimarySchool"

  // for adolescents 12-24
  * item[+]
    * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#check-box
    * linkId = "c24ae0d2-8932-4b87-9b7e-a644b5eb2874"
    * text = "Problems"
    * type = #choice
    * repeats = true
    * enableWhen[+]
      * question = "e2a16e4d-2765-4b61-b286-82cfc6356b30" // age item which has initial population from variable
      * operator = #>
      * answerInteger = 12   
    * enableWhen[+]
      * question = "e2a16e4d-2765-4b61-b286-82cfc6356b30" // age item which has initial population from variable
      * operator = #<=
      * answerInteger = 24
    * enableBehavior = #all        
    * answerValueSet = "#MedicalHistoryShortListAdolescents"

 // for adults and older >24
  * item[+]
    * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#check-box
    * linkId = "bba27ef5-05c5-4e9c-bc9f-cf42091e99cb"
    * text = "Problems"
    * type = #choice
    * repeats = true
    * enableWhen[+]
      * question = "e2a16e4d-2765-4b61-b286-82cfc6356b30" // age item which has initial population from variable
      * operator = #>
      * answerInteger = 24      
    * answerValueSet = "#MedicalHistoryShortListAdultsAndOlderPeople"

//continue
  * item[+]
    * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#autocomplete
    * extension[sdc-questionnaire-initialExpression].valueExpression
      * language = #text/fhirpath
      * expression = "%PrePopQuery.entry[21].resource.entry.resource.code.select((coding.where(system='http://snomed.info/sct') | coding.where(system!='http://snomed.info/sct').first() | text ).first())"      
    * linkId = "736f2a51-e04d-4e7f-aef1-c47f3a1f4e3c"
    * text = "Other relevant medical history, operations, hospital admissions, etc"
    * extension[sdc-questionnaire-shortText].valueString = "Other relevant medical history"
    * type = #open-choice
    * repeats = true
    * answerValueSet = "https://aehrc.csiro.au/fhir/ValueSet/MedicalHistory"
  * item[+]
    * linkId = "f00def30-35dd-401a-9a38-12602bd3b8b1"
    * text = "Provide details of identified problems"
    * type = #text
    * repeats = false 

// experimental table of medical history
  * item[+]
    * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#gtable
    * linkId = "92bd7d05-9b5e-4cf9-900b-703f361dad9d"
    * text = "Medical history and current problems list"
    * type = #group
    * repeats = true
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#autocomplete
      * extension[sdc-questionnaire-initialExpression].valueExpression
        * language = #text/fhirpath
        * expression = "%PrePopQuery.entry[21].resource.entry.resource.code.select((coding.where(system='http://snomed.info/sct') | coding.where(system!='http://snomed.info/sct').first() | text ).first())"      
      * linkId = "59b1900a-4f85-4a8c-b9cd-3fe2fd76f27e"
      * text = "Condition"
      * type = #open-choice
      * answerValueSet = "https://aehrc.csiro.au/fhir/ValueSet/MedicalHistory"
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#drop-down
      * extension[sdc-questionnaire-initialExpression].valueExpression
        * language = #text/fhirpath
        * expression = "%PrePopQuery.entry[21].resource.entry.resource.clinicalStatus.coding.code"      
      * linkId = "88bcfad7-386b-4d87-b34b-2e50482e4d2c"
      * text = "Clinical Status"
      * type = #choice
      * answerValueSet = "#condition-clinical"
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#autocomplete
      * extension[sdc-questionnaire-initialExpression].valueExpression
        * language = #text/fhirpath
        * expression = "%PrePopQuery.entry[21].resource.entry.resource.onsetDateTime"      
      * linkId = "6ae641ad-95bb-4cdc-8910-5a52077e492c"
      * text = "Onset Date"
      * type = #dateTime
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#autocomplete
      * extension[sdc-questionnaire-initialExpression].valueExpression
        * language = #text/fhirpath
        * expression = "%PrePopQuery.entry[21].resource.entry.resource.recordedDate"      
      * linkId = "18b9e159-2ed7-4047-82b7-deb2a171de4f"
      * text = "Recorded Date"
      * type = #dateTime


  * item[+]
    * linkId = "62774152-8a6e-4449-af9f-87bdce8b9bf5"
    * text = "Health priorities, actions and follow-up"
    * type = #text
    * repeats = false
