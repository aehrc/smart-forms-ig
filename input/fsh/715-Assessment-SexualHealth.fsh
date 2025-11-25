Alias: $LNC = http://loinc.org
Alias: $SCT = http://snomed.info/sct
Alias: $UCUM = http://unitsofmeasure.org

Instance: SexualHealth
InstanceOf: Questionnaire
Usage: #example
Title: "Aboriginal and Torres Strait Islander Health Check - Sexual Health"
Description: "Sexual Health sub-questionnaire for Aboriginal and Torres Strait Islander Health Check."

* contained[+] = YesNo
* contained[+] = YesNoNotAskedDeclined
* contained[+] = CervicalScreeningStatus-1

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
* url = "http://www.health.gov.au/assessments/mbs/715/SexualHealth"
* name = "SexualHealth"
* title = "Aboriginal and Torres Strait Islander Health Check - Sexual Health"
* status = #draft
* experimental = false
* subjectType[+] = #Patient
* date = "2025-03-14"
* jurisdiction.coding = urn:iso:std:iso:3166#AU

// Adolescents
* item[+]
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression].valueExpression
    * language = #text/fhirpath
    * expression = "(%age > 12) and (%age <= 24)"
  * extension[sdc-questionnaire-shortText].valueString = "Sexual health"
  * linkId = "4b49c291-6e93-4b7e-be3b-15ef8bc207ad"
  * text = "Sexual health (sexual activity, contraception, safe sex/protection, sexual orientation, gender identity, pressure to have sex, STIs)"
  * type = #group
  * repeats = false
  * item[+] //in-progress
    * extension[sdc-questionnaire-enableWhenExpression].valueExpression
      * language = #text/fhirpath
      * expression = "%resource.repeat(item).where(linkId='MarkComplete-25').answer.value = 'In progress' or %resource.repeat(item).where(linkId='MarkComplete-25').answer.value.empty()"
    * extension[questionnaire-itemControl].valueCodeableConcept = https://smartforms.csiro.au/ig/CodeSystem/QuestionnaireItemControlExtended#context-display
    * linkId = "CD-in-progress-25"
    * text = "In progress"
      * extension[http://hl7.org/fhir/StructureDefinition/rendering-xhtml].valueString = "<div title=\"In progress\" xmlns=\"http://www.w3.org/1999/xhtml\">\r\n\t<div style=\"display: flex; flex-direction: row;\">\r\n\t\t<img width='24' height='24' src='data:image/svg+xml;base64,\r\n\t\tPHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxZW0iIGhlaWdodD0iMWVtIiB2aWV3Qm94PSIwIDAgMjQgMjQiPjxwYXRoIGZpbGw9IiM3NTc1NzUiIGQ9Im0xNS44NCAxMC4ybC0xLjAxIDEuMDFsLTIuMDctMi4wM2wxLjAxLTEuMDJjLjItLjIxLjU0LS4yMi43OCAwbDEuMjkgMS4yNWMuMjEuMjEuMjIuNTUgMCAuNzlNOCAxMy45MWw0LjE3LTQuMTlsMi4wNyAyLjA4bC00LjE2IDQuMkg4di0yLjA5TTEzIDJ2MmM0LjM5LjU0IDcuNSA0LjUzIDYuOTYgOC45MkE4LjAxNCA4LjAxNCAwIDAgMSAxMyAxOS44OHYyYzUuNS0uNiA5LjQ1LTUuNTQgOC44NS0xMS4wM0MyMS4zMyA2LjE5IDE3LjY2IDIuNSAxMyAybS0yIDBjLTEuOTYuMTgtMy44MS45NS01LjMzIDIuMkw3LjEgNS43NGMxLjEyLS45IDIuNDctMS40OCAzLjktMS42OHYtMk00LjI2IDUuNjdBOS44MSA5LjgxIDAgMCAwIDIuMDUgMTFoMmMuMTktMS40Mi43NS0yLjc3IDEuNjQtMy45TDQuMjYgNS42N00yLjA2IDEzYy4yIDEuOTYuOTcgMy44MSAyLjIxIDUuMzNsMS40Mi0xLjQzQTguMDAyIDguMDAyIDAgMCAxIDQuMDYgMTNoLTJtNSA1LjM3bC0xLjM5IDEuMzdBOS45OTQgOS45OTQgMCAwIDAgMTEgMjJ2LTJhOC4wMDIgOC4wMDIgMCAwIDEtMy45LTEuNjNoLS4wNFoiLz48L3N2Zz4=' \r\n\t\tstyle=\"align-self: center;\"/>\r\n\t</div>\r\n</div>" 
    * type = #display
  * item[+] //complete
    * extension[sdc-questionnaire-enableWhenExpression].valueExpression
      * language = #text/fhirpath
      * expression = "%resource.repeat(item).where(linkId='MarkComplete-25').answer.value = 'Complete'"
    * extension[questionnaire-itemControl].valueCodeableConcept = https://smartforms.csiro.au/ig/CodeSystem/QuestionnaireItemControlExtended#context-display
    * linkId = "CD-complete-25"
    * text = "Complete"
      * extension[http://hl7.org/fhir/StructureDefinition/rendering-xhtml].valueString = "<div title=\"Complete\" xmlns=\"http://www.w3.org/1999/xhtml\">\r\n\t<div style=\"display: flex; flex-direction: row;\">\r\n\t\t<img width='24' height='24' src='data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxZW0iIGhlaWdodD0iMWVtIiB2aWV3Qm94PSIwIDAgMjQgMjQiPjxwYXRoIGZpbGw9IiMyZTdkMzIiIGQ9Ik0yMCAxMmE4IDggMCAwIDEtOCA4YTggOCAwIDAgMS04LThhOCA4IDAgMCAxIDgtOGMuNzYgMCAxLjUuMTEgMi4yLjMxbDEuNTctMS41N0E5LjgyMiA5LjgyMiAwIDAgMCAxMiAyQTEwIDEwIDAgMCAwIDIgMTJhMTAgMTAgMCAwIDAgMTAgMTBhMTAgMTAgMCAwIDAgMTAtMTBNNy45MSAxMC4wOEw2LjUgMTEuNUwxMSAxNkwyMSA2bC0xLjQxLTEuNDJMMTEgMTMuMTdsLTMuMDktMy4wOVoiLz48L3N2Zz4='\r\n\t\tstyle=\"align-self: center;\"/>\r\n\t</div>\r\n</div>"
    * type = #display
  * item[+] //attention
    * extension[sdc-questionnaire-enableWhenExpression].valueExpression
      * language = #text/fhirpath
      * expression = "%resource.repeat(item).where(linkId='MarkComplete-25').answer.value = 'Attention required'"
    * extension[questionnaire-itemControl].valueCodeableConcept = https://smartforms.csiro.au/ig/CodeSystem/QuestionnaireItemControlExtended#context-display
    * linkId = "CD-attention-25"
    * text = "Attention required"
      * extension[http://hl7.org/fhir/StructureDefinition/rendering-xhtml].valueString = "<div title=\"Attention required\" xmlns=\"http://www.w3.org/1999/xhtml\">\r\n\t<div style=\"display: flex; flex-direction: row;\">\r\n\t\t<img width='24' height='24' src='data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAxMDAgMTAwIj48Y2lyY2xlIGN4PSI1MCIgY3k9IjUwIiByPSI0MiIgZmlsbD0ibm9uZSIgc3Ryb2tlPSIjRkZD MTA3IiBzdHJva2Utd2lkdGg9IjgiLz48bGluZSB4MT0iNTAiIHkxPSIyOCIgeDI9IjUwIiB5Mj0iNjAiIHN0cm9rZT0iI0ZGQzEwNyIgc3Ryb2tlLXdpZHRoPSI4Ii8+PGNpcmNsZSBjeD0iNTAiIGN5PSI3NCIgcj0iNSIgZmlsbD0iI0ZGQzEwNyIvPjwvc3ZnPg=='\r\n\t\tstyle=\"align-self: center;\"/>\r\n\t</div>\r\n</div>"
    * type = #display
  /*
  * enableWhen[+]
    * question = "e2a16e4d-2765-4b61-b286-82cfc6356b30" // age item which has initial population from variable
    * operator = #exists
    * answerBoolean = true
  * enableWhen[+]
    * question = "e2a16e4d-2765-4b61-b286-82cfc6356b30" // age item which has initial population from variable
    * operator = #>
    * answerInteger = 12
  * enableWhen[+]
    * question = "e2a16e4d-2765-4b61-b286-82cfc6356b30" // age item which has initial population from variable
    * operator = #<=
    * answerInteger = 24
  * enableBehavior = #all
  */
  * item[+]
    * linkId = "e5aeda89-b820-4bb3-8fbd-d4f662207b7d"
    * text = "Puberty and sexual health concerns"
    * type = #group
    * repeats = false
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#radio-button
      * extension[questionnaire-choiceOrientation].valueCode = #horizontal
      * linkId = "1d20138a-caf3-4c43-9693-04c08d37a84a"
      * text = "Is there anything that you are worried about in relation to puberty/your sexual health?"
      * type = #choice
      * repeats = false
      * answerValueSet = "#YesNoNotAskedDeclined"
    * item[+]
      * linkId = "d7b92cad-4aa8-47d3-975c-92563f132325"
      * text = "Details"
      * type = #text
      * repeats = false
      * enableWhen[+]
        * question = "1d20138a-caf3-4c43-9693-04c08d37a84a"
        * operator = #=
        * answerCoding = http://terminology.hl7.org/CodeSystem/v2-0136#Y
  * item[+]
    * extension[sdc-questionnaire-shortText].valueString = "Consider discussing items relevant to age/sex/gender"
    * linkId = "0fba3972-faa3-4f40-940c-c2f1c9b55329"
    * text = "Consider discussing as relevant to age/sex/gender: menstruation (including risk of anaemia); current sexual activity; contraception; safe sex practice (eg use of condoms); sexually transmitted infection symptoms and screening; blood-borne virus screening"
      * extension[http://hl7.org/fhir/StructureDefinition/rendering-xhtml].valueString = "<div xmlns=\"http://www.w3.org/1999/xhtml\">
      <div>Consider discussing as relevant to age/sex/gender:</div>
      <ul>
        <li>menstruation (including risk of anaemia)</li>
        <li>current sexual activity</li>
        <li>contraception</li>
        <li>safe sex practice (eg use of condoms)</li>
        <li>sexually transmitted infection symptoms and screening</li>
        <li>blood-borne virus screening</li>
      </ul>
      </div>"
    * type = #text
    * repeats = false

  * item[+]
    * linkId = "b41572ba-cf36-4cec-addf-cb0b47fea63f"
    * text = "Health priorities, actions and follow-up"
    * type = #text
    * repeats = false

  * item[+]
    * linkId = "sexualhealth-adolescents-section-end-divider"
    * text.extension[http://hl7.org/fhir/StructureDefinition/rendering-style].valueString = "border-top: 1px solid #ccc;"
    * type = #display
  * item[+]
    * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#radio-button
    * linkId = "MarkComplete-25"
    * text = "Section completion status"
    * type = #choice
    * repeats = false
    * answerOption[+].valueString = "Complete"
    * answerOption[+].valueString = "In progress"
    * answerOption[+].valueString = "Attention required"
  
//Adults
* item[+]
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression].valueExpression
    * language = #text/fhirpath
    * expression = "(%age > 24) and (%age <= 49)"
  * linkId = "589b53a4-ceb2-41c0-850a-69438f9fd1cc"
  * text = "Genitourinary and sexual health"
  * type = #group
  * repeats = false
  * item[+] //in-progress
    * extension[sdc-questionnaire-enableWhenExpression].valueExpression
      * language = #text/fhirpath
      * expression = "%resource.repeat(item).where(linkId='MarkComplete-35').answer.value = 'In progress' or %resource.repeat(item).where(linkId='MarkComplete-35').answer.value.empty()"
    * extension[questionnaire-itemControl].valueCodeableConcept = https://smartforms.csiro.au/ig/CodeSystem/QuestionnaireItemControlExtended#context-display
    * linkId = "CD-in-progress-35"
    * text = "In progress"
      * extension[http://hl7.org/fhir/StructureDefinition/rendering-xhtml].valueString = "<div title=\"In progress\" xmlns=\"http://www.w3.org/1999/xhtml\">\r\n\t<div style=\"display: flex; flex-direction: row;\">\r\n\t\t<img width='24' height='24' src='data:image/svg+xml;base64,\r\n\t\tPHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxZW0iIGhlaWdodD0iMWVtIiB2aWV3Qm94PSIwIDAgMjQgMjQiPjxwYXRoIGZpbGw9IiM3NTc1NzUiIGQ9Im0xNS44NCAxMC4ybC0xLjAxIDEuMDFsLTIuMDctMi4wM2wxLjAxLTEuMDJjLjItLjIxLjU0LS4yMi43OCAwbDEuMjkgMS4yNWMuMjEuMjEuMjIuNTUgMCAuNzlNOCAxMy45MWw0LjE3LTQuMTlsMi4wNyAyLjA4bC00LjE2IDQuMkg4di0yLjA5TTEzIDJ2MmM0LjM5LjU0IDcuNSA0LjUzIDYuOTYgOC45MkE4LjAxNCA4LjAxNCAwIDAgMSAxMyAxOS44OHYyYzUuNS0uNiA5LjQ1LTUuNTQgOC44NS0xMS4wM0MyMS4zMyA2LjE5IDE3LjY2IDIuNSAxMyAybS0yIDBjLTEuOTYuMTgtMy44MS45NS01LjMzIDIuMkw3LjEgNS43NGMxLjEyLS45IDIuNDctMS40OCAzLjktMS42OHYtMk00LjI2IDUuNjdBOS44MSA5LjgxIDAgMCAwIDIuMDUgMTFoMmMuMTktMS40Mi43NS0yLjc3IDEuNjQtMy45TDQuMjYgNS42N00yLjA2IDEzYy4yIDEuOTYuOTcgMy44MSAyLjIxIDUuMzNsMS40Mi0xLjQzQTguMDAyIDguMDAyIDAgMCAxIDQuMDYgMTNoLTJtNSA1LjM3bC0xLjM5IDEuMzdBOS45OTQgOS45OTQgMCAwIDAgMTEgMjJ2LTJhOC4wMDIgOC4wMDIgMCAwIDEtMy45LTEuNjNoLS4wNFoiLz48L3N2Zz4=' \r\n\t\tstyle=\"align-self: center;\"/>\r\n\t</div>\r\n</div>" 
    * type = #display
  * item[+] //complete
    * extension[sdc-questionnaire-enableWhenExpression].valueExpression
      * language = #text/fhirpath
      * expression = "%resource.repeat(item).where(linkId='MarkComplete-35').answer.value = 'Complete'"
    * extension[questionnaire-itemControl].valueCodeableConcept = https://smartforms.csiro.au/ig/CodeSystem/QuestionnaireItemControlExtended#context-display
    * linkId = "CD-complete-35"
    * text = "Complete"
      * extension[http://hl7.org/fhir/StructureDefinition/rendering-xhtml].valueString = "<div title=\"Complete\" xmlns=\"http://www.w3.org/1999/xhtml\">\r\n\t<div style=\"display: flex; flex-direction: row;\">\r\n\t\t<img width='24' height='24' src='data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxZW0iIGhlaWdodD0iMWVtIiB2aWV3Qm94PSIwIDAgMjQgMjQiPjxwYXRoIGZpbGw9IiMyZTdkMzIiIGQ9Ik0yMCAxMmE4IDggMCAwIDEtOCA4YTggOCAwIDAgMS04LThhOCA4IDAgMCAxIDgtOGMuNzYgMCAxLjUuMTEgMi4yLjMxbDEuNTctMS41N0E5LjgyMiA5LjgyMiAwIDAgMCAxMiAyQTEwIDEwIDAgMCAwIDIgMTJhMTAgMTAgMCAwIDAgMTAgMTBhMTAgMTAgMCAwIDAgMTAtMTBNNy45MSAxMC4wOEw2LjUgMTEuNUwxMSAxNkwyMSA2bC0xLjQxLTEuNDJMMTEgMTMuMTdsLTMuMDktMy4wOVoiLz48L3N2Zz4='\r\n\t\tstyle=\"align-self: center;\"/>\r\n\t</div>\r\n</div>"
    * type = #display
  * item[+] //attention
    * extension[sdc-questionnaire-enableWhenExpression].valueExpression
      * language = #text/fhirpath
      * expression = "%resource.repeat(item).where(linkId='MarkComplete-35').answer.value = 'Attention required'"
    * extension[questionnaire-itemControl].valueCodeableConcept = https://smartforms.csiro.au/ig/CodeSystem/QuestionnaireItemControlExtended#context-display
    * linkId = "CD-attention-35"
    * text = "Attention required"
      * extension[http://hl7.org/fhir/StructureDefinition/rendering-xhtml].valueString = "<div title=\"Attention required\" xmlns=\"http://www.w3.org/1999/xhtml\">\r\n\t<div style=\"display: flex; flex-direction: row;\">\r\n\t\t<img width='24' height='24' src='data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAxMDAgMTAwIj48Y2lyY2xlIGN4PSI1MCIgY3k9IjUwIiByPSI0MiIgZmlsbD0ibm9uZSIgc3Ryb2tlPSIjRkZD MTA3IiBzdHJva2Utd2lkdGg9IjgiLz48bGluZSB4MT0iNTAiIHkxPSIyOCIgeDI9IjUwIiB5Mj0iNjAiIHN0cm9rZT0iI0ZGQzEwNyIgc3Ryb2tlLXdpZHRoPSI4Ii8+PGNpcmNsZSBjeD0iNTAiIGN5PSI3NCIgcj0iNSIgZmlsbD0iI0ZGQzEwNyIvPjwvc3ZnPg=='\r\n\t\tstyle=\"align-self: center;\"/>\r\n\t</div>\r\n</div>"
    * type = #display
  * item[+]
    * linkId = "5f5d4886-ce06-47fa-a4d8-f6808b9081c0"
    * text = "Sexual health concerns"
    * type = #group
    * repeats = false
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#radio-button
      * extension[questionnaire-choiceOrientation].valueCode = #horizontal
      * linkId = "e56e79e5-8fbb-43f0-b2a3-018b55750bd0"
      * text = "Is there anything that you are worried about in relation to your sexual health?"
      * type = #choice
      * repeats = false
      * answerValueSet = "#YesNoNotAskedDeclined"
    * item[+]
      * linkId = "5148c6c6-c99f-480d-bb05-569064ba7118"
      * text = "Details"
      * type = #text
      * repeats = false
      * enableWhen[+]
        * question = "e56e79e5-8fbb-43f0-b2a3-018b55750bd0"
        * operator = #=
        * answerCoding = http://terminology.hl7.org/CodeSystem/v2-0136#Y  
  * item[+]
    * linkId = "d844a31e-8e51-420b-855c-4f485a180a57"
    * text = "Cervical screening"
    * type = #group
    * repeats = false       
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#check-box
      * linkId = "37dbd343-6d02-477c-89bf-59ba022efbb7"
      * text = "Cervical screening status"
      * type = #choice
      * repeats = false
      * answerValueSet = "#CervicalScreeningStatus-1"
    * item[+]
      * linkId = "f93eb998-1502-4d8a-88a4-986117a387c5"
      * text = "Next due"
      * type = #date
      * repeats = false
    * item[+]
      * linkId = "862fc298-5b5e-4a46-badc-900c6ba1ff50"
      * text = "Details"
      * type = #text
      * repeats = false
  * item[+]
    * extension[sdc-questionnaire-shortText].valueString = "Consider discussing items relevant to age/sex/gender"
    * linkId = "39b02169-ea34-4af9-aa35-1c47f7f39333"
    * text = "Consider discussing as relevant to age/sex/gender: contraception; menstruation; sexually transmitted infection symptoms and screening; blood-borne virus screening; continence; menopause; erectile dysfunction"
      * extension[http://hl7.org/fhir/StructureDefinition/rendering-xhtml].valueString = "<div xmlns=\"http://www.w3.org/1999/xhtml\">
      <div>Consider discussing as relevant to age/sex/gender:</div>
      <ul>
        <li>contraception</li>
        <li>menstruation</li>
        <li>sexually transmitted infection symptoms and screening</li>
        <li>blood-borne virus screening</li>
        <li>continence</li>
        <li>menopause</li>
        <li>erectile dysfunction</li>
      </ul>
      </div>"
    * type = #text
    * repeats = false

  * item[+]
    * linkId = "efd0735c-c379-471f-83bb-93b0392093aa"
    * text = "Health priorities, actions and follow-up"
    * type = #text
    * repeats = false

    
  * item[+]
    * linkId = "sexualhealth-adults-section-end-divider"
    * text.extension[http://hl7.org/fhir/StructureDefinition/rendering-style].valueString = "border-top: 1px solid #ccc;"
    * type = #display
  * item[+]
    * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#radio-button
    * linkId = "MarkComplete-35"
    * text = "Section completion status"
    * type = #choice
    * repeats = false
    * answerOption[+].valueString = "Complete"
    * answerOption[+].valueString = "In progress"
    * answerOption[+].valueString = "Attention required"

//Older people
* item[+]
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression].valueExpression
    * language = #text/fhirpath
    * expression = "%age >= 50"
  * linkId = "02048954-e9d7-424e-8c7b-6a3c495d7ce4"
  * text = "Genitourinary and sexual health"
  * type = #group
  * repeats = false
  * item[+] //in-progress
    * extension[sdc-questionnaire-enableWhenExpression].valueExpression
      * language = #text/fhirpath
      * expression = "%resource.repeat(item).where(linkId='MarkComplete-36').answer.value = 'In progress' or %resource.repeat(item).where(linkId='MarkComplete-36').answer.value.empty()"
    * extension[questionnaire-itemControl].valueCodeableConcept = https://smartforms.csiro.au/ig/CodeSystem/QuestionnaireItemControlExtended#context-display
    * linkId = "CD-in-progress-36"
    * text = "In progress"
      * extension[http://hl7.org/fhir/StructureDefinition/rendering-xhtml].valueString = "<div title=\"In progress\" xmlns=\"http://www.w3.org/1999/xhtml\">\r\n\t<div style=\"display: flex; flex-direction: row;\">\r\n\t\t<img width='24' height='24' src='data:image/svg+xml;base64,\r\n\t\tPHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxZW0iIGhlaWdodD0iMWVtIiB2aWV3Qm94PSIwIDAgMjQgMjQiPjxwYXRoIGZpbGw9IiM3NTc1NzUiIGQ9Im0xNS44NCAxMC4ybC0xLjAxIDEuMDFsLTIuMDctMi4wM2wxLjAxLTEuMDJjLjItLjIxLjU0LS4yMi43OCAwbDEuMjkgMS4yNWMuMjEuMjEuMjIuNTUgMCAuNzlNOCAxMy45MWw0LjE3LTQuMTlsMi4wNyAyLjA4bC00LjE2IDQuMkg4di0yLjA5TTEzIDJ2MmM0LjM5LjU0IDcuNSA0LjUzIDYuOTYgOC45MkE4LjAxNCA4LjAxNCAwIDAgMSAxMyAxOS44OHYyYzUuNS0uNiA5LjQ1LTUuNTQgOC44NS0xMS4wM0MyMS4zMyA2LjE5IDE3LjY2IDIuNSAxMyAybS0yIDBjLTEuOTYuMTgtMy44MS45NS01LjMzIDIuMkw3LjEgNS43NGMxLjEyLS45IDIuNDctMS40OCAzLjktMS42OHYtMk00LjI2IDUuNjdBOS44MSA5LjgxIDAgMCAwIDIuMDUgMTFoMmMuMTktMS40Mi43NS0yLjc3IDEuNjQtMy45TDQuMjYgNS42N00yLjA2IDEzYy4yIDEuOTYuOTcgMy44MSAyLjIxIDUuMzNsMS40Mi0xLjQzQTguMDAyIDguMDAyIDAgMCAxIDQuMDYgMTNoLTJtNSA1LjM3bC0xLjM5IDEuMzdBOS45OTQgOS45OTQgMCAwIDAgMTEgMjJ2LTJhOC4wMDIgOC4wMDIgMCAwIDEtMy45LTEuNjNoLS4wNFoiLz48L3N2Zz4=' \r\n\t\tstyle=\"align-self: center;\"/>\r\n\t</div>\r\n</div>" 
    * type = #display
  * item[+] //complete
    * extension[sdc-questionnaire-enableWhenExpression].valueExpression
      * language = #text/fhirpath
      * expression = "%resource.repeat(item).where(linkId='MarkComplete-36').answer.value = 'Complete'"
    * extension[questionnaire-itemControl].valueCodeableConcept = https://smartforms.csiro.au/ig/CodeSystem/QuestionnaireItemControlExtended#context-display
    * linkId = "CD-complete-36"
    * text = "Complete"
      * extension[http://hl7.org/fhir/StructureDefinition/rendering-xhtml].valueString = "<div title=\"Complete\" xmlns=\"http://www.w3.org/1999/xhtml\">\r\n\t<div style=\"display: flex; flex-direction: row;\">\r\n\t\t<img width='24' height='24' src='data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxZW0iIGhlaWdodD0iMWVtIiB2aWV3Qm94PSIwIDAgMjQgMjQiPjxwYXRoIGZpbGw9IiMyZTdkMzIiIGQ9Ik0yMCAxMmE4IDggMCAwIDEtOCA4YTggOCAwIDAgMS04LThhOCA4IDAgMCAxIDgtOGMuNzYgMCAxLjUuMTEgMi4yLjMxbDEuNTctMS41N0E5LjgyMiA5LjgyMiAwIDAgMCAxMiAyQTEwIDEwIDAgMCAwIDIgMTJhMTAgMTAgMCAwIDAgMTAgMTBhMTAgMTAgMCAwIDAgMTAtMTBNNy45MSAxMC4wOEw2LjUgMTEuNUwxMSAxNkwyMSA2bC0xLjQxLTEuNDJMMTEgMTMuMTdsLTMuMDktMy4wOVoiLz48L3N2Zz4='\r\n\t\tstyle=\"align-self: center;\"/>\r\n\t</div>\r\n</div>"
    * type = #display
  * item[+] //attention
    * extension[sdc-questionnaire-enableWhenExpression].valueExpression
      * language = #text/fhirpath
      * expression = "%resource.repeat(item).where(linkId='MarkComplete-36').answer.value = 'Attention required'"
    * extension[questionnaire-itemControl].valueCodeableConcept = https://smartforms.csiro.au/ig/CodeSystem/QuestionnaireItemControlExtended#context-display
    * linkId = "CD-attention-36"
    * text = "Attention required"
      * extension[http://hl7.org/fhir/StructureDefinition/rendering-xhtml].valueString = "<div title=\"Attention required\" xmlns=\"http://www.w3.org/1999/xhtml\">\r\n\t<div style=\"display: flex; flex-direction: row;\">\r\n\t\t<img width='24' height='24' src='data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAxMDAgMTAwIj48Y2lyY2xlIGN4PSI1MCIgY3k9IjUwIiByPSI0MiIgZmlsbD0ibm9uZSIgc3Ryb2tlPSIjRkZD MTA3IiBzdHJva2Utd2lkdGg9IjgiLz48bGluZSB4MT0iNTAiIHkxPSIyOCIgeDI9IjUwIiB5Mj0iNjAiIHN0cm9rZT0iI0ZGQzEwNyIgc3Ryb2tlLXdpZHRoPSI4Ii8+PGNpcmNsZSBjeD0iNTAiIGN5PSI3NCIgcj0iNSIgZmlsbD0iI0ZGQzEwNyIvPjwvc3ZnPg=='\r\n\t\tstyle=\"align-self: center;\"/>\r\n\t</div>\r\n</div>"
    * type = #display
  * item[+]
    * linkId = "8172aaac-81c4-4b06-b4cd-6a891a227e9f"
    * text = "Sexual health concerns"
    * type = #group
    * repeats = false
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#radio-button
      * extension[questionnaire-choiceOrientation].valueCode = #horizontal
      * linkId = "1c40a720-bdb7-4386-a9f6-be82b7349bf7"
      * text = "Consider asking when appropriate: Is there anything that you are worried about in relation to your sexual health?"
      * type = #choice
      * repeats = false
      * answerValueSet = "#YesNoNotAskedDeclined"
    * item[+]
      * linkId = "f93fe768-9215-4a15-9376-686e9530ea79"
      * text = "Details"
      * type = #text
      * repeats = false
      * enableWhen[+]
        * question = "1c40a720-bdb7-4386-a9f6-be82b7349bf7"
        * operator = #=
        * answerCoding = http://terminology.hl7.org/CodeSystem/v2-0136#Y
  * item[+]
    * linkId = "2e1ea1cc-1f74-4b2e-bfda-f6a1d41e1e50"
    * text = "Continence issues"
    * type = #group
    * repeats = false
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#radio-button
      * extension[questionnaire-choiceOrientation].valueCode = #horizontal
      * linkId = "64fd0f79-7e09-4934-905d-9bff6715f9ba"
      * text = "Do you have problems with urine leaking?"
      * type = #choice
      * repeats = false
      * answerValueSet = "#YesNo"
    * item[+]
      * linkId = "4fc14fd9-4c7e-48ec-90c0-c406523400fa"
      * text = "Details"
      * type = #text
      * repeats = false
      * enableWhen[+]
        * question = "64fd0f79-7e09-4934-905d-9bff6715f9ba"
        * operator = #=
        * answerCoding = http://terminology.hl7.org/CodeSystem/v2-0136#Y
  * item[+]
    * extension[sdc-questionnaire-shortText].valueString = "Consider discussing items relevant to age/sex/gender"
    * linkId = "8d75d1f1-290b-41fc-8e32-ad0681c650bb"
    * text = "Consider discussing as relevant to age/sex/gender: menopause; erectile dysfunction; prostatic symptoms"
      * extension[http://hl7.org/fhir/StructureDefinition/rendering-xhtml].valueString = "<div xmlns=\"http://www.w3.org/1999/xhtml\">
      <div>Consider discussing as relevant to age/sex/gender:</div>
      <ul>
        <li>menopause</li>
        <li>erectile dysfunction</li>
        <li>prostatic symptoms</li>
      </ul>
	    </div>"
    * type = #text
    * repeats = false
  
  * item[+]
    * linkId = "e9936322-e6fe-4cf7-ab61-22846a8fbb95"
    * text = "Health priorities, actions and follow-up"
    * type = #text
    * repeats = false

  
  * item[+]
    * linkId = "sexualhealth-olderpeople-section-end-divider"
    * text.extension[http://hl7.org/fhir/StructureDefinition/rendering-style].valueString = "border-top: 1px solid #ccc;"
    * type = #display
  * item[+]
    * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#radio-button
    * linkId = "MarkComplete-36"
    * text = "Section completion status"
    * type = #choice
    * repeats = false
    * answerOption[+].valueString = "Complete"
    * answerOption[+].valueString = "In progress"
    * answerOption[+].valueString = "Attention required"


