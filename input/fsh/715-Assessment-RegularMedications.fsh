Alias: $LNC = http://loinc.org
Alias: $SCT = http://snomed.info/sct
Alias: $UCUM = http://unitsofmeasure.org

Instance: RegularMedications
InstanceOf: Questionnaire
Usage: #example
Title: "Aboriginal and Torres Strait Islander Health Check - Regular Medications"
Description: "Regular Medications sub-questionnaire for Aboriginal and Torres Strait Islander Health Check."

* contained[+] = YesNo
* contained[+] = smart-health-checks-medicine-products
* contained[+] = medication-reason-taken-1
* contained[+] = MedicationStatementTemplate
* contained[+] = MedicationStatementPatchTemplate


* extension[0].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-assemble-expectation"
* extension[=].valueCode = #assemble-child

* extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext"
* extension[=].extension[0].url = "name"
* extension[=].extension[=].valueCoding = http://hl7.org/fhir/uv/sdc/CodeSystem/launchContext#patient
* extension[=].extension[+].url = "type"
* extension[=].extension[=].valueCode = #Patient
* extension[=].extension[+].url = "description"
* extension[=].extension[=].valueString = "The patient that is to be used to pre-populate the form"
* extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext"
* extension[=].extension[0].url = "name"
* extension[=].extension[=].valueCoding = http://hl7.org/fhir/uv/sdc/CodeSystem/launchContext#user
* extension[=].extension[+].url = "type"
* extension[=].extension[=].valueCode = #Practitioner
* extension[=].extension[+].url = "description"
* extension[=].extension[=].valueString = "The practitioner user that is to be used to pre-populate the form"
* extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext"
* extension[=].extension[0].url = "name"
* extension[=].extension[=].valueCoding = http://hl7.org/fhir/uv/sdc/CodeSystem/launchContext#encounter
* extension[=].extension[+].url = "type"
* extension[=].extension[=].valueCode = #Encounter
* extension[=].extension[+].url = "description"
* extension[=].extension[=].valueString = "The encounter that is to be used to pre-populate the form"

* extension[+].url = "http://hl7.org/fhir/StructureDefinition/variable"
* extension[=].valueExpression.name = "MedicationStatement"
* extension[=].valueExpression.language = #application/x-fhir-query
* extension[=].valueExpression.expression = "MedicationStatement?patient={{%patient.id}}&status=active&_include=MedicationStatement:medication"

* extension[+].url = "http://hl7.org/fhir/StructureDefinition/variable"
* extension[=].valueExpression.name = "medicationsFromContained"
* extension[=].valueExpression.language = #text/fhirpath
* extension[=].valueExpression.expression = "%MedicationStatement.entry.resource.contained.where(resourceType = 'Medication' and id in %MedicationStatement.entry.resource.medicationReference.select(reference.replace('#', '')))"

* extension[+].url = "http://hl7.org/fhir/StructureDefinition/variable"
* extension[=].valueExpression.name = "medicationsFromRef"
* extension[=].valueExpression.language = #text/fhirpath
* extension[=].valueExpression.expression = "%MedicationStatement.entry.resource.where(resourceType = 'Medication' and id in %MedicationStatement.entry.resource.medicationReference.select(reference.replace('Medication/', '')))"

* extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-assembleContext"
* extension[=].valueString = "age"

//R5 preadoption extensions
* extension[+].url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-Questionnaire.versionAlgorithm[x]"
* extension[=].valueCoding.system = "http://hl7.org/fhir/version-algorithm"
* extension[=].valueCoding.code = #semver

* meta.profile[+] = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-render"
* meta.profile[+] = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-modular"
* meta.profile[+] = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-pop-exp"
* meta.profile[+] = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-extr-template"
* url = "http://www.health.gov.au/assessments/mbs/715/RegularMedications"
* name = "RegularMedications"
* title = "Aboriginal and Torres Strait Islander Health Check - Regular Medications"
* status = #draft
* experimental = false
* subjectType[+] = #Patient
* date = "2025-03-14"
* jurisdiction.coding = urn:iso:std:iso:3166#AU

