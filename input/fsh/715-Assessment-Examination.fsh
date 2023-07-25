Alias: $LNC = http://loinc.org
Alias: $SCT = http://snomed.info/sct
Alias: $UCUM = http://unitsofmeasure.org

Instance: Examination
InstanceOf: Questionnaire
Usage: #definition
Title: "Aboriginal and Torres Strait Islander Health Check - Examination"
Description: "Examination sub-questionnaire for Aboriginal and Torres Strait Islander Health Check."


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

* meta.profile[+] = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-render"
* meta.profile[+] = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-modular"
* meta.profile[+] = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-pop-exp"
* url = "http://www.health.gov.au/assessments/mbs/715/Examination"
* name = "Examination"
* title = "Aboriginal and Torres Strait Islander Health Check - Examination"
* status = #draft
* experimental = false
* subjectType[+] = #Patient
* date = "2022-05-24"
* jurisdiction.coding = urn:iso:std:iso:3166#AU


* item[+]
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression].valueExpression
    * language = #text/fhirpath
    * expression = "%age.exists()"
  * linkId = "c587e3b6-b91a-40dc-9a16-179342d001e9"
  * text = "Examination"
  * type = #group
  * repeats = false
  * item[+] //in-progress
    * extension[questionnaire-itemControl].valueCodeableConcept = https://smartforms.csiro.au/ig/CodeSystem/QuestionnaireItemControlExtended#context-display    
    * linkId = "CD-in-progress-7"
    * text = "In progress"
      * extension[http://hl7.org/fhir/StructureDefinition/rendering-xhtml].valueString = "<div title=\"In progress\" xmlns=\"http://www.w3.org/1999/xhtml\">\r\n\t<div style=\"display: flex; flex-direction: row;\">\r\n\t\t<img width='24' height='24' src='data:image/svg+xml;base64,\r\n\t\tPHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxZW0iIGhlaWdodD0iMWVtIiB2aWV3Qm94PSIwIDAgMjQgMjQiPjxwYXRoIGZpbGw9IiM3NTc1NzUiIGQ9Im0xNS44NCAxMC4ybC0xLjAxIDEuMDFsLTIuMDctMi4wM2wxLjAxLTEuMDJjLjItLjIxLjU0LS4yMi43OCAwbDEuMjkgMS4yNWMuMjEuMjEuMjIuNTUgMCAuNzlNOCAxMy45MWw0LjE3LTQuMTlsMi4wNyAyLjA4bC00LjE2IDQuMkg4di0yLjA5TTEzIDJ2MmM0LjM5LjU0IDcuNSA0LjUzIDYuOTYgOC45MkE4LjAxNCA4LjAxNCAwIDAgMSAxMyAxOS44OHYyYzUuNS0uNiA5LjQ1LTUuNTQgOC44NS0xMS4wM0MyMS4zMyA2LjE5IDE3LjY2IDIuNSAxMyAybS0yIDBjLTEuOTYuMTgtMy44MS45NS01LjMzIDIuMkw3LjEgNS43NGMxLjEyLS45IDIuNDctMS40OCAzLjktMS42OHYtMk00LjI2IDUuNjdBOS44MSA5LjgxIDAgMCAwIDIuMDUgMTFoMmMuMTktMS40Mi43NS0yLjc3IDEuNjQtMy45TDQuMjYgNS42N00yLjA2IDEzYy4yIDEuOTYuOTcgMy44MSAyLjIxIDUuMzNsMS40Mi0xLjQzQTguMDAyIDguMDAyIDAgMCAxIDQuMDYgMTNoLTJtNSA1LjM3bC0xLjM5IDEuMzdBOS45OTQgOS45OTQgMCAwIDAgMTEgMjJ2LTJhOC4wMDIgOC4wMDIgMCAwIDEtMy45LTEuNjNoLS4wNFoiLz48L3N2Zz4=' \r\n\t\tstyle=\"align-self: center;\"/>\r\n\t</div>\r\n</div>" 
    * type = #display
    * enableWhen[+]
      * question = "MarkComplete-7" // Section complete item
      * operator = #=
      * answerBoolean = false  
  * item[+] //complete
    * extension[questionnaire-itemControl].valueCodeableConcept = https://smartforms.csiro.au/ig/CodeSystem/QuestionnaireItemControlExtended#context-display
    * linkId = "CD-complete-7"
    * text = "Complete"
      * extension[http://hl7.org/fhir/StructureDefinition/rendering-xhtml].valueString = "<div title=\"Section completed\" xmlns=\"http://www.w3.org/1999/xhtml\">\r\n\t<div style=\"display: flex; flex-direction: row;\">\r\n\t\t<img width='24' height='24' src='data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxZW0iIGhlaWdodD0iMWVtIiB2aWV3Qm94PSIwIDAgMjQgMjQiPjxwYXRoIGZpbGw9IiMyZTdkMzIiIGQ9Ik0yMCAxMmE4IDggMCAwIDEtOCA4YTggOCAwIDAgMS04LThhOCA4IDAgMCAxIDgtOGMuNzYgMCAxLjUuMTEgMi4yLjMxbDEuNTctMS41N0E5LjgyMiA5LjgyMiAwIDAgMCAxMiAyQTEwIDEwIDAgMCAwIDIgMTJhMTAgMTAgMCAwIDAgMTAgMTBhMTAgMTAgMCAwIDAgMTAtMTBNNy45MSAxMC4wOEw2LjUgMTEuNUwxMSAxNkwyMSA2bC0xLjQxLTEuNDJMMTEgMTMuMTdsLTMuMDktMy4wOVoiLz48L3N2Zz4='\r\n\t\tstyle=\"align-self: center;\"/>\r\n\t</div>\r\n</div>\r\n"
    * type = #display
    * enableWhen[+]
      * question = "MarkComplete-7" // Section complete item
      * operator = #=
      * answerBoolean = true
  * item[+]
    * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression].valueExpression
      * language = #text/fhirpath
      * expression = "%age <= 12"
    * linkId = "d15824f8-eafc-4fa0-80a2-82f0ec7f8728"
    * text = "Growth measures recorded on Centers for Disease Control and Prevention (CDC) and World Health Organization (WHO) growth charts for centile and tracking overtime"
    * type = #display
  * item[+]
    * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression].valueExpression
      * language = #text/fhirpath
      * expression = "%age <= 5"
    * extension[sdc-questionnaire-initialExpression].valueExpression
      * language = #text/fhirpath
      * expression = "%ObsBodyHeight.entry.resource.value.value"
    * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unit].valueCoding = $UCUM#cm
    * linkId = "7df41f88-6511-4793-a26a-d96fcd89fbba"
    * text = "Length/Height"
    * type = #decimal
    * repeats = false
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#unit
      * linkId = "a7399bd6-33ef-4fb4-988c-d1426e93ffc0"
      * text = "cm"
      * type = #display
  * item[+]
    * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression].valueExpression
      * language = #text/fhirpath
      * expression = "%age > 5"
    * extension[sdc-questionnaire-initialExpression].valueExpression
      * language = #text/fhirpath
      * expression = "%ObsBodyHeight.entry.resource.value.value"
    * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unit].valueCoding = $UCUM#cm
    * linkId = "2d68889b-88c1-4c6d-8b00-db4178dc1f52"
    * text = "Height"
    * type = #decimal
    * repeats = false
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#unit
      * linkId = "b290acfa-d1f7-4e4f-91bd-93b402721127"
      * text = "cm"
      * type = #display
  * item[+]
    * extension[sdc-questionnaire-initialExpression].valueExpression
      * language = #text/fhirpath
      * expression = "%ObsBodyWeight.entry.resource.value.value"
    * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unit].valueCoding = $UCUM#kg
    * linkId = "2136abeb-d75d-475d-9cc7-eeda8d131b95"
    * text = "Weight"
    * type = #decimal
    * repeats = false
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#unit
      * linkId = "a67faacb-609a-440e-84e0-bc045a69c580"
      * text = "kg"
      * type = #display
  * item[+]
    * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression].valueExpression
      * language = #text/fhirpath
      * expression = "%age > 12"
    * extension[sdc-questionnaire-initialExpression].valueExpression
      * language = #text/fhirpath
      * expression = "%ObsBMI.entry.resource.value.value"
    * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unit].valueCoding = $UCUM#kg/m2
    * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression].valueExpression
      * description = "BMI calculation"
      * language = #text/fhirpath
      * expression = "(%weight/((%height/100).power(2))).round(1)"
    * linkId = "820f5b73-3539-44d2-8e8f-c485cf443839"
    * text = "BMI"
    * type = #decimal
    * repeats = false
    * readOnly = true
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#unit
      * linkId = "ab15aa50-a1c6-469a-83c5-3a28f110c00b"
      * text = "kg/m2"
      * type = #display
  * item[+]
    * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression].valueExpression
      * language = #text/fhirpath
      * expression = "%age <= 12"
    * extension[sdc-questionnaire-initialExpression].valueExpression
      * language = #text/fhirpath
      * expression = "%ObsHeadCircumference.entry.resource.value.value"
    * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unit].valueCoding = $UCUM#cm
    * linkId = "e9bc555b-39f7-4ab7-9998-c2e691c3dd85"
    * text = "Head circumference"
    * type = #decimal
    * repeats = false
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#unit
      * linkId = "b39b7f1e-74e3-4600-b3f1-e18c2aa711ab"
      * text = "cm"
      * type = #display
  * item[+]
    * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression].valueExpression
      * language = #text/fhirpath
      * expression = "%age >= 18"
    * extension[sdc-questionnaire-initialExpression].valueExpression
      * language = #text/fhirpath
      * expression = "%ObsWaistCircumference.entry.resource.value.value"
    * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unit].valueCoding = $UCUM#cm
    * linkId = "f8cb01db-7ac7-4794-a276-773e3f1520c2"
    * text = "Waist circumference"
    * type = #decimal
    * repeats = false
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#unit
      * linkId = "a9fad80e-aee6-41bd-b82d-f31ede4dbc45"
      * text = "cm"
      * type = #display
