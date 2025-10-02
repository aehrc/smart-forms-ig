Alias: $LNC = http://loinc.org
Alias: $SCT = http://snomed.info/sct
Alias: $UCUM = http://unitsofmeasure.org
// Alias for CVD
Alias: $launchContext = http://hl7.org/fhir/uv/sdc/CodeSystem/launchContext
Alias: $unitsofmeasure = http://unitsofmeasure.org
Alias: $questionnaire-item-control = http://hl7.org/fhir/questionnaire-item-control
Alias: $sct = http://snomed.info/sct

Instance: AbsoluteCVDRiskCalculation
InstanceOf: Questionnaire
Usage: #example
Title: "Aboriginal and Torres Strait Islander Health Check - Absolute Cardiovascular Disease Risk Calculation"
Description: "Absolute Cardiovascular Disease Risk Calculation sub-questionnaire for Aboriginal and Torres Strait Islander Health Check."


* contained[+] = biological-sex-1
* contained[+] = biological-sex-2


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
* extension[+]
  * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-assembleContext"
  * valueString = "ObsBloodPressure"
* extension[+]
  * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-assembleContext"
  * valueString = "ObsBloodPressureLatest"
* extension[+]
  * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-assembleContext"
  * valueString = "SexAtBirthCoding"
* extension[+]
  * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-assembleContext"
  * valueString = "ObsTobaccoSmokingStatus"
* extension[+]
  * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-assembleContext"
  * valueString = "ObsTobaccoSmokingStatusLatest"
* extension[+]
  * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-assembleContext"
  * valueString = "postcode"

//fhir query variables
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "ObsTotalCholesterol"
    * language = #application/x-fhir-query
    * expression = "Observation?code=14647-2&_sort=-date&patient={{%patient.id}}"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "ObsHDLCholesterol"
    * language = #application/x-fhir-query
    * expression = "Observation?code=14646-4&_sort=-date&patient={{%patient.id}}"
//client side filtering on Observations
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "ObsTotalCholesterolLatest"
    * language = #text/fhirpath
    * expression = "%ObsTotalCholesterol.entry.resource.where(status = 'final' or status = 'amended' or status = 'corrected').first()"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "ObsHDLCholesterolLatest"
    * language = #text/fhirpath
    * expression = "%ObsHDLCholesterol.entry.resource.where(status = 'final' or status = 'amended' or status = 'corrected').first()"
//Previous CVD risk result variables
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "CVDRiskResult"
    * language = #application/x-fhir-query
    * expression = "Observation?code=441829007&_sort=-date&patient={{%patient.id}}"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "CVDRiskResultLatest"
    * language = #text/fhirpath
    * expression = "%CVDRiskResult.entry.resource.where(status = 'final' or status = 'amended' or status = 'corrected').first()"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "CVDRiskResultValue"
    * language = #text/fhirpath
    * expression = "%CVDRiskResultLatest.select((((value.ofType(Quantity).comparator + value.ofType(Quantity).value.toString() + value.ofType(Quantity).unit | value.ofType(Quantity).value.toString() + value.ofType(Quantity).unit).first() | (value.ofType(Range).low.value.toString() + ' - ' + value.ofType(Range).high.value.toString() + value.ofType(Range).high.unit)).first()) + ' ' + interpretation.coding.display)"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "CVDRiskResultDateString"
    * language = #text/fhirpath
    * expression = "%CVDRiskResultLatest.effective.toString()"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "CVDRiskResultDateFormatted"
    * language = #text/fhirpath
    * expression = "%CVDRiskResultDateString.substring(8,2).toInteger().toString() + ' ' + %CVDRiskResultDateString.substring(5,2).replace('01','Jan').replace('02','Feb').replace('03','Mar').replace('04','Apr').replace('05','May').replace('06','Jun').replace('07','Jul').replace('08','Aug').replace('09','Sep').replace('10','Oct').replace('11','Nov').replace('12','Dec') + ' ' + %CVDRiskResultDateString.substring(0,4)"


* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "NewAssessmentQuestionAnswer"
    * language = #text/fhirpath
    * expression = "repeat(item).where(linkId='cvdrisk-newassessmentquestion').answer.value"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "AusCVDRiskiAccessAnswer"
    * language = #text/fhirpath
    * expression = "repeat(item).where(linkId='cvdrisk-auscvdriskiaccess').answer.value"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "RepopulateOverrideAnswer"
    * language = #text/fhirpath
    * expression = "repeat(item).where(linkId='cvdrisk-repopulateoverride').answer.value"

//R5 preadoption extensions
* extension[+]
  * url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-Questionnaire.versionAlgorithm[x]"
  * valueCoding
    * system = "http://hl7.org/fhir/version-algorithm"
    * code = #semver

* meta.profile[+] = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-render"
* meta.profile[+] = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-modular"
* meta.profile[+] = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-pop-exp"
* meta.profile[+] = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-behave"
* url = "http://www.health.gov.au/assessments/mbs/715/AbsoluteCVDRiskCalculation"
* name = "AbsoluteCVDRiskCalculation"
* title = "Aboriginal and Torres Strait Islander Health Check - Absolute Cardiovascular Disease Risk Calculation"
* status = #draft
* experimental = false
* subjectType[+] = #Patient
* date = "2025-03-14"
* jurisdiction.coding = urn:iso:std:iso:3166#AU