* item.linkId = "7dfe7c6a-ca7f-4ddf-9241-a7b918a9695a"
* item.extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression].valueExpression.language = #text/fhirpath
* item.extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression].valueExpression.expression = "%age.exists()"
* item.text = "Regular medications"
* item.type = #group
* item.repeats = false
* item.item[+] //in-progress
* item.item[=].extension[questionnaire-itemControl].valueCodeableConcept = https://smartforms.csiro.au/ig/CodeSystem/QuestionnaireItemControlExtended#context-display    
* item.item[=].linkId = "CD-in-progress-23"
* item.item[=].text = "In progress"
* item.item[=].text.extension[http://hl7.org/fhir/StructureDefinition/rendering-xhtml].valueString = "<div title=\"In progress\" xmlns=\"http://www.w3.org/1999/xhtml\">\r\n\t<div style=\"display: flex; flex-direction: row;\">\r\n\t\t<img width='24' height='24' src='data:image/svg+xml;base64,\r\n\t\tPHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxZW0iIGhlaWdodD0iMWVtIiB2aWV3Qm94PSIwIDAgMjQgMjQiPjxwYXRoIGZpbGw9IiM3NTc1NzUiIGQ9Im0xNS44NCAxMC4ybC0xLjAxIDEuMDFsLTIuMDctMi4wM2wxLjAxLTEuMDJjLjItLjIxLjU0LS4yMi43OCAwbDEuMjkgMS4yNWMuMjEuMjEuMjIuNTUgMCAuNzlNOCAxMy45MWw0LjE3LTQuMTlsMi4wNyAyLjA4bC00LjE2IDQuMkg4di0yLjA5TTEzIDJ2MmM0LjM5LjU0IDcuNSA0LjUzIDYuOTYgOC45MkE4LjAxNCA4LjAxNCAwIDAgMSAxMyAxOS44OHYyYzUuNS0uNiA5LjQ1LTUuNTQgOC44NS0xMS4wM0MyMS4zMyA2LjE5IDE3LjY2IDIuNSAxMyAybS0yIDBjLTEuOTYuMTgtMy44MS45NS01LjMzIDIuMkw3LjEgNS43NGMxLjEyLS45IDIuNDctMS40OCAzLjktMS42OHYtMk00LjI2IDUuNjdBOS44MSA5LjgxIDAgMCAwIDIuMDUgMTFoMmMuMTktMS40Mi43NS0yLjc3IDEuNjQtMy45TDQuMjYgNS42N00yLjA2IDEzYy4yIDEuOTYuOTcgMy44MSAyLjIxIDUuMzNsMS40Mi0xLjQzQTguMDAyIDguMDAyIDAgMCAxIDQuMDYgMTNoLTJtNSA1LjM3bC0xLjM5IDEuMzdBOS45OTQgOS45OTQgMCAwIDAgMTEgMjJ2LTJhOC4wMDIgOC4wMDIgMCAwIDEtMy45LTEuNjNoLS4wNFoiLz48L3N2Zz4=' \r\n\t\tstyle=\"align-self: center;\"/>\r\n\t</div>\r\n</div>" 
* item.item[=].type = #display
* item.item[=].enableWhen[+].question = "MarkComplete-23" // Section complete item
* item.item[=].enableWhen[=].operator = #!=
* item.item[=].enableWhen[=].answerBoolean = true  
* item.item[+] //complete
* item.item[=].extension[questionnaire-itemControl].valueCodeableConcept = https://smartforms.csiro.au/ig/CodeSystem/QuestionnaireItemControlExtended#context-display
* item.item[=].linkId = "CD-complete-23"
* item.item[=].text = "Complete"
* item.item[=].text.extension[http://hl7.org/fhir/StructureDefinition/rendering-xhtml].valueString = "<div title=\"Section completed\" xmlns=\"http://www.w3.org/1999/xhtml\">\r\n\t<div style=\"display: flex; flex-direction: row;\">\r\n\t\t<img width='24' height='24' src='data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxZW0iIGhlaWdodD0iMWVtIiB2aWV3Qm94PSIwIDAgMjQgMjQiPjxwYXRoIGZpbGw9IiMyZTdkMzIiIGQ9Ik0yMCAxMmE4IDggMCAwIDEtOCA4YTggOCAwIDAgMS04LThhOCA4IDAgMCAxIDgtOGMuNzYgMCAxLjUuMTEgMi4yLjMxbDEuNTctMS41N0E5LjgyMiA5LjgyMiAwIDAgMCAxMiAyQTEwIDEwIDAgMCAwIDIgMTJhMTAgMTAgMCAwIDAgMTAgMTBhMTAgMTAgMCAwIDAgMTAtMTBNNy45MSAxMC4wOEw2LjUgMTEuNUwxMSAxNkwyMSA2bC0xLjQxLTEuNDJMMTEgMTMuMTdsLTMuMDktMy4wOVoiLz48L3N2Zz4='\r\n\t\tstyle=\"align-self: center;\"/>\r\n\t</div>\r\n</div>"
* item.item[=].type = #display
* item.item[=].enableWhen[+].question = "MarkComplete-23" // Section complete item
* item.item[=].enableWhen[=].operator = #=
* item.item[=].enableWhen[=].answerBoolean = true

* item.item[+].linkId = "regularmedications-instruction"
* item.item[=].text = "Check medications are still required, appropriate dose, understanding of medication and adherence"
* item.item[=].text.extension[http://hl7.org/fhir/StructureDefinition/rendering-xhtml].valueString = "<div xmlns=\"http://www.w3.org/1999/xhtml\">
      <em>Check medications are still required, appropriate dose, understanding of medication and adherence</em>
    </div>"    
* item.item[=].type = #display

* item.item[+].linkId = "regularmedications-summary"
* item.item[=].text = "Medication summary"
* item.item[=].text.extension[http://hl7.org/fhir/StructureDefinition/rendering-xhtml].valueString = "<div xmlns=\"http://www.w3.org/1999/xhtml\">
<p>Medication summary</p>
<p style=\"font-size:0.9em; font-weight:normal\"><em>This section includes a list of existing items from the patient record. <br />Update these items here or update the patient record and repopulate the form. <br />Add new items at the bottom.</em></p>
</div>"    
* item.item[=].type = #group
* item.item[=].repeats = false

// Current medications
* item.item[=].item[0].extension[sdc-questionnaire-itemPopulationContext][+].valueExpression[+].name = "MedicationStatementRepeat"
* item.item[=].item[0].extension[sdc-questionnaire-itemPopulationContext][=].valueExpression[=].language = #text/fhirpath
* item.item[=].item[0].extension[sdc-questionnaire-itemPopulationContext][=].valueExpression[=].expression = "%MedicationStatement.entry.resource.where(resourceType = 'MedicationStatement')"
* item.item[=].item[=].extension[TemplateExtractExtensionExtended][+].extension[template][+].valueReference = Reference(MedicationStatementPatchTemplate)
* item.item[=].item[=].extension[TemplateExtractExtensionExtended][=].extension[resourceId][+].valueString = "item.where(linkId='medicationStatementId').answer.value"
* item.item[=].item[=].extension[TemplateExtractExtensionExtended][=].extension[type][+].valueCode = #MedicationStatement
* item.item[=].item[=].linkId = "regularmedications-summary-current"
* item.item[=].item[=].text = "Current medications"
* item.item[=].item[=].text.extension[+].url = "https://smartforms.csiro.au/docs/custom-extension/questionnaire-item-text-hidden"
* item.item[=].item[=].text.extension[=].valueBoolean = true
* item.item[=].item[=].type = #group
* item.item[=].item[=].repeats = true
* item.item[=].item[=].item[0].extension[questionnaire-hidden].valueBoolean = true
* item.item[=].item[=].item[=].extension[sdc-questionnaire-initialExpression][+].valueExpression.language = #text/fhirpath
* item.item[=].item[=].item[=].extension[sdc-questionnaire-initialExpression][=].valueExpression.expression = "%MedicationStatementRepeat.id"      
* item.item[=].item[=].item[=].linkId = "medicationStatementId"
* item.item[=].item[=].item[=].type = #string
* item.item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item.item[=].item[=].item[=].extension[=].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#autocomplete
/*
* item.item[=].item[=].item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression"
* item.item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item.item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%MedicationStatement.entry.resource.medication.ofType(CodeableConcept).exists()"
*/
* item.item[=].item[=].item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item.item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
/*
  This expression selects the SNOMED coding from MedicationStatements.
  In some cases, medicationReference may be a reference to a contained Medication resource or an external Medication resource.
  %medicationsFromContained and %medicationsFromRef contains a list of contained Medication resources and externally referenced Medication resources respectively.

  Step 1: Check if the medicationReference is a contained resource (starts with '#') and if its ID is in %medicationsFromContained.
  Step 2: If it is, use the ID to find the corresponding Medication resource in %medicationsFromContained and select its SNOMED coding.
  Step 3: Otherwise, check if the medicationReference is an external resource (starts with 'Medication/') and if its ID is in %medicationsFromRef.
  Step 4: If it is, use the ID to find the corresponding Medication resource in %medicationsFromRef and select its SNOMED coding.
  Step 5: Otherwise, use the SNOMED coding from MedicationStatement.medication (medicationCodeableConcept to be specific).
*/
* item.item[=].item[=].item[=].extension[=].valueExpression[=].expression = "iif(%MedicationStatementRepeat.medicationReference.reference.replace('#', '') in %medicationsFromContained.id, %medicationsFromContained.where(id = %MedicationStatementRepeat.medicationReference.reference.replace('#', '')).code.select((coding.where(system='http://snomed.info/sct') | coding.where(system!='http://snomed.info/sct').first() | text ).first()), iif(%MedicationStatementRepeat.medicationReference.reference.replace('Medication/', '') in %medicationsFromRef.id , %medicationsFromRef.where(id = %MedicationStatementRepeat.medicationReference.reference.replace('Medication/', '')).code.select((coding.where(system='http://snomed.info/sct') | coding.where(system!='http://snomed.info/sct').first() | text ).first()) ,%MedicationStatementRepeat.medication.select((coding.where(system='http://snomed.info/sct') | coding.where(system!='http://snomed.info/sct').first() | text ).first())))"
* item.item[=].item[=].item[=].linkId = "regularmedications-summary-current-medication"
* item.item[=].item[=].item[=].text = "Medication"
* item.item[=].item[=].item[=].type = #open-choice
* item.item[=].item[=].item[=].repeats = false
* item.item[=].item[=].item[=].readOnly = true
* item.item[=].item[=].item[=].answerValueSet = "#smart-health-checks-medicine-products"
/*
* item.item[=].item[=].item[+].extension.url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item.item[=].item[=].item[=].extension.valueCodeableConcept = $questionnaire-item-control#autocomplete
* item.item[=].item[=].item[=].linkId = "regularmedications-summary-current-form"
* item.item[=].item[=].item[=].text = "Form"
* item.item[=].item[=].item[=].type = #open-choice
* item.item[=].item[=].item[=].repeats = false
* item.item[=].item[=].item[=].answerValueSet = "https://healthterminologies.gov.au/fhir/ValueSet/medication-form-1"
* item.item[=].item[=].item[+].extension.url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item.item[=].item[=].item[=].extension.valueCodeableConcept = $questionnaire-item-control#autocomplete
* item.item[=].item[=].item[=].linkId = "regularmedications-summary-current-route"
* item.item[=].item[=].item[=].text = "Route of adminsitration"
* item.item[=].item[=].item[=].type = #open-choice
* item.item[=].item[=].item[=].repeats = false
* item.item[=].item[=].item[=].answerValueSet = "https://healthterminologies.gov.au/fhir/ValueSet/route-of-administration-1"
* item.item[=].item[=].item[+].linkId = "regularmedications-summary-current-doseamount"
* item.item[=].item[=].item[=].text = "Dose amount"
* item.item[=].item[=].item[=].type = #decimal
* item.item[=].item[=].item[=].repeats = false
* item.item[=].item[=].item[=].item.extension.url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item.item[=].item[=].item[=].item.extension.valueCodeableConcept = $questionnaire-item-control#unit
* item.item[=].item[=].item[=].item.linkId = "regularmedications-summary-current-doseamount-unit"
* item.item[=].item[=].item[=].item.type = #choice
* item.item[=].item[=].item[=].item.answerOption[0].valueCoding = $unitsofmeasure#mg "mg"
* item.item[=].item[=].item[=].item.answerOption[+].valueCoding = $unitsofmeasure#ml "ml"
* item.item[=].item[=].item[+].extension.url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item.item[=].item[=].item[=].extension.valueCodeableConcept = $questionnaire-item-control#drop-down
* item.item[=].item[=].item[=].linkId = "regularmedications-summary-current-dosetiming"
* item.item[=].item[=].item[=].text = "Dose timing"
* item.item[=].item[=].item[=].type = #open-choice
* item.item[=].item[=].item[=].repeats = false
* item.item[=].item[=].item[=].answerValueSet = "http://hl7.org/fhir/ValueSet/timing-abbreviation"
*/

* item.item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item.item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item.item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%MedicationStatementRepeat.status"
* item.item[=].item[=].item[=].linkId = "regularmedications-summary-current-status"
* item.item[=].item[=].item[=].text = "Status"
* item.item[=].item[=].item[=].type = #choice
* item.item[=].item[=].item[=].repeats = false
* item.item[=].item[=].item[=].answerOption[0].valueCoding = http://hl7.org/fhir/CodeSystem/medication-statement-status#active "Active"
* item.item[=].item[=].item[=].answerOption[+].valueCoding = http://hl7.org/fhir/CodeSystem/medication-statement-status#completed "Completed"
* item.item[=].item[=].item[=].answerOption[+].valueCoding = http://hl7.org/fhir/CodeSystem/medication-statement-status#stopped "Stopped"
* item.item[=].item[=].item[=].answerOption[+].valueCoding = http://hl7.org/fhir/CodeSystem/medication-statement-status#on-hold "On Hold"

* item.item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item.item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item.item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%MedicationStatementRepeat.dosage.text"
* item.item[=].item[=].item[=].linkId = "regularmedications-summary-current-dosage"
* item.item[=].item[=].item[=].text = "Dosage"
* item.item[=].item[=].item[=].type = #text
* item.item[=].item[=].item[=].repeats = false

* item.item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item.item[=].item[=].item[=].extension[=].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#autocomplete
* item.item[=].item[=].item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item.item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item.item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%MedicationStatementRepeat.reasonCode.select((coding.where(system='http://snomed.info/sct') | coding.where(system!='http://snomed.info/sct').first() | text ).first())"
* item.item[=].item[=].item[=].linkId = "regularmedications-summary-current-reasoncode"
* item.item[=].item[=].item[=].text = "Clinical indication"
* item.item[=].item[=].item[=].type = #open-choice
* item.item[=].item[=].item[=].repeats = true
* item.item[=].item[=].item[=].readOnly = true
* item.item[=].item[=].item[=].answerValueSet = "#medication-reason-taken-1"

* item.item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item.item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item.item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%MedicationStatementRepeat.note.text"
* item.item[=].item[=].item[=].linkId = "regularmedications-summary-current-comment"
* item.item[=].item[=].item[=].text = "Comment"
* item.item[=].item[=].item[=].type = #text
* item.item[=].item[=].item[=].repeats = false

// New medications
* item.item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
* item.item[=].item[=].extension[=].extension.url = "template"
* item.item[=].item[=].extension[=].extension.valueReference = Reference(MedicationStatementTemplate)
* item.item[=].item[=].linkId = "regularmedications-summary-new"
* item.item[=].item[=].text = "New medications"
* item.item[=].item[=].text.extension[+].url = "https://smartforms.csiro.au/docs/custom-extension/questionnaire-item-text-hidden"
* item.item[=].item[=].text.extension[=].valueBoolean = true
* item.item[=].item[=].type = #group
* item.item[=].item[=].repeats = true
* item.item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item.item[=].item[=].item[=].extension[=].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#autocomplete
* item.item[=].item[=].item[=].linkId = "regularmedications-summary-new-medication"
* item.item[=].item[=].item[=].text = "Medication"
* item.item[=].item[=].item[=].type = #open-choice
* item.item[=].item[=].item[=].repeats = false
* item.item[=].item[=].item[=].answerValueSet = "#smart-health-checks-medicine-products"

* item.item[=].item[=].item[+].linkId = "regularmedications-summary-new-dosage"
* item.item[=].item[=].item[=].text = "Dosage"
* item.item[=].item[=].item[=].type = #text
* item.item[=].item[=].item[=].repeats = false

* item.item[=].item[=].item[+].extension.url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item.item[=].item[=].item[=].extension.valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#autocomplete
* item.item[=].item[=].item[=].linkId = "regularmedications-summary-new-reasoncode"
* item.item[=].item[=].item[=].text = "Clinical indication"
* item.item[=].item[=].item[=].type = #open-choice
* item.item[=].item[=].item[=].repeats = true
* item.item[=].item[=].item[=].answerValueSet = "#medication-reason-taken-1"

* item.item[=].item[=].item[+].linkId = "regularmedications-summary-new-comment"
* item.item[=].item[=].item[=].text = "Comment"
* item.item[=].item[=].item[=].type = #text
* item.item[=].item[=].item[=].repeats = false

* item.item[+].extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression].valueExpression.language = #text/fhirpath
* item.item[=].extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression].valueExpression.expression = "%age <= 12"
* item.item[=].extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#radio-button
* item.item[=].extension[questionnaire-choiceOrientation].valueCode = #horizontal
* item.item[=].linkId = "6eb59145-ed9a-4184-af83-3506d47e4d4e"
* item.item[=].text = "Does your child take any regular medications (prescribed, over-the-counter, traditional, complementary and alternative)?"
* item.item[=].extension[sdc-questionnaire-shortText].valueString = "Does your child take any regular medications?"
* item.item[=].type = #choice
* item.item[=].repeats = false 
* item.item[=].answerValueSet = "#YesNo"
* item.item[+].extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression].valueExpression.language = #text/fhirpath
* item.item[=].extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression].valueExpression.expression = "%age > 12"
* item.item[=].extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#radio-button
* item.item[=].extension[questionnaire-choiceOrientation].valueCode = #horizontal
* item.item[=].linkId = "3a2d27b6-e918-4df5-aca9-b374fcf9faad"
* item.item[=].text = "Do you take any regular medications (prescribed, over-the-counter, traditional, complementary and alternative)?"
* item.item[=].extension[sdc-questionnaire-shortText].valueString = "Do you take any regular medications?"
* item.item[=].type = #choice
* item.item[=].repeats = false  
* item.item[=].answerValueSet = "#YesNo"

