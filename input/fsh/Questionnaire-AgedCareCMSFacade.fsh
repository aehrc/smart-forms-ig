Alias: $LNC = http://loinc.org
Alias: $SCT = http://snomed.info/sct
Alias: $UCUM = http://unitsofmeasure.org
Alias: $questionnaire-item-control = http://hl7.org/fhir/questionnaire-item-control

Instance: AgedCareCMSFacade
InstanceOf: Questionnaire
Usage: #definition
Title: "Aged Care QI Prototype"
Description: "Aged Care CMS Facade."


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

* extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext"
* extension[=].extension[+].url = "name"
* extension[=].extension[=].valueCoding = http://hl7.org/fhir/uv/sdc/CodeSystem/launchContext#encounter
* extension[=].extension[+].url = "type"
* extension[=].extension[=].valueCode = #Encounter
* extension[=].extension[+].url = "description"
* extension[=].extension[=].valueString = "The encounter that is to be used to pre-populate the form"


//prepop variables
* extension[+].url = "http://hl7.org/fhir/StructureDefinition/variable"
* extension[=].valueExpression[+].name = "EncounterAll"
* extension[=].valueExpression[=].language = #application/x-fhir-query
* extension[=].valueExpression[=].expression = "Encounter?patient={{%patient.id}}"
* extension[+].url = "http://hl7.org/fhir/StructureDefinition/variable"
* extension[=].valueExpression[+].name = "Weight"
* extension[=].valueExpression[=].language = #application/x-fhir-query
* extension[=].valueExpression[=].expression = "Observation?code=29463-7&patient={{%patient.id}}"
* extension[+].url = "http://hl7.org/fhir/StructureDefinition/variable"
* extension[=].valueExpression[+].name = "ProblemListItem"
* extension[=].valueExpression[=].language = #application/x-fhir-query
* extension[=].valueExpression[=].expression = "Condition?category=problem-list-item&patient={{%patient.id}}"


* meta.profile[+] = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-render"
* meta.profile[+] = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-pop-exp"
* name = "AgedCareCMSFacade"
* title = "Aged Care CMS Facade"
* status = #draft
* experimental = true
* subjectType[+] = #Patient
* date = "2023-11-27"
* jurisdiction.coding = urn:iso:std:iso:3166#AU
/*
// variables
* item[+].extension[+].url = "http://hl7.org/fhir/StructureDefinition/variable"
* item[=].extension[=].valueExpression.name = "ReportingStartDate"
* item[=].extension[=].valueExpression.language = #text/fhirpath
* item[=].extension[=].valueExpression.expression = "item.where(linkId='client').item.where(linkId='client-period').item.where(linkId='client-period-start').answer.value"
* item[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/variable"
* item[=].extension[=].valueExpression.name = "ReportingEndDate"
* item[=].extension[=].valueExpression.language = #text/fhirpath
* item[=].extension[=].valueExpression.expression = "item.where(linkId='client').item.where(linkId='client-period').item.where(linkId='client-period-end').answer.value"
*/
* item[+].extension[+].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item[=].extension[=].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#tab-container
* item[=].linkId = "tab-container"
* item[=].type = #group
* item[=].repeats = false