* item[+]
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression].valueExpression
    * language = #text/fhirpath
    * expression = "%age >= 25"
  * linkId = "d95abe99-8ef2-4b97-bc88-a2901e2ebc9c"
  * text = "Absolute cardiovascular disease risk calculation"
  * type = #group
  * repeats = false
  * item[+] //in-progress
    * extension[questionnaire-itemControl].valueCodeableConcept = https://smartforms.csiro.au/ig/CodeSystem/QuestionnaireItemControlExtended#context-display    
    * linkId = "CD-in-progress-2"
    * text = "In progress"
      * extension[http://hl7.org/fhir/StructureDefinition/rendering-xhtml].valueString = "<div title=\"In progress\" xmlns=\"http://www.w3.org/1999/xhtml\">\r\n\t<div style=\"display: flex; flex-direction: row;\">\r\n\t\t<img width='24' height='24' src='data:image/svg+xml;base64,\r\n\t\tPHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxZW0iIGhlaWdodD0iMWVtIiB2aWV3Qm94PSIwIDAgMjQgMjQiPjxwYXRoIGZpbGw9IiM3NTc1NzUiIGQ9Im0xNS44NCAxMC4ybC0xLjAxIDEuMDFsLTIuMDctMi4wM2wxLjAxLTEuMDJjLjItLjIxLjU0LS4yMi43OCAwbDEuMjkgMS4yNWMuMjEuMjEuMjIuNTUgMCAuNzlNOCAxMy45MWw0LjE3LTQuMTlsMi4wNyAyLjA4bC00LjE2IDQuMkg4di0yLjA5TTEzIDJ2MmM0LjM5LjU0IDcuNSA0LjUzIDYuOTYgOC45MkE4LjAxNCA4LjAxNCAwIDAgMSAxMyAxOS44OHYyYzUuNS0uNiA5LjQ1LTUuNTQgOC44NS0xMS4wM0MyMS4zMyA2LjE5IDE3LjY2IDIuNSAxMyAybS0yIDBjLTEuOTYuMTgtMy44MS45NS01LjMzIDIuMkw3LjEgNS43NGMxLjEyLS45IDIuNDctMS40OCAzLjktMS42OHYtMk00LjI2IDUuNjdBOS44MSA5LjgxIDAgMCAwIDIuMDUgMTFoMmMuMTktMS40Mi43NS0yLjc3IDEuNjQtMy45TDQuMjYgNS42N00yLjA2IDEzYy4yIDEuOTYuOTcgMy44MSAyLjIxIDUuMzNsMS40Mi0xLjQzQTguMDAyIDguMDAyIDAgMCAxIDQuMDYgMTNoLTJtNSA1LjM3bC0xLjM5IDEuMzdBOS45OTQgOS45OTQgMCAwIDAgMTEgMjJ2LTJhOC4wMDIgOC4wMDIgMCAwIDEtMy45LTEuNjNoLS4wNFoiLz48L3N2Zz4=' \r\n\t\tstyle=\"align-self: center;\"/>\r\n\t</div>\r\n</div>" 
    * type = #display
    * enableWhen[+]
      * question = "MarkComplete-2" // Section complete item
      * operator = #!=
      * answerBoolean = true  
  * item[+] //complete
    * extension[questionnaire-itemControl].valueCodeableConcept = https://smartforms.csiro.au/ig/CodeSystem/QuestionnaireItemControlExtended#context-display
    * linkId = "CD-complete-2"
    * text = "Complete"
      * extension[http://hl7.org/fhir/StructureDefinition/rendering-xhtml].valueString = "<div title=\"Section completed\" xmlns=\"http://www.w3.org/1999/xhtml\">\r\n\t<div style=\"display: flex; flex-direction: row;\">\r\n\t\t<img width='24' height='24' src='data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxZW0iIGhlaWdodD0iMWVtIiB2aWV3Qm94PSIwIDAgMjQgMjQiPjxwYXRoIGZpbGw9IiMyZTdkMzIiIGQ9Ik0yMCAxMmE4IDggMCAwIDEtOCA4YTggOCAwIDAgMS04LThhOCA4IDAgMCAxIDgtOGMuNzYgMCAxLjUuMTEgMi4yLjMxbDEuNTctMS41N0E5LjgyMiA5LjgyMiAwIDAgMCAxMiAyQTEwIDEwIDAgMCAwIDIgMTJhMTAgMTAgMCAwIDAgMTAgMTBhMTAgMTAgMCAwIDAgMTAtMTBNNy45MSAxMC4wOEw2LjUgMTEuNUwxMSAxNkwyMSA2bC0xLjQxLTEuNDJMMTEgMTMuMTdsLTMuMDktMy4wOVoiLz48L3N2Zz4='\r\n\t\tstyle=\"align-self: center;\"/>\r\n\t</div>\r\n</div>"
    * type = #display
    * enableWhen[+]
      * question = "MarkComplete-2" // Section complete item
      * operator = #=
      * answerBoolean = true
  * item[+]
    * linkId = "Guidance-CVDRisk"
    * text = "The Australian guideline for assessing and managing cardiovascular disease risk recommends the use of the Aus CVD Risk calculator."
      * extension[http://hl7.org/fhir/StructureDefinition/rendering-xhtml].valueString = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p style=\"font-size:1.1em;\">The Australian guideline for assessing and managing cardiovascular disease risk recommends the use of the Aus&nbsp;CVD&nbsp;Risk calculator.</p></div>"
    * type = #display
  * item[+]
    * linkId = "dabdc7b4-51db-44a0-9d59-77a88587cbe9"
    * text = "CVD risk result"
    * type = #group   
    * repeats = false
    * item[+]
      * extension[sdc-questionnaire-initialExpression].valueExpression
        * language = #text/fhirpath
        * expression = "iif(%CVDRiskResultValue.exists() and %CVDRiskResultDateFormatted.exists(), %CVDRiskResultValue + ' ( ' + %CVDRiskResultDateFormatted + ' )', 'Not available')"
      * extension[https://smartforms.csiro.au/ig/StructureDefinition/questionnaire-initialExpression-repopulatable].valueCode = #manual
      * linkId = "cvdrisk-latestresult"
      * text = "Latest available result"
      * type = #string
      * repeats = false
      * readOnly = true
    * item[+]
      * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression].valueExpression
        * language = #text/fhirpath
        * expression = "%CVDRiskResultValue.exists() and %CVDRiskResultDateFormatted.exists()"
      * linkId = "cvdrisk-newassessmentquestion"
      * text = "A previous CVD risk result has been found. Do you want to perform a new assessment?"
      * type = #boolean
      * repeats = false
    * item[+]
      * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression].valueExpression
        * language = #text/fhirpath
        * expression = "%NewAssessmentQuestionAnswer = true or %CVDRiskResultValue.empty() or %CVDRiskResultDateFormatted.empty()"
      * linkId = "cvdrisk-auscvdriskiaccess"
      * text = "Do you have access to the Aus CVD Risk-i application from your clinical system?"
        * extension[http://hl7.org/fhir/StructureDefinition/rendering-xhtml].valueString = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Do you have access to the <em>Aus&nbsp;CVD&nbsp;Risk&#8209;i</em> application from your clinical system?</p></div>"
      * type = #boolean
      * repeats = false
    * item[+]
      * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression].valueExpression
        * language = #text/fhirpath
        * expression = "%AusCVDRiskiAccessAnswer = true"
      * linkId = "cvdrisk-auscvdriskiguidance"
      * text = "Using the Aus CVD Risk-i application, calculate the CVD risk result and save it to the patient record. This form can then be repopulated to retrieve and include the result above."
        * extension[http://hl7.org/fhir/StructureDefinition/rendering-xhtml].valueString = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p style=\"font-size:1.1em;\">Using the <em>Aus&nbsp;CVD&nbsp;Risk&#8209;i</em> application, calculate the CVD risk result and save it to the patient record. This form can then be repopulated to retrieve and include the result above.</p></div>"
      * type = #display
    * item[+]
      * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression].valueExpression
        * language = #text/fhirpath
        * expression = "%AusCVDRiskiAccessAnswer = true"
      * linkId = "cvdrisk-repopulateoverride"
      * text = "Do you need to manually enter a new CVD risk result instead of repopulating?"
      * type = #boolean
      * repeats = false
    * item[+]
      * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression].valueExpression
        * language = #text/fhirpath
        * expression = "%AusCVDRiskiAccessAnswer != true or %RepopulateOverrideAnswer = true"
      * linkId = "cvdrisk-cvdriskresultgroup"
      * text = "New CVD risk result"
      * type = #group
      * repeats = false
      * item[+]
        * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression].valueExpression
          * language = #text/fhirpath
          * expression = "%AusCVDRiskiAccessAnswer != true"
        * linkId = "cvdrisk-onlincecalculatorguidance"
        * text = "Use the online Australian CVD risk calculator - https://www.cvdcheck.org.au/calculator"
          * extension[http://hl7.org/fhir/StructureDefinition/rendering-xhtml].valueString = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>The <a href=\"https://www.cvdcheck.org.au/calculator\" target=\"_blank\">Australian CVD risk calculator</a> on the Aus&nbsp;CVD&nbsp;Risk website should be used. Below is a read only view of a subset of variables that can be used as inputs for the online calculator. The calculated CVD risk result can be entered here.</p></div>"
        * type = #display
      * item[+]
        * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unit].valueCoding = $UCUM#%
        * linkId = "4c52fcec-0695-4916-b185-24a5c2711631"
        * text = "Risk result score"
        * type = #integer   
        * repeats = false
        * item[+]
          * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#unit
          * linkId = "0162854e-c124-4b58-acd9-93c17562d407"
          * text = "%"
          * type = #display
      * item[+]
        * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#radio-button
        * linkId = "28ff9463-b77f-435d-9ba7-427682a61f96"
        * text = "Assessed risk category"
        * type = #choice   
        * repeats = false
        * answerOption[+].valueString = "High Risk"
        * answerOption[+].valueString = "Intermediate Risk"
        * answerOption[+].valueString = "Low Risk"
