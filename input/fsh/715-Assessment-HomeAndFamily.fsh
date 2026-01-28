Alias: $LNC = http://loinc.org
Alias: $SCT = http://snomed.info/sct
Alias: $UCUM = http://unitsofmeasure.org

Instance: HomeAndFamily
InstanceOf: Questionnaire
Usage: #example
Title: "Aboriginal and Torres Strait Islander Health Check - Home And Family"
Description: "Home And Family sub-questionnaire for Aboriginal and Torres Strait Islander Health Check."

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
* url = "http://www.health.gov.au/assessments/mbs/715/HomeAndFamily"
* name = "HomeAndFamily"
* title = "Aboriginal and Torres Strait Islander Health Check - Home And Family"
* status = #draft
* experimental = false
* subjectType[+] = #Patient
* date = "2025-03-14"
* jurisdiction.coding = urn:iso:std:iso:3166#AU

// for adolescents and up
* item[+]
  * extension[sdc-questionnaire-enableWhenExpression].valueExpression
    * language = #text/fhirpath
    * expression = "%age > 12"
  * linkId = "819b3305-bf93-4502-9986-242ea2ae5f43"
  * text = "Home and family"
  * type = #group
  * repeats = false
  * item[+] //in-progress
    * extension[sdc-questionnaire-enableWhenExpression].valueExpression
      * language = #text/fhirpath
      * expression = "%resource.repeat(item).where(linkId='MarkComplete-12').answer.value = 'In progress' or %resource.repeat(item).where(linkId='MarkComplete-12').answer.value.empty()"
    * extension[questionnaire-itemControl].valueCodeableConcept = QuestionnaireItemControlExtended#context-display
    * linkId = "CD-in-progress-12"
    * text = "In progress"
      * extension[http://hl7.org/fhir/StructureDefinition/rendering-xhtml].valueString = "<div title=\"In progress\" xmlns=\"http://www.w3.org/1999/xhtml\">\r\n\t<div style=\"display: flex; flex-direction: row;\">\r\n\t\t<img width='24' height='24' src='data:image/svg+xml;base64,\r\n\t\tPHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxZW0iIGhlaWdodD0iMWVtIiB2aWV3Qm94PSIwIDAgMjQgMjQiPjxwYXRoIGZpbGw9IiM3NTc1NzUiIGQ9Im0xNS44NCAxMC4ybC0xLjAxIDEuMDFsLTIuMDctMi4wM2wxLjAxLTEuMDJjLjItLjIxLjU0LS4yMi43OCAwbDEuMjkgMS4yNWMuMjEuMjEuMjIuNTUgMCAuNzlNOCAxMy45MWw0LjE3LTQuMTlsMi4wNyAyLjA4bC00LjE2IDQuMkg4di0yLjA5TTEzIDJ2MmM0LjM5LjU0IDcuNSA0LjUzIDYuOTYgOC45MkE4LjAxNCA4LjAxNCAwIDAgMSAxMyAxOS44OHYyYzUuNS0uNiA5LjQ1LTUuNTQgOC44NS0xMS4wM0MyMS4zMyA2LjE5IDE3LjY2IDIuNSAxMyAybS0yIDBjLTEuOTYuMTgtMy44MS45NS01LjMzIDIuMkw3LjEgNS43NGMxLjEyLS45IDIuNDctMS40OCAzLjktMS42OHYtMk00LjI2IDUuNjdBOS44MSA5LjgxIDAgMCAwIDIuMDUgMTFoMmMuMTktMS40Mi43NS0yLjc3IDEuNjQtMy45TDQuMjYgNS42N00yLjA2IDEzYy4yIDEuOTYuOTcgMy44MSAyLjIxIDUuMzNsMS40Mi0xLjQzQTguMDAyIDguMDAyIDAgMCAxIDQuMDYgMTNoLTJtNSA1LjM3bC0xLjM5IDEuMzdBOS45OTQgOS45OTQgMCAwIDAgMTEgMjJ2LTJhOC4wMDIgOC4wMDIgMCAwIDEtMy45LTEuNjNoLS4wNFoiLz48L3N2Zz4=' \r\n\t\tstyle=\"align-self: center;\"/>\r\n\t</div>\r\n</div>" 
    * type = #display
  * item[+] //complete
    * extension[sdc-questionnaire-enableWhenExpression].valueExpression
      * language = #text/fhirpath
      * expression = "%resource.repeat(item).where(linkId='MarkComplete-12').answer.value = 'Complete'"
    * extension[questionnaire-itemControl].valueCodeableConcept = QuestionnaireItemControlExtended#context-display
    * linkId = "CD-complete-12"
    * text = "Complete"
      * extension[http://hl7.org/fhir/StructureDefinition/rendering-xhtml].valueString = "<div title=\"Complete\" xmlns=\"http://www.w3.org/1999/xhtml\">\r\n\t<div style=\"display: flex; flex-direction: row;\">\r\n\t\t<img width='24' height='24' src='data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxZW0iIGhlaWdodD0iMWVtIiB2aWV3Qm94PSIwIDAgMjQgMjQiPjxwYXRoIGZpbGw9IiMyZTdkMzIiIGQ9Ik0yMCAxMmE4IDggMCAwIDEtOCA4YTggOCAwIDAgMS04LThhOCA4IDAgMCAxIDgtOGMuNzYgMCAxLjUuMTEgMi4yLjMxbDEuNTctMS41N0E5LjgyMiA5LjgyMiAwIDAgMCAxMiAyQTEwIDEwIDAgMCAwIDIgMTJhMTAgMTAgMCAwIDAgMTAgMTBhMTAgMTAgMCAwIDAgMTAtMTBNNy45MSAxMC4wOEw2LjUgMTEuNUwxMSAxNkwyMSA2bC0xLjQxLTEuNDJMMTEgMTMuMTdsLTMuMDktMy4wOVoiLz48L3N2Zz4='\r\n\t\tstyle=\"align-self: center;\"/>\r\n\t</div>\r\n</div>"
    * type = #display
  * item[+] //attention
    * extension[sdc-questionnaire-enableWhenExpression].valueExpression
      * language = #text/fhirpath
      * expression = "%resource.repeat(item).where(linkId='MarkComplete-12').answer.value = 'Attention required'"
    * extension[questionnaire-itemControl].valueCodeableConcept = QuestionnaireItemControlExtended#context-display
    * linkId = "CD-attention-12"
    * text = "Attention required"
      * extension[http://hl7.org/fhir/StructureDefinition/rendering-xhtml].valueString = "<div title=\"Attention required\" xmlns=\"http://www.w3.org/1999/xhtml\">\r\n\t<div style=\"display: flex; flex-direction: row;\">\r\n\t\t<img width='24' height='24' src='data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAxMDAgMTAwIj48Y2lyY2xlIGN4PSI1MCIgY3k9IjUwIiByPSI0MiIgZmlsbD0ibm9uZSIgc3Ryb2tlPSIjRkY4QzAwIiBzdHJva2Utd2lkdGg9IjkiLz48bGluZSB4MT0iNTAiIHkxPSIyOCIgeDI9IjUwIiB5Mj0iNjAiIHN0cm9rZT0iI0ZGOEMwMCIgc3Ryb2tlLXdpZHRoPSI5Ii8+PGNpcmNsZSBjeD0iNTAiIGN5PSI3NCIgcj0iNSIgZmlsbD0iI0ZGOEMwMCIvPjwvc3ZnPg=='\r\n\t\tstyle=\"align-self: center;\"/>\r\n\t</div>\r\n</div>"
    * type = #display
  * item[+]
    * extension[http://hl7.org/fhir/StructureDefinition/entryFormat].valueString = "Details"
    * linkId = "29bb209f-6dfc-4ed0-8b8d-741016c0ac61"
    * text = "Who do you live with?"
    * type = #text
    * repeats = false
  * item[+]
    * linkId = "64b979b6-cfc1-4024-868c-94e7be90d12b"
    * text = "Housing stability"
    * type = #group
    * repeats = false
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#radio-button
      * extension[questionnaire-choiceOrientation].valueCode = #horizontal
      * linkId = "a7542da8-aad6-4a80-8b5b-806ca11d68d2"
      * text = "Do you have stable housing?"
      * type = #choice
      * repeats = false
      * answerValueSet = "#YesNo"
    * item[+]
      * linkId = "476dae02-d0e8-4128-81a1-7ad71dd06e97"
      * text = "Details"
      * type = #text
      * repeats = false
      * enableWhen[+]
        * question = "a7542da8-aad6-4a80-8b5b-806ca11d68d2"
        * operator = #=
        * answerCoding = http://terminology.hl7.org/CodeSystem/v2-0136#N
  * item[+]
    * linkId = "367ac5dd-07fa-4bda-a775-d9f38b15affd"
    * text = "Home safety"
    * type = #group
    * repeats = false
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#radio-button
      * extension[questionnaire-choiceOrientation].valueCode = #horizontal
      * linkId = "6f73d1ee-dd8e-419a-9142-ede367200e3b"
      * text = "Do you feel safe at home?"
      * type = #choice
      * repeats = false
      * answerValueSet = "#YesNo"
    * item[+]
      * linkId = "9bd5f571-8cbf-4c25-975c-5fc8395b75f5"
      * text = "Details"
      * type = #text
      * repeats = false
      * enableWhen[+]
        * question = "6f73d1ee-dd8e-419a-9142-ede367200e3b"
        * operator = #=
        * answerCoding = http://terminology.hl7.org/CodeSystem/v2-0136#N

  * item[+]
    * linkId = "08d2e80e-3bb4-4f67-8b1c-090b1ace225a"
    * text = "Health priorities, actions and follow-up"
    * type = #text
    * repeats = false

  * item[+]
    * linkId = "homeandfamily-section-end-divider"
    * text.extension[http://hl7.org/fhir/StructureDefinition/rendering-xhtml].valueString = "<div xmlns=\"http://www.w3.org/1999/xhtml\" style=\"border-top: 1px solid #ccc;\"></div>"
    * type = #display
  * item[+]
    * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#radio-button
    * linkId = "MarkComplete-12"
    * text = "Section completion status"
    * type = #choice
    * repeats = false
    * answerOption[+].valueString = "Complete"
      * extension[http://hl7.org/fhir/StructureDefinition/rendering-xhtml].valueString = "<div xmlns=\"http://www.w3.org/1999/xhtml\">\r\n\t<div style=\"display: flex; flex-direction: row;\">Complete&nbsp;\r\n\t\t<img width='19' height='19' src='data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxZW0iIGhlaWdodD0iMWVtIiB2aWV3Qm94PSIwIDAgMjQgMjQiPjxwYXRoIGZpbGw9IiMyZTdkMzIiIGQ9Ik0yMCAxMmE4IDggMCAwIDEtOCA4YTggOCAwIDAgMS04LThhOCA4IDAgMCAxIDgtOGMuNzYgMCAxLjUuMTEgMi4yLjMxbDEuNTctMS41N0E5LjgyMiA5LjgyMiAwIDAgMCAxMiAyQTEwIDEwIDAgMCAwIDIgMTJhMTAgMTAgMCAwIDAgMTAgMTBhMTAgMTAgMCAwIDAgMTAtMTBNNy45MSAxMC4wOEw2LjUgMTEuNUwxMSAxNkwyMSA2bC0xLjQxLTEuNDJMMTEgMTMuMTdsLTMuMDktMy4wOVoiLz48L3N2Zz4='\r\n\t\tstyle=\"align-self: center;\"/>\r\n\t</div>\r\n</div>"
    * answerOption[+].valueString = "In progress"      
      * extension[http://hl7.org/fhir/StructureDefinition/rendering-xhtml].valueString = "<div xmlns=\"http://www.w3.org/1999/xhtml\">\r\n\t<div style=\"display: flex; flex-direction: row;\">In progress&nbsp;\r\n\t\t<img width='20' height='20' src='data:image/svg+xml;base64,\r\n\t\tPHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxZW0iIGhlaWdodD0iMWVtIiB2aWV3Qm94PSIwIDAgMjQgMjQiPjxwYXRoIGZpbGw9IiM3NTc1NzUiIGQ9Im0xNS44NCAxMC4ybC0xLjAxIDEuMDFsLTIuMDctMi4wM2wxLjAxLTEuMDJjLjItLjIxLjU0LS4yMi43OCAwbDEuMjkgMS4yNWMuMjEuMjEuMjIuNTUgMCAuNzlNOCAxMy45MWw0LjE3LTQuMTlsMi4wNyAyLjA4bC00LjE2IDQuMkg4di0yLjA5TTEzIDJ2MmM0LjM5LjU0IDcuNSA0LjUzIDYuOTYgOC45MkE4LjAxNCA4LjAxNCAwIDAgMSAxMyAxOS44OHYyYzUuNS0uNiA5LjQ1LTUuNTQgOC44NS0xMS4wM0MyMS4zMyA2LjE5IDE3LjY2IDIuNSAxMyAybS0yIDBjLTEuOTYuMTgtMy44MS45NS01LjMzIDIuMkw3LjEgNS43NGMxLjEyLS45IDIuNDctMS40OCAzLjktMS42OHYtMk00LjI2IDUuNjdBOS44MSA5LjgxIDAgMCAwIDIuMDUgMTFoMmMuMTktMS40Mi43NS0yLjc3IDEuNjQtMy45TDQuMjYgNS42N00yLjA2IDEzYy4yIDEuOTYuOTcgMy44MSAyLjIxIDUuMzNsMS40Mi0xLjQzQTguMDAyIDguMDAyIDAgMCAxIDQuMDYgMTNoLTJtNSA1LjM3bC0xLjM5IDEuMzdBOS45OTQgOS45OTQgMCAwIDAgMTEgMjJ2LTJhOC4wMDIgOC4wMDIgMCAwIDEtMy45LTEuNjNoLS4wNFoiLz48L3N2Zz4=' \r\n\t\tstyle=\"align-self: center;\"/>\r\n\t</div>\r\n</div>"
    * answerOption[+].valueString = "Attention required"
      * extension[http://hl7.org/fhir/StructureDefinition/rendering-xhtml].valueString = "<div xmlns=\"http://www.w3.org/1999/xhtml\">\r\n\t<div style=\"display: flex; flex-direction: row;\">Attention required&nbsp;\r\n\t\t<img width='19' height='19' src='data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAxMDAgMTAwIj48Y2lyY2xlIGN4PSI1MCIgY3k9IjUwIiByPSI0MiIgZmlsbD0ibm9uZSIgc3Ryb2tlPSIjRkY4QzAwIiBzdHJva2Utd2lkdGg9IjkiLz48bGluZSB4MT0iNTAiIHkxPSIyOCIgeDI9IjUwIiB5Mj0iNjAiIHN0cm9rZT0iI0ZGOEMwMCIgc3Ryb2tlLXdpZHRoPSI5Ii8+PGNpcmNsZSBjeD0iNTAiIGN5PSI3NCIgcj0iNSIgZmlsbD0iI0ZGOEMwMCIvPjwvc3ZnPg=='\r\n\t\tstyle=\"align-self: center;\"/>\r\n\t</div>\r\n</div>"
