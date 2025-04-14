Alias: $LNC = http://loinc.org
Alias: $SCT = http://snomed.info/sct
Alias: $UCUM = http://unitsofmeasure.org

Instance: ExaminationExtractTest
InstanceOf: Questionnaire
Usage: #definition
Title: "Aboriginal and Torres Strait Islander Health Check - ExaminationExtractTest"
Description: "ExaminationExtractTest sub-questionnaire for Aboriginal and Torres Strait Islander Health Check."

* contained[+] = BodyHeight
* contained[+] = BodyWeight
* contained[+] = WaistCircumference
* contained[+] = HeartRate
* contained[+] = HeartRhythm
* contained[+] = BloodPressure

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
    * expression = "item.where(linkId='c587e3b6-b91a-40dc-9a16-179342d001e9').item.where(linkId='53d5d5a6-3198-4bec-92ac-03fe7d77fb68').item.where(linkId='97ed4c86-8820-4e4d-9234-0e0e8b6ca44a').item.where(linkId='443bd584-684a-449c-ab6e-9d07da4df9fa').answer.value"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "height"
    * language = #text/fhirpath
    * expression = "item.where(linkId='c587e3b6-b91a-40dc-9a16-179342d001e9').item.where(linkId='53d5d5a6-3198-4bec-92ac-03fe7d77fb68').item.where(linkId='6226a5c5-b5c3-4ebb-a689-2b286322cfe0').item.where(linkId='7035c7e7-ada3-4c6b-9ea8-f39666f5d4ea').answer.value"




* meta.profile[+] = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-render"
* meta.profile[+] = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-modular"
* meta.profile[+] = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-pop-exp"
* url = "http://www.health.gov.au/assessments/mbs/715/Examination"
* name = "ExaminationExtractTest"
* status = #draft
* experimental = false
* subjectType[+] = #Patient
* date = "2025-03-14"
* jurisdiction.coding = urn:iso:std:iso:3166#AU


* item[+] 
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
    * linkId = "RecordUpdate-Exam"
    * text = "Important: The patient record may not be updated with information entered here. Information intended for the patient record should be entered there first."
      * extension[http://hl7.org/fhir/StructureDefinition/rendering-xhtml].valueString = "<div xmlns=\"http://www.w3.org/1999/xhtml\">
    <strong>Important:</strong> <em>The patient record may not be updated with information entered here. Information intended for the patient record should be entered there first.</em>
    </div>"    
    * type = #display

// Extract hidden items
  * item[+]
    * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-hidden].valueBoolean = true
    * extension[sdc-questionnaire-initialExpression].valueExpression
      * language = #text/fhirpath
      * expression = "%patient.id"
    * linkId = "patientId"
    * type = #string  
  * item[+]
    * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-hidden].valueBoolean = true
    * extension[sdc-questionnaire-initialExpression].valueExpression
      * language = #text/fhirpath
      * expression = "%ObsBodyHeight.entry.resource.id"
    * linkId = "bodyHeightId"
    * type = #string
  * item[+]
    * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-hidden].valueBoolean = true
    * extension[sdc-questionnaire-initialExpression].valueExpression
      * language = #text/fhirpath
      * expression = "%ObsBodyHeight.entry.resource.effective.toDate()"
    * linkId = "bodyHeightEffective"
    * type = #date
  * item[+]
    * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-hidden].valueBoolean = true
    * extension[sdc-questionnaire-initialExpression].valueExpression
      * language = #text/fhirpath
      * expression = "%ObsBodyWeight.entry.resource.id"
    * linkId = "bodyWeightId"
    * type = #string
  * item[+]
    * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-hidden].valueBoolean = true
    * extension[sdc-questionnaire-initialExpression].valueExpression
      * language = #text/fhirpath
      * expression = "%ObsBodyWeight.entry.resource.effective.toDate()"
    * linkId = "bodyWeightEffective"
    * type = #date
  * item[+]
    * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-hidden].valueBoolean = true
    * extension[sdc-questionnaire-initialExpression].valueExpression
      * language = #text/fhirpath
      * expression = "%ObsWaistCircumference.entry.resource.id"
    * linkId = "waistCircumferenceId"
    * type = #string
  * item[+]
    * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-hidden].valueBoolean = true
    * extension[sdc-questionnaire-initialExpression].valueExpression
      * language = #text/fhirpath
      * expression = "%ObsWaistCircumference.entry.resource.effective.toDate()"
    * linkId = "waistCircumferenceEffective"
    * type = #date
  * item[+]
    * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-hidden].valueBoolean = true
    * extension[sdc-questionnaire-initialExpression].valueExpression
      * language = #text/fhirpath
      * expression = "%ObsHeartRate.entry.resource.id"
    * linkId = "heartRateId"
    * type = #string
  * item[+]
    * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-hidden].valueBoolean = true
    * extension[sdc-questionnaire-initialExpression].valueExpression
      * language = #text/fhirpath
      * expression = "%ObsHeartRate.entry.resource.effective.toDate()"
    * linkId = "heartRateEffective"
    * type = #date
  * item[+]
    * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-hidden].valueBoolean = true
    * extension[sdc-questionnaire-initialExpression].valueExpression
      * language = #text/fhirpath
      * expression = "%ObsHeartRate.entry.resource.id"
    * linkId = "heartRhythmId"
    * type = #string
  * item[+]
    * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-hidden].valueBoolean = true
    * extension[sdc-questionnaire-initialExpression].valueExpression
      * language = #text/fhirpath
      * expression = "%ObsHeartRate.entry.resource.effective.toDate()"
    * linkId = "heartRhythmEffective"
    * type = #date
  * item[+]
    * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-hidden].valueBoolean = true
    * extension[sdc-questionnaire-initialExpression].valueExpression
      * language = #text/fhirpath
      * expression = "%ObsBloodPressure.entry.resource.id"
    * linkId = "bloodPressureId"
    * type = #string
  * item[+]
    * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-hidden].valueBoolean = true
    * extension[sdc-questionnaire-initialExpression].valueExpression
      * language = #text/fhirpath
      * expression = "%ObsBloodPressure.entry.resource.effective.toDate()"
    * linkId = "bloodPressureEffective"
    * type = #date


