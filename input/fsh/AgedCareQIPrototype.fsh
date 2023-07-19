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