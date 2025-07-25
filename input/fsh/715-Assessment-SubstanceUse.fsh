Alias: $LNC = http://loinc.org
Alias: $SCT = http://snomed.info/sct
Alias: $UCUM = http://unitsofmeasure.org

Instance: SubstanceUse
InstanceOf: Questionnaire
Usage: #example
Title: "Aboriginal and Torres Strait Islander Health Check - Substance Use"
Description: "Substance Use sub-questionnaire for Aboriginal and Torres Strait Islander Health Check."

* contained[+] = SmokingStatusTemplate
* contained[+] = SmokingQuitStatus-1
* contained[+] = TobaccoUseStatus-1

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
  * valueString = "ObsTobaccoSmokingStatus"
* extension[+]
  * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-assembleContext"
  * valueString = "ObsTobaccoSmokingStatusLatest"

//fhirpath variables
//Previous examination results variables
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "ObsTobaccoSmokingStatusValue"
    * language = #text/fhirpath
    * expression = "%ObsTobaccoSmokingStatusLatest.value.coding.where(system='http://snomed.info/sct').first()"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "ObsTobaccoSmokingStatusDateString"
    * language = #text/fhirpath
    * expression = "%ObsTobaccoSmokingStatusLatest.effective.toDate().toString()"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "ObsTobaccoSmokingStatusDateFormatted"
    * language = #text/fhirpath
    * expression = "%ObsTobaccoSmokingStatusDateString.substring(8,2).toInteger().toString() + ' ' + %ObsTobaccoSmokingStatusDateString.substring(5,2).replace('01','Jan').replace('02','Feb').replace('03','Mar').replace('04','Apr').replace('05','May').replace('06','Jun').replace('07','Jul').replace('08','Aug').replace('09','Sep').replace('10','Oct').replace('11','Nov').replace('12','Dec') + ' ' + %ObsTobaccoSmokingStatusDateString.substring(0,4)"


//R5 preadoption extensions
* extension[+]
  * url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-Questionnaire.versionAlgorithm[x]"
  * valueCoding
    * system = "http://hl7.org/fhir/version-algorithm"
    * code = #semver

* meta.profile[+] = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-render"
* meta.profile[+] = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-modular"
* meta.profile[+] = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-behave"
* meta.profile[+] = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-extr-template"
* url = "http://www.health.gov.au/assessments/mbs/715/SubstanceUse"
* name = "SubstanceUse"
* title = "Aboriginal and Torres Strait Islander Health Check - Substance Use"
* status = #draft
* experimental = false
* subjectType[+] = #Patient
* date = "2025-03-14"
* jurisdiction.coding = urn:iso:std:iso:3166#AU