//Online calculator variables view
  * item[+]
    * linkId = "8d02ef36-3f48-4912-b001-e9fec6aa7101"
    * text = "CVD risk calculator variables"
    * type = #group
    * repeats = false
    * readOnly = true
    * enableWhen[+]
      * question = "cvdrisk-auscvdriskiaccess"
      * operator = #=
      * answerBoolean = false
    * item[+]
      * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression].valueExpression
        * description = "CVD Risk Age"
        * language = #text/fhirpath
        * expression = "%age"
      * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unit].valueCoding = $UCUM#a
      * linkId = "6909cb38-a6f4-44c9-abae-0e5d697a21f5"
      * text = "Age"
      * type = #integer
      * item[+]
        * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#unit
        * linkId = "b9aba16c-f910-4948-9267-e07851f69572"
        * text = "years"
        * type = #display
    * item[+]
      * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression].valueExpression
        * description = "CVD Risk Sex At Birth"
        * language = #text/fhirpath
        * expression = "%sexValueCode"
      * linkId = "3dbb0e63-3b28-4567-8ef3-bac242fd95f6"
      * text = "Sex at birth"
      * type = #choice
      * repeats = false
      * answerValueSet = "#biological-sex-2"
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#grid
      * linkId = "fe9feec6-593a-4106-8a7d-f9965a632ea2"
      * text = "Observation values"
        * extension[+]
          * url = "https://smartforms.csiro.au/ig/StructureDefinition/QuestionnaireItemTextHidden"
          * valueBoolean = true
      * type = #group 
      * repeats = false
      // Smoking Status
      * item[+]
        * linkId = "bac0f824-3784-400e-80f9-ad18d46bd8cb"
        * text = "Smoking status"
        * type = #group
        * repeats = false
        * item[+]
          // * extension[sdc-questionnaire-initialExpression].valueExpression
          //   * language = #text/fhirpath
          //   * expression = "%ObsTobaccoSmokingStatusLatest.value.coding.where(system='http://snomed.info/sct').first()"
          * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression].valueExpression
            * description = "CVD Smoking Status"
            * language = #text/fhirpath
            * expression = "iif(exists(%resource.descendants().item.where(linkId='b639a3a8-f476-4cc8-b5c7-f5d2abb23511').answer.value.code), %resource.descendants().item.where(linkId='b639a3a8-f476-4cc8-b5c7-f5d2abb23511').answer.value.code, %ObsTobaccoSmokingStatusLatest.value.coding.where(system='http://snomed.info/sct').first())"  
          * linkId = "333007c7-47a9-482b-af11-e55484abf2ae"
          * text = "Value"
          * type = #choice
          * repeats = false
          * answerOption[+].valueCoding = http://snomed.info/sct#266919005 "Never Smoked"
          * answerOption[+].valueCoding = http://snomed.info/sct#77176002 "Currently Smoker"
          * answerOption[+].valueCoding = http://snomed.info/sct#8517006 "Previously Smoked"
          * answerOption[+].valueCoding = http://snomed.info/sct#16090371000119103 "Never Smoked"
          * answerOption[+].valueCoding = http://snomed.info/sct#394872000 "Currently Smoker"
          * answerOption[+].valueCoding = http://snomed.info/sct#713914004 "Currently Smoker"


      // Systolic Blood Pressure
      * item[+]
        * linkId = "fa4f73a3-7633-410c-9177-8aa43b117122"
        * text = "Systolic Blood Pressure"
        * type = #group
        * repeats = false
        * item[+]
          // * extension[sdc-questionnaire-initialExpression].valueExpression
          //   * language = #text/fhirpath
          //   * expression = "%ObsBloodPressureLatest.component.where(code.coding.exists(code='8480-6')).value.value"
          * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression].valueExpression
            * description = "CVD Systolic Blood Pressure"
            * language = #text/fhirpath
            * expression = "iif(exists(%resource.descendants().item.where(linkId='bp-newbp-systolic').answer.value) and (%resource.descendants().item.where(linkId='bp-newbp-date').answer.valueDate > (now() - 24 months)  ), %resource.descendants().item.where(linkId='bp-newbp-systolic').answer.value, %ObsBloodPressureLatest.component.where(code.coding.exists(code='8480-6')).value.value)"  
          * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unit].valueCoding = $UCUM#mm[Hg]
          * linkId = "818ce640-c8dd-457d-b607-3aaa8da38524"
          * text = "Value"
          * type = #integer
          * repeats = false
          * item[+]
            * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#unit
            * linkId = "ddea5a62-a8c1-4b15-b667-7b69babec8cd"
            * text = "mm Hg"
            * type = #display
        // * item[+]
        //   * extension[sdc-questionnaire-initialExpression].valueExpression
        //     * language = #text/fhirpath
        //     * expression = "%ObsBloodPressureLatest.effective"
        //   * linkId = "85d8faf7-ddb0-446c-b489-28d786d6de50"
        //   * text = "Date performed"
        //   * type = #date
        //   * repeats = false
      
      // Total Collestrol
      * item[+]
        * linkId = "e693c7d2-be69-4f1f-b72d-7ff2ea3cd536"
        * text = "Total Cholesterol"
        * type = #group
        * repeats = false
        * item[+]
          * extension[sdc-questionnaire-initialExpression].valueExpression
            * language = #text/fhirpath
            * expression = "%ObsTotalCholesterolLatest.value.value"
          * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unit].valueCoding = $UCUM#mmol/L
          * linkId = "99932a93-8135-47b2-933b-fd751b34b7af"
          * text = "Value"
          * type = #decimal
          * repeats = false
          * item[+]
            * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#unit
            * linkId = "fcfbfc9f-e400-4aae-993f-ea54096e7361"
            * text = "mmol/L"
            * type = #display
        // * item[+]
        //   * extension[sdc-questionnaire-initialExpression].valueExpression
        //     * language = #text/fhirpath
        //     * expression = "%ObsTotalCholesterolLatest.effective"
        //   * linkId = "16cbe87b-5c8d-4385-b7d9-da3f07f63f8a"
        //   * text = "Date performed"
        //   * type = #date
        //   * repeats = false

      * item[+]
        * linkId = "87eefaf6-010f-4b0d-9f51-2c33e46e6c69"
        * text = "HDL Cholesterol"
        * type = #group
        * repeats = false
        * item[+]
          * extension[sdc-questionnaire-initialExpression].valueExpression
            * language = #text/fhirpath
            * expression = "%ObsHDLCholesterolLatest.value.value"
          * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unit].valueCoding = $UCUM#mmol/L
          * linkId = "c14b4513-1e20-461d-97f4-4631711adc65"
          * text = "Value"
          * type = #decimal
          * repeats = false
          * item[+]
            * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#unit
            * linkId = "2ba61002-b642-4b28-9e66-dc2b060c4e0e"
            * text = "mmol/L"
            * type = #display
        // * item[+]
        //   * extension[sdc-questionnaire-initialExpression].valueExpression
        //     * language = #text/fhirpath
        //     * expression = "%ObsHDLCholesterolLatest.effective"
        //   * linkId = "6407e0a7-c416-4a75-933b-904c0dcf88ca"
        //   * text = "Date performed"
        //   * type = #date
        //   * repeats = false
          //  TODO: check how to get the ratio of cholestrol "Ratio of total cholesterol to HDL cholesterol"

