Alias: $LNC = http://loinc.org
Alias: $SCT = http://snomed.info/sct
Alias: $UCUM = http://unitsofmeasure.org

Instance: MemoryAndThinking
InstanceOf: Questionnaire
Usage: #example
Title: "Aboriginal and Torres Strait Islander Health Check - Memory And Thinking"
Description: "Memory And Thinking sub-questionnaire for Aboriginal and Torres Strait Islander Health Check."

* contained[+] = YesNo

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

//R5 preadoption extensions
* extension[+]
  * url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-Questionnaire.versionAlgorithm[x]"
  * valueCoding
    * system = "http://hl7.org/fhir/version-algorithm"
    * code = #semver

* meta.profile[+] = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-render"
* meta.profile[+] = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-modular"
* url = "http://www.health.gov.au/assessments/mbs/715/MemoryAndThinking"
* name = "MemoryAndThinking"
* title = "Aboriginal and Torres Strait Islander Health Check - Memory And Thinking"
* status = #draft
* experimental = false
* subjectType[+] = #Patient
* date = "2025-03-14"
* jurisdiction.coding = urn:iso:std:iso:3166#AU

* item[+]
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression].valueExpression
    * language = #text/fhirpath
    * expression = "%age >= 50"
  * linkId = "1bd58e7b-2cb7-45fb-965f-d5fa33d0bb4c"
  * text = "Memory and thinking"
  * type = #group
  * repeats = false
  * item[+] //in-progress
    * extension[sdc-questionnaire-enableWhenExpression].valueExpression
      * language = #text/fhirpath
      * expression = "%resource.repeat(item).where(linkId='MarkComplete-18').answer.value = 'In progress' or %resource.repeat(item).where(linkId='MarkComplete-18').answer.value.empty()"
    * extension[questionnaire-itemControl].valueCodeableConcept = https://smartforms.csiro.au/ig/CodeSystem/QuestionnaireItemControlExtended#context-display
    * linkId = "CD-in-progress-18"
    * text = "In progress"
      * extension[http://hl7.org/fhir/StructureDefinition/rendering-xhtml].valueString = "<div title=\"In progress\" xmlns=\"http://www.w3.org/1999/xhtml\">\r\n\t<div style=\"display: flex; flex-direction: row;\">\r\n\t\t<img width='24' height='24' src='data:image/svg+xml;base64,\r\n\t\tPHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxZW0iIGhlaWdodD0iMWVtIiB2aWV3Qm94PSIwIDAgMjQgMjQiPjxwYXRoIGZpbGw9IiM3NTc1NzUiIGQ9Im0xNS44NCAxMC4ybC0xLjAxIDEuMDFsLTIuMDctMi4wM2wxLjAxLTEuMDJjLjItLjIxLjU0LS4yMi43OCAwbDEuMjkgMS4yNWMuMjEuMjEuMjIuNTUgMCAuNzlNOCAxMy45MWw0LjE3LTQuMTlsMi4wNyAyLjA4bC00LjE2IDQuMkg4di0yLjA5TTEzIDJ2MmM0LjM5LjU0IDcuNSA0LjUzIDYuOTYgOC45MkE4LjAxNCA4LjAxNCAwIDAgMSAxMyAxOS44OHYyYzUuNS0uNiA5LjQ1LTUuNTQgOC44NS0xMS4wM0MyMS4zMyA2LjE5IDE3LjY2IDIuNSAxMyAybS0yIDBjLTEuOTYuMTgtMy44MS45NS01LjMzIDIuMkw3LjEgNS43NGMxLjEyLS45IDIuNDctMS40OCAzLjktMS42OHYtMk00LjI2IDUuNjdBOS44MSA5LjgxIDAgMCAwIDIuMDUgMTFoMmMuMTktMS40Mi43NS0yLjc3IDEuNjQtMy45TDQuMjYgNS42N00yLjA2IDEzYy4yIDEuOTYuOTcgMy44MSAyLjIxIDUuMzNsMS40Mi0xLjQzQTguMDAyIDguMDAyIDAgMCAxIDQuMDYgMTNoLTJtNSA1LjM3bC0xLjM5IDEuMzdBOS45OTQgOS45OTQgMCAwIDAgMTEgMjJ2LTJhOC4wMDIgOC4wMDIgMCAwIDEtMy45LTEuNjNoLS4wNFoiLz48L3N2Zz4=' \r\n\t\tstyle=\"align-self: center;\"/>\r\n\t</div>\r\n</div>" 
    * type = #display
  * item[+] //complete
    * extension[sdc-questionnaire-enableWhenExpression].valueExpression
      * language = #text/fhirpath
      * expression = "%resource.repeat(item).where(linkId='MarkComplete-18').answer.value = 'Complete'"
    * extension[questionnaire-itemControl].valueCodeableConcept = https://smartforms.csiro.au/ig/CodeSystem/QuestionnaireItemControlExtended#context-display
    * linkId = "CD-complete-18"
    * text = "Complete"
      * extension[http://hl7.org/fhir/StructureDefinition/rendering-xhtml].valueString = "<div title=\"Complete\" xmlns=\"http://www.w3.org/1999/xhtml\">\r\n\t<div style=\"display: flex; flex-direction: row;\">\r\n\t\t<img width='24' height='24' src='data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxZW0iIGhlaWdodD0iMWVtIiB2aWV3Qm94PSIwIDAgMjQgMjQiPjxwYXRoIGZpbGw9IiMyZTdkMzIiIGQ9Ik0yMCAxMmE4IDggMCAwIDEtOCA4YTggOCAwIDAgMS04LThhOCA4IDAgMCAxIDgtOGMuNzYgMCAxLjUuMTEgMi4yLjMxbDEuNTctMS41N0E5LjgyMiA5LjgyMiAwIDAgMCAxMiAyQTEwIDEwIDAgMCAwIDIgMTJhMTAgMTAgMCAwIDAgMTAgMTBhMTAgMTAgMCAwIDAgMTAtMTBNNy45MSAxMC4wOEw2LjUgMTEuNUwxMSAxNkwyMSA2bC0xLjQxLTEuNDJMMTEgMTMuMTdsLTMuMDktMy4wOVoiLz48L3N2Zz4='\r\n\t\tstyle=\"align-self: center;\"/>\r\n\t</div>\r\n</div>"
    * type = #display
  * item[+] //attention
    * extension[sdc-questionnaire-enableWhenExpression].valueExpression
      * language = #text/fhirpath
      * expression = "%resource.repeat(item).where(linkId='MarkComplete-18').answer.value = 'Attention required'"
    * extension[questionnaire-itemControl].valueCodeableConcept = https://smartforms.csiro.au/ig/CodeSystem/QuestionnaireItemControlExtended#context-display
    * linkId = "CD-attention-18"
    * text = "Attention required"
      * extension[http://hl7.org/fhir/StructureDefinition/rendering-xhtml].valueString = "<div title=\"Attention required\" xmlns=\"http://www.w3.org/1999/xhtml\">\r\n\t<div style=\"display: flex; flex-direction: row;\">\r\n\t\t<img width='24' height='24' src='data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAxMDAgMTAwIj48Y2lyY2xlIGN4PSI1MCIgY3k9IjUwIiByPSI0MiIgZmlsbD0ibm9uZSIgc3Ryb2tlPSIjRkZD MTA3IiBzdHJva2Utd2lkdGg9IjgiLz48bGluZSB4MT0iNTAiIHkxPSIyOCIgeDI9IjUwIiB5Mj0iNjAiIHN0cm9rZT0iI0ZGQzEwNyIgc3Ryb2tlLXdpZHRoPSI4Ii8+PGNpcmNsZSBjeD0iNTAiIGN5PSI3NCIgcj0iNSIgZmlsbD0iI0ZGQzEwNyIvPjwvc3ZnPg=='\r\n\t\tstyle=\"align-self: center;\"/>\r\n\t</div>\r\n</div>"
    * type = #display
  * item[+]
    * linkId = "64fd0c95-b57b-4319-bf40-ad77d10a9832"
    * text = "Personal concerns about your memory or thinking"
    * type = #group
    * repeats = false
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#radio-button
      * extension[questionnaire-choiceOrientation].valueCode = #horizontal
      * linkId = "e29701be-2b79-471d-a42e-7e3830459080"
      * text = "Do you have any worries about your memory or thinking?"
      * type = #choice
      * repeats = false
      * answerValueSet = "#YesNo"
    * item[+]
      * linkId = "69985e2e-4619-42fa-a111-e6fb3118ef74"
      * text = "Details"
      * type = #text
      * repeats = false
      * enableWhen[+]
        * question = "e29701be-2b79-471d-a42e-7e3830459080"
        * operator = #=
        * answerCoding = http://terminology.hl7.org/CodeSystem/v2-0136#Y 
  * item[+]
    * linkId = "44da9ba8-4636-4eaa-8bb1-aaa65f117fab"
    * text = "Family concerns about your memory or thinking"
    * type = #group
    * repeats = false
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#radio-button
      * extension[questionnaire-choiceOrientation].valueCode = #horizontal
      * linkId = "06a67326-9e3d-4c4c-b271-af5b168d077c"
      * text = "Does anyone in your family have any worries about your memory or thinking?"
      * type = #choice
      * repeats = false
      * answerValueSet = "#YesNo"
    * item[+]
      * linkId = "43d2cb6c-29a7-4293-a6c8-87a228a82e19"
      * text = "Details"
      * type = #text
      * repeats = false
      * enableWhen[+]
        * question = "06a67326-9e3d-4c4c-b271-af5b168d077c"
        * operator = #=
        * answerCoding = http://terminology.hl7.org/CodeSystem/v2-0136#Y
  * item[+]
    * extension[http://hl7.org/fhir/StructureDefinition/entryFormat].valueString = "Details"
    * linkId = "4ebb3c30-936b-4932-a330-f1e643b5ccd4"
    * text = "If any concerns are raised and/or high risk for cognitive impairment identified, follow up with cognitive screening (eg clock test, GPCOG, KICA-Cog, MMSE)"
    * type = #text
    * repeats = false


  * item[+]
    * linkId = "1f0e7fde-e964-4f36-9151-dbdc5e145f94"
    * text = "Health priorities, actions and follow-up"
    * type = #text
    * repeats = false

  
  * item[+]
    * linkId = "memorythinking-section-end-divider"
    * text.extension[http://hl7.org/fhir/StructureDefinition/rendering-style].valueString = "border-top: 1px solid #ccc;"
    * type = #display
  * item[+]
    * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#radio-button
    * linkId = "MarkComplete-18"
    * text = "Section completion status"
    * type = #choice
    * repeats = false
    * answerOption[+].valueString = "Complete"
    * answerOption[+].valueString = "In progress"
    * answerOption[+].valueString = "Attention required"