// some linkIds maintained from full assessment questionnaire
* item[+]
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression].valueExpression
    * language = #text/fhirpath
    * expression = "%age >= 12"
  * linkId = "14a9fb5f-5b0e-4862-b143-08a11cd3ebf0"
  * text = "Substance use, including tobacco"
  * type = #group
  * repeats = false
  * item[+] //in-progress
    * extension[questionnaire-itemControl].valueCodeableConcept = https://smartforms.csiro.au/ig/CodeSystem/QuestionnaireItemControlExtended#context-display    
    * linkId = "CD-in-progress-29"
    * text = "In progress"
      * extension[http://hl7.org/fhir/StructureDefinition/rendering-xhtml].valueString = "<div title=\"In progress\" xmlns=\"http://www.w3.org/1999/xhtml\">\r\n\t<div style=\"display: flex; flex-direction: row;\">\r\n\t\t<img width='24' height='24' src='data:image/svg+xml;base64,\r\n\t\tPHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxZW0iIGhlaWdodD0iMWVtIiB2aWV3Qm94PSIwIDAgMjQgMjQiPjxwYXRoIGZpbGw9IiM3NTc1NzUiIGQ9Im0xNS44NCAxMC4ybC0xLjAxIDEuMDFsLTIuMDctMi4wM2wxLjAxLTEuMDJjLjItLjIxLjU0LS4yMi43OCAwbDEuMjkgMS4yNWMuMjEuMjEuMjIuNTUgMCAuNzlNOCAxMy45MWw0LjE3LTQuMTlsMi4wNyAyLjA4bC00LjE2IDQuMkg4di0yLjA5TTEzIDJ2MmM0LjM5LjU0IDcuNSA0LjUzIDYuOTYgOC45MkE4LjAxNCA4LjAxNCAwIDAgMSAxMyAxOS44OHYyYzUuNS0uNiA5LjQ1LTUuNTQgOC44NS0xMS4wM0MyMS4zMyA2LjE5IDE3LjY2IDIuNSAxMyAybS0yIDBjLTEuOTYuMTgtMy44MS45NS01LjMzIDIuMkw3LjEgNS43NGMxLjEyLS45IDIuNDctMS40OCAzLjktMS42OHYtMk00LjI2IDUuNjdBOS44MSA5LjgxIDAgMCAwIDIuMDUgMTFoMmMuMTktMS40Mi43NS0yLjc3IDEuNjQtMy45TDQuMjYgNS42N00yLjA2IDEzYy4yIDEuOTYuOTcgMy44MSAyLjIxIDUuMzNsMS40Mi0xLjQzQTguMDAyIDguMDAyIDAgMCAxIDQuMDYgMTNoLTJtNSA1LjM3bC0xLjM5IDEuMzdBOS45OTQgOS45OTQgMCAwIDAgMTEgMjJ2LTJhOC4wMDIgOC4wMDIgMCAwIDEtMy45LTEuNjNoLS4wNFoiLz48L3N2Zz4=' \r\n\t\tstyle=\"align-self: center;\"/>\r\n\t</div>\r\n</div>" 
    * type = #display
    * enableWhen[+]
      * question = "MarkComplete-29" // Section complete item
      * operator = #!=
      * answerBoolean = true  
  * item[+] //complete
    * extension[questionnaire-itemControl].valueCodeableConcept = https://smartforms.csiro.au/ig/CodeSystem/QuestionnaireItemControlExtended#context-display
    * linkId = "CD-complete-29"
    * text = "Complete"
      * extension[http://hl7.org/fhir/StructureDefinition/rendering-xhtml].valueString = "<div title=\"Section completed\" xmlns=\"http://www.w3.org/1999/xhtml\">\r\n\t<div style=\"display: flex; flex-direction: row;\">\r\n\t\t<img width='24' height='24' src='data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxZW0iIGhlaWdodD0iMWVtIiB2aWV3Qm94PSIwIDAgMjQgMjQiPjxwYXRoIGZpbGw9IiMyZTdkMzIiIGQ9Ik0yMCAxMmE4IDggMCAwIDEtOCA4YTggOCAwIDAgMS04LThhOCA4IDAgMCAxIDgtOGMuNzYgMCAxLjUuMTEgMi4yLjMxbDEuNTctMS41N0E5LjgyMiA5LjgyMiAwIDAgMCAxMiAyQTEwIDEwIDAgMCAwIDIgMTJhMTAgMTAgMCAwIDAgMTAgMTBhMTAgMTAgMCAwIDAgMTAtMTBNNy45MSAxMC4wOEw2LjUgMTEuNUwxMSAxNkwyMSA2bC0xLjQxLTEuNDJMMTEgMTMuMTdsLTMuMDktMy4wOVoiLz48L3N2Zz4='\r\n\t\tstyle=\"align-self: center;\"/>\r\n\t</div>\r\n</div>"
    * type = #display
    * enableWhen[+]
      * question = "MarkComplete-29" // Section complete item
      * operator = #=
      * answerBoolean = true  
  * item[+]
    * linkId = "substanceuse-smoking"
    * text = "Smoking"
    * type = #group
    * repeats = false  
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#grid
      * linkId = "substanceuse-smoking-smokingstatus"
      * text = "Smoking status"
        * extension[+]
          * url = "https://smartforms.csiro.au/ig/StructureDefinition/QuestionnaireItemTextHidden"
          * valueBoolean = true
      * type = #group
      * repeats = false
      * item[+]
        * linkId = "substanceuse-smoking-smokingstatus-group"
        * text = "Smoking status"
        * type = #group
        * repeats = false
        * item[+]
          * linkId = "substanceuse-smoking-smokingstatus-group-laststatus"
          * text = "Last status"
            * extension[http://hl7.org/fhir/StructureDefinition/cqf-expression].valueExpression
              * language = #text/fhirpath
              * expression = "iif(%ObsTobaccoSmokingStatusValue.exists() and %ObsTobaccoSmokingStatusDateFormatted.exists(), %ObsTobaccoSmokingStatusValue.display + ' ( ' + %ObsTobaccoSmokingStatusDateFormatted + ' )', 'Not available')"
          * type = #display
        * item[+]
          * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract].extension[template].valueReference.reference = "#SmokingStatusTemplate"
          * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#drop-down
          * linkId = "b639a3a8-f476-4cc8-b5c7-f5d2abb23511"
          * text = "New status"
          * type = #choice
          * repeats = false
          * answerValueSet = "#TobaccoUseStatus-1"
        * item[+]
          * linkId = "substanceuse-smoking-smokingstatus-group-newdate"
          * text = "New date"
          * type = #date
          * repeats = false
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#radio-button
      * linkId = "96dc7c22-d003-459c-8a56-f6cd182fc077"
      * text = "Quit status"
      * type = #choice
      * repeats = false
      * enableWhen[+]
        * question = "b639a3a8-f476-4cc8-b5c7-f5d2abb23511"
        * operator = #=
        * answerCoding = http://snomed.info/sct#8517006
      * answerValueSet = "#SmokingQuitStatus-1"      
    * item[+]
      * linkId = "9e86387d-1be4-4c26-9047-9dd6b03e1ee0"
      * text = "How many?"
      * type = #string
      * repeats = false
      * enableWhen[+]
        * question = "b639a3a8-f476-4cc8-b5c7-f5d2abb23511"
        * operator = #=
        * answerCoding = http://snomed.info/sct#77176002
      * enableWhen[+]
        * question = "b639a3a8-f476-4cc8-b5c7-f5d2abb23511"
        * operator = #=
        * answerCoding = http://snomed.info/sct#8517006
      * enableWhen[+]
        * question = "b639a3a8-f476-4cc8-b5c7-f5d2abb23511"
        * operator = #=
        * answerCoding = http://snomed.info/sct#394872000
      * enableBehavior = #any
    * item[+]
      * linkId = "32e71641-f660-4ca2-af99-dff8917f07be"
      * text = "How long as a smoker?"
      * type = #string
      * enableWhen[+]
        * question = "b639a3a8-f476-4cc8-b5c7-f5d2abb23511"
        * operator = #=
        * answerCoding = http://snomed.info/sct#77176002
      * enableWhen[+]
        * question = "b639a3a8-f476-4cc8-b5c7-f5d2abb23511"
        * operator = #=
        * answerCoding = http://snomed.info/sct#8517006
      * enableWhen[+]
        * question = "b639a3a8-f476-4cc8-b5c7-f5d2abb23511"
        * operator = #=
        * answerCoding = http://snomed.info/sct#394872000
      * enableBehavior = #any
  * item[+]
    * linkId = "34feaee8-8088-43ee-991d-9729990b5550"
    * text = "Alcohol and other substance use"
    * type = #group
    * repeats = false
    * item[+]
      * extension[sdc-questionnaire-shortText].valueString = "Quantity and frequency of substance use" 
      * linkId = "ea73d52c-f831-46be-a45d-2c42250a5210"
      * text = "Quantity and frequency of: alcohol; caffeine (coffee, soft drinks, iced coffee); cannabis/yarndi/gunja; other substance use: IVDU, methamphetamine, opiates, solvents, other"
        * extension[http://hl7.org/fhir/StructureDefinition/rendering-xhtml].valueString = "<div xmlns=\"http://www.w3.org/1999/xhtml\">
        <div>Quantity and frequency of:</div>
        <ul>
          <li>alcohol</li>
          <li>caffeine (coffee, soft drinks, iced coffee)</li>
          <li>cannabis/yarndi/gunja</li>
          <li>other substance use: IVDU, methamphetamine, opiates, solvents, other</li>
        </ul>
	      </div>"
      * type = #text
      * repeats = false
      * item[+]
        * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#prompt
        * linkId = "232cf24c-db60-4601-869d-525fb6e05988"
        * text = "details"
        * type = #display
  * item[+]
    * linkId = "f8e1cc1f-f1a1-4eb3-8255-77d600f52831"
    * text = "Health priorities, actions and follow-up"
    * type = #text
    * repeats = false     

  * item[+]
    * linkId = "MarkComplete-29"
    * text = "Mark section as complete"
      * extension[http://hl7.org/fhir/StructureDefinition/rendering-xhtml].valueString = "<div xmlns=\"http://www.w3.org/1999/xhtml\">\r\n<head>\r\n    <style type=\"text/css\">\r\n        .alert {\r\n            padding: 0.875rem;\r\n            margin-bottom: 1rem;\r\n            font-size: 0.875rem;\r\n            color: #29712D;\r\n            border-radius: 0.5rem;\r\n            background-color: #D9E8DA;\r\n            font-weight: 700;\r\n        max-width: 205px;\r\n        }\r\n    </style>\r\n</head>\r\n<body>\r\n<div class=\"alert\">Mark section as complete</div>\r\n</body>\r\n</div>"
    * type = #boolean
    * repeats = false