/*
  * item[+]
    * extension[sdc-questionnaire-initialExpression].valueExpression
      * language = #text/fhirpath
      * expression = "%ObsBloodPressure.entry.resource.select(component[0].value.select(value.toString()) + '/' + component[1].value.select(value.toString()) )"
    * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unit].valueCoding = $UCUM#mm[Hg]
    * linkId = "15200593-ab79-47ec-babe-4fdcb2327737"
    * text = "Blood pressure"
    * type = #string
    * repeats = false
    * enableWhen[+]
      * question = "e2a16e4d-2765-4b61-b286-82cfc6356b30" // age item which has initial population from variable
      * operator = #>
      * answerInteger = 12
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#unit
      * linkId = "eb022a99-7bd0-4635-aaad-04ac0d0334c8"
      * text = "mm Hg"
      * type = #display
*/
  * item[+]
    * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression].valueExpression
      * language = #text/fhirpath
      * expression = "%age > 12"
    * linkId = "72c56a10-a1d9-4a53-99ec-902fea9b58a7"
    * text = "Blood pressure"
    * type = #group
    * repeats = false
    * item[+]      
      * extension[sdc-questionnaire-initialExpression].valueExpression
        * language = #text/fhirpath
        * expression = "%ObsBloodPressure.entry.resource.component.where(code.coding.where(code='8480-6')).value.value"
      * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unit].valueCoding = $UCUM#mm[Hg]
      * linkId = "38cda3d6-6fbf-4970-91fc-f6c1636db5f9"
      * text = "Systolic"
      * type = #integer
      * repeats = false
      * item[+]
        * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#unit
        * linkId = "085e2215-1bfd-45bb-a21a-a4904d0a6aa9"
        * text = "mm Hg"
        * type = #display
    * item[+]      
      * extension[sdc-questionnaire-initialExpression].valueExpression
        * language = #text/fhirpath
        * expression = "%ObsBloodPressure.entry.resource.component.where(code.coding.where(code='8462-4')).value.value"
      * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unit].valueCoding = $UCUM#mm[Hg]
      * linkId = "4d67ff19-80bc-42d0-b0fd-6f1a78d2b956"
      * text = "Diastolic"
      * type = #integer
      * repeats = false
      * item[+]
        * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#unit
        * linkId = "eb022a99-7bd0-4635-aaad-04ac0d0334c8"
        * text = "mm Hg"
        * type = #display

    
  * item[+]
    * extension[sdc-questionnaire-initialExpression].valueExpression
      * language = #text/fhirpath
      * expression = "%ObsHeartRate.entry.resource.value.value"
    * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unit].valueCoding = $UCUM#/min
    * linkId = "4eb7887a-fb87-4130-a246-20a5284f47fd"
    * text = "Heart rate"
    * type = #integer
    * repeats = false
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#unit
      * linkId = "f5690e0c-1a80-4fee-9aa6-5768270afe6d"
      * text = "/min"
      * type = #display
  * item[+]
    * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#radio-button
    * linkId = "a36e379a-904e-4b91-84e1-0650fb047837"
    * text = "Heart rhythm"
    * type = #choice
    * answerOption[+].valueCoding = $SCT#271636001 "Pulse Regular"
    * answerOption[+].valueCoding = $SCT#61086009 "Pulse Irregular"
    * repeats = false
  // needs assessment for potentional coded response
  * item[+]
    * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression].valueExpression
      * language = #text/fhirpath
      * expression = "%age <= 12"
    * linkId = "213a3eac-e530-4e27-859c-407136c7a0a6"
    * text = "Cardiac auscultation"
    * type = #text
    * repeats = false
  * item[+]
    * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression].valueExpression
      * language = #text/fhirpath
      * expression = "%age <= 12"
    * linkId = "8886f3bb-52de-4294-a5cb-8f960e2a6bbe"
    * text = "Abdominal examination"
    * type = #text
    * repeats = false
  * item[+]
    * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression].valueExpression
      * language = #text/fhirpath
      * expression = "%age <= 12"
    * linkId = "5e10229c-390d-4968-90d3-f896840f3c50"
    * text = "Gait examination (musculoskeletal structure, balance, coordination)"
    * type = #text
    * repeats = false
  * item[+]
    * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression].valueExpression
      * language = #text/fhirpath
      * expression = "%age < 1"
    * linkId = "6c69ee91-f777-494c-bf09-d963773cd4ae"
    * text = "Newborn examination (if indicated, infant aged <=6 weeks)"
    * type = #text
    * repeats = false