//* item.item[+].extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#check-box
* item.item[+].linkId = "874ec8db-95c9-4cc0-95db-e45edaa3cd12"
* item.item[=].text = "Check the health record is up to date"
* item.item[=].type = #boolean
* item.item[=].repeats = false
/** item.item[=].enableWhen[+].question = "6eb59145-ed9a-4184-af83-3506d47e4d4e"
* item.item[=].enableWhen[=].operator = #=
* item.item[=].enableWhen[=].answerCoding = http://terminology.hl7.org/CodeSystem/v2-0136#Y
* item.item[=].enableWhen[+].question = "3a2d27b6-e918-4df5-aca9-b374fcf9faad"
* item.item[=].enableWhen[=].operator = #=
* item.item[=].enableWhen[=].answerCoding = http://terminology.hl7.org/CodeSystem/v2-0136#Y
* item.item[=].enableBehavior = #any*/
//* item.item[+].extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#check-box
* item.item[+].linkId = "36290837-ad70-48b2-9c66-31533fec918b"
* item.item[=].text = "Check medication understanding and adherence with patient"
* item.item[=].extension[sdc-questionnaire-shortText].valueString = "Understanding and adherence checked"
* item.item[=].type = #boolean
* item.item[=].repeats = false
* item.item[=].enableWhen[+].question = "6eb59145-ed9a-4184-af83-3506d47e4d4e"
* item.item[=].enableWhen[=].operator = #=
* item.item[=].enableWhen[=].answerCoding = http://terminology.hl7.org/CodeSystem/v2-0136#Y
* item.item[=].enableWhen[+].question = "3a2d27b6-e918-4df5-aca9-b374fcf9faad"
* item.item[=].enableWhen[=].operator = #=
* item.item[=].enableWhen[=].answerCoding = http://terminology.hl7.org/CodeSystem/v2-0136#Y
* item.item[=].enableBehavior = #any

* item.item[+].linkId = "aa9ff2ed-bcd2-406d-a9ff-89c201df2605"
* item.item[=].text = "Health priorities, actions and follow-up"
* item.item[=].type = #text
* item.item[=].repeats = false

* item.item[+].linkId = "MarkComplete-23"
* item.item[=].text = "Mark section as complete"
* item.item[=].text.extension[http://hl7.org/fhir/StructureDefinition/rendering-xhtml].valueString = "<div xmlns=\"http://www.w3.org/1999/xhtml\">\r\n<head>\r\n    <style type=\"text/css\">\r\n        .alert {\r\n            padding: 0.875rem;\r\n            margin-bottom: 1rem;\r\n            font-size: 0.875rem;\r\n            color: #29712D;\r\n            border-radius: 0.5rem;\r\n            background-color: #D9E8DA;\r\n            font-weight: 700;\r\n        max-width: 205px;\r\n        }\r\n    </style>\r\n</head>\r\n<body>\r\n<div class=\"alert\">Mark section as complete</div>\r\n</body>\r\n</div>"
* item.item[=].type = #boolean
* item.item[=].repeats = false
