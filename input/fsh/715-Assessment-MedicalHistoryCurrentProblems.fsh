Alias: $LNC = http://loinc.org
Alias: $SCT = http://snomed.info/sct
Alias: $UCUM = http://unitsofmeasure.org

Instance: MedicalHistoryCurrentProblems
InstanceOf: Questionnaire
Usage: #example
Title: "Aboriginal and Torres Strait Islander Health Check - Medical History"
Description: "Medical History sub-questionnaire for Aboriginal and Torres Strait Islander Health Check."

* contained[+] = ConditionClinicalStatusMinimal
* contained[+] = clinical-condition-1
* contained[+] = ConditionTemplate
* contained[+] = ConditionPatchTemplate

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
* extension[+]
  * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-assembleContext"
  * valueString = "Condition"

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
* url = "http://www.health.gov.au/assessments/mbs/715/MedicalHistoryCurrentProblems"
* name = "MedicalHistoryCurrentProblems"
* title = "Aboriginal and Torres Strait Islander Health Check - Medical History"
* status = #draft
* experimental = false
* subjectType[+] = #Patient
* date = "2025-03-14"
* jurisdiction.coding = urn:iso:std:iso:3166#AU

* item[+]
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression].valueExpression
    * language = #text/fhirpath
    * expression = "%age.exists()"
  * linkId = "28d5dbe4-1e65-487c-847a-847f544a6a91"
  * text = "Medical history and current problems"
  * type = #group
  * repeats = false
  * item[+] //in-progress
    * extension[sdc-questionnaire-enableWhenExpression].valueExpression
      * language = #text/fhirpath
      * expression = "%resource.repeat(item).where(linkId='MarkComplete-17').answer.value = 'In progress' or %resource.repeat(item).where(linkId='MarkComplete-17').answer.value.empty()"
    * extension[questionnaire-itemControl].valueCodeableConcept = https://smartforms.csiro.au/ig/CodeSystem/QuestionnaireItemControlExtended#context-display
    * linkId = "CD-in-progress-17"
    * text = "In progress"
      * extension[http://hl7.org/fhir/StructureDefinition/rendering-xhtml].valueString = "<div title=\"In progress\" xmlns=\"http://www.w3.org/1999/xhtml\">\r\n\t<div style=\"display: flex; flex-direction: row;\">\r\n\t\t<img width='24' height='24' src='data:image/svg+xml;base64,\r\n\t\tPHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxZW0iIGhlaWdodD0iMWVtIiB2aWV3Qm94PSIwIDAgMjQgMjQiPjxwYXRoIGZpbGw9IiM3NTc1NzUiIGQ9Im0xNS44NCAxMC4ybC0xLjAxIDEuMDFsLTIuMDctMi4wM2wxLjAxLTEuMDJjLjItLjIxLjU0LS4yMi43OCAwbDEuMjkgMS4yNWMuMjEuMjEuMjIuNTUgMCAuNzlNOCAxMy45MWw0LjE3LTQuMTlsMi4wNyAyLjA4bC00LjE2IDQuMkg4di0yLjA5TTEzIDJ2MmM0LjM5LjU0IDcuNSA0LjUzIDYuOTYgOC45MkE4LjAxNCA4LjAxNCAwIDAgMSAxMyAxOS44OHYyYzUuNS0uNiA5LjQ1LTUuNTQgOC44NS0xMS4wM0MyMS4zMyA2LjE5IDE3LjY2IDIuNSAxMyAybS0yIDBjLTEuOTYuMTgtMy44MS45NS01LjMzIDIuMkw3LjEgNS43NGMxLjEyLS45IDIuNDctMS40OCAzLjktMS42OHYtMk00LjI2IDUuNjdBOS44MSA5LjgxIDAgMCAwIDIuMDUgMTFoMmMuMTktMS40Mi43NS0yLjc3IDEuNjQtMy45TDQuMjYgNS42N00yLjA2IDEzYy4yIDEuOTYuOTcgMy44MSAyLjIxIDUuMzNsMS40Mi0xLjQzQTguMDAyIDguMDAyIDAgMCAxIDQuMDYgMTNoLTJtNSA1LjM3bC0xLjM5IDEuMzdBOS45OTQgOS45OTQgMCAwIDAgMTEgMjJ2LTJhOC4wMDIgOC4wMDIgMCAwIDEtMy45LTEuNjNoLS4wNFoiLz48L3N2Zz4=' \r\n\t\tstyle=\"align-self: center;\"/>\r\n\t</div>\r\n</div>" 
    * type = #display
  * item[+] //complete
    * extension[sdc-questionnaire-enableWhenExpression].valueExpression
      * language = #text/fhirpath
      * expression = "%resource.repeat(item).where(linkId='MarkComplete-17').answer.value = 'Complete'"
    * extension[questionnaire-itemControl].valueCodeableConcept = https://smartforms.csiro.au/ig/CodeSystem/QuestionnaireItemControlExtended#context-display
    * linkId = "CD-complete-17"
    * text = "Complete"
      * extension[http://hl7.org/fhir/StructureDefinition/rendering-xhtml].valueString = "<div title=\"Complete\" xmlns=\"http://www.w3.org/1999/xhtml\">\r\n\t<div style=\"display: flex; flex-direction: row;\">\r\n\t\t<img width='24' height='24' src='data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxZW0iIGhlaWdodD0iMWVtIiB2aWV3Qm94PSIwIDAgMjQgMjQiPjxwYXRoIGZpbGw9IiMyZTdkMzIiIGQ9Ik0yMCAxMmE4IDggMCAwIDEtOCA4YTggOCAwIDAgMS04LThhOCA4IDAgMCAxIDgtOGMuNzYgMCAxLjUuMTEgMi4yLjMxbDEuNTctMS41N0E5LjgyMiA5LjgyMiAwIDAgMCAxMiAyQTEwIDEwIDAgMCAwIDIgMTJhMTAgMTAgMCAwIDAgMTAgMTBhMTAgMTAgMCAwIDAgMTAtMTBNNy45MSAxMC4wOEw2LjUgMTEuNUwxMSAxNkwyMSA2bC0xLjQxLTEuNDJMMTEgMTMuMTdsLTMuMDktMy4wOVoiLz48L3N2Zz4='\r\n\t\tstyle=\"align-self: center;\"/>\r\n\t</div>\r\n</div>"
    * type = #display
  * item[+] //attention
    * extension[sdc-questionnaire-enableWhenExpression].valueExpression
      * language = #text/fhirpath
      * expression = "%resource.repeat(item).where(linkId='MarkComplete-17').answer.value = 'Attention required'"
    * extension[questionnaire-itemControl].valueCodeableConcept = https://smartforms.csiro.au/ig/CodeSystem/QuestionnaireItemControlExtended#context-display
    * linkId = "CD-attention-17"
    * text = "Attention required"
      * extension[http://hl7.org/fhir/StructureDefinition/rendering-xhtml].valueString = "<div title=\"Attention required\" xmlns=\"http://www.w3.org/1999/xhtml\">\r\n\t<div style=\"display: flex; flex-direction: row;\">\r\n\t\t<img width='24' height='24' src='data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAxMDAgMTAwIj48Y2lyY2xlIGN4PSI1MCIgY3k9IjUwIiByPSI0MiIgZmlsbD0ibm9uZSIgc3Ryb2tlPSIjRkZD MTA3IiBzdHJva2Utd2lkdGg9IjgiLz48bGluZSB4MT0iNTAiIHkxPSIyOCIgeDI9IjUwIiB5Mj0iNjAiIHN0cm9rZT0iI0ZGQzEwNyIgc3Ryb2tlLXdpZHRoPSI4Ii8+PGNpcmNsZSBjeD0iNTAiIGN5PSI3NCIgcj0iNSIgZmlsbD0iI0ZGQzEwNyIvPjwvc3ZnPg=='\r\n\t\tstyle=\"align-self: center;\"/>\r\n\t</div>\r\n</div>"
    * type = #display
//Birth history      
  * item[+]
    * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression].valueExpression
      * language = #text/fhirpath
      * expression = "%age <= 5"
    * linkId = "b9de2b58-55e2-436d-95ab-49600508cdf7"
    * text = "Birth history"
    * type = #group
    * repeats = false
    * item[+]
      * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unit].valueCoding = $UCUM#wk
      * linkId = "a10a7375-e9d3-4e71-a47a-282e9ba38ec1"
      * text = "Gestation at birth"
      * type = #decimal
      * repeats = false
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
      * item[+]
        * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#unit
        * linkId = "87cf1ecd-6d1b-4de1-894d-58bd77dcfde1"
        * text = "kg"
        * type = #display
        
// table of medical history

  * item[+]
    * linkId = "medicalhistorysummary"
    * text = "Medical history summary"
      * extension[http://hl7.org/fhir/StructureDefinition/rendering-xhtml].valueString = "<div xmlns=\"http://www.w3.org/1999/xhtml\">
    <p>Medical history summary</p>
    <p style=\"font-size:0.9em; font-weight:normal\"><em>This section includes a list of existing items from the patient record. <br />Update these items here or update the patient record and repopulate the form. <br />Add new items at the bottom.</em></p>
    </div>"
    * type = #group 
    * item[+]
      * extension[https://smartforms.csiro.au/ig/StructureDefinition/GroupHideAddItemButton][+].valueBoolean = true
      * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl][+].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#gtable
      * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-itemPopulationContext][+].valueExpression
        * name = "ConditionRepeat"
        * language = #text/fhirpath
        * expression = "%Condition.entry.resource.where(verificationStatus.coding.all(code.empty() or code='confirmed'))"
      * extension[sdc-questionnaire-templateExtract][+]
        * extension[template][+].valueReference = Reference(ConditionPatchTemplate)
        * extension[TemplateExtractExtensionPatchRequestUrl][+].valueString = "'Condition/' + item.where(linkId='conditionId').answer.value"
      * linkId = "92bd7d05-9b5e-4cf9-900b-703f361dad9d"
      * text = "Medical history summary"
        * extension[+]
          * url = "https://smartforms.csiro.au/ig/StructureDefinition/QuestionnaireItemTextHidden"
          * valueBoolean = true
      * type = #group
      * repeats = true
      * item[+]
        * extension[questionnaire-hidden].valueBoolean = true
        * extension[sdc-questionnaire-initialExpression].valueExpression
          * language = #text/fhirpath
          * expression = "%ConditionRepeat.id"      
        * linkId = "conditionId"
        * type = #string
      * item[+]
        * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#autocomplete
        * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-width].valueQuantity = 40 '%'
        * extension[sdc-questionnaire-initialExpression].valueExpression
          * language = #text/fhirpath
          * expression = "%ConditionRepeat.code.select((coding.where(system='http://snomed.info/sct') | coding.where(system!='http://snomed.info/sct').first() | text ).first())"      
        * linkId = "59b1900a-4f85-4a8c-b9cd-3fe2fd76f27e"
        * text = "Condition"
        * type = #open-choice
        * answerValueSet = "#clinical-condition-1"
        * readOnly = true
      * item[+]
        * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#drop-down
        * extension[sdc-questionnaire-initialExpression].valueExpression
          * language = #text/fhirpath
          * expression = "%ConditionRepeat.clinicalStatus.coding"      
        * linkId = "88bcfad7-386b-4d87-b34b-2e50482e4d2c"
        * text = "Clinical status"
        * type = #choice
        * answerValueSet = "#ConditionClinicalStatusMinimal"
