Alias: $LNC = http://loinc.org
Alias: $SCT = http://snomed.info/sct
Alias: $UCUM = http://unitsofmeasure.org
Alias: $questionnaire-item-control = http://hl7.org/fhir/questionnaire-item-control
Alias: $display-category = http://hl7.org/fhir/questionnaire-display-category

Instance: ProcedureForRequest
InstanceOf: ValueSet
Usage: #inline
* extension[+].url = "http://hl7.org/fhir/StructureDefinition/valueset-supplement"
* extension[=].valueCanonical = "http://sparked.csiro.au/CodeSystem/ranzcr-rrs-snomedct-supplement"
* status = #draft
* compose.include.system = "http://snomed.info/sct"
* compose.include.version = "http://snomed.info/sct/32506021000036107/version/20240630"
* compose.include.filter[+].property = #RANZCR-Procedure
* compose.include.filter[=].op = #=
* compose.include.filter[=].value = "{{%procedureFocus}}"
* compose.include.filter[+].property = #RANZCR-BodySite
* compose.include.filter[=].op = #=
* compose.include.filter[=].value = "{{%bodySite}}"
* compose.include.filter[+].property = #RANZCR-BodySiteLaterality
* compose.include.filter[=].op = #=
* compose.include.filter[=].value = "{{%laterality}}"
* compose.include.filter[+].property = #RANZCR-Contrast
* compose.include.filter[=].op = #=
* compose.include.filter[=].value = "{{%contrast}}"
* compose.include.valueSet = "https://ranzcr.com/fhir/ValueSet/radiology-referral"


Instance: RadiologyTerminologyPOC
InstanceOf: Questionnaire
Usage: #definition
Title: "Radiology Terminology POC"
Description: "Radiology Terminology POC."


* contained[+] = ProcedureForRequest

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
* name = "RadiologyTerminologyPOC"
* title = "Radiology Terminology POC"
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

// Terminology POC variables
* item[=].item[+].extension[+].url = "http://hl7.org/fhir/StructureDefinition/variable"
* item[=].item[=].extension[=].valueExpression[+].name = "procedureFocus"
* item[=].item[=].extension[=].valueExpression[=].language = #text/fhirpath
* item[=].item[=].extension[=].valueExpression[=].expression = "item.repeat(item).where(linkId='radiology-service-examination-components-modality').answer.value.code"
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/variable"
* item[=].item[=].extension[=].valueExpression[+].name = "bodySite"
* item[=].item[=].extension[=].valueExpression[=].language = #text/fhirpath
* item[=].item[=].extension[=].valueExpression[=].expression = "item.repeat(item).where(linkId='radiology-service-examination-components-bodysite').answer.value.code"
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/variable"
* item[=].item[=].extension[=].valueExpression[+].name = "laterality"
* item[=].item[=].extension[=].valueExpression[=].language = #text/fhirpath
* item[=].item[=].extension[=].valueExpression[=].expression = "item.repeat(item).where(linkId='radiology-service-examination-components-laterality').answer.value.code"
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/variable"
* item[=].item[=].extension[=].valueExpression[+].name = "contrast"
* item[=].item[=].extension[=].valueExpression[=].language = #text/fhirpath
* item[=].item[=].extension[=].valueExpression[=].expression = "item.repeat(item).where(linkId='radiology-service-examination-components-contrast').answer.value.code"

* item[=].item[=].linkId = "radiology-service-examination"
* item[=].item[=].text = "Examination"
* item[=].item[=].type = #group
* item[=].item[=].repeats = false
* item[=].item[=].required = true

* item[=].item[=].item[+].linkId = "radiology-service-examination-components"
* item[=].item[=].item[=].text = "Procedure components"
* item[=].item[=].item[=].type = #group
* item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].required = false

* item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item[=].item[=].item[=].item[=].extension[=].valueCodeableConcept = $questionnaire-item-control#drop-down
* item[=].item[=].item[=].item[=].linkId = "radiology-service-examination-components-modality"
* item[=].item[=].item[=].item[=].text = "Procedure focus"
* item[=].item[=].item[=].item[=].type = #choice
* item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[=].required = true
* item[=].item[=].item[=].item[=].answerValueSet = "http://ranzcr.com/fhir/ValueSet/radiology-procedure-1"

* item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item[=].item[=].item[=].item[=].extension[=].valueCodeableConcept = $questionnaire-item-control#drop-down
* item[=].item[=].item[=].item[=].linkId = "radiology-service-examination-components-bodysite"
* item[=].item[=].item[=].item[=].text = "Body site"
* item[=].item[=].item[=].item[=].type = #choice
* item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[=].answerValueSet = "http://ranzcr.com/fhir/ValueSet/radiology-body-structure-1"

* item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item[=].item[=].item[=].item[=].extension[=].valueCodeableConcept = $questionnaire-item-control#radio-button
* item[=].item[=].item[=].item[=].linkId = "radiology-service-examination-components-laterality"
* item[=].item[=].item[=].item[=].text = "Laterality"
* item[=].item[=].item[=].item[=].type = #choice
* item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[=].answerValueSet = "http://ranzcr.com/fhir/ValueSet/radiology-laterality-1"

* item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item[=].item[=].item[=].item[=].extension[=].valueCodeableConcept = $questionnaire-item-control#radio-button
* item[=].item[=].item[=].item[=].linkId = "radiology-service-examination-components-contrast"
* item[=].item[=].item[=].item[=].text = "Contrast"
* item[=].item[=].item[=].item[=].type = #choice
* item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[=].answerValueSet = "http://ranzcr.com/fhir/ValueSet/radiology-contrast-1"

* item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item[=].item[=].item[=].extension[=].valueCodeableConcept = $questionnaire-item-control#autocomplete
* item[=].item[=].item[=].linkId = "radiology-service-examination-procedure"
* item[=].item[=].item[=].text = "Procedure being requested"
* item[=].item[=].item[=].type = #open-choice
* item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].required = true
* item[=].item[=].item[=].answerValueSet = "#ProcedureForRequest"



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