// Observations table with dates
  * item[+]
    * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control|1.0.0#grid
    * linkId = "53d5d5a6-3198-4bec-92ac-03fe7d77fb68"
    * type = #group 
    * repeats = false
    * item[+]
      * extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
      * extension[=].extension[+].url = "template"
      * extension[=].extension[=].valueReference.reference = "#BodyHeight"
      * extension[=].extension[+].url = "ifNoneExist"
      * extension[=].extension[=].valueString = "iif(%resource.repeat(item).where(linkId='bodyHeightEffective').answer.value =  %resource.repeat(item).where(linkId='c666ac96-1e64-40e2-8e0b-7d0187bb3e50').answer.value, '_id=' + %resource.repeat(item).where(linkId='bodyHeightId').answer.value)"
      // * extension[=].extension[=].valueString = "'date=ge' + %resource.repeat(item).where(linkId='bodyHeightEffective').answer.value.toString()"
      // * extension[=].extension[=].valueString = "'_id=' + %resource.repeat(item).where(linkId='bodyHeightId').answer.value"
      * linkId = "6226a5c5-b5c3-4ebb-a689-2b286322cfe0"
      * text = "Height"
      * type = #group
      * repeats = false       
      * item[+]
        * extension[sdc-questionnaire-initialExpression].valueExpression
          * language = #text/fhirpath
          * expression = "%ObsBodyHeight.entry.resource.value.value"
        * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unit].valueCoding = $UCUM#cm
        * linkId = "7035c7e7-ada3-4c6b-9ea8-f39666f5d4ea"
        * text = "Value"
        * type = #decimal
        * repeats = false
        * item[+]
          * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#unit
          * linkId = "387c95f0-8b54-4ad7-992d-8ab26a34fd77"
          * text = "cm"
          * type = #display
      * item[+]
        * extension[sdc-questionnaire-initialExpression].valueExpression
          * language = #text/fhirpath
          * expression = "%ObsBodyHeight.entry.resource.effective"
        * linkId = "c666ac96-1e64-40e2-8e0b-7d0187bb3e50"
        * text = "Date performed"
        * type = #date
        * repeats = false
    * item[+]
      * extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
      * extension[=].extension[+].url = "template"
      * extension[=].extension[=].valueReference.reference = "#BodyWeight"
      * extension[=].extension[+].url = "ifNoneExist"
      * extension[=].extension[=].valueString = "iif(%resource.repeat(item).where(linkId='bodyWeightEffective').answer.value =  %resource.repeat(item).where(linkId='92cdc1c7-eb6c-4f6d-9bd9-ae726a0e0d3d').answer.value, '_id=' + %resource.repeat(item).where(linkId='bodyWeightId').answer.value)"
      * linkId = "97ed4c86-8820-4e4d-9234-0e0e8b6ca44a"
      * text = "Weight"
      * type = #group
      * repeats = false
      * item[+]
        * extension[sdc-questionnaire-initialExpression].valueExpression
          * language = #text/fhirpath
          * expression = "%ObsBodyWeight.entry.resource.value.value"
        * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unit].valueCoding = $UCUM#kg
        * linkId = "443bd584-684a-449c-ab6e-9d07da4df9fa"
        * text = "Value"
        * type = #decimal
        * repeats = false
        * item[+]
          * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#unit
          * linkId = "5ba0d699-bc2a-45d0-8f40-f53cb21dc911"
          * text = "kg"
          * type = #display
      * item[+]
        * extension[sdc-questionnaire-initialExpression].valueExpression
          * language = #text/fhirpath
          * expression = "%ObsBodyWeight.entry.resource.effective"
        * linkId = "92cdc1c7-eb6c-4f6d-9bd9-ae726a0e0d3d"
        * text = "Date performed"
        * type = #date
        * repeats = false
    * item[+]
      * linkId = "bc209c5e-ed28-48e3-b1a1-55cb7e435d8b"
      * text = "BMI"
      * type = #group
      * repeats = false
      * item[+]
        * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression].valueExpression
          * description = "BMI calculation"
          * language = #text/fhirpath
          * expression = "(%weight/((%height/100).power(2))).round(1)"
        * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unit].valueCoding = $UCUM#kg/m2
        * linkId = "2ada6633-03c6-4b05-bc23-18dec84ec150"
        * text = "Value"
        * type = #decimal
        * repeats = false
        * readOnly = true
        * item[+]
          * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#unit
          * linkId = "a709b8ec-9e65-40f0-a781-500cb3e56f3c"
          * text = "kg/m2"
          * type = #display
    * item[+]
      * extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
      * extension[=].extension[+].url = "template"
      * extension[=].extension[=].valueReference.reference = "#WaistCircumference"
      * extension[=].extension[+].url = "ifNoneExist"
      * extension[=].extension[=].valueString = "iif(%resource.repeat(item).where(linkId='waistCircumferenceEffective').answer.value =  %resource.repeat(item).where(linkId='3eb3b929-e67a-4331-8949-b8447b66a4c7').answer.value, '_id=' + %resource.repeat(item).where(linkId='waistCircumferenceId').answer.value)"
      * linkId = "ec884b64-ed8d-485b-930f-e7ac18ad4cc9"
      * text = "Waist circumference"
      * type = #group
      * repeats = false
      * item[+]
        * extension[sdc-questionnaire-initialExpression].valueExpression
          * language = #text/fhirpath
          * expression = "%ObsWaistCircumference.entry.resource.value.value"
        * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unit].valueCoding = $UCUM#cm
        * linkId = "8df0f5d8-821d-4f71-b3c1-d164616ea2f5"
        * text = "Value"
        * type = #decimal
        * repeats = false
        * item[+]
          * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#unit
          * linkId = "19aeb0ab-7494-4bac-8b2d-d7d2527c1f4a"
          * text = "cm"
          * type = #display
      * item[+]
        * extension[sdc-questionnaire-initialExpression].valueExpression
          * language = #text/fhirpath
          * expression = "%ObsWaistCircumference.entry.resource.effective"
        * linkId = "3eb3b929-e67a-4331-8949-b8447b66a4c7"
        * text = "Date performed"
        * type = #date
        * repeats = false
    * item[+]
      * extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
      * extension[=].extension[+].url = "template"
      * extension[=].extension[=].valueReference.reference = "#HeartRate"
      * extension[=].extension[+].url = "ifNoneExist"
      * extension[=].extension[=].valueString = "iif(%resource.repeat(item).where(linkId='heartRateEffective').answer.value =  %resource.repeat(item).where(linkId='feeac08f-2ba6-4048-80a2-10b3f90cf5e3').answer.value, '_id=' + %resource.repeat(item).where(linkId='heartRateId').answer.value)"
      * linkId = "3d3e1079-d225-447b-959b-4caddc057f7d"
      * text = "Heart rate"
      * type = #group
      * repeats = false
      * item[+]
        * extension[sdc-questionnaire-initialExpression].valueExpression
          * language = #text/fhirpath
          * expression = "%ObsHeartRate.entry.resource.value.value"
        * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unit].valueCoding = $UCUM#/min
        * linkId = "49029ef0-eaa8-44f8-b26a-177820c82dfd"
        * text = "Value"
        * type = #integer
        * repeats = false
        * item[+]
          * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#unit
          * linkId = "090964b9-be33-438b-8465-2a2a09632fde"
          * text = "/min"
          * type = #display
      * item[+]
        * extension[sdc-questionnaire-initialExpression].valueExpression
          * language = #text/fhirpath
          * expression = "%ObsHeartRate.entry.resource.effective"
        * linkId = "feeac08f-2ba6-4048-80a2-10b3f90cf5e3"
        * text = "Date performed"
        * type = #date
        * repeats = false
    * item[+]
      * extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
      * extension[=].extension[+].url = "template"
      * extension[=].extension[=].valueReference.reference = "#HeartRhythm"
      * extension[=].extension[+].url = "ifNoneExist"
      * extension[=].extension[=].valueString = "iif(%resource.repeat(item).where(linkId='heartRhythmEffective').answer.value =  %resource.repeat(item).where(linkId='eeb56682-0eae-4428-9c37-0e63852026c0').answer.value, '_id=' + %resource.repeat(item).where(linkId='heartRhythmId').answer.value)"
      * linkId = "8d3d05cc-64bc-47ae-b989-060bac838d1c"
      * text = "Heart rhythm"
      * type = #group
      * repeats = false
      * item[+]       
        * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#radio-button
        * linkId = "99a8eb6f-a36a-4daf-99d7-27bfde0d4bb1"
        * text = "Value"
        * type = #choice
        * repeats = false
        * answerOption[+].valueCoding = $SCT#271636001 "Pulse regular"
        * answerOption[+].valueCoding = $SCT#61086009 "Pulse irregular"
      * item[+]
        * linkId = "eeb56682-0eae-4428-9c37-0e63852026c0"
        * text = "Date performed"
        * type = #date
        * repeats = false