// This hidden item is used to determine the appropriate patch parameter parts for comment.
      * item[+]
        * extension[sdc-questionnaire-initialExpression].valueExpression
          * language = #text/fhirpath
          * expression = "%ConditionRepeat.clinicalStatus.coding" 
        * extension[questionnaire-hidden].valueBoolean = true             
        * linkId = "medicalhistory-status-hidden"
        * type = #choice
        * answerValueSet = "#ConditionClinicalStatusMinimal"
      * item[+]
        * extension[sdc-questionnaire-initialExpression].valueExpression
          * language = #text/fhirpath
          * expression = "%ConditionRepeat.onset.ofType(dateTime).toString().substring(0,10).toDate()"
        * linkId = "6ae641ad-95bb-4cdc-8910-5a52077e492c"
        * text = "Onset date"
        * type = #date
        * readOnly = true
      * item[+]
        * extension[sdc-questionnaire-initialExpression].valueExpression
          * language = #text/fhirpath
          * expression = "%ConditionRepeat.abatement.ofType(dateTime).toString().substring(0,10).toDate()"
        * linkId = "e4524654-f6de-4717-b288-34919394d46b"
        * text = "Abatement date"
        * type = #date
// This hidden item is used to determine the appropriate patch parameter parts for comment.
      * item[+]
        * extension[sdc-questionnaire-initialExpression].valueExpression
          * language = #text/fhirpath
          * expression = "%ConditionRepeat.abatement.ofType(dateTime).toString().substring(0,10).toDate()"
        * extension[questionnaire-hidden].valueBoolean = true
        * linkId = "medicalhistory-abatementdate-hidden"
        * type = #date

