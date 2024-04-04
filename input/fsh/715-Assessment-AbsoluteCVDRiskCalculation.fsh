Alias: $LNC = http://loinc.org
Alias: $SCT = http://snomed.info/sct
Alias: $UCUM = http://unitsofmeasure.org

Instance: AbsoluteCVDRiskCalculation
InstanceOf: Questionnaire
Usage: #definition
Title: "Aboriginal and Torres Strait Islander Health Check - Absolute Cardiovascular Disease Risk Calculation"
Description: "Absolute Cardiovascular Disease Risk Calculation sub-questionnaire for Aboriginal and Torres Strait Islander Health Check."


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
* extension[+]
  * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-assembleContext"
  * valueString = "Condition"
* extension[+]
  * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-assembleContext"
  * valueString = "ObsBloodPressure"
* extension[+]
  * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-assembleContext"
  * valueString = "sex"
* extension[+]
  * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-assembleContext"
  * valueString = "smoker"
* extension[+]
  * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-assembleContext"
  * valueString = "postcode"

//fhir query variables
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "ObsTotalCholesterol"
    * language = #application/x-fhir-query
    * expression = "Observation?code=14647-2&_count=1&_sort=-date&patient={{%patient.id}}"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "ObsHDLCholesterol"
    * language = #application/x-fhir-query
    * expression = "Observation?code=14646-4&_count=1&_sort=-date&patient={{%patient.id}}"

