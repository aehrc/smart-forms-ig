Alias: $LNC = http://loinc.org
Alias: $SCT = http://snomed.info/sct
Alias: $UCUM = http://unitsofmeasure.org

Instance: Examination
InstanceOf: Questionnaire
Usage: #example
Title: "Aboriginal and Torres Strait Islander Health Check - Examination"
Description: "Examination sub-questionnaire for Aboriginal and Torres Strait Islander Health Check."

* contained[+] = heart-rhythm-1
* contained[+] = BodyHeightTemplate
* contained[+] = BodyHeightLengthTemplate
* contained[+] = BodyWeightTemplate
* contained[+] = WaistCircumferenceTemplate
* contained[+] = HeadCircumferenceTemplate
* contained[+] = HeartRateTemplate
* contained[+] = HeartRhythmTemplate
* contained[+] = BloodPressureTemplate

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
  * valueString = "ObsBloodPressure"
* extension[+]
  * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-assembleContext"
  * valueString = "age"

//fhir query variables

* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "ObsWaistCircumference"
    * language = #application/x-fhir-query
    * expression = "Observation?code=8280-0&_count=1&_sort=-date&patient={{%patient.id}}"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "ObsHeartRate"
    * language = #application/x-fhir-query
    * expression = "Observation?code=8867-4&_count=1&_sort=-date&patient={{%patient.id}}"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "ObsHeartRhythm"
    * language = #application/x-fhir-query
    * expression = "Observation?code=364074009&_count=1&_sort=-date&patient={{%patient.id}}"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "ObsBodyHeight"
    * language = #application/x-fhir-query
    * expression = "Observation?code=8302-2&_count=1&_sort=-date&patient={{%patient.id}}"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "ObsBodyWeight"
    * language = #application/x-fhir-query
    * expression = "Observation?code=29463-7&_count=1&_sort=-date&patient={{%patient.id}}"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "ObsHeadCircumference"
    * language = #application/x-fhir-query
    * expression = "Observation?code=9843-4&_count=1&_sort=-date&patient={{%patient.id}}"

//fhirpath variables

* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "weight"
    * language = #text/fhirpath
    * expression = "item.where(linkId='c587e3b6-b91a-40dc-9a16-179342d001e9').item.where(linkId='53d5d5a6-3198-4bec-92ac-03fe7d77fb68').item.where(linkId='97ed4c86-8820-4e4d-9234-0e0e8b6ca44a').item.where(linkId='obs-weight-newresult').answer.value"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "height"
    * language = #text/fhirpath
    * expression = "item.where(linkId='c587e3b6-b91a-40dc-9a16-179342d001e9').item.where(linkId='53d5d5a6-3198-4bec-92ac-03fe7d77fb68').item.where(linkId='6226a5c5-b5c3-4ebb-a689-2b286322cfe0').item.where(linkId='obs-height-newresult').answer.value"

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
* url = "http://www.health.gov.au/assessments/mbs/715/Examination"
* name = "Examination"
* title = "Aboriginal and Torres Strait Islander Health Check - Examination"
* status = #draft
* experimental = false
* subjectType[+] = #Patient
* date = "2025-03-14"
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
      * operator = #!=
      * answerBoolean = true  
  * item[+] //complete
    * extension[questionnaire-itemControl].valueCodeableConcept = https://smartforms.csiro.au/ig/CodeSystem/QuestionnaireItemControlExtended#context-display
    * linkId = "CD-complete-7"
    * text = "Complete"
      * extension[http://hl7.org/fhir/StructureDefinition/rendering-xhtml].valueString = "<div title=\"Section completed\" xmlns=\"http://www.w3.org/1999/xhtml\">\r\n\t<div style=\"display: flex; flex-direction: row;\">\r\n\t\t<img width='24' height='24' src='data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxZW0iIGhlaWdodD0iMWVtIiB2aWV3Qm94PSIwIDAgMjQgMjQiPjxwYXRoIGZpbGw9IiMyZTdkMzIiIGQ9Ik0yMCAxMmE4IDggMCAwIDEtOCA4YTggOCAwIDAgMS04LThhOCA4IDAgMCAxIDgtOGMuNzYgMCAxLjUuMTEgMi4yLjMxbDEuNTctMS41N0E5LjgyMiA5LjgyMiAwIDAgMCAxMiAyQTEwIDEwIDAgMCAwIDIgMTJhMTAgMTAgMCAwIDAgMTAgMTBhMTAgMTAgMCAwIDAgMTAtMTBNNy45MSAxMC4wOEw2LjUgMTEuNUwxMSAxNkwyMSA2bC0xLjQxLTEuNDJMMTEgMTMuMTdsLTMuMDktMy4wOVoiLz48L3N2Zz4='\r\n\t\tstyle=\"align-self: center;\"/>\r\n\t</div>\r\n</div>"
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

// Observations table with dates
  * item[+]
    * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control|1.0.0#grid
    * linkId = "53d5d5a6-3198-4bec-92ac-03fe7d77fb68"    
    * text = "The tabled observations will display the most recent results available from the patient record. New observations may be added."
      * extension[http://hl7.org/fhir/StructureDefinition/rendering-xhtml].valueString = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p style=\"font-size:0.9em; font-weight:normal\"><em>The tabled observations will display the most recent results available from the patient record. New observations may be added.</em></p></div>"    
    * type = #group 
    * repeats = false
    * item[+]
      * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression].valueExpression
        * language = #text/fhirpath
        * expression = "%age <= 5"
      * linkId = "4e32e9b2-82e6-41ea-9545-79e928f7d6c2"
      * text = "Length/Height"
      * type = #group
      * repeats = false
      * item[+]
        * linkId = "837cd0ce-4a9e-4c8b-8679-007ed961f121"
        * text = "Last result"
          * extension[http://hl7.org/fhir/StructureDefinition/cqf-expression].valueExpression
            * language = #text/fhirpath
            * expression = "iif(%ObsBodyHeight.entry.resource.where(status='final').value.value.empty(), 'Not available', %ObsBodyHeight.entry.resource.where(status='final').value.value.toString() + ' cm' + ' (' + %ObsBodyHeight.entry.resource.where(status='final').effective.toDate().toString() + ')')"
        * type = #display
      * item[+]
        * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract].extension[template].valueReference.reference = "#BodyHeightLengthTemplate"
        * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unit].valueCoding = $UCUM#cm
        * linkId = "obs-lengthheight-newresult"
        * text = "New result"
        * type = #decimal
        * repeats = false
        * item[+]
          * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#unit
          * linkId = "obslengthheight-newresult-unit"
          * text = "cm"
          * type = #display
      * item[+]
        * linkId = "obs-lengthheight-newdate"
        * text = "New result date"
        * type = #date
        * repeats = false
    * item[+]
      * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression].valueExpression
        * language = #text/fhirpath
        * expression = "%age > 5"
      * linkId = "6226a5c5-b5c3-4ebb-a689-2b286322cfe0"
      * text = "Height"
      * type = #group
      * repeats = false
      * item[+]
        * linkId = "7035c7e7-ada3-4c6b-9ea8-f39666f5d4ea"
        * text = "Last result"
          * extension[http://hl7.org/fhir/StructureDefinition/cqf-expression].valueExpression
            * language = #text/fhirpath
            * expression = "iif(%ObsBodyHeight.entry.resource.where(status='final').value.value.empty(), 'Not available', %ObsBodyHeight.entry.resource.where(status='final').value.value.toString() + ' cm' + ' (' + %ObsBodyHeight.entry.resource.where(status='final').effective.toDate().toString() + ')')"
        * type = #display
      * item[+]
        * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract].extension[template].valueReference.reference = "#BodyHeightTemplate"
        * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unit].valueCoding = $UCUM#cm
        * linkId = "obs-height-newresult"
        * text = "New result"
        * type = #decimal
        * repeats = false
        * item[+]
          * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#unit
          * linkId = "obs-height-newresult-unit"
          * text = "cm"
          * type = #display
      * item[+]
        * linkId = "obs-height-newdate"
        * text = "New result date"
        * type = #date
        * repeats = false
    * item[+]
      * linkId = "97ed4c86-8820-4e4d-9234-0e0e8b6ca44a"
      * text = "Weight"
      * type = #group
      * repeats = false
      * item[+]
        * linkId = "443bd584-684a-449c-ab6e-9d07da4df9fa"
        * text = "Last result"
          * extension[http://hl7.org/fhir/StructureDefinition/cqf-expression].valueExpression
            * language = #text/fhirpath
            * expression = "iif(%ObsBodyWeight.entry.resource.where(status='final').value.value.empty(), 'Not available', %ObsBodyWeight.entry.resource.where(status='final').value.value.toString() + ' kg' + ' (' + %ObsBodyWeight.entry.resource.where(status='final').effective.toDate().toString() + ')')"
        * type = #display
      * item[+]
        * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract].extension[template].valueReference.reference = "#BodyWeightTemplate"
        * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unit].valueCoding = $UCUM#kg
        * linkId = "obs-weight-newresult"
        * text = "New result"
        * type = #decimal
        * repeats = false
        * item[+]
          * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#unit
          * linkId = "obs-weight-newresult-unit"
          * text = "kg"
          * type = #display
      * item[+]
        * linkId = "obs-weight-newdate"
        * text = "New result date"
        * type = #date
        * repeats = false
    * item[+]
      * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression].valueExpression
        * language = #text/fhirpath
        * expression = "%age > 12"
      * linkId = "bc209c5e-ed28-48e3-b1a1-55cb7e435d8b"
      * text = "BMI (calculated)"
      * type = #group
      * repeats = false
      * item[+]
        * linkId = "2ada6633-03c6-4b05-bc23-18dec84ec150"
        * text = "Last result"
          * extension[http://hl7.org/fhir/StructureDefinition/cqf-expression].valueExpression
            * language = #text/fhirpath
            * expression = "iif(%ObsBodyWeight.entry.resource.where(status='final').value.value.empty() or %ObsBodyHeight.entry.resource.where(status='final').value.value.empty(), 'Not available', (%ObsBodyWeight.entry.resource.where(status='final').value.value/((%ObsBodyHeight.entry.resource.where(status='final').value.value/100).power(2))).round(1).toString() + ' kg/m2')"
        * type = #display
      * item[+]
        * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression].valueExpression
          * description = "BMI calculation"
          * language = #text/fhirpath
          * expression = "(%weight/((%height/100).power(2))).round(1)"
        * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unit].valueCoding = $UCUM#kg/m2
        * linkId = "obs-bmi-newresult"
        * text = "New result"
        * type = #decimal
        * repeats = false
        * readOnly = true
        * item[+]
          * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#unit
          * linkId = "obs-bmi-newresult-unit"
          * text = "kg/m2"
          * type = #display
    * item[+]
      * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression].valueExpression
        * language = #text/fhirpath
        * expression = "%age <= 12"
      * linkId = "d3557f55-1abf-401c-aada-2d4380151c56"
      * text = "Head circumference"
      * type = #group
      * repeats = false
      * item[+]
        * linkId = "7a4a6aac-558e-4bec-86c5-326ae07e37d6"
        * text = "Last result"
          * extension[http://hl7.org/fhir/StructureDefinition/cqf-expression].valueExpression
            * language = #text/fhirpath
            * expression = "iif(%ObsHeadCircumference.entry.resource.where(status='final').value.value.empty(), 'Not available', %ObsHeadCircumference.entry.resource.where(status='final').value.value.toString() + ' cm' + ' (' + %ObsHeadCircumference.entry.resource.where(status='final').effective.toDate().toString() + ')')"
        * type = #display
      * item[+]
        * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract].extension[template].valueReference.reference = "#HeadCircumferenceTemplate"
        * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unit].valueCoding = $UCUM#cm
        * linkId = "obs-headcircumference-newresult"
        * text = "New result"
        * type = #decimal
        * repeats = false
        * item[+]
          * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#unit
          * linkId = "obs-headcircumference-newresult-unit"
          * text = "cm"
          * type = #display
      * item[+]
        * linkId = "obs-headcircumference-newdate"
        * text = "New result date"
        * type = #date
        * repeats = false
    * item[+]
      * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression].valueExpression
        * language = #text/fhirpath
        * expression = "%age >= 18"
      * linkId = "ec884b64-ed8d-485b-930f-e7ac18ad4cc9"
      * text = "Waist circumference"
      * type = #group
      * repeats = false
      * item[+]
        * linkId = "8df0f5d8-821d-4f71-b3c1-d164616ea2f5"
        * text = "Last result"
          * extension[http://hl7.org/fhir/StructureDefinition/cqf-expression].valueExpression
            * language = #text/fhirpath
            * expression = "iif(%ObsWaistCircumference.entry.resource.where(status='final').value.value.empty(), 'Not available', %ObsWaistCircumference.entry.resource.where(status='final').value.value.toString() + ' cm' + ' (' + %ObsWaistCircumference.entry.resource.where(status='final').effective.toDate().toString() + ')')"
        * type = #display
      * item[+]
        * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract].extension[template].valueReference.reference = "#WaistCircumferenceTemplate"
        * linkId = "obs-waistcircumference-newresult"
        * text = "New result"
        * type = #decimal
        * repeats = false
        * item[+]
          * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#unit
          * linkId = "obs-waistcircumference-newresult-unit"
          * text = "cm"
          * type = #display
      * item[+]
        * linkId = "obs-waistcircumference-newdate"
        * text = "New result date"
        * type = #date
        * repeats = false
    * item[+]
      * linkId = "3d3e1079-d225-447b-959b-4caddc057f7d"
      * text = "Heart rate"
      * type = #group
      * repeats = false
      * item[+]
        * linkId = "49029ef0-eaa8-44f8-b26a-177820c82dfd"
        * text = "Last result"
          * extension[http://hl7.org/fhir/StructureDefinition/cqf-expression].valueExpression
            * language = #text/fhirpath
            * expression = "iif(%ObsHeartRate.entry.resource.where(status='final').value.value.empty(), 'Not available', %ObsHeartRate.entry.resource.where(status='final').value.value.round().toString() + ' /min' + ' (' + %ObsHeartRate.entry.resource.where(status='final').effective.toDate().toString() + ')')"
        * type = #display
      * item[+]
        * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract].extension[template].valueReference.reference = "#HeartRateTemplate"
        * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unit].valueCoding = $UCUM#/min
        * linkId = "obs-heartrate-newresult"
        * text = "New result"
        * type = #integer
        * repeats = false
        * item[+]
          * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#unit
          * linkId = "obs-heartrate-newresult-unit"
          * text = "/min"
          * type = #display
      * item[+]
        * linkId = "obs-heartrate-newdate"
        * text = "New result date"
        * type = #date
        * repeats = false
    * item[+]
      * linkId = "8d3d05cc-64bc-47ae-b989-060bac838d1c"
      * text = "Heart rhythm"
      * type = #group
      * repeats = false
      * item[+]
        * linkId = "99a8eb6f-a36a-4daf-99d7-27bfde0d4bb1"
        * text = "Last result"
          * extension[http://hl7.org/fhir/StructureDefinition/cqf-expression].valueExpression
            * language = #text/fhirpath
            * expression = "iif(%ObsHeartRhythm.entry.resource.where(status='final').value.coding.where(system='http://snomed.info/sct').first().empty(), 'Not available', %ObsHeartRhythm.entry.resource.where(status='final').value.coding.where(system='http://snomed.info/sct').first().display + ' (' + %ObsHeartRhythm.entry.resource.where(status='final').effective.toDate().toString() + ')')"
        * type = #display
      * item[+]       
        * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract].extension[template].valueReference.reference = "#HeartRhythmTemplate"
        * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#radio-button
        * linkId = "obs-heartrhythm-newresult"
        * text = "New result"
        * type = #choice
        * repeats = false        
        * answerValueSet = "#heart-rhythm-1"
      * item[+]
        * linkId = "obs-heartrhythm-newdate"
        * text = "New result date"
        * type = #date
        * repeats = false


