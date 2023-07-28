Alias: $LNC = http://loinc.org
Alias: $SCT = http://snomed.info/sct
Alias: $UCUM = http://unitsofmeasure.org
Alias: $questionnaire-item-control = http://hl7.org/fhir/questionnaire-item-control
Alias: $interrai = https://interrai.org/

Instance: AgedCareQIPrototype
InstanceOf: Questionnaire
Usage: #definition
Title: "Aged Care QI Prototype"
Description: "Aged Care QI Prototype."

* contained[+] = PressureInjuryClassification

//launch context
* extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext"
* extension[=].extension[+].url = "name"
* extension[=].extension[=].valueCoding = http://hl7.org/fhir/uv/sdc/CodeSystem/launchContext#patient
* extension[=].extension[+].url = "type"
* extension[=].extension[=].valueCode = #Patient
* extension[=].extension[+].url = "description"
* extension[=].extension[=].valueString = "The patient that is to be used to pre-populate the form"

* extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext"
* extension[=].extension[+].url = "name"
* extension[=].extension[=].valueCoding = http://hl7.org/fhir/uv/sdc/CodeSystem/launchContext#user
* extension[=].extension[+].url = "type"
* extension[=].extension[=].valueCode = #Practitioner
* extension[=].extension[+].url = "description"
* extension[=].extension[=].valueString = "The practitioner user that is to be used to pre-populate the form"

//prepop variables
* extension[+].url = "http://hl7.org/fhir/StructureDefinition/variable"
* extension[=].valueExpression[+].name = "Condition"
* extension[=].valueExpression[=].language = #application/x-fhir-query
* extension[=].valueExpression[=].expression = "Condition?patient={{%patient.id}}"


* meta.profile[+] = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-render"
* meta.profile[+] = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-pop-exp"
* name = "AgedCareQIPrototype"
* title = "Aged Care QI Prototype"
* status = #draft
* experimental = true
* subjectType[+] = #Patient
* date = "2023-07-07"
* jurisdiction.coding = urn:iso:std:iso:3166#AU

* item[0].extension[+].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item[=].extension[=].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#tab-container
* item[=].linkId = "tab-container"
* item[=].type = #group
* item[=].repeats = false
//Client Details
* item[=].item[+].linkId = "client"
* item[=].item[=].text = "Client Details"
* item[=].item[=].type = #group
* item[=].item[=].required = true
* item[=].item[=].repeats = false
* item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].extension[=].valueExpression[=].expression = "(%patient.name.where(use='official').select((family | (given | prefix).join(' ')).join(', ') | text) | %patient.name.where(use!='official').select((family | (given | prefix).join(' ')).join(', ') | text)).first()"
* item[=].item[=].item[=].linkId = "client-name"
* item[=].item[=].item[=].text = "Name"
* item[=].item[=].item[=].type = #string
* item[=].item[=].item[=].required = true
* item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].readOnly = true
* item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%patient.birthDate"
* item[=].item[=].item[=].linkId = "client-dob"
* item[=].item[=].item[=].text = "Date of birth"
* item[=].item[=].item[=].type = #date
* item[=].item[=].item[=].required = true
* item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].readOnly = true
* item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].extension[=].valueExpression[=].expression = "iif(today().toString().select(substring(5,2) & substring(8,2)).toInteger() > %patient.birthDate.toString().select(substring(5,2) & substring(8,2)).toInteger(), today().toString().substring(0,4).toInteger() - %patient.birthDate.toString().substring(0,4).toInteger(), today().toString().substring(0,4).toInteger() - %patient.birthDate.toString().substring(0,4).toInteger() - 1)"
* item[=].item[=].item[=].linkId = "client-age"
* item[=].item[=].item[=].text = "Age"
* item[=].item[=].item[=].type = #integer
* item[=].item[=].item[=].required = true
* item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].readOnly = true
* item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%patient.gender"
* item[=].item[=].item[=].linkId = "client-gender"
* item[=].item[=].item[=].text = "Administrative Gender"
* item[=].item[=].item[=].type = #choice
* item[=].item[=].item[=].required = false
* item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].readOnly = true
* item[=].item[=].item[=].answerValueSet = "http://hl7.org/fhir/ValueSet/administrative-gender"
* item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%patient.gender"
* item[=].item[=].item[=].linkId = "client-absent"
* item[=].item[=].item[=].text = "Absent from service for the entire quarter"
* item[=].item[=].item[=].type = #boolean
* item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].linkId = "client-eol"
* item[=].item[=].item[=].text = "Receiving end-of-life care"
* item[=].item[=].item[=].type = #boolean
* item[=].item[=].item[=].repeats = false