* meta.profile[+] = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-render"
* meta.profile[+] = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-modular"
* meta.profile[+] = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-pop-exp"
* url = "http://www.health.gov.au/assessments/mbs/715/AbsoluteCVDRiskCalculation"
* name = "AbsoluteCVDRiskCalculation"
* title = "Aboriginal and Torres Strait Islander Health Check - Absolute Cardiovascular Disease Risk Calculation"
* status = #draft
* experimental = false
* subjectType[+] = #Patient
* date = "2024-04-02"
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
      * operator = #=
      * answerBoolean = false  
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
    * linkId = "RecordUpdate-CVDRisk"
    * text = "Important: The patient record may not be updated with information entered here. Information intended for the patient record should be entered there."
      * extension[http://hl7.org/fhir/StructureDefinition/rendering-xhtml].valueString = "<div xmlns=\"http://www.w3.org/1999/xhtml\">
    <strong>Important:</strong> <em>The patient record may not be updated with information entered here. Information intended for the patient record should be entered there first.</em>
    </div>"    
    * type = #display 
  * item[+]
    * linkId = "Guidance-CVDRisk"
    * text = "Australian CVD risk calculator - https://www.cvdcheck.org.au/calculator"
      * extension[http://hl7.org/fhir/StructureDefinition/rendering-xhtml].valueString = "<div xmlns=\"http://www.w3.org/1999/xhtml\">
        <p style=\"font-size:1.2em\">The Australian guideline for assessing and managing cardiovascular disease risk recommends the use of the online <a href=\"https://www.cvdcheck.org.au/calculator\" target=\"_blank\">Australian CVD risk calculator</a>.</p>
        <p>The items included in this section are a subset of variables that can be used as inputs for the online calculator.</p>
        <p>The final CVD risk result can be entered in the item at the bottom of this section.</p>
        </div>"
    * type = #display
  * item[+]
    * linkId = "8d02ef36-3f48-4912-b001-e9fec6aa7101"
    * text = "CVD risk calculator variables"
    * type = #group
    * repeats = false
    * readOnly = true
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
        * expression = "%sex"
      * linkId = "3dbb0e63-3b28-4567-8ef3-bac242fd95f6"
      * text = "Sex at birth"
      * type = #choice
      * repeats = false
      * answerValueSet = "https://healthterminologies.gov.au/fhir/ValueSet/biological-sex-1"
    * item[+]
      * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression].valueExpression
        * description = "CVD Risk Smoking Status"
        * language = #text/fhirpath
        * expression = "%smoker"
      * linkId = "bac0f824-3784-400e-80f9-ad18d46bd8cb"
      * text = "Smoking status"
      * type = #choice
      * repeats = false
      // better as a standard answerValueSet when missing concepts are available
      * answerOption[+].valueCoding = http://snomed.info/sct#266919005 "Never smoked"
      * answerOption[+].valueCoding = http://snomed.info/sct#77176002 "Smoker"
      * answerOption[+].valueCoding = http://snomed.info/sct#8517006 "Ex-smoker"
      * answerOption[+].valueCoding = http://snomed.info/sct#16090371000119103 "Environmental exposure to tobacco smoke (home, car, etc)"
      * answerOption[+].valueString = "Wants to quit"
      * answerOption[+].valueString = "Other tobacco use"

    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control|1.0.0#grid
      * linkId = "fe9feec6-593a-4106-8a7d-f9965a632ea2"
      * type = #group 
      * repeats = false
      * item[+]
        * linkId = "fa4f73a3-7633-410c-9177-8aa43b117122"
        * text = "Systolic Blood Pressure"
        * type = #group
        * repeats = false
        * item[+]
          * extension[sdc-questionnaire-initialExpression].valueExpression
            * language = #text/fhirpath
            * expression = "%ObsBloodPressure.entry.resource.component.where(code.coding.exists(code='8480-6')).value.value"
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
        * item[+]
          * extension[sdc-questionnaire-initialExpression].valueExpression
            * language = #text/fhirpath
            * expression = "%ObsBloodPressure.entry.resource.effective"
          * linkId = "85d8faf7-ddb0-446c-b489-28d786d6de50"
          * text = "Date performed"
          * type = #date
          * repeats = false
      * item[+]
        * linkId = "e693c7d2-be69-4f1f-b72d-7ff2ea3cd536"
        * text = "Total Cholesterol"
        * type = #group
        * repeats = false
        * item[+]
          * extension[sdc-questionnaire-initialExpression].valueExpression
            * language = #text/fhirpath
            * expression = "%ObsTotalCholesterol.entry.resource.value.value"
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
        * item[+]
          * extension[sdc-questionnaire-initialExpression].valueExpression
            * language = #text/fhirpath
            * expression = "%ObsTotalCholesterol.entry.resource.effective"
          * linkId = "16cbe87b-5c8d-4385-b7d9-da3f07f63f8a"
          * text = "Date performed"
          * type = #date
          * repeats = false
      * item[+]
        * linkId = "87eefaf6-010f-4b0d-9f51-2c33e46e6c69"
        * text = "HDL Cholesterol"
        * type = #group
        * repeats = false
        * item[+]
          * extension[sdc-questionnaire-initialExpression].valueExpression
            * language = #text/fhirpath
            * expression = "%ObsHDLCholesterol.entry.resource.value.value"
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
        * item[+]
          * extension[sdc-questionnaire-initialExpression].valueExpression
            * language = #text/fhirpath
            * expression = "%ObsHDLCholesterol.entry.resource.effective"
          * linkId = "6407e0a7-c416-4a75-933b-904c0dcf88ca"
          * text = "Date performed"
          * type = #date
          * repeats = false
    * item[+]
      * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression].valueExpression
        * description = "CVD Risk Postcode"
        * language = #text/fhirpath
        * expression = "%postcode"
      * linkId = "fa8f03ca-9a5a-4ed1-a866-db26e567352a"
      * text = "Postcode"
      * type = #string
    * item[+]
      * extension[+][sdc-questionnaire-initialExpression].valueExpression
        * language = #text/fhirpath
        * expression = "%Condition.entry.resource.code.coding.where(system='http://snomed.info/sct' and code='44054006').exists()" //type 2 diabetes
      * linkId = "1c1eea28-6c82-4b7b-aaa3-8655ce70f2fd"
      * text = "Type 2 diabetes mellitus"
      * type = #boolean
      * repeats = false

  * item[+]
    * linkId = "dabdc7b4-51db-44a0-9d59-77a88587cbe9"
    * text = "CVD risk result"
    * type = #group   
    * repeats = false  
    * item[+]
      * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unit].valueCoding = $UCUM#%
      * linkId = "4c52fcec-0695-4916-b185-24a5c2711631"
      * text = "Calculated risk"
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
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#radio-button
      * linkId = "041a589e-7bb5-441d-a4ba-a22db8040b3f"
      * text = "Reclassification decision"
      * type = #choice   
      * repeats = false
      * answerOption[+].valueString = "Reclassified up"
      * answerOption[+].valueString = "Reclassified down"
      * answerOption[+].valueString = "Did not reclassify"

