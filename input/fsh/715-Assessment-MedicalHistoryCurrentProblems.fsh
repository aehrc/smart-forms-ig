Alias: $LNC = http://loinc.org
Alias: $SCT = http://snomed.info/sct
Alias: $UCUM = http://unitsofmeasure.org

Instance: MedicalHistoryCurrentProblems
InstanceOf: Questionnaire
Usage: #example
Title: "Aboriginal and Torres Strait Islander Health Check - Medical History"
Description: "Medical History sub-questionnaire for Aboriginal and Torres Strait Islander Health Check."

* contained[+] = condition-clinical
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
    * extension[questionnaire-itemControl].valueCodeableConcept = https://smartforms.csiro.au/ig/CodeSystem/QuestionnaireItemControlExtended#context-display    
    * linkId = "CD-in-progress-17"
    * text = "In progress"
      * extension[http://hl7.org/fhir/StructureDefinition/rendering-xhtml].valueString = "<div title=\"In progress\" xmlns=\"http://www.w3.org/1999/xhtml\">\r\n\t<div style=\"display: flex; flex-direction: row;\">\r\n\t\t<img width='24' height='24' src='data:image/svg+xml;base64,\r\n\t\tPHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxZW0iIGhlaWdodD0iMWVtIiB2aWV3Qm94PSIwIDAgMjQgMjQiPjxwYXRoIGZpbGw9IiM3NTc1NzUiIGQ9Im0xNS44NCAxMC4ybC0xLjAxIDEuMDFsLTIuMDctMi4wM2wxLjAxLTEuMDJjLjItLjIxLjU0LS4yMi43OCAwbDEuMjkgMS4yNWMuMjEuMjEuMjIuNTUgMCAuNzlNOCAxMy45MWw0LjE3LTQuMTlsMi4wNyAyLjA4bC00LjE2IDQuMkg4di0yLjA5TTEzIDJ2MmM0LjM5LjU0IDcuNSA0LjUzIDYuOTYgOC45MkE4LjAxNCA4LjAxNCAwIDAgMSAxMyAxOS44OHYyYzUuNS0uNiA5LjQ1LTUuNTQgOC44NS0xMS4wM0MyMS4zMyA2LjE5IDE3LjY2IDIuNSAxMyAybS0yIDBjLTEuOTYuMTgtMy44MS45NS01LjMzIDIuMkw3LjEgNS43NGMxLjEyLS45IDIuNDctMS40OCAzLjktMS42OHYtMk00LjI2IDUuNjdBOS44MSA5LjgxIDAgMCAwIDIuMDUgMTFoMmMuMTktMS40Mi43NS0yLjc3IDEuNjQtMy45TDQuMjYgNS42N00yLjA2IDEzYy4yIDEuOTYuOTcgMy44MSAyLjIxIDUuMzNsMS40Mi0xLjQzQTguMDAyIDguMDAyIDAgMCAxIDQuMDYgMTNoLTJtNSA1LjM3bC0xLjM5IDEuMzdBOS45OTQgOS45OTQgMCAwIDAgMTEgMjJ2LTJhOC4wMDIgOC4wMDIgMCAwIDEtMy45LTEuNjNoLS4wNFoiLz48L3N2Zz4=' \r\n\t\tstyle=\"align-self: center;\"/>\r\n\t</div>\r\n</div>" 
    * type = #display
    * enableWhen[+]
      * question = "MarkComplete-17" // Section complete item
      * operator = #!=
      * answerBoolean = true  
  * item[+] //complete
    * extension[questionnaire-itemControl].valueCodeableConcept = https://smartforms.csiro.au/ig/CodeSystem/QuestionnaireItemControlExtended#context-display
    * linkId = "CD-complete-17"
    * text = "Complete"
      * extension[http://hl7.org/fhir/StructureDefinition/rendering-xhtml].valueString = "<div title=\"Section completed\" xmlns=\"http://www.w3.org/1999/xhtml\">\r\n\t<div style=\"display: flex; flex-direction: row;\">\r\n\t\t<img width='24' height='24' src='data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxZW0iIGhlaWdodD0iMWVtIiB2aWV3Qm94PSIwIDAgMjQgMjQiPjxwYXRoIGZpbGw9IiMyZTdkMzIiIGQ9Ik0yMCAxMmE4IDggMCAwIDEtOCA4YTggOCAwIDAgMS04LThhOCA4IDAgMCAxIDgtOGMuNzYgMCAxLjUuMTEgMi4yLjMxbDEuNTctMS41N0E5LjgyMiA5LjgyMiAwIDAgMCAxMiAyQTEwIDEwIDAgMCAwIDIgMTJhMTAgMTAgMCAwIDAgMTAgMTBhMTAgMTAgMCAwIDAgMTAtMTBNNy45MSAxMC4wOEw2LjUgMTEuNUwxMSAxNkwyMSA2bC0xLjQxLTEuNDJMMTEgMTMuMTdsLTMuMDktMy4wOVoiLz48L3N2Zz4='\r\n\t\tstyle=\"align-self: center;\"/>\r\n\t</div>\r\n</div>"
    * type = #display
    * enableWhen[+]
      * question = "MarkComplete-17" // Section complete item
      * operator = #=
      * answerBoolean = true
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
      * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl][+].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#gtable
      * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-itemPopulationContext][+].valueExpression
        * name = "ConditionRepeat"
        * language = #text/fhirpath
        * expression = "%Condition.entry.resource.where(verificationStatus.coding.all(code.empty() or code='confirmed'))"
      * extension[TemplateExtractExtensionExtended][+]
        * extension[template][+].valueReference = Reference(ConditionPatchTemplate)
        * extension[resourceId][+].valueString = "item.where(linkId='conditionId').answer.value"
        * extension[type][+].valueCode = #Condition
      * linkId = "92bd7d05-9b5e-4cf9-900b-703f361dad9d"
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
        * answerValueSet = "#condition-clinical"
      * item[+]
        * extension[sdc-questionnaire-initialExpression].valueExpression
          * language = #text/fhirpath
          * expression = "%ConditionRepeat.onset.ofType(dateTime).toDate()"
        * linkId = "6ae641ad-95bb-4cdc-8910-5a52077e492c"
        * text = "Onset date"
        * type = #date
        * readOnly = true
      * item[+]
        * extension[sdc-questionnaire-initialExpression].valueExpression
          * language = #text/fhirpath
          * expression = "%ConditionRepeat.abatement.ofType(dateTime).toDate()"
        * linkId = "e4524654-f6de-4717-b288-34919394d46b"
        * text = "Abatement date"
        * type = #date