//TODO Check how CVD medications are calculated. It uses medication request array.  The patient prepop does not list these medications. But the array variables exists. 


//Use of CVD Medicines
    * item[+]
      // * extension[0]
      //   * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression"
      //   * valueExpression
      //     * language = #text/fhirpath
      //     * expression = "%enableWhenNoHighRiskNoOutOfAgeRange"
      // * extension[+]
      //   * url = "https://smartforms.csiro.au/ig/StructureDefinition/required-feedback"
      //   * valueString = "Please make a selection to continue"
      * linkId = "cvd-meds-group"
      * type = #group
      * repeats = false
      // * required = true
      * text = "Use of CVD medicines within last 6 months"
      * item[+]
        * extension[0]
          * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
          * valueExpression
            * language = #text/fhirpath
            * expression = "%memberOfBpLoweringNewMedicationExists or %memberOfBpLoweringMedicationReqMedication or %memberOfBpLoweringMedicationCode or %memberOfBpLoweringMedicationContained or {}"
        * extension[+]
          * url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
          * valueCodeableConcept = $questionnaire-item-control#check-box
        * linkId = "bp-lowering-meds-boolean"
        * type = #boolean
        * repeats = false
        * text = "Blood pressure-lowering medicines"
        // * enableWhen
        //   * question = "cvd-meds-none-boolean"
        //   * operator = #!=
        //   * answerBoolean = true

      * item[+]
        * extension[0]
          * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
          * valueExpression
            * language = #text/fhirpath
            * expression = "%memberOfLipidModifyingNewMedicationExists or %memberOfLipidModifyingMedicationReqMedication or %memberOfLipidModifyingMedicationCode or %memberOfLipidModifyingMedicationContained or {}"
        * extension[+]
          * url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
          * valueCodeableConcept = $questionnaire-item-control#check-box
        * linkId = "lipid-modifying-meds-boolean"
        * type = #boolean
        * repeats = false
        * text = "Lipid-modifying medicines"
        // * enableWhen
        //   * question = "cvd-meds-none-boolean"
        //   * operator = #!=
        //   * answerBoolean = true
      * item[+]
        * extension[0]
          * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
          * valueExpression
            * language = #text/fhirpath
            * expression = "%memberOfAntithromboticMedicationNewMedicationExists or %memberOfAntithromboticMedicationReqMedication or %memberOfAntithromboticMedicationCode or %memberOfAntithromboticMedicationContained or {}"
        * extension[+]
          * url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
          * valueCodeableConcept = $questionnaire-item-control#check-box
        * linkId = "antithrombotic-meds-boolean"
        * type = #boolean
        * repeats = false
        * text = "Antithrombotic medicines"
        // * enableWhen
        //   * question = "cvd-meds-none-boolean"
        //   * operator = #!=
        //   * answerBoolean = true
// End if CVD Medicines

//  Start History of Atrial Fibrillation ******
    * item[+]
      * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression].valueExpression
        * description = "CVD Atrial Fibrillation Check"
        * language = #text/fhirpath
        * expression = "%conditionAtrialFibrillationExists or %newDiagnosisAtrialFibrillationExists"
      * linkId = "history-atrial-fibrillation-boolean"
      * type = #boolean
      * repeats = false
      * text = "History of atrial fibrillation"
    