// QI - Pressure Injuries

* item[=].item[+].extension[+].url = "http://hl7.org/fhir/StructureDefinition/variable"
* item[=].item[=].extension[=].valueExpression.name = "PressureInjuries"
* item[=].item[=].extension[=].valueExpression.language = #text/fhirpath
* item[=].item[=].extension[=].valueExpression.expression = "item.where(linkId='qi-pi-4').item.where(linkId='qi-pi-4-1').answer.value"
* item[=].item[=].linkId = "qi-pi"
* item[=].item[=].text = "Pressure Injuries"
* item[=].item[=].type = #group
* item[=].item[=].repeats = false
* item[=].item[=].required = true


* item[=].item[=].item[+].linkId = "qi-pi-2"
* item[=].item[=].item[=].text = "Date of last assessment"
* item[=].item[=].item[=].type = #date
* item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].required = true

* item[=].item[=].item[+].linkId = "qi-pi-3"
* item[=].item[=].item[=].text = "Withheld consent for pressure injury assessment for the entire quarter"
* item[=].item[=].item[=].type = #boolean
* item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].required = true

//Pressure Injuries table
* item[=].item[=].item[+].extension[0].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item[=].item[=].item[=].extension[=].valueCodeableConcept = $questionnaire-item-control#gtable

* item[=].item[=].item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-itemPopulationContext"
* item[=].item[=].item[=].extension[=].valueExpression.name = "ConditionRepeatPIs"
* item[=].item[=].item[=].extension[=].valueExpression.language = #text/fhirpath
* item[=].item[=].item[=].extension[=].valueExpression.expression = "%Condition.entry.resource.where(clinicalStatus.coding.code='active' and code.coding.where(system='http://hl7.org/fhir/sid/icd-10-am' and (code='L89.0' or code='L89.1' or code='L89.2' or code='L89.3' or code='L89.4' or code='L89.5')))"

* item[=].item[=].item[=].linkId = "qi-pi-4"
* item[=].item[=].item[=].text = "Pressure Injuries Classification List (active)"
* item[=].item[=].item[=].type = #group
* item[=].item[=].item[=].repeats = true

* item[=].item[=].item[=].item[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item[=].item[=].item[=].item[=].extension[=].valueCodeableConcept = $questionnaire-item-control#drop-down

* item[=].item[=].item[=].item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].extension[=].valueExpression.language = #text/fhirpath
* item[=].item[=].item[=].item[=].extension[=].valueExpression.expression = "%ConditionRepeatPIs.code.coding.where(system='http://hl7.org/fhir/sid/icd-10-am' and (code='L89.0' or code='L89.1' or code='L89.2' or code='L89.3' or code='L89.4' or code='L89.5'))"

* item[=].item[=].item[=].item[=].linkId = "qi-pi-4-1"
* item[=].item[=].item[=].item[=].text = "Pressure Injury"
* item[=].item[=].item[=].item[=].type = #choice
* item[=].item[=].item[=].item[=].answerValueSet = "#PressureInjuryClassification"

* item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].extension[=].valueExpression.language = #text/fhirpath
* item[=].item[=].item[=].item[=].extension[=].valueExpression.expression = "%ConditionRepeatPIs.onset.ofType(dateTime)"

* item[=].item[=].item[=].item[=].linkId = "qi-pi-4-2"
* item[=].item[=].item[=].item[=].text = "Onset Date"
* item[=].item[=].item[=].item[=].type = #dateTime

* item[=].item[=].item[=].item[+].linkId = "qi-pi-4-3"
* item[=].item[=].item[=].item[=].text = "Acquired outside of service during quarter?"
* item[=].item[=].item[=].item[=].type = #boolean