// table for new diagnoses
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#gtable
      * extension[sdc-questionnaire-templateExtract]
        * extension[template].valueReference = Reference(ConditionTemplate)
      * linkId = "newdiagnosis"
      * type = #group
      * repeats = true
      * item[+]
        * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#autocomplete
        * linkId = "2da85994-2d5e-42f1-8a81-abf44f397468"
        * text = "Condition"
        * type = #open-choice
        * answerValueSet = "#clinical-condition-1"
      * item[+]
        * linkId = "4d55bffb-3286-4a23-a785-3b9c346d464d"
        * text = "Onset date"
        * type = #date
      * item[+]
        * linkId = "newdiagnosis-comment"
        * text = "Comment"
        * type = #string
      

  * item[+]
    * linkId = "62774152-8a6e-4449-af9f-87bdce8b9bf5"
    * text = "Health priorities, actions and follow-up"
    * type = #text
    * repeats = false

  * item[+]
    * linkId = "MarkComplete-17"
    * text = "Mark section as complete"
      * extension[http://hl7.org/fhir/StructureDefinition/rendering-xhtml].valueString = "<div xmlns=\"http://www.w3.org/1999/xhtml\">\r\n<head>\r\n    <style type=\"text/css\">\r\n        .alert {\r\n            padding: 0.875rem;\r\n            margin-bottom: 1rem;\r\n            font-size: 0.875rem;\r\n            color: #29712D;\r\n            border-radius: 0.5rem;\r\n            background-color: #D9E8DA;\r\n            font-weight: 700;\r\n        max-width: 205px;\r\n        }\r\n    </style>\r\n</head>\r\n<body>\r\n<div class=\"alert\">Mark section as complete</div>\r\n</body>\r\n</div>"
    * type = #boolean
    * repeats = false