//  ******* End of Atrial Fibrillation
    
// **** Start Postcode ****
    * item[+]
      * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression].valueExpression
        * description = "CVD Risk Postcode JVTEST"
        * language = #text/fhirpath
        * expression = "%postcode"
      * linkId = "fa8f03ca-9a5a-4ed1-a866-db26e567352a"
      * text = "Postcode"
      * type = #string
//  End ***** of Postcode 

// Diabetes
    * item[+]
      * extension
        * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
        * valueExpression
          * language = #text/fhirpath
          * expression = "%conditionDiabetesExists or %newDiagnosisDiabetesExists"
      * linkId = "1c1eea28-6c82-4b7b-aaa3-8655ce70f2fd"
      * text = "Type 2 diabetes mellitus"
      * type = #boolean
      * repeats = false
      * item[+]
        * extension
          * url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
          * valueCodeableConcept = $questionnaire-item-control#check-box
        * linkId = "cvd-meds-none-boolean"
        * type = #boolean
        * repeats = false
        * text = "None"
        * enableWhen[0]
          * question = "bp-lowering-meds-boolean"
          * operator = #!=
          * answerBoolean = true
        * enableWhen[+]
          * question = "lipid-modifying-meds-boolean"
          * operator = #!=
          * answerBoolean = true
        * enableWhen[+]
          * question = "antithrombotic-meds-boolean"
          * operator = #!=
          * answerBoolean = true

//
// **************************************Start of Additional Diabetes Details Group
    
    * item[+]
      * linkId = "additional-diabetes-details-group"
      * type = #group
      * repeats = false
      * text = "Additional Diabetes Details"
      // * item[0]
      //   * extension[0]
      //     * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
      //     * valueExpression
      //       * language = #text/fhirpath
      //       * expression = "%diabetesYearsIntegerPrePop.exists() or %hba1cMmolDecimalPrepop.exists() or %uacrDecimalPrepop.exists() or %egfrDecimalPrepop.exists() or %bmiWeightDecimalPrepop.exists() or %bmiHeightDecimalPrepop.exists() or %insulinUseBooleanPrepop.exists()"
      //   // * extension[+]
      //   //   * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression"
      //   //   * valueExpression
      //   //     * language = #text/fhirpath
      //   //     * expression = "%enableWhenNoHighRiskNoOutOfAgeRange"
      //   * linkId = "additional-diabetes-details-boolean"
      //   * text = "Provide additional diabetes details"
      //   * type = #boolean
      * item[0]
        * text = "The diabetes specific equation provides a more accurate CVD risk estimate for people with type 2 diabetes. Please note that this may give an inaccurate risk estimate in people with type 1 diabetes."
          * extension
            * url = "http://hl7.org/fhir/StructureDefinition/rendering-xhtml"
            * valueString = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p style=\"color: rgb(84, 110, 122); font-size: 14px\">The diabetes specific equation provides a more accurate CVD risk estimate for people with type 2 diabetes. Please note that this may give an inaccurate risk estimate in people with type 1 diabetes.</p></div>"
        * linkId = "additional-diabetes-details-display"
        * type = #display
      * item[+]
        * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression].valueExpression
          * description = "Diabetes Years Final"
          * language = #text/fhirpath
          * expression = "%diabetesYearsFinal"
        // * extension[+]
        //   * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
        //   * valueExpression
        //     * language = #text/fhirpath
        //     * expression = "%diabetesYearsFinal"
        * linkId = "diabetes-years-integer"
        * text = "Years since diabetes diagnosis"
        // * required = true
        * type = #integer
// HbA1c

      * item[+]
        * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#grid
        * linkId = "hba1c-cvd-grid"
        * text = "Glycated haemoglobin (HbA1c)"
        * type = #group

        * item[+]
          // * extension[0]
          //   * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression"
          //   * valueExpression
          //     * language = #text/fhirpath
          //     * expression = "%enableWhenNoHighRiskNoOutOfAgeRangeNoDiabetes"
          // * extension[+]
          //   * url = "https://smartforms.csiro.au/ig/StructureDefinition/required-feedback"
          //   * valueString = "Please enter a valid number"
          * linkId = "hba1c-group"
          * text = "Glycated haemoglobin (HbA1c)"
          * type = #group
          * repeats = false
          * required = true
          * item[0]
            * extension[+]
              * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
              * valueExpression
                * language = #text/fhirpath
                * expression = "%hba1cMmolDecimalPrepop"
            // * extension[+]
            //   * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression"
            //   * valueExpression
            //     * language = #text/fhirpath
            //     * expression = "%hbA1cPercentageValue.empty()"
            * linkId = "hba1c-mmol-decimal"
            * text = "Decimal Value"
            * type = #decimal
            * item[0] 
              * extension
                * url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
                * valueCodeableConcept = $questionnaire-item-control#unit
              * linkId = "hba1c-mmol-unit"
              * text = "mmol/mol"
              * type = #display
          * item[+]
            * text = "Or"
            * type = #display
            * linkId = "hba1c-or-seperator-text"
            * extension[0]
              * url = "https://smartforms.csiro.au/ig/StructureDefinition/QuestionnaireItemTextHidden"
              * valueBoolean = true


          * item[+]
            * extension[+]
              * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression"
              * valueExpression
                * language = #text/fhirpath
                * expression = "%hbA1cMmolValue.empty()"
            * linkId = "hba1c-percentage-decimal"
            * text = "Percentage"
            * type = #decimal
            * item
              * extension
                * url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
                * valueCodeableConcept = $questionnaire-item-control#unit
              * linkId = "hba1c-percentage-unit"
              * text = "%"
              * type = #display
  // 