//Patient
* item[=].item[+].linkId = "patient"
* item[=].item[=].text = "Patient"
* item[=].item[=].type = #group
* item[=].item[=].repeats = false
* item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%patient.identifier.where(type.coding.exists(system='http://terminology.hl7.org/CodeSystem/v2-0203' and code='MR')).value"
* item[=].item[=].item[=].linkId = "patient-mrn"
* item[=].item[=].item[=].text = "MRN identifier"
* item[=].item[=].item[=].type = #string
* item[=].item[=].item[=].repeats = false
* item[=].item[=].item[+].linkId = "patient-name"
* item[=].item[=].item[=].text = "Legal name"
* item[=].item[=].item[=].type = #group
* item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%patient.name.where(use='official').select(family)"
* item[=].item[=].item[=].item[=].linkId = "patient-name-family"
* item[=].item[=].item[=].item[=].text = "Family name"
* item[=].item[=].item[=].item[=].type = #string
* item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%patient.name.where(use='official').select(given[0])"
* item[=].item[=].item[=].item[=].linkId = "patient-name-given"
* item[=].item[=].item[=].item[=].text = "First given name"
* item[=].item[=].item[=].item[=].type = #string
* item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%patient.name.where(use='official').select(given.skip(1)).join(' ')"
* item[=].item[=].item[=].item[=].linkId = "patient-name-additional-given"
* item[=].item[=].item[=].item[=].text = "Additional given names"
* item[=].item[=].item[=].item[=].type = #string
* item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%patient.name.where(use='official').select(prefix).join(' ')"
* item[=].item[=].item[=].item[=].linkId = "patient-name-prefix"
* item[=].item[=].item[=].item[=].text = "Name prefix"
* item[=].item[=].item[=].item[=].type = #string
* item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%patient.name.where(use='usual').select(given[0])"
* item[=].item[=].item[=].item[=].linkId = "patient-name-preferred"
* item[=].item[=].item[=].item[=].text = "Preferred name"
* item[=].item[=].item[=].item[=].type = #string
* item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%patient.gender"
* item[=].item[=].item[=].linkId = "patient-gender"
* item[=].item[=].item[=].text = "Administrative gender"
* item[=].item[=].item[=].type = #choice
* item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].answerValueSet = "http://hl7.org/fhir/ValueSet/administrative-gender"
* item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%patient.birthDate"
* item[=].item[=].item[=].linkId = "patient-dob"
* item[=].item[=].item[=].text = "Date of birth"
* item[=].item[=].item[=].type = #date
* item[=].item[=].item[=].repeats = false
* item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%patient.deceased.ofType(Boolean)"
* item[=].item[=].item[=].linkId = "patient-deceased"
* item[=].item[=].item[=].text = "Deceased indicator"
* item[=].item[=].item[=].type = #boolean
* item[=].item[=].item[=].repeats = false
* item[=].item[=].item[+].linkId = "patient-facility"
* item[=].item[=].item[=].text = "Facility managing patient record"
* item[=].item[=].item[=].type = #group
* item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%patient.managingOrganization.display"
* item[=].item[=].item[=].item[=].linkId = "patient-facility-name"
* item[=].item[=].item[=].item[=].text = "Managing organisation name"
* item[=].item[=].item[=].item[=].type = #string
* item[=].item[=].item[=].item[=].repeats = false
// what identifier type is this? is there an AU base profile?
* item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%patient.managingOrganization.identifier.value"
* item[=].item[=].item[=].item[=].linkId = "patient-facility-identifier"
* item[=].item[=].item[=].item[=].text = "Managing organization facility identifier assigned by Services Australia"
* item[=].item[=].item[=].item[=].type = #string
* item[=].item[=].item[=].item[=].repeats = false


//Practitioner
* item[=].item[+].linkId = "practitioner"
* item[=].item[=].text = "Practitioner"
* item[=].item[=].type = #group
* item[=].item[=].repeats = false
* item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%user.identifier.where(type.coding.exists(system='http://terminology.hl7.org/CodeSystem/v2-0203' and code='EI')).value"
* item[=].item[=].item[=].linkId = "practitioner-employee-number"
* item[=].item[=].item[=].text = "Employee number"
* item[=].item[=].item[=].type = #string
* item[=].item[=].item[=].repeats = false
* item[=].item[=].item[+].linkId = "practitioner-name"
* item[=].item[=].item[=].text = "Legal name"
* item[=].item[=].item[=].type = #group
* item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%user.name.where(use='official').select(family)"
* item[=].item[=].item[=].item[=].linkId = "practitioner-name-family"
* item[=].item[=].item[=].item[=].text = "Family name"
* item[=].item[=].item[=].item[=].type = #string
* item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%user.name.where(use='official').select(given[0])"
* item[=].item[=].item[=].item[=].linkId = "practitioner-name-given"
* item[=].item[=].item[=].item[=].text = "First given name"
* item[=].item[=].item[=].item[=].type = #string
* item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%user.name.where(use='official').select(given.skip(1)).join(' ')"
* item[=].item[=].item[=].item[=].linkId = "practitioner-name-additional-given"
* item[=].item[=].item[=].item[=].text = "Additional given names"
* item[=].item[=].item[=].item[=].type = #string
* item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%user.name.where(use='official').select(prefix).join(' ')"
* item[=].item[=].item[=].item[=].linkId = "practitioner-name-prefix"
* item[=].item[=].item[=].item[=].text = "Name prefix"
* item[=].item[=].item[=].item[=].type = #string
* item[=].item[=].item[=].item[=].repeats = false



