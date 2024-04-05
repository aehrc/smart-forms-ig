Alias: $LNC = http://loinc.org
Alias: $SCT = http://snomed.info/sct
Alias: $UCUM = http://unitsofmeasure.org

Instance: EyeHealth
InstanceOf: Questionnaire
Usage: #definition
Title: "Aboriginal and Torres Strait Islander Health Check - Eye Health"
Description: "Eye Health sub-questionnaire for Aboriginal and Torres Strait Islander Health Check."

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
    
//assemble context
* extension[+]
  * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-assembleContext"
  * valueString = "age"

* meta.profile[+] = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-render"
* meta.profile[+] = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-modular"
* meta.profile[+] = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-pop-exp"
* url = "http://www.health.gov.au/assessments/mbs/715/EyeHealth"
* name = "EyeHealth"
* title = "Aboriginal and Torres Strait Islander Health Check - Eye Health"
* status = #draft
* experimental = false
* subjectType[+] = #Patient
* date = "2024-04-02"
* jurisdiction.coding = urn:iso:std:iso:3166#AU

* item[+]
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression].valueExpression
    * language = #text/fhirpath
    * expression = "%age.exists()"
  * linkId = "961da481-1698-4a1d-962b-a9c2185e335a"
  * text = "Eye health"
  * type = #group
  * repeats = false
  * item[+] //in-progress
    * extension[questionnaire-itemControl].valueCodeableConcept = https://smartforms.csiro.au/ig/CodeSystem/QuestionnaireItemControlExtended#context-display    
    * linkId = "CD-in-progress-8"
    * text = "In progress"
      * extension[http://hl7.org/fhir/StructureDefinition/rendering-xhtml].valueString = "<div title=\"In progress\" xmlns=\"http://www.w3.org/1999/xhtml\">\r\n\t<div style=\"display: flex; flex-direction: row;\">\r\n\t\t<img width='24' height='24' src='data:image/svg+xml;base64,\r\n\t\tPHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxZW0iIGhlaWdodD0iMWVtIiB2aWV3Qm94PSIwIDAgMjQgMjQiPjxwYXRoIGZpbGw9IiM3NTc1NzUiIGQ9Im0xNS44NCAxMC4ybC0xLjAxIDEuMDFsLTIuMDctMi4wM2wxLjAxLTEuMDJjLjItLjIxLjU0LS4yMi43OCAwbDEuMjkgMS4yNWMuMjEuMjEuMjIuNTUgMCAuNzlNOCAxMy45MWw0LjE3LTQuMTlsMi4wNyAyLjA4bC00LjE2IDQuMkg4di0yLjA5TTEzIDJ2MmM0LjM5LjU0IDcuNSA0LjUzIDYuOTYgOC45MkE4LjAxNCA4LjAxNCAwIDAgMSAxMyAxOS44OHYyYzUuNS0uNiA5LjQ1LTUuNTQgOC44NS0xMS4wM0MyMS4zMyA2LjE5IDE3LjY2IDIuNSAxMyAybS0yIDBjLTEuOTYuMTgtMy44MS45NS01LjMzIDIuMkw3LjEgNS43NGMxLjEyLS45IDIuNDctMS40OCAzLjktMS42OHYtMk00LjI2IDUuNjdBOS44MSA5LjgxIDAgMCAwIDIuMDUgMTFoMmMuMTktMS40Mi43NS0yLjc3IDEuNjQtMy45TDQuMjYgNS42N00yLjA2IDEzYy4yIDEuOTYuOTcgMy44MSAyLjIxIDUuMzNsMS40Mi0xLjQzQTguMDAyIDguMDAyIDAgMCAxIDQuMDYgMTNoLTJtNSA1LjM3bC0xLjM5IDEuMzdBOS45OTQgOS45OTQgMCAwIDAgMTEgMjJ2LTJhOC4wMDIgOC4wMDIgMCAwIDEtMy45LTEuNjNoLS4wNFoiLz48L3N2Zz4=' \r\n\t\tstyle=\"align-self: center;\"/>\r\n\t</div>\r\n</div>" 
    * type = #display
    * enableWhen[+]
      * question = "MarkComplete-8" // Section complete item
      * operator = #!=
      * answerBoolean = true  
  * item[+] //complete
    * extension[questionnaire-itemControl].valueCodeableConcept = https://smartforms.csiro.au/ig/CodeSystem/QuestionnaireItemControlExtended#context-display
    * linkId = "CD-complete-8"
    * text = "Complete"
      * extension[http://hl7.org/fhir/StructureDefinition/rendering-xhtml].valueString = "<div title=\"Section completed\" xmlns=\"http://www.w3.org/1999/xhtml\">\r\n\t<div style=\"display: flex; flex-direction: row;\">\r\n\t\t<img width='24' height='24' src='data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxZW0iIGhlaWdodD0iMWVtIiB2aWV3Qm94PSIwIDAgMjQgMjQiPjxwYXRoIGZpbGw9IiMyZTdkMzIiIGQ9Ik0yMCAxMmE4IDggMCAwIDEtOCA4YTggOCAwIDAgMS04LThhOCA4IDAgMCAxIDgtOGMuNzYgMCAxLjUuMTEgMi4yLjMxbDEuNTctMS41N0E5LjgyMiA5LjgyMiAwIDAgMCAxMiAyQTEwIDEwIDAgMCAwIDIgMTJhMTAgMTAgMCAwIDAgMTAgMTBhMTAgMTAgMCAwIDAgMTAtMTBNNy45MSAxMC4wOEw2LjUgMTEuNUwxMSAxNkwyMSA2bC0xLjQxLTEuNDJMMTEgMTMuMTdsLTMuMDktMy4wOVoiLz48L3N2Zz4='\r\n\t\tstyle=\"align-self: center;\"/>\r\n\t</div>\r\n</div>"
    * type = #display
    * enableWhen[+]
      * question = "MarkComplete-8" // Section complete item
      * operator = #=
      * answerBoolean = true
  * item[+]
    * linkId = "0e30de87-8d5a-4b7a-893a-f1791c4f31c5"
    * text = "Vision concerns"
    * type = #group
    * repeats = false
    * item[+]
      * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression].valueExpression
        * language = #text/fhirpath
        * expression = "%age <= 12"
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#radio-button
      * extension[questionnaire-choiceOrientation].valueCode = #horizontal
      * linkId = "bc49ee24-62a8-4252-a5ee-9c68bfed601c"
      * text = "Is there anything that you are worried about with your child's vision?"
      * type = #choice
      * repeats = false
      * answerValueSet = "#YesNo"
    * item[+]
      * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression].valueExpression
        * language = #text/fhirpath
        * expression = "%age > 12"
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#radio-button
      * extension[questionnaire-choiceOrientation].valueCode = #horizontal
      * linkId = "6286346d-c805-4519-8e82-bf364a215c58"
      * text = "Is there anything that you are worried about with your vision?"
      * type = #choice
      * repeats = false
      * answerValueSet = "#YesNo"
    * item[+]
      * linkId = "468770e4-af95-4377-8af5-280deb585e01"
      * text = "Details"
      * type = #text
      * repeats = false
      * enableWhen[+]
        * question = "bc49ee24-62a8-4252-a5ee-9c68bfed601c"
        * operator = #=
        * answerCoding = http://terminology.hl7.org/CodeSystem/v2-0136#Y
      * enableWhen[+]
        * question = "6286346d-c805-4519-8e82-bf364a215c58"
        * operator = #=
        * answerCoding = http://terminology.hl7.org/CodeSystem/v2-0136#Y
      * enableBehavior = #any  
      