// uACR
     
      * item[+]
        // * extension
        //   * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression"
        //   * valueExpression
        //     * language = #text/fhirpath
        //     * expression = "%enableWhenNoHighRiskNoOutOfAgeRangeNoDiabetes"
        * linkId = "uacr-group"
        * type = #group
        * text = "uACR"
        * repeats = false
        * required = true
        * item[0]
          * extension[0]
            * url = "http://hl7.org/fhir/StructureDefinition/entryFormat"
            * valueString = "Enter value"
          * extension[+]
            * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
            * valueExpression
              * language = #text/fhirpath
              * expression = "%uacrDecimalPrepop"
          * extension[+]
            * url = "https://smartforms.csiro.au/ig/StructureDefinition/required-feedback"
            * valueString = "Please enter a valid number"
          * linkId = "uacr-decimal"
          * text = "uACR"
          * required = true
          * type = #decimal
          * item
            * extension
              * url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
              * valueCodeableConcept = $questionnaire-item-control#unit
            * linkId = "uacr-unit"
            * text = "mg/mmol"
            * type = #display
        * item[+]
          * extension
            * url = "http://hl7.org/fhir/StructureDefinition/questionnaire-hidden"
            * valueBoolean = true
          * text.extension
            * url = "http://hl7.org/fhir/StructureDefinition/rendering-xhtml"
            * valueString = "<div xmlns=\"http://www.w3.org/1999/xhtml\" id=\"uacr-alert-div\" style=\"width:100%; display: flex; border-radius: 4px; border: 1px solid transparent; background-color: rgba(255, 168, 90, 0.12); padding: 12px 16px; color: rgb(168, 75, 13);\"><div style=\"margin-right: 16px; margin-top: 1px; height: 20px; width: 20px;\"><svg xmlns=\"http://www.w3.org/2000/svg\" width=\"20\" height=\"20\" viewBox=\"0 0 24 24\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"2\" stroke-linecap=\"round\" stroke-linejoin=\"round\"><path d=\"M3 12a9 9 0 1 0 18 0a9 9 0 0 0 -18 0\"></path><path d=\"M12 8v4\"></path><path d=\"M12 16h.01\"></path></svg></div><div style=\"display: flex; flex-direction: column; gap: 10px; font-size: 14px;\"><div style=\"font-weight: 600;\">Clinically determined high risk</div><div style=\"color: rgb(84, 110, 122);\">People with moderate-to-severe chronic kidney disease are automatically considered to be at high risk of CVD. This includes people with any of the following:</div><ul style=\"color: rgb(84, 110, 122); font-size: 14px; list-style-position: inside;\" ><li>sustained eGFR <45mL/min/1.73m²</li><li>persistent uACR >25mg/mmol (men) or persistent uACR >35mg/mmol (women)</li></ul><div style=\"display: flex;\"><button type=\"button\" aria-label=\"Close alert\" onclick=\"document.getElementById('uacr-alert-div').style.display='none';\"style=\"border-radius: 4px; height: 30px; min-width: 110px; padding: 0 1.125rem; font-size: 12px; font-weight: 500; line-height: 30px; text-decoration: none; background-color: rgb(182, 198, 207, 0.4); color: rgb(25, 27, 94); border: none; cursor: pointer;\">Continue with risk calculator</button></div></div></div>"
          * linkId = "uacr-alert"
          * type = #display
          * repeats = false
