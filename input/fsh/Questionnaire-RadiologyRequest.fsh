Alias: $LNC = http://loinc.org
Alias: $SCT = http://snomed.info/sct
Alias: $UCUM = http://unitsofmeasure.org
Alias: $questionnaire-item-control = http://hl7.org/fhir/questionnaire-item-control
Alias: $display-category = http://hl7.org/fhir/questionnaire-display-category

Instance: RadiologyRequestForm
InstanceOf: Questionnaire
Usage: #definition
Title: "Radiology Request Form"
Description: "Radiology request form."


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

//fhir query variables
* extension[+].url = "http://hl7.org/fhir/StructureDefinition/variable"
* extension[=].valueExpression[+].name = "PractitionerRole"
* extension[=].valueExpression[=].language = #application/x-fhir-query
* extension[=].valueExpression[=].expression = "PractitionerRole?practitioner={{%user.id}}"

// Structure Map
* extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-targetStructureMap"
* extension[=].valueCanonical = "https://smartforms.csiro.au/ig/StructureMap/AURadiologyReqFormExtract"

// Metadata
* meta.profile[+] = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-render"
* meta.profile[+] = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-pop-exp"
* name = "RadiologyRequestForm"
* title = "Radiology Request Form"
* status = #draft
* experimental = true
* subjectType[+] = #Patient
* date = "2024-06-26"
* jurisdiction.coding = urn:iso:std:iso:3166#AU

    // Provider
* item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-itemPopulationContext"
* item[=].extension[=].valueExpression[+].name = "PractitionerRoleRepeat"
* item[=].extension[=].valueExpression[=].language = #text/fhirpath
* item[=].extension[=].valueExpression[=].expression = "%PractitionerRole.entry.resource"
* item[=].linkId = "radiology-order"
* item[=].text = "Order details"
* item[=].type = #group
* item[=].repeats = false
* item[=].required = true

* item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].extension[=].valueExpression[=].expression = "now().toString()"
* item[=].item[=].linkId = "radiology-order-number"
* item[=].item[=].text = "Order number"
* item[=].item[=].type = #string
* item[=].item[=].repeats = false
* item[=].item[=].required = true

* item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].extension[=].valueExpression[=].expression = "'PractitionerRole/' + %PractitionerRoleRepeat.id"
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-hidden"
* item[=].item[=].extension[=].valueBoolean = true
* item[=].item[=].linkId = "radiology-order-requesterreference"
* item[=].item[=].text = "Requester reference"
* item[=].item[=].type = #string
* item[=].item[=].repeats = false

* item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].extension[=].valueExpression[=].expression = "%PractitionerRoleRepeat.identifier.where(system='http://ns.electronichealth.net.au/id/medicare-provider-number').value"
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-hidden"
* item[=].item[=].extension[=].valueBoolean = true
* item[=].item[=].linkId = "radiology-order-requesterdisplay"
* item[=].item[=].text = "Requester display"
* item[=].item[=].type = #string
* item[=].item[=].repeats = false

    // Service details
* item[+].linkId = "radiology-service"
* item[=].text = "Service details"
* item[=].type = #group
* item[=].repeats = true
* item[=].required = true

* item[=].item[+].linkId = "radiology-service-examination"
* item[=].item[=].text = "Examination"
* item[=].item[=].type = #group
* item[=].item[=].repeats = true
* item[=].item[=].required = true

* item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item[=].item[=].item[=].extension[=].valueCodeableConcept = $questionnaire-item-control#autocomplete
* item[=].item[=].item[=].linkId = "radiology-service-examination-procedure"
* item[=].item[=].item[=].text = "Procedure"
* item[=].item[=].item[=].type = #open-choice
* item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].required = true
* item[=].item[=].item[=].answerValueSet = "https://healthterminologies.gov.au/fhir/ValueSet/imaging-procedure-1"

* item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item[=].item[=].item[=].extension[=].valueCodeableConcept = $questionnaire-item-control#autocomplete
* item[=].item[=].item[=].linkId = "radiology-service-examination-bodysite"
* item[=].item[=].item[=].text = "Body site"
* item[=].item[=].item[=].type = #open-choice
* item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].answerValueSet = "https://healthterminologies.gov.au/fhir/ValueSet/body-site-1"
* item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-displayCategory"
* item[=].item[=].item[=].item[=].extension[=].valueCodeableConcept = $display-category#instructions
* item[=].item[=].item[=].item[=].linkId = "radiology-service-examination-components-bodysite-instructions"
* item[=].item[=].item[=].item[=].text = "Include lateralised body site where appropriate"
* item[=].item[=].item[=].item[=].type = #display

* item[=].item[=].item[+].linkId = "radiology-service-examination-contrast"
* item[=].item[=].item[=].text = "Contrast"
* item[=].item[=].item[=].type = #boolean
* item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-displayCategory"
* item[=].item[=].item[=].item[=].extension[=].valueCodeableConcept = $display-category#instructions
* item[=].item[=].item[=].item[=].linkId = "radiology-service-examination-components-contrast-instructions"
* item[=].item[=].item[=].item[=].text = "Leave unanswered if no specific instruction"
* item[=].item[=].item[=].item[=].type = #display

* item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item[=].item[=].item[=].extension[=].valueCodeableConcept = $questionnaire-item-control#drop-down
* item[=].item[=].item[=].linkId = "radiology-service-examination-priority"
* item[=].item[=].item[=].text = "Urgency"
* item[=].item[=].item[=].type = #choice
* item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].answerOption[+].valueCoding = http://hl7.org/fhir/request-priority|4.0.1#stat "Emergency"
* item[=].item[=].item[=].answerOption[+].valueCoding = http://hl7.org/fhir/request-priority|4.0.1#urgent "Urgent"
* item[=].item[=].item[=].answerOption[+].valueCoding = http://hl7.org/fhir/request-priority|4.0.1#routine "Routine"

* item[=].item[=].item[+].linkId = "radiology-service-examination-timing"
* item[=].item[=].item[=].text = "Service due"
* item[=].item[=].item[=].type = #dateTime
* item[=].item[=].item[=].repeats = false

* item[=].item[+].extension[+].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item[=].item[=].extension[=].valueCodeableConcept = $questionnaire-item-control#autocomplete
* item[=].item[=].linkId = "radiology-service-clinicalindication"
* item[=].item[=].text = "Clinical indication"
* item[=].item[=].type = #open-choice
* item[=].item[=].repeats = true
* item[=].item[=].answerValueSet = "https://healthterminologies.gov.au/fhir/ValueSet/reason-for-request-1"

* item[=].item[+].linkId = "radiology-service-clinicalnotes"
* item[=].item[=].text = "Clinical context"
* item[=].item[=].type = #text
* item[=].item[=].repeats = false

* item[=].item[+].linkId = "radiology-service-comment"
* item[=].item[=].text = "Comment"
* item[=].item[=].type = #text
* item[=].item[=].repeats = false