//Encounter
* item[=].item[+].linkId = "encounter"
* item[=].item[=].text = "Encounter"
* item[=].item[=].type = #group
* item[=].item[=].repeats = false
* item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%encounter.extension.where(url='http://hl7.org.au/fhir/StructureDefinition/encounter-description').value"
* item[=].item[=].item[=].linkId = "encounter-description"
* item[=].item[=].item[=].text = "Text description of encounter"
* item[=].item[=].item[=].type = #text
* item[=].item[=].item[=].repeats = false
* item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%encounter.class"
* item[=].item[=].item[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item[=].item[=].item[=].extension[=].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#drop-down
* item[=].item[=].item[=].linkId = "encounter-class"
* item[=].item[=].item[=].text = "Class"
* item[=].item[=].item[=].type = #choice
* item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].answerOption[+].valueCoding = http://terminology.hl7.org.au/CodeSystem/v3-ActCode#RACF
* item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%encounter.status"
* item[=].item[=].item[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item[=].item[=].item[=].extension[=].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#drop-down
* item[=].item[=].item[=].linkId = "encounter-status"
* item[=].item[=].item[=].text = "Status"
* item[=].item[=].item[=].type = #choice
* item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].answerOption[+].valueCoding = http://hl7.org/fhir/encounter-status#in-progress "In Progress"
* item[=].item[=].item[=].answerOption[+].valueCoding = http://hl7.org/fhir/encounter-status#onleave "On Leave"
* item[=].item[=].item[=].answerOption[+].valueCoding = http://hl7.org/fhir/encounter-status#finished "Finished"
* item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%encounter.period.start"
* item[=].item[=].item[=].linkId = "encounter-periodstart"
* item[=].item[=].item[=].text = "Period start"
* item[=].item[=].item[=].type = #date
* item[=].item[=].item[=].repeats = false
* item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%encounter.period.end"
* item[=].item[=].item[=].linkId = "encounter-periodend"
* item[=].item[=].item[=].text = "Period end"
* item[=].item[=].item[=].type = #date
* item[=].item[=].item[=].repeats = false
* item[=].item[=].item[+].linkId = "encounter-statushistory"
* item[=].item[=].item[=].text = "Status history"
* item[=].item[=].item[=].type = #group
* item[=].item[=].item[=].repeats = true
* item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%encounter.statusHistory.status"
* item[=].item[=].item[=].item[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item[=].item[=].item[=].item[=].extension[=].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#drop-down
* item[=].item[=].item[=].item[=].linkId = "encounter-statushistory-status"
* item[=].item[=].item[=].item[=].text = "Status"
* item[=].item[=].item[=].item[=].type = #choice
* item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[=].answerOption[+].valueCoding = http://hl7.org/fhir/encounter-status#in-progress "In Progress"
* item[=].item[=].item[=].item[=].answerOption[+].valueCoding = http://hl7.org/fhir/encounter-status#onleave "On Leave"
* item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%encounter.statusHistory.period.start"
* item[=].item[=].item[=].item[=].linkId = "encounter-statushistory-periodstart"
* item[=].item[=].item[=].item[=].text = "Period start"
* item[=].item[=].item[=].item[=].type = #date
* item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%encounter.statusHistory.period.end"
* item[=].item[=].item[=].item[=].linkId = "encounter-statushistory-periodend"
* item[=].item[=].item[=].item[=].text = "Period end"
* item[=].item[=].item[=].item[=].type = #date
* item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%encounter.reasonCode.coding"
* item[=].item[=].item[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item[=].item[=].item[=].extension[=].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#drop-down
* item[=].item[=].item[=].linkId = "encounter-reason"
* item[=].item[=].item[=].text = "Reason"
* item[=].item[=].item[=].type = #choice
* item[=].item[=].item[=].repeats = true
* item[=].item[=].item[=].answerOption[+].valueCoding = $SCT#410201001 "Weight maintenance regimen management"
* item[=].item[=].item[=].answerOption[+].valueCoding = $SCT#103735009 "Palliative care"
* item[=].item[=].item[=].answerOption[+].valueCoding = $SCT#423216003 "End-of-life surveillance" 
* item[=].item[=].item[+].linkId = "encounter-serviceprovider"
* item[=].item[=].item[=].text = "Facility managing encounter"
* item[=].item[=].item[=].type = #group
* item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%encounter.serviceProvider.display"
* item[=].item[=].item[=].item[=].linkId = "encounter-serviceprovider-name"
* item[=].item[=].item[=].item[=].text = "Organisation name"
* item[=].item[=].item[=].item[=].type = #string
* item[=].item[=].item[=].item[=].repeats = false
// what identifier type is this? is there an AU base profile?
* item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%encounter.serviceProvider.identifier.value"
* item[=].item[=].item[=].item[=].linkId = "encounter-serviceprovider-identifier"
* item[=].item[=].item[=].item[=].text = "Organization facility identifier assigned by Services Australia"
* item[=].item[=].item[=].item[=].type = #string
* item[=].item[=].item[=].item[=].repeats = false

//Hospitalisation
* item[=].item[+].linkId = "hospitalisation"
* item[=].item[=].text = "Hospitalisation"
* item[=].item[=].type = #group
* item[=].item[=].repeats = false
* item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-itemPopulationContext"
* item[=].item[=].item[=].extension[=].valueExpression[+].name = "HospitalisationRepeat"
* item[=].item[=].item[=].extension[=].valueExpression[=].language = #text/fhirpath
* item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%EncounterAll.entry.resource.where(class='IMP' or class='EMER' or class='SS')"
* item[=].item[=].item[=].linkId = "hospitalisation-encounter"
* item[=].item[=].item[=].text = "Hospitalisation encounter"
* item[=].item[=].item[=].type = #group
* item[=].item[=].item[=].repeats = true
* item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%EncounterAll.extension.where(url='http://hl7.org.au/fhir/StructureDefinition/encounter-description').value"
* item[=].item[=].item[=].item[=].linkId = "hospitalisation-encounter-description"
* item[=].item[=].item[=].item[=].text = "Text description of encounter"
* item[=].item[=].item[=].item[=].type = #string
* item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%EncounterAll.class"
* item[=].item[=].item[=].item[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item[=].item[=].item[=].item[=].extension[=].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#drop-down
* item[=].item[=].item[=].item[=].linkId = "hospitalisation-encounter-class"
* item[=].item[=].item[=].item[=].text = "Class"
* item[=].item[=].item[=].item[=].type = #choice
* item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[=].answerOption[+].valueCoding = http://terminology.hl7.org.au/CodeSystem/v3-ActCode#IMP
* item[=].item[=].item[=].item[=].answerOption[+].valueCoding = http://terminology.hl7.org.au/CodeSystem/v3-ActCode#EMER
* item[=].item[=].item[=].item[=].answerOption[+].valueCoding = http://terminology.hl7.org.au/CodeSystem/v3-ActCode#SS
* item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%EncounterAll.status"
* item[=].item[=].item[=].item[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item[=].item[=].item[=].item[=].extension[=].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#drop-down
* item[=].item[=].item[=].item[=].linkId = "hospitalisation-encounter-status"
* item[=].item[=].item[=].item[=].text = "Status"
* item[=].item[=].item[=].item[=].type = #choice
* item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[=].answerOption[+].valueCoding = http://hl7.org/fhir/encounter-status#in-progress "In Progress"
* item[=].item[=].item[=].item[=].answerOption[+].valueCoding = http://hl7.org/fhir/encounter-status#onleave "On Leave"
* item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%EncounterAll.period.start"
* item[=].item[=].item[=].item[=].linkId = "hospitalisation-encounter-periodstart"
* item[=].item[=].item[=].item[=].text = "Period start"
* item[=].item[=].item[=].item[=].type = #date
* item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%EncounterAll.period.end"
* item[=].item[=].item[=].item[=].linkId = "hospitalisation-encounter-periodend"
* item[=].item[=].item[=].item[=].text = "Period end"
* item[=].item[=].item[=].item[=].type = #date
* item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%EncounterAll.where(class='IMP').length.value"
* item[=].item[=].item[=].item[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-unit"
* item[=].item[=].item[=].item[=].extension[=].valueCoding = $UCUM#d
* item[=].item[=].item[=].item[=].linkId = "hospitalisation-encounter-duration"
* item[=].item[=].item[=].item[=].text = "Duration"
* item[=].item[=].item[=].item[=].type = #decimal
* item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item[=].item[=].item[=].item[=].item[=].extension[=].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#unit
* item[=].item[=].item[=].item[=].item[=].linkId = "hospitalisation-encounter-duration-unit"
* item[=].item[=].item[=].item[=].item[=].text = "days"
* item[=].item[=].item[=].item[=].item[=].type = #display
* item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%EncounterAll.reasonCode.text"
* item[=].item[=].item[=].item[=].linkId = "hospitalisation-encounter-reason"
* item[=].item[=].item[=].item[=].text = "Reason"
* item[=].item[=].item[=].item[=].type = #string
* item[=].item[=].item[=].item[=].repeats = false
// is this all that's wanted?
* item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%EncounterAll.serviceProvider.reference"
* item[=].item[=].item[=].item[=].linkId = "hospitalisation-encounter-serviceprovider"
* item[=].item[=].item[=].item[=].text = "Facility managing encounter (id only)"
* item[=].item[=].item[=].item[=].type = #string
* item[=].item[=].item[=].item[=].repeats = false



//Medical history
* item[=].item[+].linkId = "medicalhistory"
* item[=].item[=].text = "Medical History"
* item[=].item[=].type = #group
* item[=].item[=].repeats = false
* item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item[=].item[=].item[=].extension[=].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#gtable
* item[=].item[=].item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-itemPopulationContext"
* item[=].item[=].item[=].extension[=].valueExpression[+].name = "ProblemListItemRepeat"
* item[=].item[=].item[=].extension[=].valueExpression[=].language = #text/fhirpath
* item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%ProblemListItem.entry.resource"
* item[=].item[=].item[=].linkId = "medicalhistory-condition"
* item[=].item[=].item[=].text = "Problem List Condition"
* item[=].item[=].item[=].type = #group
* item[=].item[=].item[=].repeats = true
* item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item[=].item[=].item[=].item[=].extension[=].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#drop-down
* item[=].item[=].item[=].item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%ProblemListItemRepeat.code.coding"
* item[=].item[=].item[=].item[=].linkId = "medicalhistory-condition-code"
* item[=].item[=].item[=].item[=].text = "Condition code"
* item[=].item[=].item[=].item[=].type = #choice
* item[=].item[=].item[=].item[=].answerValueSet = "https://healthterminologies.gov.au/fhir/ValueSet/clinical-condition-1"
* item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%ProblemListItemRepeat.code.text"
* item[=].item[=].item[=].item[=].linkId = "medicalhistory-condition-text"
* item[=].item[=].item[=].item[=].text = "Condition text"
* item[=].item[=].item[=].item[=].type = #string
* item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item[=].item[=].item[=].item[=].extension[=].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#drop-down
* item[=].item[=].item[=].item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%ProblemListItemRepeat.status"
* item[=].item[=].item[=].item[=].linkId = "medicalhistory-condition-status"
* item[=].item[=].item[=].item[=].text = "Status"
* item[=].item[=].item[=].item[=].type = #choice
* item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[=].answerValueSet = "http://hl7.org/fhir/ValueSet/condition-clinical"
* item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%ProblemListItemRepeat.onset.ofType(dateTime)"
* item[=].item[=].item[=].item[=].linkId = "medicalhistory-condition-onsetdate"
* item[=].item[=].item[=].item[=].text = "Onset date"
* item[=].item[=].item[=].item[=].type = #date
* item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%ProblemListItemRepeat.abatement.ofType(dateTime)"
* item[=].item[=].item[=].item[=].linkId = "medicalhistory-condition-abatementdate"
* item[=].item[=].item[=].item[=].text = "Abatement date"
* item[=].item[=].item[=].item[=].type = #date
* item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%ProblemListItemRepeat.recordedDate"
* item[=].item[=].item[=].item[=].linkId = "medicalhistory-condition-recordeddate"
* item[=].item[=].item[=].item[=].text = "Recorded date"
* item[=].item[=].item[=].item[=].type = #date
* item[=].item[=].item[=].item[=].repeats = false