//  end of uACR
     
      // eGFR

      * item[+]
        // * extension[0]
        //   * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression"
        //   * valueExpression
        //     * language = #text/fhirpath
        //     * expression = "%enableWhenNoHighRiskNoOutOfAgeRangeNoDiabetes"
        // * extension[+]
        //   * url = "https://smartforms.csiro.au/ig/StructureDefinition/required-feedback"
        //   * valueString = "Please enter a valid number"
        * linkId = "egfr-group"
        * text = "eGFR"
        * type = #group
        * repeats = false
        * required = true
        * item[0]
          // * extension[0]
          //   * url = "http://hl7.org/fhir/StructureDefinition/entryFormat"
          //   * valueString = "Enter value"
          * extension[0]
            * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
            * valueExpression
              * language = #text/fhirpath
              * expression = "%egfrDecimalPrepop"
          // * extension[+]
          //   * url = "http://hl7.org/fhir/StructureDefinition/minValue"
          //   * valueDecimal = 1
          // * extension[+]
          //   * url = "http://hl7.org/fhir/StructureDefinition/maxValue"
          //   * valueDecimal = 199
          // * extension[+]
          //   * url = "https://smartforms.csiro.au/ig/StructureDefinition/minValue-feedback"
          //   * valueString = "Please enter a value between 1-199 to continue"
          // * extension[+]
          //   * url = "https://smartforms.csiro.au/ig/StructureDefinition/maxValue-feedback"
          //   * valueString = "Please enter a value between 1-199 to continue"
          // * extension[+]
          //   * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression"
          //   * valueExpression
          //     * language = #text/fhirpath
          //     * expression = "%eGFR90BooleanEnabled.empty() or %eGFR90BooleanEnabled = false"
          * linkId = "egfr-decimal"
          * text = "eGFR"
          * type = #decimal
          * item
            * extension
              * url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
              * valueCodeableConcept = $questionnaire-item-control#unit
            * linkId = "egfr-unit"
            * text = "mL/min/1.73 m²"
            * type = #display
        // * item[+]
        //   * extension
        //     * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression"
        //     * valueExpression
        //       * language = #text/fhirpath
        //       * expression = "%eGFRDecimalValue.empty()"
        //   * linkId = "egfr-90-boolean"
        //   * text = "eGFR≥90"
        //   * type = #boolean
      * item[+]
        * extension
          * url = "http://hl7.org/fhir/StructureDefinition/questionnaire-hidden"
          * valueBoolean = true
        * text.extension
          * url = "http://hl7.org/fhir/StructureDefinition/rendering-xhtml"
          * valueString = "<div xmlns=\"http://www.w3.org/1999/xhtml\" id=\"egfr-alert-div\" style=\"width:100%; display: flex; border-radius: 4px; border: 1px solid transparent; background-color: rgba(255, 168, 90, 0.12); padding: 12px 16px; color: rgb(168, 75, 13);\"><div style=\"margin-right: 16px; margin-top: 1px; height: 20px; width: 20px;\"><svg xmlns=\"http://www.w3.org/2000/svg\" width=\"20\" height=\"20\" viewBox=\"0 0 24 24\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"2\" stroke-linecap=\"round\" stroke-linejoin=\"round\"><path d=\"M3 12a9 9 0 1 0 18 0a9 9 0 0 0 -18 0\"></path><path d=\"M12 8v4\"></path><path d=\"M12 16h.01\"></path></svg></div><div style=\"display: flex; flex-direction: column; gap: 10px; font-size: 14px;\"><div style=\"font-weight: 600;\">Clinically determined high risk</div><div style=\"color: rgb(84, 110, 122);\">People with moderate-to-severe chronic kidney disease are automatically considered to be at high risk of CVD. This includes people with any of the following:</div><ul style=\"color: rgb(84, 110, 122); font-size: 14px; list-style-position: inside;\" ><li>sustained eGFR <45mL/min/1.73m²</li><li>persistent uACR >25mg/mmol (men) or persistent uACR >35mg/mmol (women)</li></ul><div style=\"display: flex;\"><button type=\"button\" aria-label=\"Close alert\" onclick=\"document.getElementById('egfr-alert-div').style.display='none';\"style=\"border-radius: 4px; height: 30px; min-width: 110px; padding: 0 1.125rem; font-size: 12px; font-weight: 500; line-height: 30px; text-decoration: none; background-color: rgb(182, 198, 207, 0.4); color: rgb(25, 27, 94); border: none; cursor: pointer;\">Continue with risk calculator</button></div></div></div>"
        * linkId = "egfr-alert"
        * type = #display
        * repeats = false

      // BMI

      * item[+]
        // * extension[0]
        //   * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression"
        //   * valueExpression
        //     * language = #text/fhirpath
        //     * expression = "%enableWhenNoHighRiskNoOutOfAgeRangeNoDiabetes"
        * extension[+]
          * url = "http://hl7.org/fhir/StructureDefinition/questionnaire-unit"
          * valueCoding = $unitsofmeasure#kg/m2 "kg/m²"
        * linkId = "bmi-group"
        * text = "Body mass index (BMI)"
        * required = true
        * type = #group
        * item[0]
          // * extension[0]
          //   * url = "http://hl7.org/fhir/StructureDefinition/entryFormat"
          //   * valueString = "Weight"
          // * extension[+]
          //   * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
          //   * valueExpression
          //     * language = #text/fhirpath
          //     * expression = "%bmiWeightDecimalPrepop"
          // * extension[+]
          //   * url = "http://hl7.org/fhir/StructureDefinition/minValue"
          //   * valueDecimal = 30
          // * extension[+]
          //   * url = "http://hl7.org/fhir/StructureDefinition/maxValue"
          //   * valueDecimal = 350
          // * extension[+]
          //   * url = "https://smartforms.csiro.au/ig/StructureDefinition/minValue-feedback"
          //   * valueString = "Please enter a value between 30-350 to continue"
          // * extension[+]
          //   * url = "https://smartforms.csiro.au/ig/StructureDefinition/maxValue-feedback"
          //   * valueString = "Please enter a value between 30-350 to continue"
          // * extension[+]
          //   * url = "https://smartforms.csiro.au/ig/StructureDefinition/required-feedback"
          //   * valueString = "Please enter a valid number to continue"
          * extension[0]
            * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression"
            * valueExpression
              * language = #text/fhirpath
              * expression = "%weightValueLatest"
          * linkId = "bmi-weight-decimal"
          * text = "Weight"
          * type = #decimal
          // * required = true
          * item
            * extension
              * url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
              * valueCodeableConcept = $questionnaire-item-control#unit
            * linkId = "bmi-weight-unit"
            * text = "kg"
            * type = #display
        * item[+]
          * extension[0]
            * url = "http://hl7.org/fhir/StructureDefinition/entryFormat"
            * valueString = "Height"
          // * extension[+]
          //   * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
          //   * valueExpression
          //     * language = #text/fhirpath
          //     * expression = "%bmiHeightDecimalPrepop"
          * extension[+]
            * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression"
            * valueExpression
              * language = #text/fhirpath
              * expression = "iif(exists(%height), %height / 100, %ObsBodyHeightValue / 100)"
          * linkId = "bmi-height-decimal"
          * text = "Height"
          * type = #decimal
          * required = true
          * item
            * extension
              * url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
              * valueCodeableConcept = $questionnaire-item-control#unit
            * linkId = "bmi-height-unit"
            * text = "m"
            * type = #display

      // Insulin Use

      * item[+]
        * extension[0]
          * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
          * valueExpression
            * language = #text/fhirpath
            * expression = "%insulinUseBooleanPrepop"
        // * extension[+]
        //   * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression"
        //   * valueExpression
        //     * language = #text/fhirpath
        //     * expression = "%enableWhenNoHighRiskNoOutOfAgeRangeNoDiabetes"
        * extension[+]
          * url = "https://smartforms.csiro.au/ig/StructureDefinition/required-feedback"
          * valueString = "Please make a selection to continue"
        * linkId = "insulin-use-boolean"
        * text = "Use of insulin within last 6 months"
        * required = true
        * type = #boolean


      // * enableWhen
      //   * question = "diabetes-boolean"
      //   * operator = #=
      //   * answerBoolean = true