// table for new diagnoses
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#gtable
      * extension[sdc-questionnaire-templateExtract]
        * extension[template].valueReference = Reference(ConditionTemplate)
      * linkId = "newdiagnosis"
      * text = "New diagnosis"
        * extension[+]
          * url = "https://smartforms.csiro.au/ig/StructureDefinition/QuestionnaireItemTextHidden"
          * valueBoolean = true
      * type = #group
      * repeats = true
      * item[+]
        * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#autocomplete
        * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-width].valueQuantity = 35 '%'
        * linkId = "2da85994-2d5e-42f1-8a81-abf44f397468"
        * text = "Condition"
        * type = #open-choice
        * answerValueSet = "#clinical-condition-1"
      * item[+]
        * linkId = "4d55bffb-3286-4a23-a785-3b9c346d464d"
        * text = "Onset date"
        * type = #date
      * item[+]
        * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-width].valueQuantity = 45 '%'
        * linkId = "newdiagnosis-comment"
        * text = "Comment"
        * type = #string
      

  * item[+]
    * linkId = "62774152-8a6e-4449-af9f-87bdce8b9bf5"
    * text = "Health priorities, actions and follow-up"
    * type = #text
    * repeats = false

  * item[+]
    * linkId = "medicalhistory-section-end-divider"
    * text.extension[http://hl7.org/fhir/StructureDefinition/rendering-style].valueString = "border-top: 1px solid #ccc;"
    * type = #display
  * item[+]
    * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#radio-button
    * linkId = "MarkComplete-17"
    * text = "Section completion status"
    * type = #choice
    * repeats = false
    * answerOption[+].valueString = "Complete"
    * answerOption[+].valueString = "In progress"
    * answerOption[+].valueString = "Attention required"