// needs assessment for what is being recorded. Actual measurement result or result interpretation?
  * item[+]
    * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression].valueExpression
      * language = #text/fhirpath
      * expression = "%age <= 12"
    * linkId = "7a431d03-1726-4905-aae7-49f62a10ce5e"
    * text = "Haemoglobin (children at risk of iron deficiency anaemia)"
    * type = #string
    * repeats = false
  * item[+]
    * linkId = "fcbfa6e1-c101-4675-969d-aa11027859c2"
    * text = "Health priorities, actions and follow-up"
    * type = #text
    * repeats = false


  * item[+]
    * linkId = "MarkComplete-7"
    * text = "Mark section as complete"
      * extension[http://hl7.org/fhir/StructureDefinition/rendering-xhtml].valueString = "<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n<head>\r\n    <style type=\"text/css\">\r\n        .alert {\r\n            padding: 0.875rem;\r\n            margin-bottom: 1rem;\r\n            font-size: 0.875rem;\r\n            color: #2E7D32;\r\n            border-radius: 0.5rem;\r\n            background-color: #d5e5d6;\r\n            font-weight: 700;\r\n        }\r\n    </style>\r\n</head>\r\n<body>\r\n<div class=\"alert\">Mark section as complete</div>\r\n</body>\r\n</html>"
    * type = #boolean
    * repeats = false