// Blood pressure observations table with dates
  * item[+]
    * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression].valueExpression
      * language = #text/fhirpath
      * expression = "%age > 12"
    * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control|1.0.0#grid
    * linkId = "3639c586-9576-48d3-a52b-e91fd2138581"
    * type = #group
    * repeats = false
    * item[+]
      * linkId = "705f6d04-acab-4d14-baab-98f9bfc4808e"
      * text = "Blood pressure"
      * type = #group
      * repeats = false
      * item[+]
        * linkId = "bp-bp-lastresult"
        * text = "Last result"
          * extension[http://hl7.org/fhir/StructureDefinition/cqf-expression].valueExpression
            * language = #text/fhirpath
            * expression = "iif(%ObsBloodPressure.entry.resource.where(status='final').component.where(code.coding.exists(code='8480-6')).value.value.empty() or %ObsBloodPressure.entry.resource.where(status='final').component.where(code.coding.exists(code='8462-4')).value.value.empty(), 'Not available', %ObsBloodPressure.entry.resource.where(status='final').component.where(code.coding.exists(code='8480-6')).value.value.round().toString() + ' / ' + %ObsBloodPressure.entry.resource.where(status='final').component.where(code.coding.exists(code='8462-4')).value.value.round().toString() + ' mm Hg (' + %ObsBloodPressure.entry.resource.where(status='final').effective.toDate().toString() + ')')"
        * type = #display
      * item[+]
        * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract].extension[template].valueReference.reference = "#BloodPressureTemplate"
        * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unit].valueCoding = $UCUM#mm[Hg]
        * linkId = "bp-newbp-systolic"
        * text = "Systolic"
        * type = #integer
        * repeats = false
        * item[+]
          * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#unit
          * linkId = "bp-newbp-systolic-unit"
          * text = "mm Hg"
          * type = #display
      * item[+]      
        * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unit].valueCoding = $UCUM#mm[Hg]
        * linkId = "bp-newbp-diastolic"
        * text = "Diastolic"
        * type = #integer
        * repeats = false
        * item[+]
          * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#unit
          * linkId = "bp-newbp-diastolic-unit"
          * text = "mm Hg"
          * type = #display
      * item[+]
        * linkId = "bp-newbp-date"
        * text = "Date performed"
        * type = #date
        * repeats = false

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
      * extension[http://hl7.org/fhir/StructureDefinition/rendering-xhtml].valueString = "<div xmlns=\"http://www.w3.org/1999/xhtml\">\r\n<head>\r\n    <style type=\"text/css\">\r\n        .alert {\r\n            padding: 0.875rem;\r\n            margin-bottom: 1rem;\r\n            font-size: 0.875rem;\r\n            color: #2E7D32;\r\n            border-radius: 0.5rem;\r\n            background-color: #d5e5d6;\r\n            font-weight: 700;\r\n        }\r\n    </style>\r\n</head>\r\n<body>\r\n<div class=\"alert\">Mark section as complete</div>\r\n</body>\r\n</div>"
    * type = #boolean
    * repeats = false