// END of Additional Diabetes group **************************


    // * item[+]
    //   * extension[sdc-questionnaire-initialExpression].valueExpression
    //     * language = #text/fhirpath
    //     * expression = "%Condition.entry.resource.code.coding.where(system='http://snomed.info/sct' and code='44054006').exists()" //type 2 diabetes
    //   * linkId = "1c1eea28-6c82-4b7b-aaa3-8655ce70f2fd"
    //   * text = "Type 2 diabetes mellitus"
    //   * type = #boolean
    //   * repeats = false
    // * linkId = "f8022f3f-21fe-42c0-8abd-95f24e2e37e5"
    // * text = "Health priorities, actions and follow-up"
    // * type = #text
    // * repeats = false


    // //CVD Items
    // * item[+]
    //   * linkId = "8d02ef36-3f48-4912-b001-e9fec6aa7101"
    //   * text = "CVD risk calculator variables"
    //   * type = #group
    //   * repeats = false
    //   * readOnly = true
      // * item[+]
      //   * extension[+]
      //     * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression"
      //     * valueExpression
      //       * description = "CVD Risk Age"
      //       * language = #text/fhirpath
      //       * expression = "%age"
      //   * extension[+]
      //     * url = "http://hl7.org/fhir/StructureDefinition/questionnaire-unit"
      //     * valueCoding = $unitsofmeasure#a
      //   * linkId = "6909cb38-a6f4-44c9-abae-0e5d697a21f5"
      //   * text = "Age"
      //   * type = #integer
      //   * item
      //     * extension
      //       * url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
      //       * valueCodeableConcept = $questionnaire-item-control#unit
      //     * linkId = "b9aba16c-f910-4948-9267-e07851f69572"
      //     * text = "years"
      //     * type = #display
      // * item[+]
      //   * extension
      //     * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression"
      //     * valueExpression
      //       * description = "CVD Risk Sex At Birth"
      //       * language = #text/fhirpath
      //       * expression = "%sex"
      //   * linkId = "3dbb0e63-3b28-4567-8ef3-bac242fd95f6"
      //   * text = "Sex at birth"
      //   * type = #choice
      //   * repeats = false
      //   * answerValueSet = "#biological-sex-1"
      // * item[+]
      //   * extension
      //     * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression"
      //     * valueExpression
      //       * description = "CVD Risk Smoking Status"
      //       * language = #text/fhirpath
      //       * expression = "%smoker"
      //   * linkId = "bac0f824-3784-400e-80f9-ad18d46bd8cb"
      //   * text = "Smoking status"
      //   * type = #choice
      //   * repeats = false
      //   * answerOption[0].valueCoding = $sct#266919005 "Never smoked"
      //   * answerOption[+].valueCoding = $sct#77176002 "Smoker"
      //   * answerOption[+].valueCoding = $sct#8517006 "Ex-smoker"
      //   * answerOption[+].valueCoding = $sct#16090371000119103 "Exposure to second hand tobacco smoke"
      //   * answerOption[+].valueString = "Wants to quit"
      //   // Add Additional smoking mapping here
      //   * answerOption[+].valueString = "Other tobacco use"
      // * item[+]
      //   * extension
      //     * url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
      //     * valueCodeableConcept.coding = $questionnaire-item-control#grid
      //       * version = "1.0.0"
      //   * linkId = "fe9feec6-593a-4106-8a7d-f9965a632ea2"
      //   * type = #group
      //   * repeats = false
      //   * item[0]
      //     * linkId = "fa4f73a3-7633-410c-9177-8aa43b117122"
      //     * text = "Systolic Blood Pressure"
      //     * type = #group
      //     * repeats = false
      //     * item
      //       * extension[0]
      //         * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
      //         * valueExpression
      //           * language = #text/fhirpath
      //           * expression = "%ObsBloodPressure.entry.resource.component.where(code.coding.exists(code='8480-6')).value.value"
      //       * extension[+]
      //         * url = "http://hl7.org/fhir/StructureDefinition/questionnaire-unit"
      //         * valueCoding = $unitsofmeasure#mm[Hg]
      //       * linkId = "818ce640-c8dd-457d-b607-3aaa8da38524"
      //       * text = "Value"
      //       * type = #integer
      //       * repeats = false
      //       * item
      //         * extension
      //           * url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
      //           * valueCodeableConcept = $questionnaire-item-control#unit
      //         * linkId = "ddea5a62-a8c1-4b15-b667-7b69babec8cd"
      //         * text = "mm Hg"
      //         * type = #display
      //   * item[+]
      //     * linkId = "e693c7d2-be69-4f1f-b72d-7ff2ea3cd536"
      //     * text = "Total Cholesterol"
      //     * type = #group
      //     * repeats = false
      //     * item
      //       * extension[0]
      //         * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
      //         * valueExpression
      //           * language = #text/fhirpath
      //           * expression = "%ObsTotalCholesterol.entry.resource.value.value"
      //       * extension[+]
      //         * url = "http://hl7.org/fhir/StructureDefinition/questionnaire-unit"
      //         * valueCoding = $unitsofmeasure#mmol/L
      //       * linkId = "99932a93-8135-47b2-933b-fd751b34b7af"
      //       * text = "Value"
      //       * type = #decimal
      //       * repeats = false
      //       * item
      //         * extension
      //           * url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
      //           * valueCodeableConcept = $questionnaire-item-control#unit
      //         * linkId = "fcfbfc9f-e400-4aae-993f-ea54096e7361"
      //         * text = "mmol/L"
      //         * type = #display
      //   * item[+]
      //     * linkId = "87eefaf6-010f-4b0d-9f51-2c33e46e6c69"
      //     * text = "HDL Cholesterol"
      //     * type = #group
      //     * repeats = false
      //     * item
      //       * extension[0]
      //         * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
      //         * valueExpression
      //           * language = #text/fhirpath
      //           * expression = "%ObsHDLCholesterol.entry.resource.value.value"
      //       * extension[+]
      //         * url = "http://hl7.org/fhir/StructureDefinition/questionnaire-unit"
      //         * valueCoding = $unitsofmeasure#mmol/L
      //       * linkId = "c14b4513-1e20-461d-97f4-4631711adc65"
      //       * text = "Value"
      //       * type = #decimal
      //       * repeats = false
      //       * item
      //         * extension
      //           * url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
      //           * valueCodeableConcept = $questionnaire-item-control#unit
      //         * linkId = "2ba61002-b642-4b28-9e66-dc2b060c4e0e"
      //         * text = "mmol/L"
      //         * type = #display
      // * item[+]
      //   * extension
      //     * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression"
      //     * valueExpression
      //       * description = "CVD Risk Postcode"
      //       * language = #text/fhirpath
      //       * expression = "%postcode"
      //   * linkId = "fa8f03ca-9a5a-4ed1-a866-db26e567352a"
      //   * text = "Postcode"
      //   * type = #string

      
      // * item[+]
      //   * extension[0]
      //     * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
      //     * valueExpression
      //       * language = #text/fhirpath
      //       * expression = "%memberOfDiabetesResourceArray.exists() or {}"
      //   * extension[+]
      //     * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression"
      //     * valueExpression
      //       * language = #text/fhirpath
      //       * expression = "%enableWhenNoHighRiskNoOutOfAgeRange"
      //   * extension[+]
      //     * url = "https://smartforms.csiro.au/ig/StructureDefinition/required-feedback"
      //     * valueString = "Please make a selection to continue"
      //   * linkId = "diabetes-boolean"
      //   * type = #boolean
      //   * repeats = false
      //   * required = true
      //   * text = "Diabetes"
 
  * item[+]
    * linkId = "MarkComplete-2"
    * text = "Mark section as complete"
      * extension[http://hl7.org/fhir/StructureDefinition/rendering-xhtml].valueString = "<div xmlns=\"http://www.w3.org/1999/xhtml\">\r\n<head>\r\n    <style type=\"text/css\">\r\n        .alert {\r\n            padding: 0.875rem;\r\n            margin-bottom: 1rem;\r\n            font-size: 0.875rem;\r\n            color: #29712D;\r\n            border-radius: 0.5rem;\r\n            background-color: #D9E8DA;\r\n            font-weight: 700;\r\n        max-width: 205px;\r\n        }\r\n    </style>\r\n</head>\r\n<body>\r\n<div class=\"alert\">Mark section as complete</div>\r\n</body>\r\n</div>"
    * type = #boolean
    * repeats = false