// table
  * item[+]
    * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control|1.0.0#grid
    * linkId = "25d3e4b6-8c71-4c17-8f5a-aca90e232ed2"
    * text = "Eye examination"
    * type = #group 
    * repeats = false
    * item[+]
      * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression].valueExpression
        * language = #text/fhirpath
        * expression = "%age < 1"
      * linkId = "cb1b9349-2dd1-4bdd-904b-a529458e3b98"
      * text = "Red reflex (up to six months)"
      * type = #group
      * repeats = false
      * item[+]
        * linkId = "47ce0b44-ac12-4a1d-8657-2cc741a29d3a"
        * text = "Left eye"
        * type = #string
        * repeats = false
      * item[+]
        * linkId = "3f192141-0845-44d6-85ad-94f0295e062f"
        * text = "Right eye"
        * type = #string
        * repeats = false
    * item[+]
      * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression].valueExpression
        * language = #text/fhirpath
        * expression = "%age <= 12"
      * linkId = "3ff41163-549f-4834-8817-151144613988"
      * text = "Evidence of squint or other abnormality"
      * type = #group
      * repeats = false
      * item[+]
        * linkId = "83e65791-a04a-42e4-b3f2-1e552b8e8044"
        * text = "Left eye"
        * type = #string
        * repeats = false
      * item[+]
        * linkId = "2dd18bad-9491-436f-a2db-a4ed6022ac5c"
        * text = "Right eye"
        * type = #string
        * repeats = false
    * item[+]
      * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression].valueExpression
        * language = #text/fhirpath
        * expression = "%age >= 3"
      * linkId = "2c0e12a5-2650-4886-8f50-405dc0ead9c5"
      * text = "Visual acuity"
      * type = #group
      * repeats = false
      * item[+]
        * linkId = "43825f29-c720-40a5-9fd1-de50ee35479c"
        * text = "Left eye"
        * type = #string
        * repeats = false
      * item[+]
        * linkId = "e98428b4-bc8d-4272-a803-757a84813c3c"
        * text = "Right eye"
        * type = #string
        * repeats = false
    * item[+]
      * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression].valueExpression
        * language = #text/fhirpath
        * expression = "%age >= 25"
      * linkId = "bac129ef-a5c0-4d94-915c-ceadc6016594"
      * text = "Trachoma Check (endemic areas)"
      * type = #group
      * repeats = false
      * item[+]
        * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#check-box
        * linkId = "202b5b91-541e-4a72-b1f6-1d474b59b7a3"
        * text = "Left eye"
        * type = #choice
        * repeats = false
        * answerOption[+].valueCoding = $SCT#60332004 "Trichiasis"
        * answerOption[+].valueCoding = $SCT#95726001 "Corneal scar"
      * item[+]
        * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#check-box
        * linkId = "6ae69487-345e-46a0-a8db-b1356671ee59"
        * text = "Right eye"
        * type = #choice
        * repeats = false
        * answerOption[+].valueCoding = $SCT#60332004 "Trichiasis"
        * answerOption[+].valueCoding = $SCT#95726001 "Corneal scar"


  * item[+]
    * linkId = "8dcdc04c-7655-4b47-88eb-8425f0cdc0d0"
    * text = "Health priorities, actions and follow-up"
    * type = #text
    * repeats = false  


  * item[+]
    * linkId = "MarkComplete-8"
    * text = "Mark section as complete"
      * extension[http://hl7.org/fhir/StructureDefinition/rendering-xhtml].valueString = "<div xmlns=\"http://www.w3.org/1999/xhtml\">\r\n<head>\r\n    <style type=\"text/css\">\r\n        .alert {\r\n            padding: 0.875rem;\r\n            margin-bottom: 1rem;\r\n            font-size: 0.875rem;\r\n            color: #2E7D32;\r\n            border-radius: 0.5rem;\r\n            background-color: #d5e5d6;\r\n            font-weight: 700;\r\n        }\r\n    </style>\r\n</head>\r\n<body>\r\n<div class=\"alert\">Mark section as complete</div>\r\n</body>\r\n</div>"
    * type = #boolean
    * repeats = false