Alias: $LNC = http://loinc.org
Alias: $SCT = http://snomed.info/sct
Alias: $UCUM = http://unitsofmeasure.org

Instance: AllergiesAdverseReactions
InstanceOf: Questionnaire
Usage: #example
Title: "Aboriginal and Torres Strait Islander Health Check - Allergies/Adverse Reactions"
Description: "Allergies/Adverse Reactions sub-questionnaire for Aboriginal and Torres Strait Islander Health Check."

* contained[+] = AllergyIntoleranceTemplate
* contained[+] = AllergyIntolerancePatchTemplate
* contained[+] = AllergyIntoleranceClinicalStatusMinimal

//assemble expectation
* extension[+]
  * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-assemble-expectation"
  * valueCode = #assemble-child

//launch context
* extension[+]
  * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext"
  * extension[+]
    * url = "name"
    * valueCoding = http://hl7.org/fhir/uv/sdc/CodeSystem/launchContext#patient
  * extension[+]
    * url = "type"
    * valueCode = #Patient
  * extension[+]
    * url = "description"
    * valueString = "The patient that is to be used to pre-populate the form"
* extension[+]
  * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext"
  * extension[+]
    * url = "name"
    * valueCoding = http://hl7.org/fhir/uv/sdc/CodeSystem/launchContext#user
  * extension[+]
    * url = "type"
    * valueCode = #Practitioner
  * extension[+]
    * url = "description"
    * valueString = "The practitioner user that is to be used to pre-populate the form"
* extension[+]
  * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext"
  * extension[+]
    * url = "name"
    * valueCoding = http://hl7.org/fhir/uv/sdc/CodeSystem/launchContext#encounter
  * extension[+]
    * url = "type"
    * valueCode = #Encounter
  * extension[+]
    * url = "description"
    * valueString = "The encounter that is to be used to pre-populate the form"
 
//assemble context
* extension[+]
  * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-assembleContext"
  * valueString = "age"

//fhir query variables
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "AllergyIntolerance"
    * language = #application/x-fhir-query
    * expression = "AllergyIntolerance?patient={{%patient.id}}"

//R5 preadoption extensions
* extension[+]
  * url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-Questionnaire.versionAlgorithm[x]"
  * valueCoding
    * system = "http://hl7.org/fhir/version-algorithm"
    * code = #semver

* meta.profile[+] = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-render"
* meta.profile[+] = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-modular"
* meta.profile[+] = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-pop-exp"
* meta.profile[+] = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-extr-template"
* url = "http://www.health.gov.au/assessments/mbs/715/AllergiesAdverseReactions"
* name = "AllergiesAdverseReactions"
* title = "Aboriginal and Torres Strait Islander Health Check - Allergies/Adverse Reactions"
* status = #draft
* experimental = false
* subjectType[+] = #Patient
* date = "2025-03-14"
* jurisdiction.coding = urn:iso:std:iso:3166#AU