/* Deprecated CVD Risk calculator
  * item[+]
    * extension[+][sdc-questionnaire-initialExpression].valueExpression
      * language = #text/fhirpath
      * expression = "%ObsBloodPressure.entry.resource.component.where(code.coding.where(code='8480-6')).value.value"
    * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unit].valueCoding = $UCUM#mm[Hg]
    * linkId = "4b98f514-2f6a-41f3-ad9d-185abc68ae34"
    * text = "Systolic Blood Pressure"
    * type = #integer
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#prompt
      * linkId = "1624394a-1777-4692-b304-03cd42de4c27"
      * text = "75 or more"
      * type = #display
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#unit
      * linkId = "414f230f-7b33-4e55-b323-724206f6825e"
      * text = "mm Hg"
      * type = #display
  * item[+]        
    * extension[+][sdc-questionnaire-initialExpression].valueExpression
      * language = #text/fhirpath
      * expression = "%ObsTotalCholesterol.entry.resource.value.value"
    * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unit].valueCoding = $UCUM#mmol/L
    * linkId = "f11feebc-fc4a-40d5-8481-b87d9f5a89aa"
    * text = "Total Cholesterol"
    * type = #decimal
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#prompt
      * linkId = "0f260464-fcfc-46d1-b04b-c8fb061b781e"
      * text = "2 or more"
      * type = #display
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#unit
      * linkId = "d5a18260-0376-4c73-97a9-a23198bccce1"
      * text = "mmol/L"
      * type = #display
  * item[+]
    * extension[+][sdc-questionnaire-initialExpression].valueExpression
      * language = #text/fhirpath
      * expression = "%ObsHDLCholesterol.entry.resource.value.value"
    * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unit].valueCoding = $UCUM#mmol/L
    * linkId = "c47a7fae-0c60-40f8-8426-1019b1f0dd8f"
    * text = "HDL Cholesterol"
    * type = #decimal
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#prompt
      * linkId = "9b05a756-40f6-4ae4-9ec9-179e55685531"
      * text = "Between 0.2 - 5"
      * type = #display
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#unit
      * linkId = "28576058-6a24-4516-900a-42c9452722d3"
      * text = "mmol/L"
      * type = #display
  * item[+]
    * extension[+][sdc-questionnaire-initialExpression].valueExpression
      * language = #text/fhirpath
      * expression = "%Condition.entry.resource.code.coding.where(system='http://snomed.info/sct' and code='44054006').exists()" //type 2 diabetes
    * linkId = "e8fed84e-6c15-4f62-bc95-cd08033af3f7"
    * text = "Diabetes"
    * type = #boolean
    * repeats = false
  * item[+]
    * linkId = "b980624c-e91a-44d4-80ba-a9f34c0e1188"
    * text = "ECG LVH"
    * type = #boolean
    * repeats = false
  * item[+]
    * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression].valueExpression
      * description = "CVD Risk Score"
      * language = #text/fhirpath
      * expression = "%cvdScore.round(0)"
    * linkId = "ca830916-e2ee-4b24-a4c1-13eee23f8733"
    * text = "Cardiovascular disease risk calculated result"
    // * code = $SCT#827181004 "Risk of cardiovascular disease"
    * type = #integer   
    * repeats = false
    * readOnly = true  
    * item[+]
      * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-displayCategory].valueCodeableConcept = http://hl7.org/fhir/questionnaire-display-category#instructions
      * linkId = "1d0b746d-70a3-4c09-a33b-f67fd6db63a0"
      * text = "https://auscvdrisk.com.au/risk-calculator"
      * type = #display
*/

  * item[+]
    * linkId = "f8022f3f-21fe-42c0-8abd-95f24e2e37e5"
    * text = "Health priorities, actions and follow-up"
    * type = #text
    * repeats = false

  
  * item[+]
    * linkId = "MarkComplete-2"
    * text = "Mark section as complete"
      * extension[http://hl7.org/fhir/StructureDefinition/rendering-xhtml].valueString = "<div xmlns=\"http://www.w3.org/1999/xhtml\">\r\n<head>\r\n    <style type=\"text/css\">\r\n        .alert {\r\n            padding: 0.875rem;\r\n            margin-bottom: 1rem;\r\n            font-size: 0.875rem;\r\n            color: #2E7D32;\r\n            border-radius: 0.5rem;\r\n            background-color: #d5e5d6;\r\n            font-weight: 700;\r\n        }\r\n    </style>\r\n</head>\r\n<body>\r\n<div class=\"alert\">Mark section as complete</div>\r\n</body>\r\n</div>"
    * type = #boolean
    * repeats = false