* item[=].item[=].item[+].extension[0].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression"
* item[=].item[=].item[=].extension[=].valueExpression.description = "Pressure injury count"
* item[=].item[=].item[=].extension[=].valueExpression.language = #text/fhirpath
* item[=].item[=].item[=].extension[=].valueExpression.expression = "%PressureInjuries.count()"
* item[=].item[=].item[=].linkId = "qi-pi-5"
* item[=].item[=].item[=].text = "Number of pressure injuries"
* item[=].item[=].item[=].type = #integer
* item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].required = true



// QI - Physical Restraint

* item[=].item[+].linkId = "qi-restraint"
* item[=].item[=].text = "Physical Restraint"
* item[=].item[=].type = #group
* item[=].item[=].repeats = false
* item[=].item[=].required = true

* item[=].item[=].item[+].linkId = "qi-restraint-1"
* item[=].item[=].item[=].text = "Date of assessment"
* item[=].item[=].item[=].type = #date
* item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].required = true

* item[=].item[=].item[+].linkId = "qi-restraint-2"
* item[=].item[=].item[=].text = "Absent during assessment period"
* item[=].item[=].item[=].type = #boolean
* item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].required = true

* item[=].item[=].item[+].extension[0].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item[=].item[=].item[=].extension[=].valueCodeableConcept = $questionnaire-item-control#gtable
* item[=].item[=].item[=].linkId = "qi-restraint-3"
* item[=].item[=].item[=].text = "Physical restraints present during assessment period"
* item[=].item[=].item[=].type = #group
* item[=].item[=].item[=].repeats = true

* item[=].item[=].item[=].item[+].extension[0].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item[=].item[=].item[=].item[=].extension[=].valueCodeableConcept = $questionnaire-item-control#drop-down
* item[=].item[=].item[=].item[=].linkId = "qi-restraint-3-1"
* item[=].item[=].item[=].item[=].text = "Physical restraint type"
* item[=].item[=].item[=].item[=].type = #choice
* item[=].item[=].item[=].item[=].answerOption[+].valueCoding = $interrai#iN6a "a. Full bed rails on all open sides of bed"
* item[=].item[=].item[=].item[=].answerOption[+].valueCoding = $interrai#iN6b "b. Trunk restraint"
* item[=].item[=].item[=].item[=].answerOption[+].valueCoding = $interrai#iN6c "c. Chair prevents rising"

* item[=].item[=].item[=].item[+].extension[0].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item[=].item[=].item[=].item[=].extension[=].valueCodeableConcept = $questionnaire-item-control#drop-down
* item[=].item[=].item[=].item[=].linkId = "qi-restraint-3-2"
* item[=].item[=].item[=].item[=].text = "Frequency of use"
* item[=].item[=].item[=].item[=].type = #choice
* item[=].item[=].item[=].item[=].answerOption[+].valueCoding = $interrai#0 "0. Not used"
* item[=].item[=].item[=].item[=].answerOption[+].valueCoding = $interrai#1 "1. Used less than daily"
* item[=].item[=].item[=].item[=].answerOption[+].valueCoding = $interrai#2 "2. Used daily-Nights only"
* item[=].item[=].item[=].item[=].answerOption[+].valueCoding = $interrai#3 "3. Used daily-Days only"
* item[=].item[=].item[=].item[=].answerOption[+].valueCoding = $interrai#4 "4. Used nights and days, but not constant"
* item[=].item[=].item[=].item[=].answerOption[+].valueCoding = $interrai#5 "5. Constant use for full 24 hours (may include periodic releases)"

* item[=].item[=].item[+].linkId = "qi-restraint-4"
* item[=].item[=].item[=].text = "Restrained through use of secure area during assessment period"
* item[=].item[=].item[=].type = #boolean
* item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].required = true

// QI - Unplanned Weight Loss

* item[=].item[+].extension[+].url = "http://hl7.org/fhir/StructureDefinition/variable"
* item[=].item[=].extension[=].valueExpression.name = "PreviousWeight"
* item[=].item[=].extension[=].valueExpression.language = #text/fhirpath
* item[=].item[=].extension[=].valueExpression.expression = "item.where(linkId='qi-weight-3').item.where(linkId='qi-weight-3-1').answer.value"
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/variable"
* item[=].item[=].extension[=].valueExpression.name = "FinishingWeight"
* item[=].item[=].extension[=].valueExpression.language = #text/fhirpath
* item[=].item[=].extension[=].valueExpression.expression = "item.where(linkId='qi-weight-3').item.where(linkId='qi-weight-3-4').answer.value"
* item[=].item[=].linkId = "qi-weight"
* item[=].item[=].text = "Unplanned Weight Loss"
* item[=].item[=].type = #group
* item[=].item[=].repeats = false
* item[=].item[=].required = true