* item[+]
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression].valueExpression
    * language = #text/fhirpath
    * expression = "%age.exists()"
  * linkId = "allergy"
  * text = "Allergies/adverse reactions"
  * type = #group
  * repeats = false
  * item[+] //in-progress
    * extension[questionnaire-itemControl].valueCodeableConcept = https://smartforms.csiro.au/ig/CodeSystem/QuestionnaireItemControlExtended#context-display    
    * linkId = "CD-in-progress-3"
    * text = "In progress"
      * extension[http://hl7.org/fhir/StructureDefinition/rendering-xhtml].valueString = "<div title=\"In progress\" xmlns=\"http://www.w3.org/1999/xhtml\">\r\n\t<div style=\"display: flex; flex-direction: row;\">\r\n\t\t<img width='24' height='24' src='data:image/svg+xml;base64,\r\n\t\tPHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxZW0iIGhlaWdodD0iMWVtIiB2aWV3Qm94PSIwIDAgMjQgMjQiPjxwYXRoIGZpbGw9IiM3NTc1NzUiIGQ9Im0xNS44NCAxMC4ybC0xLjAxIDEuMDFsLTIuMDctMi4wM2wxLjAxLTEuMDJjLjItLjIxLjU0LS4yMi43OCAwbDEuMjkgMS4yNWMuMjEuMjEuMjIuNTUgMCAuNzlNOCAxMy45MWw0LjE3LTQuMTlsMi4wNyAyLjA4bC00LjE2IDQuMkg4di0yLjA5TTEzIDJ2MmM0LjM5LjU0IDcuNSA0LjUzIDYuOTYgOC45MkE4LjAxNCA4LjAxNCAwIDAgMSAxMyAxOS44OHYyYzUuNS0uNiA5LjQ1LTUuNTQgOC44NS0xMS4wM0MyMS4zMyA2LjE5IDE3LjY2IDIuNSAxMyAybS0yIDBjLTEuOTYuMTgtMy44MS45NS01LjMzIDIuMkw3LjEgNS43NGMxLjEyLS45IDIuNDctMS40OCAzLjktMS42OHYtMk00LjI2IDUuNjdBOS44MSA5LjgxIDAgMCAwIDIuMDUgMTFoMmMuMTktMS40Mi43NS0yLjc3IDEuNjQtMy45TDQuMjYgNS42N00yLjA2IDEzYy4yIDEuOTYuOTcgMy44MSAyLjIxIDUuMzNsMS40Mi0xLjQzQTguMDAyIDguMDAyIDAgMCAxIDQuMDYgMTNoLTJtNSA1LjM3bC0xLjM5IDEuMzdBOS45OTQgOS45OTQgMCAwIDAgMTEgMjJ2LTJhOC4wMDIgOC4wMDIgMCAwIDEtMy45LTEuNjNoLS4wNFoiLz48L3N2Zz4=' \r\n\t\tstyle=\"align-self: center;\"/>\r\n\t</div>\r\n</div>" 
    * type = #display
    * enableWhen[+]
      * question = "MarkComplete-3" // Section complete item
      * operator = #!=
      * answerBoolean = true  
  * item[+] //complete
    * extension[questionnaire-itemControl].valueCodeableConcept = https://smartforms.csiro.au/ig/CodeSystem/QuestionnaireItemControlExtended#context-display
    * linkId = "CD-complete-3"
    * text = "Complete"
      * extension[http://hl7.org/fhir/StructureDefinition/rendering-xhtml].valueString = "<div title=\"Section completed\" xmlns=\"http://www.w3.org/1999/xhtml\">\r\n\t<div style=\"display: flex; flex-direction: row;\">\r\n\t\t<img width='24' height='24' src='data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxZW0iIGhlaWdodD0iMWVtIiB2aWV3Qm94PSIwIDAgMjQgMjQiPjxwYXRoIGZpbGw9IiMyZTdkMzIiIGQ9Ik0yMCAxMmE4IDggMCAwIDEtOCA4YTggOCAwIDAgMS04LThhOCA4IDAgMCAxIDgtOGMuNzYgMCAxLjUuMTEgMi4yLjMxbDEuNTctMS41N0E5LjgyMiA5LjgyMiAwIDAgMCAxMiAyQTEwIDEwIDAgMCAwIDIgMTJhMTAgMTAgMCAwIDAgMTAgMTBhMTAgMTAgMCAwIDAgMTAtMTBNNy45MSAxMC4wOEw2LjUgMTEuNUwxMSAxNkwyMSA2bC0xLjQxLTEuNDJMMTEgMTMuMTdsLTMuMDktMy4wOVoiLz48L3N2Zz4='\r\n\t\tstyle=\"align-self: center;\"/>\r\n\t</div>\r\n</div>"
    * type = #display
    * enableWhen[+]
      * question = "MarkComplete-3" // Section complete item
      * operator = #=
      * answerBoolean = true

  // Adverse reaction risk summary
  * item[+]
    * linkId = "allergyinstruction"
    * text = "Adverse reaction risk summary"
      * extension[http://hl7.org/fhir/StructureDefinition/rendering-xhtml].valueString = "<div xmlns=\"http://www.w3.org/1999/xhtml\">
    <p>Adverse reaction risk summary</p>
    <p style=\"font-size:0.9em; font-weight:normal\"><em>This section includes a list of existing items from the patient record. <br />Update these items here or update the patient record and repopulate the form. <br />Add new items at the bottom.</em></p>
    </div>"    
    * type = #group 
//existing adverse reactions
* item[=].item[=].item[+].extension[sdc-questionnaire-itemPopulationContext][+].valueExpression[+].name = "AllergyIntoleranceRepeat"
* item[=].item[=].item[=].extension[sdc-questionnaire-itemPopulationContext][=].valueExpression[=].language = #text/fhirpath
* item[=].item[=].item[=].extension[sdc-questionnaire-itemPopulationContext][=].valueExpression[=].expression = "%AllergyIntolerance.entry.resource.where(clinicalStatus.coding.exists(code='active')).where(verificationStatus.coding.all(code.empty() or code='confirmed'))"
* item[=].item[=].item[=].extension[sdc-questionnaire-templateExtract][+].extension[template][+].valueReference = Reference(AllergyIntolerancePatchTemplate)
* item[=].item[=].item[=].extension[sdc-questionnaire-templateExtract][=].extension[TemplateExtractExtensionPatchRequestUrl][+].valueString = "'AllergyIntolerance/' + item.where(linkId='allergyIntoleranceId').answer.value"
* item[=].item[=].item[=].extension[https://smartforms.csiro.au/ig/StructureDefinition/GroupHideAddItemButton][+].valueBoolean = true
* item[=].item[=].item[=].linkId = "allergysummary"
* item[=].item[=].item[=].text = "Adverse reaction risk summary"
* item[=].item[=].item[=].text.extension[+].url = "https://smartforms.csiro.au/ig/StructureDefinition/QuestionnaireItemTextHidden"
* item[=].item[=].item[=].text.extension[=].valueBoolean = true
* item[=].item[=].item[=].type = #group
* item[=].item[=].item[=].repeats = true
* item[=].item[=].item[=].item[0].extension[questionnaire-hidden].valueBoolean = true
* item[=].item[=].item[=].item[=].extension[sdc-questionnaire-initialExpression][+].valueExpression.language = #text/fhirpath
* item[=].item[=].item[=].item[=].extension[sdc-questionnaire-initialExpression][=].valueExpression.expression = "%AllergyIntoleranceRepeat.id"      
* item[=].item[=].item[=].item[=].linkId = "allergyIntoleranceId"
* item[=].item[=].item[=].item[=].type = #string
* item[=].item[=].item[=].item[+].extension[sdc-questionnaire-initialExpression][+].valueExpression.language = #text/fhirpath
* item[=].item[=].item[=].item[=].extension[sdc-questionnaire-initialExpression][=].valueExpression.expression = "%AllergyIntoleranceRepeat.code.select((coding.where(system='http://snomed.info/sct') | coding.where(system!='http://snomed.info/sct').first() | text ).first())"
* item[=].item[=].item[=].item[=].extension[questionnaire-itemControl][+].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#autocomplete
* item[=].item[=].item[=].item[=].linkId = "allergysummary-substance"
* item[=].item[=].item[=].item[=].text = "Substance"
* item[=].item[=].item[=].item[=].type = #open-choice
* item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[=].readOnly = true
* item[=].item[=].item[=].item[=].answerValueSet = "https://healthterminologies.gov.au/fhir/ValueSet/adverse-reaction-agent-1"
* item[=].item[=].item[=].item[+].extension[sdc-questionnaire-initialExpression][+].valueExpression.language = #text/fhirpath
* item[=].item[=].item[=].item[=].extension[sdc-questionnaire-initialExpression][=].valueExpression.expression = "%AllergyIntoleranceRepeat.clinicalStatus.coding"
* item[=].item[=].item[=].item[=].extension[questionnaire-itemControl][+].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#drop-down
* item[=].item[=].item[=].item[=].linkId = "allergysummary-status"
* item[=].item[=].item[=].item[=].text = "Status"
* item[=].item[=].item[=].item[=].type = #choice
* item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[=].answerValueSet = "#AllergyIntoleranceClinicalStatusMinimal"
// This hidden item is used to determine the appropriate patch parameter parts for comment.
* item[=].item[=].item[=].item[+].extension[sdc-questionnaire-initialExpression][+].valueExpression.language = #text/fhirpath
* item[=].item[=].item[=].item[=].extension[sdc-questionnaire-initialExpression][=].valueExpression.expression = "%AllergyIntoleranceRepeat.clinicalStatus.coding"
* item[=].item[=].item[=].item[=].extension[questionnaire-hidden].valueBoolean = true
* item[=].item[=].item[=].item[=].linkId = "allergysummary-status-hidden"
* item[=].item[=].item[=].item[=].type = #choice
* item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[=].answerValueSet = "#AllergyIntoleranceClinicalStatusMinimal"
* item[=].item[=].item[=].item[+].extension[sdc-questionnaire-initialExpression][+].valueExpression.language = #text/fhirpath
* item[=].item[=].item[=].item[=].extension[sdc-questionnaire-initialExpression][=].valueExpression.expression = "%AllergyIntoleranceRepeat.reaction.manifestation.coding"
* item[=].item[=].item[=].item[=].extension[questionnaire-itemControl][+].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#autocomplete
* item[=].item[=].item[=].item[=].linkId = "allergysummary-manifestation"
* item[=].item[=].item[=].item[=].text = "Manifestation"
* item[=].item[=].item[=].item[=].type = #open-choice
* item[=].item[=].item[=].item[=].repeats = true
* item[=].item[=].item[=].item[=].readOnly = true
* item[=].item[=].item[=].item[=].answerValueSet = "https://healthterminologies.gov.au/fhir/ValueSet/clinical-finding-1"
// manifestation value set
// * item[=].item[=].item[=].item[=].answerValueSet = "http://snomed.info/sct/32506021000036107?fhir_vs=refset/142341000036103"
* item[=].item[=].item[=].item[+].extension[sdc-questionnaire-initialExpression][+].valueExpression.language = #text/fhirpath
* item[=].item[=].item[=].item[=].extension[sdc-questionnaire-initialExpression][=].valueExpression.expression = "%AllergyIntoleranceRepeat.note[0].text"
* item[=].item[=].item[=].item[=].linkId = "allergysummary-comment"
* item[=].item[=].item[=].item[=].text = "Comment"
* item[=].item[=].item[=].item[=].type = #text
* item[=].item[=].item[=].item[=].repeats = false
// This hidden item is used to determine the appropriate patch parameter parts for comment.
* item[=].item[=].item[=].item[+].extension[sdc-questionnaire-initialExpression][+].valueExpression.language = #text/fhirpath
* item[=].item[=].item[=].item[=].extension[sdc-questionnaire-initialExpression][=].valueExpression.expression = "%AllergyIntoleranceRepeat.note[0].text"
* item[=].item[=].item[=].item[=].extension[questionnaire-hidden].valueBoolean = true
* item[=].item[=].item[=].item[=].linkId = "allergysummary-comment-hidden"
* item[=].item[=].item[=].item[=].type = #text
* item[=].item[=].item[=].item[=].repeats = false

//new adverse reactions
* item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
* item[=].item[=].item[=].extension[=].extension.url = "template"
* item[=].item[=].item[=].extension[=].extension.valueReference = Reference(AllergyIntoleranceTemplate)
* item[=].item[=].item[=].linkId = "allergynew"
* item[=].item[=].item[=].text = "New adverse reaction risks"
* item[=].item[=].item[=].text.extension[+].url = "https://smartforms.csiro.au/ig/StructureDefinition/QuestionnaireItemTextHidden"
* item[=].item[=].item[=].text.extension[=].valueBoolean = true
* item[=].item[=].item[=].type = #group
* item[=].item[=].item[=].repeats = true
* item[=].item[=].item[=].item[+].extension[questionnaire-itemControl][+].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#autocomplete
* item[=].item[=].item[=].item[=].linkId = "allergynew-substance"
* item[=].item[=].item[=].item[=].text = "Substance"
* item[=].item[=].item[=].item[=].type = #open-choice
* item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[=].required = true
* item[=].item[=].item[=].item[=].answerValueSet = "https://healthterminologies.gov.au/fhir/ValueSet/adverse-reaction-agent-1"
* item[=].item[=].item[=].item[+].extension[questionnaire-itemControl][+].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#autocomplete
* item[=].item[=].item[=].item[=].linkId = "allergynew-manifestation"
* item[=].item[=].item[=].item[=].text = "Manifestation"
* item[=].item[=].item[=].item[=].type = #open-choice
* item[=].item[=].item[=].item[=].repeats = true
* item[=].item[=].item[=].item[=].answerValueSet = "https://healthterminologies.gov.au/fhir/ValueSet/clinical-finding-1"
// manifestation value set
// * item[=].item[=].item[=].item[=].answerValueSet = "http://snomed.info/sct/32506021000036107?fhir_vs=refset/142341000036103"
* item[=].item[=].item[=].item[+].linkId = "allergynew-comment"
* item[=].item[=].item[=].item[=].text = "Comment"
* item[=].item[=].item[=].item[=].type = #text
* item[=].item[=].item[=].item[=].repeats = false

* item[=].item[+].linkId = "3e689aeb-69a1-4a9b-93bd-50377511dd9b"
* item[=].item[=].text = "Health priorities, actions and follow-up"
* item[=].item[=].type = #text
* item[=].item[=].repeats = false
* item[=].item[+].linkId = "MarkComplete-3"
* item[=].item[=].text = "Mark section as complete"
* item[=].item[=].text.extension[http://hl7.org/fhir/StructureDefinition/rendering-xhtml].valueString = "<div xmlns=\"http://www.w3.org/1999/xhtml\">\r\n<head>\r\n    <style type=\"text/css\">\r\n        .alert {\r\n            padding: 0.875rem;\r\n            margin-bottom: 1rem;\r\n            font-size: 0.875rem;\r\n            color: #29712D;\r\n            border-radius: 0.5rem;\r\n            background-color: #D9E8DA;\r\n            font-weight: 700;\r\n        max-width: 205px;\r\n        }\r\n    </style>\r\n</head>\r\n<body>\r\n<div class=\"alert\">Mark section as complete</div>\r\n</body>\r\n</div>"
* item[=].item[=].type = #boolean
* item[=].item[=].repeats = false