// Blood pressure observations table with dates
  * item[+]
    * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control|1.0.0#grid
    * linkId = "3639c586-9576-48d3-a52b-e91fd2138581"
    * type = #group 
    * repeats = false
    * item[+]
      * extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
      * extension[=].extension[+].url = "template"
      * extension[=].extension[=].valueReference.reference = "#BloodPressure"
      * extension[=].extension[+].url = "ifNoneExist"
      * extension[=].extension[=].valueString = "iif(%resource.repeat(item).where(linkId='bloodPressureEffective').answer.value =  %resource.repeat(item).where(linkId='a005050c-ed79-46ed-ac14-2fc1496059a5').answer.value, '_id=' + %resource.repeat(item).where(linkId='bloodPressureId').answer.value)"
      * linkId = "705f6d04-acab-4d14-baab-98f9bfc4808e"
      * text = "Blood pressure"
      * type = #group
      * repeats = false
      * item[+]
        * extension[sdc-questionnaire-initialExpression].valueExpression
          * language = #text/fhirpath
          * expression = "%ObsBloodPressure.entry.resource.component.where(code.coding.exists(code='8480-6')).value.value"
        * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unit].valueCoding = $UCUM#mm[Hg]
        * linkId = "e68b660d-cfd2-4b89-957a-c96a4c73a5fd"
        * text = "Systolic"
        * type = #integer
        * repeats = false
        * item[+]
          * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#unit
          * linkId = "197d212d-72cc-4c85-91dc-2f030d384391"
          * text = "mm Hg"
          * type = #display
      * item[+]      
        * extension[sdc-questionnaire-initialExpression].valueExpression
          * language = #text/fhirpath
          * expression = "%ObsBloodPressure.entry.resource.component.where(code.coding.exists(code='8462-4')).value.value"
        * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unit].valueCoding = $UCUM#mm[Hg]
        * linkId = "867b0022-f812-4f80-b287-79686c972b15"
        * text = "Diastolic"
        * type = #integer
        * repeats = false
        * item[+]
          * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#unit
          * linkId = "416ee494-4fa2-4b29-af0b-3d022f686e39"
          * text = "mm Hg"
          * type = #display
      * item[+]
        * extension[sdc-questionnaire-initialExpression].valueExpression
          * language = #text/fhirpath
          * expression = "%ObsBloodPressure.entry.resource.effective"
        * linkId = "a005050c-ed79-46ed-ac14-2fc1496059a5"
        * text = "Date performed"
        * type = #date
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