* item[=].item[=].item[+].linkId = "qi-weight-1"
* item[=].item[=].item[=].text = "Undertaking weight loss strategy"
* item[=].item[=].item[=].type = #boolean
* item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].required = true


* item[=].item[=].item[+].extension[0].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item[=].item[=].item[=].extension[=].valueCodeableConcept = $questionnaire-item-control#check-box
* item[=].item[=].item[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-choiceOrientation"
* item[=].item[=].item[=].extension[=].valueCode = #vertical"
* item[=].item[=].item[=].linkId = "qi-weight-2"
* item[=].item[=].item[=].text = "Withheld consent to be weighed"
* item[=].item[=].item[=].type = #choice
* item[=].item[=].item[=].repeats = true
* item[=].item[=].item[=].answerOption[+].valueString = "On the starting weight collection date"
* item[=].item[=].item[=].answerOption[+].valueString = "On the middle weight collection date"
* item[=].item[=].item[=].answerOption[+].valueString = "On the finishing weight collection date"


* item[=].item[=].item[+].extension[0].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item[=].item[=].item[=].extension[=].valueCodeableConcept = $questionnaire-item-control#gtable
* item[=].item[=].item[=].linkId = "qi-weight-3"
* item[=].item[=].item[=].text = "Recorded weights"
* item[=].item[=].item[=].type = #group
* item[=].item[=].item[=].repeats = true
* item[=].item[=].item[=].item[+].extension[0].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-unit"
* item[=].item[=].item[=].item[=].extension[=].valueCodeableConcept = $UCUM#kg "kg"
* item[=].item[=].item[=].item[=].linkId = "qi-weight-3-1"
* item[=].item[=].item[=].item[=].text = "Previous weight"
* item[=].item[=].item[=].item[=].type = #decimal
* item[=].item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item[=].item[=].item[=].item[=].item[=].extension[=].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#unit
* item[=].item[=].item[=].item[=].item[=].linkId = "qi-weight-3-1-1"
* item[=].item[=].item[=].item[=].item[=].text = "kg"
* item[=].item[=].item[=].item[=].item[=].type = #display
* item[=].item[=].item[=].item[+].extension[0].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-unit"
* item[=].item[=].item[=].item[=].extension[=].valueCodeableConcept = $UCUM#kg "kg"
* item[=].item[=].item[=].item[=].linkId = "qi-weight-3-2"
* item[=].item[=].item[=].item[=].text = "Starting weight"
* item[=].item[=].item[=].item[=].type = #decimal
* item[=].item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item[=].item[=].item[=].item[=].item[=].extension[=].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#unit
* item[=].item[=].item[=].item[=].item[=].linkId = "qi-weight-3-2-1"
* item[=].item[=].item[=].item[=].item[=].text = "kg"
* item[=].item[=].item[=].item[=].item[=].type = #display
* item[=].item[=].item[=].item[+].extension[0].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-unit"
* item[=].item[=].item[=].item[=].extension[=].valueCodeableConcept = $UCUM#kg "kg"
* item[=].item[=].item[=].item[=].linkId = "qi-weight-3-3"
* item[=].item[=].item[=].item[=].text = "Middle weight"
* item[=].item[=].item[=].item[=].type = #decimal
* item[=].item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item[=].item[=].item[=].item[=].item[=].extension[=].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#unit
* item[=].item[=].item[=].item[=].item[=].linkId = "qi-weight-3-3-1"
* item[=].item[=].item[=].item[=].item[=].text = "kg"
* item[=].item[=].item[=].item[=].item[=].type = #display
* item[=].item[=].item[=].item[+].extension[0].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-unit"
* item[=].item[=].item[=].item[=].extension[=].valueCodeableConcept = $UCUM#kg "kg"
* item[=].item[=].item[=].item[=].linkId = "qi-weight-3-4"
* item[=].item[=].item[=].item[=].text = "Finishing weight"
* item[=].item[=].item[=].item[=].type = #decimal
* item[=].item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item[=].item[=].item[=].item[=].item[=].extension[=].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#unit
* item[=].item[=].item[=].item[=].item[=].linkId = "qi-weight-3-4-1"
* item[=].item[=].item[=].item[=].item[=].text = "kg"
* item[=].item[=].item[=].item[=].item[=].type = #display

* item[=].item[=].item[+].extension[0].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression"
* item[=].item[=].item[=].extension[=].valueExpression.description = "Percentage weight change"
* item[=].item[=].item[=].extension[=].valueExpression.language = #text/fhirpath
* item[=].item[=].item[=].extension[=].valueExpression.expression = "((%FinishingWeight-%PreviousWeight)/%PreviousWeight)*100"
* item[=].item[=].item[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-unit"
* item[=].item[=].item[=].extension[=].valueCodeableConcept = $UCUM#%
* item[=].item[=].item[=].linkId = "qi-weight-4"
* item[=].item[=].item[=].text = "Weight change over quarter"
* item[=].item[=].item[=].type = #decimal
* item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item[=].item[=].item[=].item[=].extension[=].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#unit
* item[=].item[=].item[=].item[=].linkId = "qi-weight-4-1"
* item[=].item[=].item[=].item[=].text = "%"
* item[=].item[=].item[=].item[=].type = #display

// QI - Continence

* item[=].item[+].type = #group
* item[=].item[=].linkId = "qi-continence"
* item[=].item[=].text = "Continence"

//in-progress
* item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item[=].item[=].item[=].extension[=].valueCodeableConcept = https://smartforms.csiro.au/ig/CodeSystem/QuestionnaireItemControlExtended#context-display    
* item[=].item[=].item[=].linkId = "CD-in-progress-1"
* item[=].item[=].item[=].text = "In progress"
* item[=].item[=].item[=].text.extension[+].url = "http://hl7.org/fhir/StructureDefinition/rendering-xhtml" 
* item[=].item[=].item[=].text.extension[=].valueString = "<div title=\"In progress\" xmlns=\"http://www.w3.org/1999/xhtml\">\r\n\t<div style=\"display: flex; flex-direction: row;\">\r\n\t\t<img width='24' height='24' src='data:image/svg+xml;base64,\r\n\t\tPHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxZW0iIGhlaWdodD0iMWVtIiB2aWV3Qm94PSIwIDAgMjQgMjQiPjxwYXRoIGZpbGw9IiM3NTc1NzUiIGQ9Im0xNS44NCAxMC4ybC0xLjAxIDEuMDFsLTIuMDctMi4wM2wxLjAxLTEuMDJjLjItLjIxLjU0LS4yMi43OCAwbDEuMjkgMS4yNWMuMjEuMjEuMjIuNTUgMCAuNzlNOCAxMy45MWw0LjE3LTQuMTlsMi4wNyAyLjA4bC00LjE2IDQuMkg4di0yLjA5TTEzIDJ2MmM0LjM5LjU0IDcuNSA0LjUzIDYuOTYgOC45MkE4LjAxNCA4LjAxNCAwIDAgMSAxMyAxOS44OHYyYzUuNS0uNiA5LjQ1LTUuNTQgOC44NS0xMS4wM0MyMS4zMyA2LjE5IDE3LjY2IDIuNSAxMyAybS0yIDBjLTEuOTYuMTgtMy44MS45NS01LjMzIDIuMkw3LjEgNS43NGMxLjEyLS45IDIuNDctMS40OCAzLjktMS42OHYtMk00LjI2IDUuNjdBOS44MSA5LjgxIDAgMCAwIDIuMDUgMTFoMmMuMTktMS40Mi43NS0yLjc3IDEuNjQtMy45TDQuMjYgNS42N00yLjA2IDEzYy4yIDEuOTYuOTcgMy44MSAyLjIxIDUuMzNsMS40Mi0xLjQzQTguMDAyIDguMDAyIDAgMCAxIDQuMDYgMTNoLTJtNSA1LjM3bC0xLjM5IDEuMzdBOS45OTQgOS45OTQgMCAwIDAgMTEgMjJ2LTJhOC4wMDIgOC4wMDIgMCAwIDEtMy45LTEuNjNoLS4wNFoiLz48L3N2Zz4=' \r\n\t\tstyle=\"align-self: center;\"/>\r\n\t</div>\r\n</div>" 
* item[=].item[=].item[=].type = #display
* item[=].item[=].item[=].enableWhen[+].question = "MarkComplete-1" // Section complete item
* item[=].item[=].item[=].enableWhen[=].operator = #=
* item[=].item[=].item[=].enableWhen[=].answerBoolean = false  
//complete
* item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item[=].item[=].item[=].extension[=].valueCodeableConcept = https://smartforms.csiro.au/ig/CodeSystem/QuestionnaireItemControlExtended#context-display
* item[=].item[=].item[=].linkId = "CD-complete-1"
* item[=].item[=].item[=].text = "Complete"
* item[=].item[=].item[=].text.extension[+].url = "http://hl7.org/fhir/StructureDefinition/rendering-xhtml" 
* item[=].item[=].item[=].text.extension[=].valueString = "<div title=\"Section completed\" xmlns=\"http://www.w3.org/1999/xhtml\">\r\n\t<div style=\"display: flex; flex-direction: row;\">\r\n\t\t<img width='24' height='24' src='data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxZW0iIGhlaWdodD0iMWVtIiB2aWV3Qm94PSIwIDAgMjQgMjQiPjxwYXRoIGZpbGw9IiMyZTdkMzIiIGQ9Ik0yMCAxMmE4IDggMCAwIDEtOCA4YTggOCAwIDAgMS04LThhOCA4IDAgMCAxIDgtOGMuNzYgMCAxLjUuMTEgMi4yLjMxbDEuNTctMS41N0E5LjgyMiA5LjgyMiAwIDAgMCAxMiAyQTEwIDEwIDAgMCAwIDIgMTJhMTAgMTAgMCAwIDAgMTAgMTBhMTAgMTAgMCAwIDAgMTAtMTBNNy45MSAxMC4wOEw2LjUgMTEuNUwxMSAxNkwyMSA2bC0xLjQxLTEuNDJMMTEgMTMuMTdsLTMuMDktMy4wOVoiLz48L3N2Zz4='\r\n\t\tstyle=\"align-self: center;\"/>\r\n\t</div>\r\n</div>\r\n"
* item[=].item[=].item[=].type = #display
* item[=].item[=].item[=].enableWhen[+].question = "MarkComplete-1" // Section complete item
* item[=].item[=].item[=].enableWhen[=].operator = #=
* item[=].item[=].item[=].enableWhen[=].answerBoolean = true
//alert
* item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item[=].item[=].item[=].extension[=].valueCodeableConcept = https://smartforms.csiro.au/ig/CodeSystem/QuestionnaireItemControlExtended#context-display
* item[=].item[=].item[=].linkId = "alert-iad"
* item[=].item[=].item[=].text = "IAD present"
* item[=].item[=].item[=].text.extension[+].url = "http://hl7.org/fhir/StructureDefinition/rendering-xhtml" 
* item[=].item[=].item[=].text.extension[=].valueString = "<div title=\"IAD present\" xmlns=\"http://www.w3.org/1999/xhtml\">\r\n\t<div style=\"display: flex; flex-direction: row;\">\r\n\t\t<img width='24' height='24' src='data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxZW0iIGhlaWdodD0iMWVtIiB2aWV3Qm94PSIwIDAgMjQgMjQiPjxwYXRoIGZpbGw9IiNkMzJmMmYiIGQ9Ik0xMSAxNWgydjJoLTJ2LTJtMC04aDJ2NmgtMlY3bTEtNUM2LjQ3IDIgMiA2LjUgMiAxMmExMCAxMCAwIDAgMCAxMCAxMGExMCAxMCAwIDAgMCAxMC0xMEExMCAxMCAwIDAgMCAxMiAybTAgMThhOCA4IDAgMCAxLTgtOGE4IDggMCAwIDEgOC04YTggOCAwIDAgMSA4IDhhOCA4IDAgMCAxLTggOFoiLz48L3N2Zz4=' style=\"align-self: center;\"/>\r\n\t</div>\r\n</div>"
* item[=].item[=].item[=].type = #display      
* item[=].item[=].item[=].enableWhen[+].question = "qi-continence-1-1" // IAD category item
* item[=].item[=].item[=].enableWhen[=].operator = #exists
* item[=].item[=].item[=].enableWhen[=].answerBoolean = true



* item[=].item[=].item[+].type = #choice
* item[=].item[=].item[=].code = $interrai#iH1 "Bladder continence"
* item[=].item[=].item[=].extension.url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item[=].item[=].item[=].extension.valueCodeableConcept = $questionnaire-item-control#drop-down "Drop down"
* item[=].item[=].item[=].extension.valueCodeableConcept.text = "Drop down"
* item[=].item[=].item[=].required = false
* item[=].item[=].item[=].linkId = "iH1"
* item[=].item[=].item[=].text = "1. Bladder continence"
* item[=].item[=].item[=].answerOption[0].valueCoding = $interrai#0 "0. Continent - Complete control; DOES NOT USE any type of catheter or other urinary collection device"
* item[=].item[=].item[=].answerOption[+].valueCoding = $interrai#1 "1. Control with any catheter or ostomy over last 3 days"
* item[=].item[=].item[=].answerOption[+].valueCoding = $interrai#2 "2. Infrequently incontinent - Not incontinent over last 3 days, but does have incontinent episodes"
* item[=].item[=].item[=].answerOption[+].valueCoding = $interrai#3 "3. Occasionally incontinent—Less than daily"
* item[=].item[=].item[=].answerOption[+].valueCoding = $interrai#4 "4. Frequently incontinent—Daily, but some control present"
* item[=].item[=].item[=].answerOption[+].valueCoding = $interrai#5 "5. Incontinent—No control present"
* item[=].item[=].item[=].answerOption[+].valueCoding = $interrai#8 "8. Did not occur—No urine output from bladder in last 3 days"
* item[=].item[=].item[+].type = #choice
* item[=].item[=].item[=].code = $interrai#iH3 "Bowel continence"
* item[=].item[=].item[=].extension.url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item[=].item[=].item[=].extension.valueCodeableConcept = $questionnaire-item-control#drop-down "Drop down"
* item[=].item[=].item[=].extension.valueCodeableConcept.text = "Drop down"
* item[=].item[=].item[=].required = false
* item[=].item[=].item[=].linkId = "iH3"
* item[=].item[=].item[=].text = "3. Bowel continence"
* item[=].item[=].item[=].answerOption[0].valueCoding = $interrai#0 "0. Continent - Complete control; DOES NOT USE any type of ostomy device"
* item[=].item[=].item[=].answerOption[+].valueCoding = $interrai#1 "1. Control with ostomy - Control with ostomy over last 3 days"
* item[=].item[=].item[=].answerOption[+].valueCoding = $interrai#2 "2. Infrequently incontinent - Not incontinent over last 3 days, but does have incontinent episodes"
* item[=].item[=].item[=].answerOption[+].valueCoding = $interrai#3 "3. Occasionally incontinent — Less than daily"
* item[=].item[=].item[=].answerOption[+].valueCoding = $interrai#4 "4. Frequently incontinent — Daily, but some control present"
* item[=].item[=].item[=].answerOption[+].valueCoding = $interrai#5 "5. Incontinent — No control present"
* item[=].item[=].item[=].answerOption[+].valueCoding = $interrai#8 "8. Did not occur — No bowel movement in last 3 days"

//IAD

* item[=].item[=].item[+].extension[0].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item[=].item[=].item[=].extension[=].valueCodeableConcept = $questionnaire-item-control#gtable
/*
* item[=].item[=].item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-itemPopulationContext"
* item[=].item[=].item[=].extension[=].valueExpression.name = "ConditionRepeatPIs"
* item[=].item[=].item[=].extension[=].valueExpression.language = #text/fhirpath
* item[=].item[=].item[=].extension[=].valueExpression.expression = "%Condition.entry.resource.where(clinicalStatus.coding.code='active' and code.coding.where(system='http://hl7.org/fhir/sid/icd-10-am' and (code='L89.0' or code='L89.1' or code='L89.2' or code='L89.3' or code='L89.4' or code='L89.5')))"
*/
* item[=].item[=].item[=].linkId = "qi-continence-1"
* item[=].item[=].item[=].text = "Incontinence Associated Dermatitis"
* item[=].item[=].item[=].type = #group
* item[=].item[=].item[=].repeats = true
* item[=].item[=].item[=].enableWhen[+].question = "iH1"
* item[=].item[=].item[=].enableWhen[=].operator = #!=
* item[=].item[=].item[=].enableWhen[=].answerCoding = $interrai#0
* item[=].item[=].item[=].enableWhen[+].question = "iH3"
* item[=].item[=].item[=].enableWhen[=].operator = #!=
* item[=].item[=].item[=].enableWhen[=].answerCoding = $interrai#0
* item[=].item[=].item[=].enableBehavior = #any

* item[=].item[=].item[=].item[+].extension[0].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item[=].item[=].item[=].item[=].extension[=].valueCodeableConcept = $questionnaire-item-control#drop-down
/*
* item[=].item[=].item[=].item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].extension[=].valueExpression.language = #text/fhirpath
* item[=].item[=].item[=].item[=].extension[=].valueExpression.expression = "%ConditionRepeatPIs.code.coding.where(system='http://hl7.org/fhir/sid/icd-10-am' and (code='L89.0' or code='L89.1' or code='L89.2' or code='L89.3' or code='L89.4' or code='L89.5'))"
*/
* item[=].item[=].item[=].item[=].linkId = "qi-continence-1-1"
* item[=].item[=].item[=].item[=].text = "IAD Category"
* item[=].item[=].item[=].item[=].type = #choice
* item[=].item[=].item[=].item[=].answerOption[0].valueString = "1A: Persistent redness without clinical signs of infection"
* item[=].item[=].item[=].item[=].answerOption[+].valueString = "1B: Persistent redness with clinical signs of infection"
* item[=].item[=].item[=].item[=].answerOption[+].valueString = "2A: Skin loss without clinical signs of infection"
* item[=].item[=].item[=].item[=].answerOption[+].valueString = "2B: Skin loss with clinical signs of infection"

/*
* item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].extension[=].valueExpression.language = #text/fhirpath
* item[=].item[=].item[=].item[=].extension[=].valueExpression.expression = "%ConditionRepeatPIs.onset.ofType(dateTime)"
*/
* item[=].item[=].item[=].item[+].linkId = "qi-continence-1-2"
* item[=].item[=].item[=].item[=].text = "Recorded Date"
* item[=].item[=].item[=].item[=].type = #dateTime


* item[=].item[=].item[+].linkId = "MarkComplete-1"
* item[=].item[=].item[=].text = "Mark section as complete"
* item[=].item[=].item[=].text.extension[+].url = "http://hl7.org/fhir/StructureDefinition/rendering-xhtml"
* item[=].item[=].item[=].text.extension[=].valueString = "<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n<head>\r\n    <style type=\"text/css\">\r\n        .alert {\r\n            padding: 0.875rem;\r\n            margin-bottom: 1rem;\r\n            font-size: 0.875rem;\r\n            color: #2E7D32;\r\n            border-radius: 0.5rem;\r\n            background-color: #d5e5d6;\r\n            font-weight: 700;\r\n        }\r\n    </style>\r\n</head>\r\n<body>\r\n<div class=\"alert\">Mark section as complete</div>\r\n</body>\r\n</html>"
* item[=].item[=].item[=].type = #boolean
* item[=].item[=].item[=].repeats = false

/*


* item[=].item[=].item[=].linkId = "qi-pi-2"
* item[=].item[=].item[=].text = "Date of assessment"
* item[=].item[=].item[=].type = #date
* item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].required = true

* item[=].item[=].item[=].linkId = "qi-pi-3"
* item[=].item[=].item[=].text = "Pressure Injury Classification"
* item[=].item[=].item[=].type = #choice
* item[=].item[=].item[=].repeats = true
* item[=].item[=].item[=].required = true



* item[=].item[=].item[+].extension[0].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item[=].item[=].item[=].extension[=].valueCodeableConcept = $questionnaire-item-control#
* item[=].item[=].item[=].linkId = "qi-pi-2"
* item[=].item[=].item[=].text = "Date of assessment"
* item[=].item[=].item[=].type = #date
* item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].required = true

*/

