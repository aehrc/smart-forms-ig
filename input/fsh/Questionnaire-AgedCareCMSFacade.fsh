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
* extension[=].valueExpression[+].name = "Hospitalisation"
* extension[=].valueExpression[=].language = #application/x-fhir-query
* extension[=].valueExpression[=].expression = "Encounter?class=IMP,EMER,SS&patient={{%patient.id}}"
* extension[+].url = "http://hl7.org/fhir/StructureDefinition/variable"
* extension[=].valueExpression[+].name = "Weight"
* extension[=].valueExpression[=].language = #application/x-fhir-query
* extension[=].valueExpression[=].expression = "Observation?code=27113001&_sort=-date&patient={{%patient.id}}"
* extension[+].url = "http://hl7.org/fhir/StructureDefinition/variable"
* extension[=].valueExpression[+].name = "UrinaryContinence"
* extension[=].valueExpression[=].language = #application/x-fhir-query
* extension[=].valueExpression[=].expression = "Observation?code=129009001&_count=1&_sort=-date&patient={{%patient.id}}"
* extension[+].url = "http://hl7.org/fhir/StructureDefinition/variable"
* extension[=].valueExpression[+].name = "BowelContinence"
* extension[=].valueExpression[=].language = #application/x-fhir-query
* extension[=].valueExpression[=].expression = "Observation?code=129008009&_count=1&_sort=-date&patient={{%patient.id}}"
* extension[+].url = "http://hl7.org/fhir/StructureDefinition/variable"
* extension[=].valueExpression[+].name = "BarthelIndex"
* extension[=].valueExpression[=].language = #application/x-fhir-query
* extension[=].valueExpression[=].expression = "Observation?code=443653008&_count=1&_sort=-date&patient={{%patient.id}}"
* extension[+].url = "http://hl7.org/fhir/StructureDefinition/variable"
* extension[=].valueExpression[+].name = "ProblemListItem"
* extension[=].valueExpression[=].language = #application/x-fhir-query
* extension[=].valueExpression[=].expression = "Condition?category=problem-list-item&patient={{%patient.id}}"
* extension[+].url = "http://hl7.org/fhir/StructureDefinition/variable"
* extension[=].valueExpression[+].name = "PressureInjury"
* extension[=].valueExpression[=].language = #application/x-fhir-query
* extension[=].valueExpression[=].expression = "Condition?category=416462003&code=1163215007&patient={{%patient.id}}"
* extension[+].url = "http://hl7.org/fhir/StructureDefinition/variable"
* extension[=].valueExpression[+].name = "IAD"
* extension[=].valueExpression[=].language = #application/x-fhir-query
* extension[=].valueExpression[=].expression = "Condition?category=416462003&code=402275006&patient={{%patient.id}}"
* extension[+].url = "http://hl7.org/fhir/StructureDefinition/variable"
* extension[=].valueExpression[+].name = "RestrictivePractice"
* extension[=].valueExpression[=].language = #application/x-fhir-query
* extension[=].valueExpression[=].expression = "Procedure?code=386423001,90278001,386517008,68894007&patient={{%patient.id}}"


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
* item[=].extension[=].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control|1.0.0#tab-container
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
* item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "(%patient.name.where(use='usual').select((family | (given | prefix).join(' ')).join(', ').where($this != '') | text)).first()"
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
* item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%patient.deceased.ofType(boolean)"
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
* item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-itemPopulationContext"
* item[=].item[=].item[=].extension[=].valueExpression[+].name = "EncounterStatusHistory"
* item[=].item[=].item[=].extension[=].valueExpression[=].language = #text/fhirpath
* item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%encounter.statusHistory"
* item[=].item[=].item[=].linkId = "encounter-statushistory"
* item[=].item[=].item[=].text = "Status history"
* item[=].item[=].item[=].type = #group
* item[=].item[=].item[=].repeats = true
* item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%EncounterStatusHistory.status"
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
* item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%EncounterStatusHistory.period.start"
* item[=].item[=].item[=].item[=].linkId = "encounter-statushistory-periodstart"
* item[=].item[=].item[=].item[=].text = "Period start"
* item[=].item[=].item[=].item[=].type = #date
* item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%EncounterStatusHistory.period.end"
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
* item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%Hospitalisation.entry.resource"
* item[=].item[=].item[=].linkId = "hospitalisation-encounter"
* item[=].item[=].item[=].text = "Hospitalisation encounter"
* item[=].item[=].item[=].type = #group
* item[=].item[=].item[=].repeats = true
* item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%HospitalisationRepeat.extension.where(url='http://hl7.org.au/fhir/StructureDefinition/encounter-description').value"
* item[=].item[=].item[=].item[=].linkId = "hospitalisation-encounter-description"
* item[=].item[=].item[=].item[=].text = "Text description of encounter"
* item[=].item[=].item[=].item[=].type = #text
* item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%HospitalisationRepeat.class"
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
* item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%HospitalisationRepeat.status"
* item[=].item[=].item[=].item[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item[=].item[=].item[=].item[=].extension[=].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#drop-down
* item[=].item[=].item[=].item[=].linkId = "hospitalisation-encounter-status"
* item[=].item[=].item[=].item[=].text = "Status"
* item[=].item[=].item[=].item[=].type = #choice
* item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[=].answerOption[+].valueCoding = http://hl7.org/fhir/encounter-status#in-progress "In Progress"
* item[=].item[=].item[=].item[=].answerOption[+].valueCoding = http://hl7.org/fhir/encounter-status#finished "Finished"
* item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%HospitalisationRepeat.period.start"
* item[=].item[=].item[=].item[=].linkId = "hospitalisation-encounter-periodstart"
* item[=].item[=].item[=].item[=].text = "Period start"
* item[=].item[=].item[=].item[=].type = #date
* item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%HospitalisationRepeat.period.end"
* item[=].item[=].item[=].item[=].linkId = "hospitalisation-encounter-periodend"
* item[=].item[=].item[=].item[=].text = "Period end"
* item[=].item[=].item[=].item[=].type = #date
* item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%HospitalisationRepeat.where(class.exists(code='IMP')).length.value.round(0)"
* item[=].item[=].item[=].item[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-unit"
* item[=].item[=].item[=].item[=].extension[=].valueCoding = $UCUM#d
* item[=].item[=].item[=].item[=].linkId = "hospitalisation-encounter-duration"
* item[=].item[=].item[=].item[=].text = "Duration"
* item[=].item[=].item[=].item[=].type = #integer
* item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item[=].item[=].item[=].item[=].item[=].extension[=].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#unit
* item[=].item[=].item[=].item[=].item[=].linkId = "hospitalisation-encounter-duration-unit"
* item[=].item[=].item[=].item[=].item[=].text = "days"
* item[=].item[=].item[=].item[=].item[=].type = #display
* item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%HospitalisationRepeat.reasonCode.text"
* item[=].item[=].item[=].item[=].linkId = "hospitalisation-encounter-reason"
* item[=].item[=].item[=].item[=].text = "Reason"
* item[=].item[=].item[=].item[=].type = #string
* item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%HospitalisationRepeat.serviceProvider.display"
* item[=].item[=].item[=].item[=].linkId = "hospitalisation-encounter-serviceprovidername"
* item[=].item[=].item[=].item[=].text = "Service provider name"
* item[=].item[=].item[=].item[=].type = #string
* item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%HospitalisationRepeat.serviceProvider.identifier.value"
* item[=].item[=].item[=].item[=].linkId = "hospitalisation-encounter-serviceprovideridentifier"
* item[=].item[=].item[=].item[=].text = "Service provider identifier"
* item[=].item[=].item[=].item[=].type = #string
* item[=].item[=].item[=].item[=].repeats = false


//Medical history
* item[=].item[+].linkId = "medicalhistory"
* item[=].item[=].text = "Medical history"
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
* item[=].item[=].item[=].item[=].extension[=].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#autocomplete
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
* item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%ProblemListItemRepeat.clinicalStatus.coding"
* item[=].item[=].item[=].item[=].linkId = "medicalhistory-condition-clinicalstatus"
* item[=].item[=].item[=].item[=].text = "Clinical status"
* item[=].item[=].item[=].item[=].type = #choice
* item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[=].answerValueSet = "http://hl7.org/fhir/ValueSet/condition-clinical"
* item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%ProblemListItemRepeat.onset.ofType(dateTime)"
* item[=].item[=].item[=].item[=].linkId = "medicalhistory-condition-onsetdate"
* item[=].item[=].item[=].item[=].text = "Onset date"
* item[=].item[=].item[=].item[=].type = #dateTime
* item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%ProblemListItemRepeat.abatement.ofType(dateTime)"
* item[=].item[=].item[=].item[=].linkId = "medicalhistory-condition-abatementdate"
* item[=].item[=].item[=].item[=].text = "Abatement date"
* item[=].item[=].item[=].item[=].type = #dateTime
* item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%ProblemListItemRepeat.recordedDate"
* item[=].item[=].item[=].item[=].linkId = "medicalhistory-condition-recordeddate"
* item[=].item[=].item[=].item[=].text = "Recorded date"
* item[=].item[=].item[=].item[=].type = #dateTime
* item[=].item[=].item[=].item[=].repeats = false

//Pressure Injuries
* item[=].item[+].linkId = "pressureinjuries"
* item[=].item[=].text = "Pressure injuries"
* item[=].item[=].type = #group
* item[=].item[=].repeats = false
* item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-itemPopulationContext"
* item[=].item[=].item[=].extension[=].valueExpression[+].name = "PressureInjuryRepeat"
* item[=].item[=].item[=].extension[=].valueExpression[=].language = #text/fhirpath
* item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%PressureInjury.entry.resource"
* item[=].item[=].item[=].linkId = "pressureinjuries-wound"
* item[=].item[=].item[=].text = "Pressure injury wound"
* item[=].item[=].item[=].type = #group
* item[=].item[=].item[=].repeats = true
* item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item[=].item[=].item[=].item[=].extension[=].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#drop-down
* item[=].item[=].item[=].item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%PressureInjuryRepeat.stage.summary.coding"
* item[=].item[=].item[=].item[=].linkId = "pressureinjuries-wound-stage"
* item[=].item[=].item[=].item[=].text = "Stage"
* item[=].item[=].item[=].item[=].type = #choice
* item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[=].answerOption[+].valueCoding = $SCT#1163217004 "Pressure injury stage I"
* item[=].item[=].item[=].item[=].answerOption[+].valueCoding = $SCT#1163220007 "Pressure injury stage II"
* item[=].item[=].item[=].item[=].answerOption[+].valueCoding = $SCT#1163222004 "Pressure injury stage III"
* item[=].item[=].item[=].item[=].answerOption[+].valueCoding = $SCT#1163224003 "Pressure injury stage IV"
* item[=].item[=].item[=].item[=].answerOption[+].valueCoding = $SCT#723071003 "Deep tissue pressure injury"
* item[=].item[=].item[=].item[=].answerOption[+].valueCoding = $SCT#723073000 "Suspected deep tissue pressure injury"
* item[=].item[=].item[=].item[=].answerOption[+].valueCoding = $SCT#1163226001 "Unstageable pressure injury"
* item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%PressureInjuryRepeat.stage.summary.text"
* item[=].item[=].item[=].item[=].linkId = "pressureinjuries-wound-stage-text"
* item[=].item[=].item[=].item[=].text = "Stage text"
* item[=].item[=].item[=].item[=].type = #string
* item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item[=].item[=].item[=].item[=].extension[=].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#drop-down
* item[=].item[=].item[=].item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%PressureInjuryRepeat.clinicalStatus.coding"
* item[=].item[=].item[=].item[=].linkId = "pressureinjuries-wound-clinicalstatus"
* item[=].item[=].item[=].item[=].text = "Clinical status"
* item[=].item[=].item[=].item[=].type = #choice
* item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[=].answerValueSet = "http://hl7.org/fhir/ValueSet/condition-clinical"
* item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%PressureInjuryRepeat.onset.ofType(dateTime)"
* item[=].item[=].item[=].item[=].linkId = "pressureinjuries-wound-onsetdate"
* item[=].item[=].item[=].item[=].text = "Onset date"
* item[=].item[=].item[=].item[=].type = #dateTime
* item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%PressureInjuryRepeat.abatement.ofType(dateTime)"
* item[=].item[=].item[=].item[=].linkId = "pressureinjuries-wound-abatementdate"
* item[=].item[=].item[=].item[=].text = "Abatement date"
* item[=].item[=].item[=].item[=].type = #dateTime
* item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%PressureInjuryRepeat.recordedDate"
* item[=].item[=].item[=].item[=].linkId = "pressureinjuries-wound-recordeddate"
* item[=].item[=].item[=].item[=].text = "Recorded date"
* item[=].item[=].item[=].item[=].type = #dateTime
* item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item[=].item[=].item[=].item[=].extension[=].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#drop-down
* item[=].item[=].item[=].item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%PressureInjuryRepeat.extension.where(url='https://smartforms.csiro.au/ig/StructureDefinition/ConditionEnvironmentAcquired').value.coding"
* item[=].item[=].item[=].item[=].linkId = "pressureinjuries-wound-environmentacquired"
* item[=].item[=].item[=].item[=].text = "Environment acquired"
* item[=].item[=].item[=].item[=].type = #choice
* item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[=].answerOption[+].valueCoding = $SCT#22232009 "Hospital"
* item[=].item[=].item[=].item[=].answerOption[+].valueCoding = $SCT#285202004 "Community environment"
* item[=].item[=].item[=].item[=].answerOption[+].valueCoding = $SCT#257652008 "Aged care facility"
* item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%PressureInjuryRepeat.evidence.code.text"
* item[=].item[=].item[=].item[=].linkId = "pressureinjuries-wound-description"
* item[=].item[=].item[=].item[=].text = "Description"
* item[=].item[=].item[=].item[=].type = #text
* item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%PressureInjuryRepeat.bodySite.text"
* item[=].item[=].item[=].item[=].linkId = "pressureinjuries-wound-bodysite"
* item[=].item[=].item[=].item[=].text = "Body site"
* item[=].item[=].item[=].item[=].type = #string
* item[=].item[=].item[=].item[=].repeats = false

//Restrictive Practice
* item[=].item[+].linkId = "restrictivepractice"
* item[=].item[=].text = "Restrictive practice"
* item[=].item[=].type = #group
* item[=].item[=].repeats = false
* item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-itemPopulationContext"
* item[=].item[=].item[=].extension[=].valueExpression[+].name = "RestrictivePracticeRepeat"
* item[=].item[=].item[=].extension[=].valueExpression[=].language = #text/fhirpath
* item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%RestrictivePractice.entry.resource"
* item[=].item[=].item[=].linkId = "restrictivepractice-intervention"
* item[=].item[=].item[=].text = "Restrictive practice intervention"
* item[=].item[=].item[=].type = #group
* item[=].item[=].item[=].repeats = true
* item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item[=].item[=].item[=].item[=].extension[=].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#drop-down
* item[=].item[=].item[=].item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%RestrictivePracticeRepeat.code.coding"
* item[=].item[=].item[=].item[=].linkId = "restrictivepractice-intervention-code"
* item[=].item[=].item[=].item[=].text = "Code"
* item[=].item[=].item[=].item[=].type = #choice
* item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[=].answerOption[+].valueCoding = $SCT#386423001 "Physical restraint"
* item[=].item[=].item[=].item[=].answerOption[+].valueCoding = $SCT#90278001 "Secluding patient"
* item[=].item[=].item[=].item[=].answerOption[+].valueCoding = $SCT#386517008 "Area restriction (Environmental)"
* item[=].item[=].item[=].item[=].answerOption[+].valueCoding = $SCT#68894007 "Placing restraint (Mechanical)"
* item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item[=].item[=].item[=].item[=].extension[=].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#drop-down
* item[=].item[=].item[=].item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%RestrictivePracticeRepeat.status"
* item[=].item[=].item[=].item[=].linkId = "restrictivepractice-intervention-status"
* item[=].item[=].item[=].item[=].text = "Status"
* item[=].item[=].item[=].item[=].type = #choice
* item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[=].answerOption[+].valueCoding = http://hl7.org/fhir/event-status#in-progress "In Progress"
* item[=].item[=].item[=].item[=].answerOption[+].valueCoding = http://hl7.org/fhir/event-status#on-hold "On Hold"
* item[=].item[=].item[=].item[=].answerOption[+].valueCoding = http://hl7.org/fhir/event-status#completed "Completed"
* item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%RestrictivePracticeRepeat.select(performed.start | performed.ofType(dateTime))"
* item[=].item[=].item[=].item[=].linkId = "restrictivepractice-intervention-performedstartdate"
* item[=].item[=].item[=].item[=].text = "Performed start date"
* item[=].item[=].item[=].item[=].type = #dateTime
* item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%RestrictivePracticeRepeat.select(performed.end)"
* item[=].item[=].item[=].item[=].linkId = "restrictivepractice-intervention-performedenddate"
* item[=].item[=].item[=].item[=].text = "Performed end date"
* item[=].item[=].item[=].item[=].type = #dateTime
* item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%RestrictivePracticeRepeat.usedCode.coding.system"
* item[=].item[=].item[=].item[=].linkId = "restrictivepractice-intervention-restraintsubtypecode-system"
* item[=].item[=].item[=].item[=].text = "Restraint subtype code system"
* item[=].item[=].item[=].item[=].type = #string
* item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%RestrictivePracticeRepeat.usedCode.coding.code"
* item[=].item[=].item[=].item[=].linkId = "restrictivepractice-intervention-restraintsubtypecode-code"
* item[=].item[=].item[=].item[=].text = "Restraint subtype code code"
* item[=].item[=].item[=].item[=].type = #string
* item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%RestrictivePracticeRepeat.usedCode.coding.display"
* item[=].item[=].item[=].item[=].linkId = "restrictivepractice-intervention-restraintsubtypecode-display"
* item[=].item[=].item[=].item[=].text = "Restraint subtype code display"
* item[=].item[=].item[=].item[=].type = #string
* item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%RestrictivePracticeRepeat.usedCode.text"
* item[=].item[=].item[=].item[=].linkId = "restrictivepractice-intervention-restraintsubtypetext"
* item[=].item[=].item[=].item[=].text = "Restraint subtype text"
* item[=].item[=].item[=].item[=].type = #string
* item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-itemPopulationContext"
* item[=].item[=].item[=].item[=].extension[=].valueExpression[+].name = "RestrictivePracticeNoteRepeat"
* item[=].item[=].item[=].item[=].extension[=].valueExpression[=].language = #text/fhirpath
* item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%RestrictivePracticeRepeat.note"
* item[=].item[=].item[=].item[=].linkId = "restrictivepractice-intervention-note"
* item[=].item[=].item[=].item[=].text = "Note"
* item[=].item[=].item[=].item[=].type = #group
* item[=].item[=].item[=].item[=].repeats = true
* item[=].item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%RestrictivePracticeNoteRepeat.time"
* item[=].item[=].item[=].item[=].item[=].linkId = "restrictivepractice-intervention-note-time"
* item[=].item[=].item[=].item[=].item[=].text = "Time"
* item[=].item[=].item[=].item[=].item[=].type = #dateTime
* item[=].item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%RestrictivePracticeNoteRepeat.text"
* item[=].item[=].item[=].item[=].item[=].linkId = "restrictivepractice-intervention-note-text"
* item[=].item[=].item[=].item[=].item[=].text = "Text"
* item[=].item[=].item[=].item[=].item[=].type = #text
* item[=].item[=].item[=].item[=].item[=].repeats = false



//Body weight
* item[=].item[+].linkId = "bodyweight"
* item[=].item[=].text = "Body weight"
* item[=].item[=].type = #group
* item[=].item[=].repeats = false
* item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item[=].item[=].item[=].extension[=].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#gtable
* item[=].item[=].item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-itemPopulationContext"
* item[=].item[=].item[=].extension[=].valueExpression[+].name = "WeightRepeat"
* item[=].item[=].item[=].extension[=].valueExpression[=].language = #text/fhirpath
* item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%Weight.entry.resource"
* item[=].item[=].item[=].linkId = "bodyweight-observation"
* item[=].item[=].item[=].text = "Body weight observation"
* item[=].item[=].item[=].type = #group
* item[=].item[=].item[=].repeats = true
* item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%WeightRepeat.effective.ofType(dateTime)"
* item[=].item[=].item[=].item[=].linkId = "bodyweight-observation-effectivedate"
* item[=].item[=].item[=].item[=].text = "Effective date"
* item[=].item[=].item[=].item[=].type = #dateTime
* item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%WeightRepeat.value.ofType(Quantity).value"
* item[=].item[=].item[=].item[=].linkId = "bodyweight-observation-value"
* item[=].item[=].item[=].item[=].text = "Value"
* item[=].item[=].item[=].item[=].type = #decimal
* item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%WeightRepeat.value.ofType(Quantity).code"
* item[=].item[=].item[=].item[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item[=].item[=].item[=].item[=].extension[=].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#drop-down
* item[=].item[=].item[=].item[=].linkId = "bodyweight-observation-unitcode"
* item[=].item[=].item[=].item[=].text = "Unit code"
* item[=].item[=].item[=].item[=].type = #choice
* item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[=].answerOption[+].valueString = "kg"
* item[=].item[=].item[=].item[=].answerOption[=].initialSelected = true
* item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%WeightRepeat.issued"
* item[=].item[=].item[=].item[=].linkId = "bodyweight-observation-issued"
* item[=].item[=].item[=].item[=].text = "Issued"
* item[=].item[=].item[=].item[=].type = #dateTime
* item[=].item[=].item[=].item[=].repeats = false

//Incontinence
* item[=].item[+].linkId = "continence"
* item[=].item[=].text = "Continence"
* item[=].item[=].type = #group
* item[=].item[=].repeats = false
* item[=].item[=].item[+].linkId = "continence-urinary"
* item[=].item[=].item[=].text = "Urinary continence"
* item[=].item[=].item[=].type = #group
* item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%UrinaryContinence.entry.resource.effective.ofType(dateTime)"
* item[=].item[=].item[=].item[=].linkId = "continence-urinary-effectivedate"
* item[=].item[=].item[=].item[=].text = "Effective date"
* item[=].item[=].item[=].item[=].type = #dateTime
* item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%UrinaryContinence.entry.resource.value.coding"
* item[=].item[=].item[=].item[=].linkId = "continence-urinary-code"
* item[=].item[=].item[=].item[=].text = "Code"
* item[=].item[=].item[=].item[=].type = #choice
* item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[=].answerOption[+].valueCoding = $LNC#LA126-5 "CONTINENT-Complete control [includes use of indwelling urinary catheter or ostomy device that does not leak urine or stool]"
* item[=].item[=].item[=].item[=].answerOption[+].valueCoding = $LNC#LA127-3 "USUALLY CONTINENT-BLADDER, incontinent episodes once a week or less; BOWEL, less than weekly"
* item[=].item[=].item[=].item[=].answerOption[+].valueCoding = $LNC#LA128-1 "OCCASIONALLY INCONTINENT-BLADDER, 2 or more times a week but not daily; BOWEL, once a week"
* item[=].item[=].item[=].item[=].answerOption[+].valueCoding = $LNC#LA129-9 "FREQUENTLY INCONTINENT-BLADDER, tended to be incontinent daily, but some control present (e.g., on day shift); BOWEL, 2-3 times a week"
* item[=].item[=].item[=].item[=].answerOption[+].valueCoding = $LNC#LA130-7 "INCONTINENT-Had inadequate control BLADDER, multiple daily episodes; BOWEL, all (or almost all) of the time"
* item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%UrinaryContinence.entry.resource.value.text"
* item[=].item[=].item[=].item[=].linkId = "continence-urinary-text"
* item[=].item[=].item[=].item[=].text = "Text"
* item[=].item[=].item[=].item[=].type = #text
* item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%UrinaryContinence.entry.resource.issued"
* item[=].item[=].item[=].item[=].linkId = "continence-urinary-issued"
* item[=].item[=].item[=].item[=].text = "Issued"
* item[=].item[=].item[=].item[=].type = #dateTime
* item[=].item[=].item[=].item[=].repeats = false

* item[=].item[=].item[+].linkId = "continence-bowel"
* item[=].item[=].item[=].text = "Bowel continence"
* item[=].item[=].item[=].type = #group
* item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%BowelContinence.entry.resource.effective.ofType(dateTime)"
* item[=].item[=].item[=].item[=].linkId = "continence-bowel-effectivedate"
* item[=].item[=].item[=].item[=].text = "Effective date"
* item[=].item[=].item[=].item[=].type = #dateTime
* item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%BowelContinence.entry.resource.value.coding"
* item[=].item[=].item[=].item[=].linkId = "continence-bowel-code"
* item[=].item[=].item[=].item[=].text = "Code"
* item[=].item[=].item[=].item[=].type = #choice
* item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[=].answerOption[+].valueCoding = $LNC#LA126-5 "CONTINENT-Complete control [includes use of indwelling urinary catheter or ostomy device that does not leak urine or stool]"
* item[=].item[=].item[=].item[=].answerOption[+].valueCoding = $LNC#LA127-3 "USUALLY CONTINENT-BLADDER, incontinent episodes once a week or less; BOWEL, less than weekly"
* item[=].item[=].item[=].item[=].answerOption[+].valueCoding = $LNC#LA128-1 "OCCASIONALLY INCONTINENT-BLADDER, 2 or more times a week but not daily; BOWEL, once a week"
* item[=].item[=].item[=].item[=].answerOption[+].valueCoding = $LNC#LA129-9 "FREQUENTLY INCONTINENT-BLADDER, tended to be incontinent daily, but some control present (e.g., on day shift); BOWEL, 2-3 times a week"
* item[=].item[=].item[=].item[=].answerOption[+].valueCoding = $LNC#LA130-7 "INCONTINENT-Had inadequate control BLADDER, multiple daily episodes; BOWEL, all (or almost all) of the time"
* item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%BowelContinence.entry.resource.value.text"
* item[=].item[=].item[=].item[=].linkId = "continence-bowel-text"
* item[=].item[=].item[=].item[=].text = "Text"
* item[=].item[=].item[=].item[=].type = #text
* item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%BowelContinence.entry.resource.issued"
* item[=].item[=].item[=].item[=].linkId = "continence-bowel-issued"
* item[=].item[=].item[=].item[=].text = "Issued"
* item[=].item[=].item[=].item[=].type = #dateTime
* item[=].item[=].item[=].item[=].repeats = false

//IAD
* item[=].item[+].linkId = "iad"
* item[=].item[=].text = "Incontinence associated dermatitis"
* item[=].item[=].type = #group
* item[=].item[=].repeats = false
* item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-itemPopulationContext"
* item[=].item[=].item[=].extension[=].valueExpression[+].name = "IADRepeat"
* item[=].item[=].item[=].extension[=].valueExpression[=].language = #text/fhirpath
* item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%IAD.entry.resource"
* item[=].item[=].item[=].linkId = "iad-wound"
* item[=].item[=].item[=].text = "Incontinence associated dermatitis wound"
* item[=].item[=].item[=].type = #group
* item[=].item[=].item[=].repeats = true
* item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item[=].item[=].item[=].item[=].extension[=].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#drop-down
* item[=].item[=].item[=].item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%IADRepeat.stage.summary.coding"
* item[=].item[=].item[=].item[=].linkId = "iad-wound-stage"
* item[=].item[=].item[=].item[=].text = "Stage"
* item[=].item[=].item[=].item[=].type = #choice
* item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[=].answerOption[+].valueCoding = $SCT#264653008 "1A"
* item[=].item[=].item[=].item[=].answerOption[+].valueCoding = $SCT#264654002 "1B"
* item[=].item[=].item[=].item[=].answerOption[+].valueCoding = $SCT#264662005 "2A"
* item[=].item[=].item[=].item[=].answerOption[+].valueCoding = $SCT#264663000 "2B"
* item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%IADRepeat.stage.summary.text"
* item[=].item[=].item[=].item[=].linkId = "iad-wound-stage-text"
* item[=].item[=].item[=].item[=].text = "Stage text"
* item[=].item[=].item[=].item[=].type = #string
* item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item[=].item[=].item[=].item[=].extension[=].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#drop-down
* item[=].item[=].item[=].item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%IADRepeat.clinicalStatus.coding"
* item[=].item[=].item[=].item[=].linkId = "iad-wound-clinicalstatus"
* item[=].item[=].item[=].item[=].text = "Clinical status"
* item[=].item[=].item[=].item[=].type = #choice
* item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[=].answerValueSet = "http://hl7.org/fhir/ValueSet/condition-clinical"
* item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%IADRepeat.onset.ofType(dateTime)"
* item[=].item[=].item[=].item[=].linkId = "iad-wound-onsetdate"
* item[=].item[=].item[=].item[=].text = "Onset date"
* item[=].item[=].item[=].item[=].type = #dateTime
* item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%IADRepeat.abatement.ofType(dateTime)"
* item[=].item[=].item[=].item[=].linkId = "iad-wound-abatementdate"
* item[=].item[=].item[=].item[=].text = "Abatement date"
* item[=].item[=].item[=].item[=].type = #dateTime
* item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%IADRepeat.recordedDate"
* item[=].item[=].item[=].item[=].linkId = "iad-wound-recordeddate"
* item[=].item[=].item[=].item[=].text = "Recorded date"
* item[=].item[=].item[=].item[=].type = #dateTime
* item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%IADRepeat.evidence.code.text"
* item[=].item[=].item[=].item[=].linkId = "iad-wound-description"
* item[=].item[=].item[=].item[=].text = "Description"
* item[=].item[=].item[=].item[=].type = #text
* item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%IADRepeat.bodySite.text"
* item[=].item[=].item[=].item[=].linkId = "iad-wound-bodysite"
* item[=].item[=].item[=].item[=].text = "Body site"
* item[=].item[=].item[=].item[=].type = #string
* item[=].item[=].item[=].item[=].repeats = false

//Barthel Index
* item[=].item[+].linkId = "barthel"
* item[=].item[=].text = "Barthel index"
* item[=].item[=].type = #group
* item[=].item[=].repeats = false
* item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item[=].item[=].item[=].extension[=].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#grid
* item[=].item[=].item[=].linkId = "barthel-modified"
* item[=].item[=].item[=].text = "Modified Barthel index of activities of daily living score"
* item[=].item[=].item[=].type = #group
* item[=].item[=].item[=].item[+].linkId = "barthel-modified-score"
* item[=].item[=].item[=].item[=].text = "Modified Barthel index score"
* item[=].item[=].item[=].item[=].type = #group
* item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%BarthelIndex.entry.resource.effective.ofType(dateTime)"
* item[=].item[=].item[=].item[=].item[=].linkId = "barthel-modified-effectivedate"
* item[=].item[=].item[=].item[=].item[=].text = "Effective date"
* item[=].item[=].item[=].item[=].item[=].type = #dateTime
* item[=].item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%BarthelIndex.entry.resource.value.value"
* item[=].item[=].item[=].item[=].item[=].linkId = "barthel-modified-value"
* item[=].item[=].item[=].item[=].item[=].text = "Value"
* item[=].item[=].item[=].item[=].item[=].type = #integer
* item[=].item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%BarthelIndex.entry.resource.value.code"
* item[=].item[=].item[=].item[=].item[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item[=].item[=].item[=].item[=].item[=].extension[=].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#drop-down
* item[=].item[=].item[=].item[=].item[=].linkId = "barthel-modified-unitcode"
* item[=].item[=].item[=].item[=].item[=].text = "Unit code"
* item[=].item[=].item[=].item[=].item[=].type = #choice
* item[=].item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[=].item[=].answerOption[+].valueString = "{score}"
* item[=].item[=].item[=].item[=].item[=].answerOption[=].initialSelected = true
* item[=].item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%BarthelIndex.entry.resource.issued"
* item[=].item[=].item[=].item[=].item[=].linkId = "barthel-modified-issued"
* item[=].item[=].item[=].item[=].item[=].text = "Issued"
* item[=].item[=].item[=].item[=].item[=].type = #dateTime
* item[=].item[=].item[=].item[=].item[=].repeats = false

* item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item[=].item[=].item[=].extension[=].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#grid
* item[=].item[=].item[=].linkId = "barthel-components"
* item[=].item[=].item[=].text = "Modified Barthel index of activities of daily living component questions"
* item[=].item[=].item[=].type = #group
* item[=].item[=].item[=].item[+].linkId = "barthel-components-feeding"
* item[=].item[=].item[=].item[=].text = "Feeding"
* item[=].item[=].item[=].item[=].type = #group
* item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%BarthelIndex.entry.resource.component[0].code.coding"
* item[=].item[=].item[=].item[=].item[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item[=].item[=].item[=].item[=].item[=].extension[=].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#drop-down
* item[=].item[=].item[=].item[=].item[=].linkId = "barthel-components-feeding-code"
* item[=].item[=].item[=].item[=].item[=].text = "Code"
* item[=].item[=].item[=].item[=].item[=].type = #choice
* item[=].item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[=].item[=].answerOption[+].valueCoding = $LNC#83184-2 "Feeding or eating - functional ability"
* item[=].item[=].item[=].item[=].item[=].answerOption[=].initialSelected = true
* item[=].item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%BarthelIndex.entry.resource.component[0].value.value"
* item[=].item[=].item[=].item[=].item[=].linkId = "barthel-components-feeding-value"
* item[=].item[=].item[=].item[=].item[=].text = "Value"
* item[=].item[=].item[=].item[=].item[=].type = #integer
* item[=].item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%BarthelIndex.entry.resource.component[0].value.code"
* item[=].item[=].item[=].item[=].item[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item[=].item[=].item[=].item[=].item[=].extension[=].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#drop-down
* item[=].item[=].item[=].item[=].item[=].linkId = "barthel-components-feeding-unitcode"
* item[=].item[=].item[=].item[=].item[=].text = "Unit code"
* item[=].item[=].item[=].item[=].item[=].type = #choice
* item[=].item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[=].item[=].answerOption[+].valueString = "{score}"
* item[=].item[=].item[=].item[=].item[=].answerOption[=].initialSelected = true
* item[=].item[=].item[=].item[+].linkId = "barthel-components-transfer"
* item[=].item[=].item[=].item[=].text = "Transfer"
* item[=].item[=].item[=].item[=].type = #group
* item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%BarthelIndex.entry.resource.component[1].code.coding"
* item[=].item[=].item[=].item[=].item[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item[=].item[=].item[=].item[=].item[=].extension[=].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#drop-down
* item[=].item[=].item[=].item[=].item[=].linkId = "barthel-components-transfer-code"
* item[=].item[=].item[=].item[=].item[=].text = "Code"
* item[=].item[=].item[=].item[=].item[=].type = #choice
* item[=].item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[=].item[=].answerOption[+].valueCoding = $LNC#83185-9 "Transferring - functional ability"
* item[=].item[=].item[=].item[=].item[=].answerOption[=].initialSelected = true
* item[=].item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%BarthelIndex.entry.resource.component[1].value.value"
* item[=].item[=].item[=].item[=].item[=].linkId = "barthel-components-transfer-value"
* item[=].item[=].item[=].item[=].item[=].text = "Value"
* item[=].item[=].item[=].item[=].item[=].type = #integer
* item[=].item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%BarthelIndex.entry.resource.component[1].value.code"
* item[=].item[=].item[=].item[=].item[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item[=].item[=].item[=].item[=].item[=].extension[=].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#drop-down
* item[=].item[=].item[=].item[=].item[=].linkId = "barthel-components-transfer-unitcode"
* item[=].item[=].item[=].item[=].item[=].text = "Unit code"
* item[=].item[=].item[=].item[=].item[=].type = #choice
* item[=].item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[=].item[=].answerOption[+].valueString = "{score}"
* item[=].item[=].item[=].item[=].item[=].answerOption[=].initialSelected = true
* item[=].item[=].item[=].item[+].linkId = "barthel-components-grooming"
* item[=].item[=].item[=].item[=].text = "Grooming"
* item[=].item[=].item[=].item[=].type = #group
* item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%BarthelIndex.entry.resource.component[2].code.coding"
* item[=].item[=].item[=].item[=].item[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item[=].item[=].item[=].item[=].item[=].extension[=].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#drop-down
* item[=].item[=].item[=].item[=].item[=].linkId = "barthel-components-grooming-code"
* item[=].item[=].item[=].item[=].item[=].text = "Code"
* item[=].item[=].item[=].item[=].item[=].type = #choice
* item[=].item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[=].item[=].answerOption[+].valueCoding = $LNC#96767-9 "Grooming - functional ability"
* item[=].item[=].item[=].item[=].item[=].answerOption[=].initialSelected = true
* item[=].item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%BarthelIndex.entry.resource.component[2].value.value"
* item[=].item[=].item[=].item[=].item[=].linkId = "barthel-components-grooming-value"
* item[=].item[=].item[=].item[=].item[=].text = "Value"
* item[=].item[=].item[=].item[=].item[=].type = #integer
* item[=].item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%BarthelIndex.entry.resource.component[2].value.code"
* item[=].item[=].item[=].item[=].item[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item[=].item[=].item[=].item[=].item[=].extension[=].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#drop-down
* item[=].item[=].item[=].item[=].item[=].linkId = "barthel-components-grooming-unitcode"
* item[=].item[=].item[=].item[=].item[=].text = "Unit code"
* item[=].item[=].item[=].item[=].item[=].type = #choice
* item[=].item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[=].item[=].answerOption[+].valueString = "{score}"
* item[=].item[=].item[=].item[=].item[=].answerOption[=].initialSelected = true
* item[=].item[=].item[=].item[+].linkId = "barthel-components-toiletuse"
* item[=].item[=].item[=].item[=].text = "Toilet Use"
* item[=].item[=].item[=].item[=].type = #group
* item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%BarthelIndex.entry.resource.component[3].code.coding"
* item[=].item[=].item[=].item[=].item[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item[=].item[=].item[=].item[=].item[=].extension[=].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#drop-down
* item[=].item[=].item[=].item[=].item[=].linkId = "barthel-components-toiletuse-code"
* item[=].item[=].item[=].item[=].item[=].text = "Code"
* item[=].item[=].item[=].item[=].item[=].type = #choice
* item[=].item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[=].item[=].answerOption[+].valueCoding = $LNC#83183-4 "Toileting - functional ability"
* item[=].item[=].item[=].item[=].item[=].answerOption[=].initialSelected = true
* item[=].item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%BarthelIndex.entry.resource.component[3].value.value"
* item[=].item[=].item[=].item[=].item[=].linkId = "barthel-components-toiletuse-value"
* item[=].item[=].item[=].item[=].item[=].text = "Value"
* item[=].item[=].item[=].item[=].item[=].type = #integer
* item[=].item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%BarthelIndex.entry.resource.component[3].value.code"
* item[=].item[=].item[=].item[=].item[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item[=].item[=].item[=].item[=].item[=].extension[=].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#drop-down
* item[=].item[=].item[=].item[=].item[=].linkId = "barthel-components-toiletuse-unitcode"
* item[=].item[=].item[=].item[=].item[=].text = "Unit code"
* item[=].item[=].item[=].item[=].item[=].type = #choice
* item[=].item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[=].item[=].answerOption[+].valueString = "{score}"
* item[=].item[=].item[=].item[=].item[=].answerOption[=].initialSelected = true
* item[=].item[=].item[=].item[+].linkId = "barthel-components-bathing"
* item[=].item[=].item[=].item[=].text = "Bathing"
* item[=].item[=].item[=].item[=].type = #group
* item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%BarthelIndex.entry.resource.component[4].code.coding"
* item[=].item[=].item[=].item[=].item[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item[=].item[=].item[=].item[=].item[=].extension[=].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#drop-down
* item[=].item[=].item[=].item[=].item[=].linkId = "barthel-components-bathing-code"
* item[=].item[=].item[=].item[=].item[=].text = "Code"
* item[=].item[=].item[=].item[=].item[=].type = #choice
* item[=].item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[=].item[=].answerOption[+].valueCoding = $LNC#83181-8 "Bathing - functional ability"
* item[=].item[=].item[=].item[=].item[=].answerOption[=].initialSelected = true
* item[=].item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%BarthelIndex.entry.resource.component[4].value.value"
* item[=].item[=].item[=].item[=].item[=].linkId = "barthel-components-bathing-value"
* item[=].item[=].item[=].item[=].item[=].text = "Value"
* item[=].item[=].item[=].item[=].item[=].type = #integer
* item[=].item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%BarthelIndex.entry.resource.component[4].value.code"
* item[=].item[=].item[=].item[=].item[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item[=].item[=].item[=].item[=].item[=].extension[=].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#drop-down
* item[=].item[=].item[=].item[=].item[=].linkId = "barthel-components-bathing-unitcode"
* item[=].item[=].item[=].item[=].item[=].text = "Unit code"
* item[=].item[=].item[=].item[=].item[=].type = #choice
* item[=].item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[=].item[=].answerOption[+].valueString = "{score}"
* item[=].item[=].item[=].item[=].item[=].answerOption[=].initialSelected = true
* item[=].item[=].item[=].item[+].linkId = "barthel-components-mobility"
* item[=].item[=].item[=].item[=].text = "Mobility"
* item[=].item[=].item[=].item[=].type = #group
* item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%BarthelIndex.entry.resource.component[5].code.coding"
* item[=].item[=].item[=].item[=].item[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item[=].item[=].item[=].item[=].item[=].extension[=].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#drop-down
* item[=].item[=].item[=].item[=].item[=].linkId = "barthel-components-mobility-code"
* item[=].item[=].item[=].item[=].item[=].text = "Code"
* item[=].item[=].item[=].item[=].item[=].type = #choice
* item[=].item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[=].item[=].answerOption[+].valueCoding = $LNC#83186-7 "Ambulation - functional ability"
* item[=].item[=].item[=].item[=].item[=].answerOption[=].initialSelected = true
* item[=].item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%BarthelIndex.entry.resource.component[5].value.value"
* item[=].item[=].item[=].item[=].item[=].linkId = "barthel-components-mobility-value"
* item[=].item[=].item[=].item[=].item[=].text = "Value"
* item[=].item[=].item[=].item[=].item[=].type = #integer
* item[=].item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%BarthelIndex.entry.resource.component[5].value.code"
* item[=].item[=].item[=].item[=].item[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item[=].item[=].item[=].item[=].item[=].extension[=].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#drop-down
* item[=].item[=].item[=].item[=].item[=].linkId = "barthel-components-mobility-unitcode"
* item[=].item[=].item[=].item[=].item[=].text = "Unit code"
* item[=].item[=].item[=].item[=].item[=].type = #choice
* item[=].item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[=].item[=].answerOption[+].valueString = "{score}"
* item[=].item[=].item[=].item[=].item[=].answerOption[=].initialSelected = true
* item[=].item[=].item[=].item[+].linkId = "barthel-components-stairs"
* item[=].item[=].item[=].item[=].text = "Stairs"
* item[=].item[=].item[=].item[=].type = #group
* item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%BarthelIndex.entry.resource.component[6].code.coding"
* item[=].item[=].item[=].item[=].item[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item[=].item[=].item[=].item[=].item[=].extension[=].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#drop-down
* item[=].item[=].item[=].item[=].item[=].linkId = "barthel-components-stairs-code"
* item[=].item[=].item[=].item[=].item[=].text = "Code"
* item[=].item[=].item[=].item[=].item[=].type = #choice
* item[=].item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[=].item[=].answerOption[+].valueCoding = $LNC#96758-8 "Stairs - functional ability"
* item[=].item[=].item[=].item[=].item[=].answerOption[=].initialSelected = true
* item[=].item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%BarthelIndex.entry.resource.component[6].value.value"
* item[=].item[=].item[=].item[=].item[=].linkId = "barthel-components-stairs-value"
* item[=].item[=].item[=].item[=].item[=].text = "Value"
* item[=].item[=].item[=].item[=].item[=].type = #integer
* item[=].item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%BarthelIndex.entry.resource.component[6].value.code"
* item[=].item[=].item[=].item[=].item[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item[=].item[=].item[=].item[=].item[=].extension[=].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#drop-down
* item[=].item[=].item[=].item[=].item[=].linkId = "barthel-components-stairs-unitcode"
* item[=].item[=].item[=].item[=].item[=].text = "Unit code"
* item[=].item[=].item[=].item[=].item[=].type = #choice
* item[=].item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[=].item[=].answerOption[+].valueString = "{score}"
* item[=].item[=].item[=].item[=].item[=].answerOption[=].initialSelected = true
* item[=].item[=].item[=].item[+].linkId = "barthel-components-dressing"
* item[=].item[=].item[=].item[=].text = "Dressing"
* item[=].item[=].item[=].item[=].type = #group
* item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%BarthelIndex.entry.resource.component[7].code.coding"
* item[=].item[=].item[=].item[=].item[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item[=].item[=].item[=].item[=].item[=].extension[=].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#drop-down
* item[=].item[=].item[=].item[=].item[=].linkId = "barthel-components-dressing-code"
* item[=].item[=].item[=].item[=].item[=].text = "Code"
* item[=].item[=].item[=].item[=].item[=].type = #choice
* item[=].item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[=].item[=].answerOption[+].valueCoding = $LNC#83182-6 "Dressing - functional ability"
* item[=].item[=].item[=].item[=].item[=].answerOption[=].initialSelected = true
* item[=].item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%BarthelIndex.entry.resource.component[7].value.value"
* item[=].item[=].item[=].item[=].item[=].linkId = "barthel-components-dressing-value"
* item[=].item[=].item[=].item[=].item[=].text = "Value"
* item[=].item[=].item[=].item[=].item[=].type = #integer
* item[=].item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%BarthelIndex.entry.resource.component[7].value.code"
* item[=].item[=].item[=].item[=].item[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item[=].item[=].item[=].item[=].item[=].extension[=].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#drop-down
* item[=].item[=].item[=].item[=].item[=].linkId = "barthel-components-dressing-unitcode"
* item[=].item[=].item[=].item[=].item[=].text = "Unit code"
* item[=].item[=].item[=].item[=].item[=].type = #choice
* item[=].item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[=].item[=].answerOption[+].valueString = "{score}"
* item[=].item[=].item[=].item[=].item[=].answerOption[=].initialSelected = true
* item[=].item[=].item[=].item[+].linkId = "barthel-components-bowels"
* item[=].item[=].item[=].item[=].text = "Bowels"
* item[=].item[=].item[=].item[=].type = #group
* item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%BarthelIndex.entry.resource.component[8].code.coding"
* item[=].item[=].item[=].item[=].item[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item[=].item[=].item[=].item[=].item[=].extension[=].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#drop-down
* item[=].item[=].item[=].item[=].item[=].linkId = "barthel-components-bowels-code"
* item[=].item[=].item[=].item[=].item[=].text = "Code"
* item[=].item[=].item[=].item[=].item[=].type = #choice
* item[=].item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[=].item[=].answerOption[+].valueCoding = $LNC#96759-6 "Bowel control - functional ability"
* item[=].item[=].item[=].item[=].item[=].answerOption[=].initialSelected = true
* item[=].item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%BarthelIndex.entry.resource.component[8].value.value"
* item[=].item[=].item[=].item[=].item[=].linkId = "barthel-components-bowels-value"
* item[=].item[=].item[=].item[=].item[=].text = "Value"
* item[=].item[=].item[=].item[=].item[=].type = #integer
* item[=].item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%BarthelIndex.entry.resource.component[8].value.code"
* item[=].item[=].item[=].item[=].item[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item[=].item[=].item[=].item[=].item[=].extension[=].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#drop-down
* item[=].item[=].item[=].item[=].item[=].linkId = "barthel-components-bowels-unitcode"
* item[=].item[=].item[=].item[=].item[=].text = "Unit code"
* item[=].item[=].item[=].item[=].item[=].type = #choice
* item[=].item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[=].item[=].answerOption[+].valueString = "{score}"
* item[=].item[=].item[=].item[=].item[=].answerOption[=].initialSelected = true
* item[=].item[=].item[=].item[+].linkId = "barthel-components-bladder"
* item[=].item[=].item[=].item[=].text = "Bladder"
* item[=].item[=].item[=].item[=].type = #group
* item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%BarthelIndex.entry.resource.component[9].code.coding"
* item[=].item[=].item[=].item[=].item[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item[=].item[=].item[=].item[=].item[=].extension[=].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#drop-down
* item[=].item[=].item[=].item[=].item[=].linkId = "barthel-components-bladder-code"
* item[=].item[=].item[=].item[=].item[=].text = "Code"
* item[=].item[=].item[=].item[=].item[=].type = #choice
* item[=].item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[=].item[=].answerOption[+].valueCoding = $LNC#96760-4 "Bladder control - functional ability"
* item[=].item[=].item[=].item[=].item[=].answerOption[=].initialSelected = true
* item[=].item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%BarthelIndex.entry.resource.component[9].value.value"
* item[=].item[=].item[=].item[=].item[=].linkId = "barthel-components-bladder-value"
* item[=].item[=].item[=].item[=].item[=].text = "Value"
* item[=].item[=].item[=].item[=].item[=].type = #integer
* item[=].item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%BarthelIndex.entry.resource.component[9].value.code"
* item[=].item[=].item[=].item[=].item[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item[=].item[=].item[=].item[=].item[=].extension[=].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#drop-down
* item[=].item[=].item[=].item[=].item[=].linkId = "barthel-components-bladder-unitcode"
* item[=].item[=].item[=].item[=].item[=].text = "Unit code"
* item[=].item[=].item[=].item[=].item[=].type = #choice
* item[=].item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[=].item[=].answerOption[+].valueString = "{score}"
* item[=].item[=].item[=].item[=].item[=].answerOption[=].initialSelected = true