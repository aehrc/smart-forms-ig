Alias: $LNC = http://loinc.org
Alias: $SCT = http://snomed.info/sct
Alias: $UCUM = http://unitsofmeasure.org
Alias: $questionnaire-item-control = http://hl7.org/fhir/questionnaire-item-control
Alias: $display-category = http://hl7.org/fhir/questionnaire-display-category

Instance: PathologyRequestForm
InstanceOf: Questionnaire
Usage: #definition
Title: "Pathology Request Form"
Description: "Pathology request form."


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

// Metadata
* meta.profile[+] = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-render"
* meta.profile[+] = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-pop-exp"
* name = "PathologyRequestForm"
* title = "Pathology Request Form"
* status = #draft
* experimental = true
* subjectType[+] = #Patient
* date = "2024-07-16"
* jurisdiction.coding = urn:iso:std:iso:3166#AU

//fhir query variables
* extension[+].url = "http://hl7.org/fhir/StructureDefinition/variable"
* extension[=].valueExpression[+].name = "PractitionerRole"
* extension[=].valueExpression[=].language = #application/x-fhir-query
* extension[=].valueExpression[=].expression = "PractitionerRole?practitioner={{%user.id}}"

    // Provider
* item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-itemPopulationContext"
* item[=].extension[=].valueExpression[+].name = "PractitionerRoleRepeat"
* item[=].extension[=].valueExpression[=].language = #text/fhirpath
* item[=].extension[=].valueExpression[=].expression = "%PractitionerRole.entry.resource"
* item[=].linkId = "pathology-order"
* item[=].text = "Order details"
* item[=].type = #group
* item[=].repeats = false

* item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].extension[=].valueExpression[=].expression = "now().toString()"
* item[=].item[=].linkId = "pathology-order-number"
* item[=].item[=].text = "Order number"
* item[=].item[=].type = #string
* item[=].item[=].repeats = false

* item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].extension[=].valueExpression[=].expression = "'PractitionerRole/' + %PractitionerRoleRepeat.id"
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-hidden"
* item[=].item[=].extension[=].valueBoolean = true
* item[=].item[=].linkId = "pathology-order-requesterreference"
* item[=].item[=].text = "Requester reference"
* item[=].item[=].type = #string
* item[=].item[=].repeats = false

* item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].extension[=].valueExpression[=].expression = "%PractitionerRoleRepeat.identifier.where(system='http://ns.electronichealth.net.au/id/medicare-provider-number').value"
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-hidden"
* item[=].item[=].extension[=].valueBoolean = true
* item[=].item[=].linkId = "pathology-order-requesterdisplay"
* item[=].item[=].text = "Requester display"
* item[=].item[=].type = #string
* item[=].item[=].repeats = false

    // Service details
* item[+].linkId = "pathology-service"
* item[=].text = "Service details"
* item[=].type = #group
* item[=].repeats = true
* item[=].required = true

* item[=].item[+].linkId = "pathology-service-test"
* item[=].item[=].text = "Test"
* item[=].item[=].type = #group
* item[=].item[=].repeats = true
* item[=].item[=].required = true

* item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item[=].item[=].item[=].extension[=].valueCodeableConcept = $questionnaire-item-control#autocomplete
* item[=].item[=].item[=].linkId = "pathology-service-test-testname"
* item[=].item[=].item[=].text = "Test name"
* item[=].item[=].item[=].type = #open-choice
* item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].required = true
* item[=].item[=].item[=].answerValueSet = "https://www.rcpa.edu.au/fhir/ValueSet/spia-requesting-refset-3"

* item[=].item[=].item[+].linkId = "pathology-service-test-fasting"
* item[=].item[=].item[=].text = "Fasting"
* item[=].item[=].item[=].type = #boolean
* item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-displayCategory"
* item[=].item[=].item[=].item[=].extension[=].valueCodeableConcept = $display-category#instructions
* item[=].item[=].item[=].item[=].linkId = "pathology-service-test-fasting-instructions"
* item[=].item[=].item[=].item[=].text = "Leave unanswered if no specific instruction"
* item[=].item[=].item[=].item[=].type = #display

* item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item[=].item[=].item[=].extension[=].valueCodeableConcept = $questionnaire-item-control#drop-down
* item[=].item[=].item[=].linkId = "pathology-service-examination-priority"
* item[=].item[=].item[=].text = "Urgency"
* item[=].item[=].item[=].type = #choice
* item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].answerOption[+].valueCoding = http://hl7.org/fhir/request-priority|4.0.1#stat "Emergency"
* item[=].item[=].item[=].answerOption[+].valueCoding = http://hl7.org/fhir/request-priority|4.0.1#urgent "Urgent"
* item[=].item[=].item[=].answerOption[+].valueCoding = http://hl7.org/fhir/request-priority|4.0.1#routine "Routine"

* item[=].item[=].item[+].linkId = "pathology-service-examination-timing"
* item[=].item[=].item[=].text = "Service due"
* item[=].item[=].item[=].type = #dateTime
* item[=].item[=].item[=].repeats = false

* item[=].item[+].extension[+].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item[=].item[=].extension[=].valueCodeableConcept = $questionnaire-item-control#autocomplete
* item[=].item[=].linkId = "pathology-service-clinicalindication"
* item[=].item[=].text = "Clinical indication"
* item[=].item[=].type = #open-choice
* item[=].item[=].repeats = true
* item[=].item[=].answerValueSet = "https://healthterminologies.gov.au/fhir/ValueSet/reason-for-request-1"

* item[=].item[+].linkId = "pathology-service-clinicalnotes"
* item[=].item[=].text = "Clinical context"
* item[=].item[=].type = #text
* item[=].item[=].repeats = false

* item[=].item[+].linkId = "pathology-service-comment"
* item[=].item[=].text = "Comment"
* item[=].item[=].type = #text
* item[=].item[=].repeats = false
