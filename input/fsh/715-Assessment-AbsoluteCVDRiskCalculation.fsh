Alias: $LNC = http://loinc.org
Alias: $SCT = http://snomed.info/sct
Alias: $UCUM = http://unitsofmeasure.org

Instance: AbsoluteCVDRiskCalculation
InstanceOf: Questionnaire
Usage: #example
Title: "Aboriginal and Torres Strait Islander Health Check - Absolute Cardiovascular Disease Risk Calculation"
Description: "Absolute Cardiovascular Disease Risk Calculation sub-questionnaire for Aboriginal and Torres Strait Islander Health Check."


* contained[+] = CVDRiskSmokingStatus-1
* contained[+] = CVDRiskCategory-1
* contained[+] = CVDRiskResultTemplate

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
  * valueString = "ObsBloodPressureLatest"
* extension[+]
  * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-assembleContext"
  * valueString = "ObsTobaccoSmokingStatus"
* extension[+]
  * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-assembleContext"
  * valueString = "ObsTobaccoSmokingStatusLatest"
* extension[+]
  * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-assembleContext"
  * valueString = "postcode"
* extension[+]
  * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-assembleContext"
  * valueString = "ObsBodyHeight"
* extension[+]
  * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-assembleContext"
  * valueString = "ObsBodyHeightLatest"
* extension[+]
  * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-assembleContext"
  * valueString = "ObsBodyWeight"
* extension[+]
  * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-assembleContext"
  * valueString = "ObsBodyWeightLatest"
* extension[+]
  * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-assembleContext"
  * valueString = "CVDSexAtBirth"
* extension[+]
  * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-assembleContext"
  * valueString = "CVDSmokingStatusNew"
* extension[+]
  * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-assembleContext"
  * valueString = "CVDSystolicBloodPressureValue"
* extension[+]
  * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-assembleContext"
  * valueString = "CVDSystolicBloodPressureDate"
* extension[+]
  * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-assembleContext"
  * valueString = "weight"
* extension[+]
  * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-assembleContext"
  * valueString = "height"
* extension[+]
  * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-assembleContext"
  * valueString = "CVDWeightNewResultDate"
* extension[+]
  * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-assembleContext"
  * valueString = "CVDHeightNewResultDate"

//Cholesterol variables
  // enableWhen variable for total and HDL cholesterol items
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "totalHDLRatioValue"
    * language = #text/fhirpath
    * expression = "repeat(item).where(linkId='cvdrisk-totalhdlratio').answer.value"
  //Total Cholesterol
    //fhir query for total cholesterol observations sorted by date descending
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "ObsTotalCholesterol"
    * language = #application/x-fhir-query
    * expression = "Observation?code=14647-2&_sort=-date&patient={{%patient.id}}"
    //client side filtering to get latest resource with final/amended/corrected status
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "ObsTotalCholesterolLatest"
    * language = #text/fhirpath
    * expression = "%ObsTotalCholesterol.entry.resource.where(status = 'final' or status = 'amended' or status = 'corrected').first()"
    // filters resources to current results per CVD risk
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "ObsTotalCholesterolLatestCurrent"
    * language = #text/fhirpath
    * expression = "%ObsTotalCholesterolLatest.where(effective > (now() - 5 years))"

  //HDL Cholesterol
    //fhir query for HDL cholesterol observations sorted by date descending
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "ObsHDLCholesterol"
    * language = #application/x-fhir-query
    * expression = "Observation?code=14646-4&_sort=-date&patient={{%patient.id}}"
    //client side filtering to get latest resource with final/amended/corrected status
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "ObsHDLCholesterolLatest"
    * language = #text/fhirpath
    * expression = "%ObsHDLCholesterol.entry.resource.where(status = 'final' or status = 'amended' or status = 'corrected').first()"
    // filters resource to current results per CVD risk
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "ObsHDLCholesterolLatestCurrent"
    * language = #text/fhirpath
    * expression = "%ObsHDLCholesterolLatest.where(effective > (now() - 5 years))"

  //Total Cholesterol / HDL Cholesterol ratio
    //fhir query for Total Cholesterol / HDL Cholesterol ratio observations sorted by date descending
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "ObsTotalCholHDLRatio"
    * language = #application/x-fhir-query
    * expression = "Observation?code=32309-7&_sort=-date&patient={{%patient.id}}"
    //client side filtering to get latest resource with final/amended/corrected status
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "ObsTotalCholHDLRatioLatest"
    * language = #text/fhirpath
    * expression = "%ObsTotalCholHDLRatio.entry.resource.where(status = 'final' or status = 'amended' or status = 'corrected').first()"
    // CVD risk pre-population value
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "totalHDLRatioPrePop"
    * language = #text/fhirpath
    * expression = "iif(%ObsTotalCholesterolLatest.where(effective > (now() - 5 years)).exists() and %ObsHDLCholesterolLatest.where(effective > (now() - 5 years)).exists(), (%ObsTotalCholesterolLatest.value.value/%ObsHDLCholesterolLatest.value.value).round(2), %ObsTotalCholHDLRatioLatest.where(effective > (now() - 5 years)).value.value.round(2))"

//HbA1C
  //fhir query for HbA1C observations sorted by date descending
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "ObsHbA1C"
    * language = #application/x-fhir-query
    * expression = "Observation?code=59261-8&_sort=-date&patient={{%patient.id}}"
    //client side filtering to get latest resource with final/amended/corrected status
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "ObsHbA1CLatest"
    * language = #text/fhirpath
    * expression = "%ObsHbA1C.entry.resource.where(status = 'final' or status = 'amended' or status = 'corrected').first()"
    // CVD risk pre-population value
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "hba1cMmolDecimalPrepop"
    * language = #text/fhirpath
    * expression = "%ObsHbA1CLatest.where(effective > (now() - 12 months)).value.value"

//uACR
  //fhir query for uACR observations sorted by date descending
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "ObsuACR"
    * language = #application/x-fhir-query
    * expression = "Observation?code=32294-1&_sort=-date&patient={{%patient.id}}"
    //client side filtering to get latest resource with final/amended/corrected status
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "ObsuACRLatest"
    * language = #text/fhirpath
    * expression = "%ObsuACR.entry.resource.where(status = 'final' or status = 'amended' or status = 'corrected').first()"
    // CVD risk pre-population value
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "uacrDecimalPrepop"
    * language = #text/fhirpath
    * expression = "%ObsuACRLatest.where(effective > (now() - 18 months)).value.value"

//eGFR
  //fhir query for eGFR observations sorted by date descending
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "ObseGFR"
    * language = #application/x-fhir-query
    * expression = "Observation?code=62238-1&_sort=-date&patient={{%patient.id}}"
    //client side filtering to get latest resource with final/amended/corrected status
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "ObseGFRLatest"
    * language = #text/fhirpath
    * expression = "%ObseGFR.entry.resource.where(status = 'final' or status = 'amended' or status = 'corrected').first()"
    // CVD risk pre-population value
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "egfrDecimalPrepop"
    * language = #text/fhirpath
    * expression = "%ObseGFRLatest.where(effective > (now() - 12 months)).value.value"

//Blood Pressure
  //fhir query for sitting blood pressure observations sorted by date descending
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "ObsBloodPressureSitting"
    * language = #application/x-fhir-query
    * expression = "Observation?code=163035008&_sort=-date&patient={{%patient.id}}"
    //client side filtering to get latest resource with final/amended/corrected status
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "ObsBloodPressureSittingLatest"
    * language = #text/fhirpath
    * expression = "%ObsBloodPressureSitting.entry.resource.where(status = 'final' or status = 'amended' or status = 'corrected').first()"

//MedicationRequest
  //fhir query for MedicationRequest resources for active and completed requests and including referenced Medication resources 
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "MedicationRequest"
    * language = #application/x-fhir-query
    * expression = "MedicationRequest?status=active,completed&patient={{%patient.id}}&_include=MedicationRequest:medication"
  //client side filtering on %MedicationRequest
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "medicationRequestArray"
    * language = #text/fhirpath
    * expression = "%MedicationRequest.entry.resource.where(intent = 'order' or intent = 'original-order' or intent='reflex-order' or intent='filler-order' or intent='instance-order' or resourceType = 'Medication')"
  // Medication pre-population terminology requests
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "memberOfBpLoweringMedicationReqMedication"
    * language = #text/fhirpath
    * expression = "%medicationRequestArray.where(medication.memberOf('http://snomed.info/sct/32506021000036107?fhir_vs=ecl/(((%5E929360061000036106%20AND%20%3C%3C%20(41549009%20OR%2033252009%20OR%2045518007%20OR%2096308008%20OR%2048698004%20))%20OR%20(%20%3C%3C%5E929360071000036103%20AND%20%3C%3C%20(41549009%20OR%2033252009%20OR%2045518007%20OR%2096308008%20OR%2048698004%20))%20OR%20(%20%3C%3C%5E%20929360081000036101%20%3A%20%7B%20774160008%20%3D%20%3C%3C%20(41549009%20OR%2033252009%20OR%2045518007%20OR%2096308008%20OR%2048698004%20)%20%7D)%20OR%20(((%20%3C%3C%5E929360071000036103%20AND%20%3C%3C%20(41549009%20OR%2033252009%20OR%2045518007%20OR%2096308008%20OR%2048698004%20))%20OR%20(%20%3C%3C%5E%20929360081000036101%20%3A%20%7B%20774160008%20%3D%20%3C%3C%20(%2041549009%20OR%2033252009%20OR%2045518007%20OR%2096308008%20OR%2048698004%20)%7D))%20.774158006%20))%20MINUS%20(((%20%3C%3C%5E929360071000036103%20%3A%20411116001%20%3D%20(%3C%3C385124005%20OR%20%3C%3C385122009%20OR%20%3C%3C129011000036109%20))%20OR%20(%3C%3C%5E%20929360081000036101%20%3A%20%7B%20774160008%20%3D%20(%3C%3C%5E929360071000036103%20%3A%20411116001%20%3D%20(%3C%3C385124005%20OR%20%3C%3C385122009%20OR%20%3C%3C129011000036109%20))%7D)%20OR%20(((%20%3C%3C%5E929360071000036103%20%3A%20411116001%20%3D%20(%3C%3C385124005%20OR%20%3C%3C385122009%20OR%20%3C%3C129011000036109%20))%20OR%20(%3C%3C%5E%20929360081000036101%20%3A%20%7B%20774160008%20%3D%20(%3C%3C%5E929360071000036103%20%3A%20411116001%20%3D%20(%3C%3C385124005%20OR%20%3C%3C385122009%20OR%20%3C%3C129011000036109%20))%20%7D)%20)%20.774158006%20))%20OR%20((%3C%3C%5E929360061000036106%20AND%20%3C%3C(108402001%20OR%2077856005%20OR%2085591001%20OR%20349903009%20OR%2087285001%20))%20OR%20(%3C%3C%5E%20929360081000036101%20%3A%20%7B%20774160008%20%3D%20%3C%3C(108402001%20OR%2077856005%20OR%2085591001%20OR%20349903009%20OR%2087285001%20)%20%7D)%20OR%20(((%3C%3C%5E929360061000036106%20AND%20%3C%3C(108402001%20OR%2077856005%20OR%2085591001%20OR%20349903009%20OR%2087285001%20))%20OR%20(%3C%3C%5E%20929360081000036101%20%3A%20%7B%20774160008%20%3D%20%3C%3C(108402001%20OR%2077856005%20OR%2085591001%20OR%20349903009%20OR%2087285001%20)%20%7D))%20.774158006%20))))')).where(authoredOn > (now() - 12 months)).exists()"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "memberOfBpLoweringMedicationCode"
    * language = #text/fhirpath
    // SELECT Medications resources where IDs are referenced in MRs, MR should be authored in the last 12 months, and Medication codes are in the BP lowering medication code set
    * expression = "%medicationRequestArray.where(resourceType = 'Medication' and id in %medicationRequestArray.where(authoredOn > (now() - 12 months)).medicationReference.select(reference.replace('Medication/', ''))).where(code.memberOf('http://snomed.info/sct/32506021000036107?fhir_vs=ecl/(((%5E929360061000036106%20AND%20%3C%3C%20(41549009%20OR%2033252009%20OR%2045518007%20OR%2096308008%20OR%2048698004%20))%20OR%20(%20%3C%3C%5E929360071000036103%20AND%20%3C%3C%20(41549009%20OR%2033252009%20OR%2045518007%20OR%2096308008%20OR%2048698004%20))%20OR%20(%20%3C%3C%5E%20929360081000036101%20%3A%20%7B%20774160008%20%3D%20%3C%3C%20(41549009%20OR%2033252009%20OR%2045518007%20OR%2096308008%20OR%2048698004%20)%20%7D)%20OR%20(((%20%3C%3C%5E929360071000036103%20AND%20%3C%3C%20(41549009%20OR%2033252009%20OR%2045518007%20OR%2096308008%20OR%2048698004%20))%20OR%20(%20%3C%3C%5E%20929360081000036101%20%3A%20%7B%20774160008%20%3D%20%3C%3C%20(%2041549009%20OR%2033252009%20OR%2045518007%20OR%2096308008%20OR%2048698004%20)%7D))%20.774158006%20))%20MINUS%20(((%20%3C%3C%5E929360071000036103%20%3A%20411116001%20%3D%20(%3C%3C385124005%20OR%20%3C%3C385122009%20OR%20%3C%3C129011000036109%20))%20OR%20(%3C%3C%5E%20929360081000036101%20%3A%20%7B%20774160008%20%3D%20(%3C%3C%5E929360071000036103%20%3A%20411116001%20%3D%20(%3C%3C385124005%20OR%20%3C%3C385122009%20OR%20%3C%3C129011000036109%20))%7D)%20OR%20(((%20%3C%3C%5E929360071000036103%20%3A%20411116001%20%3D%20(%3C%3C385124005%20OR%20%3C%3C385122009%20OR%20%3C%3C129011000036109%20))%20OR%20(%3C%3C%5E%20929360081000036101%20%3A%20%7B%20774160008%20%3D%20(%3C%3C%5E929360071000036103%20%3A%20411116001%20%3D%20(%3C%3C385124005%20OR%20%3C%3C385122009%20OR%20%3C%3C129011000036109%20))%20%7D)%20)%20.774158006%20))%20OR%20((%3C%3C%5E929360061000036106%20AND%20%3C%3C(108402001%20OR%2077856005%20OR%2085591001%20OR%20349903009%20OR%2087285001%20))%20OR%20(%3C%3C%5E%20929360081000036101%20%3A%20%7B%20774160008%20%3D%20%3C%3C(108402001%20OR%2077856005%20OR%2085591001%20OR%20349903009%20OR%2087285001%20)%20%7D)%20OR%20(((%3C%3C%5E929360061000036106%20AND%20%3C%3C(108402001%20OR%2077856005%20OR%2085591001%20OR%20349903009%20OR%2087285001%20))%20OR%20(%3C%3C%5E%20929360081000036101%20%3A%20%7B%20774160008%20%3D%20%3C%3C(108402001%20OR%2077856005%20OR%2085591001%20OR%20349903009%20OR%2087285001%20)%20%7D))%20.774158006%20))))')).exists()"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "memberOfBpLoweringMedicationContained"
    * language = #text/fhirpath    
    // MR should be authored in the last 12 months, SELECT contained Medications resources where IDs are referenced, and the codes are in the BP lowering medication code set
    * expression = "%medicationRequestArray.where(authoredOn > (now() - 12 months)).contained.where(resourceType = 'Medication' and id in (%medicationRequestArray.medication.select(reference.replace('#', '')))).where(code.memberOf('http://snomed.info/sct/32506021000036107?fhir_vs=ecl/(((%5E929360061000036106%20AND%20%3C%3C%20(41549009%20OR%2033252009%20OR%2045518007%20OR%2096308008%20OR%2048698004%20))%20OR%20(%20%3C%3C%5E929360071000036103%20AND%20%3C%3C%20(41549009%20OR%2033252009%20OR%2045518007%20OR%2096308008%20OR%2048698004%20))%20OR%20(%20%3C%3C%5E%20929360081000036101%20%3A%20%7B%20774160008%20%3D%20%3C%3C%20(41549009%20OR%2033252009%20OR%2045518007%20OR%2096308008%20OR%2048698004%20)%20%7D)%20OR%20(((%20%3C%3C%5E929360071000036103%20AND%20%3C%3C%20(41549009%20OR%2033252009%20OR%2045518007%20OR%2096308008%20OR%2048698004%20))%20OR%20(%20%3C%3C%5E%20929360081000036101%20%3A%20%7B%20774160008%20%3D%20%3C%3C%20(%2041549009%20OR%2033252009%20OR%2045518007%20OR%2096308008%20OR%2048698004%20)%7D))%20.774158006%20))%20MINUS%20(((%20%3C%3C%5E929360071000036103%20%3A%20411116001%20%3D%20(%3C%3C385124005%20OR%20%3C%3C385122009%20OR%20%3C%3C129011000036109%20))%20OR%20(%3C%3C%5E%20929360081000036101%20%3A%20%7B%20774160008%20%3D%20(%3C%3C%5E929360071000036103%20%3A%20411116001%20%3D%20(%3C%3C385124005%20OR%20%3C%3C385122009%20OR%20%3C%3C129011000036109%20))%7D)%20OR%20(((%20%3C%3C%5E929360071000036103%20%3A%20411116001%20%3D%20(%3C%3C385124005%20OR%20%3C%3C385122009%20OR%20%3C%3C129011000036109%20))%20OR%20(%3C%3C%5E%20929360081000036101%20%3A%20%7B%20774160008%20%3D%20(%3C%3C%5E929360071000036103%20%3A%20411116001%20%3D%20(%3C%3C385124005%20OR%20%3C%3C385122009%20OR%20%3C%3C129011000036109%20))%20%7D)%20)%20.774158006%20))%20OR%20((%3C%3C%5E929360061000036106%20AND%20%3C%3C(108402001%20OR%2077856005%20OR%2085591001%20OR%20349903009%20OR%2087285001%20))%20OR%20(%3C%3C%5E%20929360081000036101%20%3A%20%7B%20774160008%20%3D%20%3C%3C(108402001%20OR%2077856005%20OR%2085591001%20OR%20349903009%20OR%2087285001%20)%20%7D)%20OR%20(((%3C%3C%5E929360061000036106%20AND%20%3C%3C(108402001%20OR%2077856005%20OR%2085591001%20OR%20349903009%20OR%2087285001%20))%20OR%20(%3C%3C%5E%20929360081000036101%20%3A%20%7B%20774160008%20%3D%20%3C%3C(108402001%20OR%2077856005%20OR%2085591001%20OR%20349903009%20OR%2087285001%20)%20%7D))%20.774158006%20))))')).exists()"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "memberOfLipidModifyingMedicationReqMedication"
    * language = #text/fhirpath
    * expression = "%medicationRequestArray.where(medication.memberOf('http://snomed.info/sct/32506021000036107?fhir_vs=ecl/%20%28%28%20%28%20%28%28%5E929360061000036106%20AND%20%3C%3C%20%28108600003%20OR%2096307003%20OR%2096305006%20OR%2096304005%20OR%20319982006%20OR%20319937007%20OR%2072824008%20OR%2077035009%20OR%2066971004%20OR%20408041006%20OR%2035282000%20OR%2063639004%20%29%29%20OR%20%28%3C%3C%5E929360071000036103%20AND%20%3C%3C%20%28108600003%20OR%2096307003%20OR%2096305006%20OR%2096304005%20OR%20319982006%20OR%20319937007%20OR%2072824008%20OR%2077035009%20OR%2066971004%20OR%20408041006%20OR%2035282000%20OR%2063639004%20%29%29%20OR%20%28%3C%3C%5E%20929360081000036101%20%3A%20%7B%20774160008%20%3D%20%3C%3C%20%28108600003%20OR%2096307003%20OR%2096305006%20OR%2096304005%20OR%20319982006%20OR%20319937007%20OR%2072824008%20OR%2077035009%20OR%2066971004%20OR%20408041006%20OR%2035282000%20OR%2063639004%20%29%20%7D%29%20OR%20%28%28%20%28%20%3C%3C%5E929360071000036103%20AND%20%3C%3C%20%28108600003%20OR%2096307003%20OR%2096305006%20OR%2096304005%20OR%20319982006%20OR%20319937007%20OR%2072824008%20OR%2077035009%20OR%2066971004%20OR%20408041006%20OR%2035282000%20OR%2063639004%20%29%20%29%20OR%20%28%3C%3C%5E%20929360081000036101%20%3A%20%7B%20774160008%20%3D%20%3C%3C%20%28108600003%20OR%2096307003%20OR%2096305006%20OR%2096304005%20OR%20319982006%20OR%20319937007%20OR%2072824008%20OR%2077035009%20OR%2066971004%20OR%20408041006%20OR%2035282000%20OR%2063639004%20%29%20%7D%20%29%20%29%20.774158006%20%29%29%20%29%20%29%20MINUS%20%28%20%28%20%28%28%3C%3C%201145021005%20%29%20OR%20%28%3C%3C%5E%20929360081000036101%20%3A%20%7B%20774160008%20%3D%20%3C%3C%201145021005%20%7D%29%20OR%20%28%28%20%28%20%3C%3C%201145021005%20%29%20OR%20%28%3C%3C%5E%20929360081000036101%20%3A%20%7B%20774160008%20%3D%20%3C%3C%201145021005%20%7D%20%29%20%29%20.774158006%20%29%29%20%29%20%29%29')).where(authoredOn > (now() - 12 months)).exists()"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "memberOfLipidModifyingMedicationCode"
    * language = #text/fhirpath
    // SELECT Medications resources where IDs are referenced in MRs, MR should be authored in the last 12 months, and Medication codes are in the Lipid modifying medication code set
    * expression = "%medicationRequestArray.where(resourceType = 'Medication' and id in %medicationRequestArray.where(authoredOn > (now() - 12 months)).medicationReference.select(reference.replace('Medication/', ''))).where(code.memberOf('http://snomed.info/sct/32506021000036107?fhir_vs=ecl/%20%28%28%20%28%20%28%28%5E929360061000036106%20AND%20%3C%3C%20%28108600003%20OR%2096307003%20OR%2096305006%20OR%2096304005%20OR%20319982006%20OR%20319937007%20OR%2072824008%20OR%2077035009%20OR%2066971004%20OR%20408041006%20OR%2035282000%20OR%2063639004%20%29%29%20OR%20%28%3C%3C%5E929360071000036103%20AND%20%3C%3C%20%28108600003%20OR%2096307003%20OR%2096305006%20OR%2096304005%20OR%20319982006%20OR%20319937007%20OR%2072824008%20OR%2077035009%20OR%2066971004%20OR%20408041006%20OR%2035282000%20OR%2063639004%20%29%29%20OR%20%28%3C%3C%5E%20929360081000036101%20%3A%20%7B%20774160008%20%3D%20%3C%3C%20%28108600003%20OR%2096307003%20OR%2096305006%20OR%2096304005%20OR%20319982006%20OR%20319937007%20OR%2072824008%20OR%2077035009%20OR%2066971004%20OR%20408041006%20OR%2035282000%20OR%2063639004%20%29%20%7D%29%20OR%20%28%28%20%28%20%3C%3C%5E929360071000036103%20AND%20%3C%3C%20%28108600003%20OR%2096307003%20OR%2096305006%20OR%2096304005%20OR%20319982006%20OR%20319937007%20OR%2072824008%20OR%2077035009%20OR%2066971004%20OR%20408041006%20OR%2035282000%20OR%2063639004%20%29%20%29%20OR%20%28%3C%3C%5E%20929360081000036101%20%3A%20%7B%20774160008%20%3D%20%3C%3C%20%28108600003%20OR%2096307003%20OR%2096305006%20OR%2096304005%20OR%20319982006%20OR%20319937007%20OR%2072824008%20OR%2077035009%20OR%2066971004%20OR%20408041006%20OR%2035282000%20OR%2063639004%20%29%20%7D%20%29%20%29%20.774158006%20%29%29%20%29%20%29%20MINUS%20%28%20%28%20%28%28%3C%3C%201145021005%20%29%20OR%20%28%3C%3C%5E%20929360081000036101%20%3A%20%7B%20774160008%20%3D%20%3C%3C%201145021005%20%7D%29%20OR%20%28%28%20%28%20%3C%3C%201145021005%20%29%20OR%20%28%3C%3C%5E%20929360081000036101%20%3A%20%7B%20774160008%20%3D%20%3C%3C%201145021005%20%7D%20%29%20%29%20.774158006%20%29%29%20%29%20%29%29')).exists()"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "memberOfLipidModifyingMedicationContained"
    * language = #text/fhirpath
    // MR should be authored in the last 12 months, SELECT contained Medications resources where IDs are referenced, and the codes are in the Lipid modifying medication code set
    * expression = "%medicationRequestArray.where(authoredOn > (now() - 12 months)).contained.where(resourceType = 'Medication' and id in (%medicationRequestArray.medication.select(reference.replace('#', '')))).where(code.memberOf('http://snomed.info/sct/32506021000036107?fhir_vs=ecl/%20%28%28%20%28%20%28%28%5E929360061000036106%20AND%20%3C%3C%20%28108600003%20OR%2096307003%20OR%2096305006%20OR%2096304005%20OR%20319982006%20OR%20319937007%20OR%2072824008%20OR%2077035009%20OR%2066971004%20OR%20408041006%20OR%2035282000%20OR%2063639004%20%29%29%20OR%20%28%3C%3C%5E929360071000036103%20AND%20%3C%3C%20%28108600003%20OR%2096307003%20OR%2096305006%20OR%2096304005%20OR%20319982006%20OR%20319937007%20OR%2072824008%20OR%2077035009%20OR%2066971004%20OR%20408041006%20OR%2035282000%20OR%2063639004%20%29%29%20OR%20%28%3C%3C%5E%20929360081000036101%20%3A%20%7B%20774160008%20%3D%20%3C%3C%20%28108600003%20OR%2096307003%20OR%2096305006%20OR%2096304005%20OR%20319982006%20OR%20319937007%20OR%2072824008%20OR%2077035009%20OR%2066971004%20OR%20408041006%20OR%2035282000%20OR%2063639004%20%29%20%7D%29%20OR%20%28%28%20%28%20%3C%3C%5E929360071000036103%20AND%20%3C%3C%20%28108600003%20OR%2096307003%20OR%2096305006%20OR%2096304005%20OR%20319982006%20OR%20319937007%20OR%2072824008%20OR%2077035009%20OR%2066971004%20OR%20408041006%20OR%2035282000%20OR%2063639004%20%29%20%29%20OR%20%28%3C%3C%5E%20929360081000036101%20%3A%20%7B%20774160008%20%3D%20%3C%3C%20%28108600003%20OR%2096307003%20OR%2096305006%20OR%2096304005%20OR%20319982006%20OR%20319937007%20OR%2072824008%20OR%2077035009%20OR%2066971004%20OR%20408041006%20OR%2035282000%20OR%2063639004%20%29%20%7D%20%29%20%29%20.774158006%20%29%29%20%29%20%29%20MINUS%20%28%20%28%20%28%28%3C%3C%201145021005%20%29%20OR%20%28%3C%3C%5E%20929360081000036101%20%3A%20%7B%20774160008%20%3D%20%3C%3C%201145021005%20%7D%29%20OR%20%28%28%20%28%20%3C%3C%201145021005%20%29%20OR%20%28%3C%3C%5E%20929360081000036101%20%3A%20%7B%20774160008%20%3D%20%3C%3C%201145021005%20%7D%20%29%20%29%20.774158006%20%29%29%20%29%20%29%29')).exists()"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "memberOfAntithromboticMedicationReqMedication"
    * language = #text/fhirpath
    * expression = "%medicationRequestArray.where(medication.memberOf('http://snomed.info/sct/32506021000036107?fhir_vs=ecl/%20%28%28%20%28%20%28%28%5E929360061000036106%20AND%20%3C%3C%20%287947003%20OR%20108979001%20OR%2066859009%20OR%20443312008%20OR%20704464003%20OR%20108971003%20OR%2048603004%20OR%20714788005%20OR%2047527007%20OR%20442539005%20OR%20703906002%20%29%29%20OR%20%28%3C%3C%5E929360071000036103%20AND%20%3C%3C%20%287947003%20OR%20108979001%20OR%2066859009%20OR%20443312008%20OR%20704464003%20OR%20108971003%20OR%2048603004%20OR%20714788005%20OR%2047527007%20OR%20442539005%20OR%20703906002%20%29%29%20OR%20%28%3C%3C%5E%20929360081000036101%20%3A%20%7B%20774160008%20%3D%20%3C%3C%20%287947003%20OR%20108979001%20OR%2066859009%20OR%20443312008%20OR%20704464003%20OR%20108971003%20OR%2048603004%20OR%20714788005%20OR%2047527007%20OR%20442539005%20OR%20703906002%20%29%20%7D%29%20OR%20%28%28%28%20%3C%3C%5E929360071000036103%20AND%20%3C%3C%20%287947003%20OR%20108979001%20OR%2066859009%20OR%20443312008%20OR%20704464003%20OR%20108971003%20OR%2048603004%20OR%20714788005%20OR%2047527007%20OR%20442539005%20OR%20703906002%20%29%20%29%20OR%20%28%3C%3C%5E%20929360081000036101%20%3A%20%7B%20774160008%20%3D%20%3C%3C%20%287947003%20OR%20108979001%20OR%2066859009%20OR%20443312008%20OR%20704464003%20OR%20108971003%20OR%2048603004%20OR%20714788005%20OR%2047527007%20OR%20442539005%20OR%20703906002%20%29%20%7D%20%29%29.774158006%20%29%29%20%29%29%20MINUS%20%28%20%28%20%28%28%3C%3C%5E929360071000036103%20%3A%20%7B732943007%20%3D387458008%20%2C%20999000041000168106%20%3E%23150%2C%20999000051000168108%20%3D258684004%20%7D%29%20OR%20%28%3C%3C%5E%20929360081000036101%20%3A%20%7B%20774160008%20%3D%20%28%3C%3C%5E929360071000036103%20%3A%20%7B732943007%20%3D387458008%20%2C%20999000041000168106%20%3E%23150%2C%20999000051000168108%20%3D258684004%20%7D%29%20%7D%29%20OR%20%28%28%28%20%3C%3C%5E929360071000036103%20%3A%20%7B732943007%20%3D387458008%20%2C%20999000041000168106%20%3E%23150%2C%20999000051000168108%20%3D258684004%20%7D%20%29%20OR%20%28%3C%3C%5E%20929360081000036101%20%3A%20%7B%20774160008%20%3D%20%28%3C%3C%5E929360071000036103%20%3A%20%7B732943007%20%3D387458008%20%2C%20999000041000168106%20%3E%23150%2C%20999000051000168108%20%3D258684004%20%7D%29%20%7D%20%29%29.774158006%20%29%20OR%20%2861756011000036104%20OR%20412096001%20OR%2061789011000036100%20%29%29%20%29%29%29')).where(authoredOn > (now() - 12 months)).exists()"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "memberOfAntithromboticMedicationCode"
    * language = #text/fhirpath
    // SELECT Medications resources where IDs are referenced in MRs, MR should be authored in the last 12 months, and Medication codes are in the Antithrombotic medication code set
    * expression = "%medicationRequestArray.where(resourceType = 'Medication' and id in %medicationRequestArray.where(authoredOn > (now() - 12 months)).medicationReference.select(reference.replace('Medication/', ''))).where(code.memberOf('http://snomed.info/sct/32506021000036107?fhir_vs=ecl/%20%28%28%20%28%20%28%28%5E929360061000036106%20AND%20%3C%3C%20%287947003%20OR%20108979001%20OR%2066859009%20OR%20443312008%20OR%20704464003%20OR%20108971003%20OR%2048603004%20OR%20714788005%20OR%2047527007%20OR%20442539005%20OR%20703906002%20%29%29%20OR%20%28%3C%3C%5E929360071000036103%20AND%20%3C%3C%20%287947003%20OR%20108979001%20OR%2066859009%20OR%20443312008%20OR%20704464003%20OR%20108971003%20OR%2048603004%20OR%20714788005%20OR%2047527007%20OR%20442539005%20OR%20703906002%20%29%29%20OR%20%28%3C%3C%5E%20929360081000036101%20%3A%20%7B%20774160008%20%3D%20%3C%3C%20%287947003%20OR%20108979001%20OR%2066859009%20OR%20443312008%20OR%20704464003%20OR%20108971003%20OR%2048603004%20OR%20714788005%20OR%2047527007%20OR%20442539005%20OR%20703906002%20%29%20%7D%29%20OR%20%28%28%28%20%3C%3C%5E929360071000036103%20AND%20%3C%3C%20%287947003%20OR%20108979001%20OR%2066859009%20OR%20443312008%20OR%20704464003%20OR%20108971003%20OR%2048603004%20OR%20714788005%20OR%2047527007%20OR%20442539005%20OR%20703906002%20%29%20%29%20OR%20%28%3C%3C%5E%20929360081000036101%20%3A%20%7B%20774160008%20%3D%20%3C%3C%20%287947003%20OR%20108979001%20OR%2066859009%20OR%20443312008%20OR%20704464003%20OR%20108971003%20OR%2048603004%20OR%20714788005%20OR%2047527007%20OR%20442539005%20OR%20703906002%20%29%20%7D%20%29%29.774158006%20%29%29%20%29%29%20MINUS%20%28%20%28%20%28%28%3C%3C%5E929360071000036103%20%3A%20%7B732943007%20%3D387458008%20%2C%20999000041000168106%20%3E%23150%2C%20999000051000168108%20%3D258684004%20%7D%29%20OR%20%28%3C%3C%5E%20929360081000036101%20%3A%20%7B%20774160008%20%3D%20%28%3C%3C%5E929360071000036103%20%3A%20%7B732943007%20%3D387458008%20%2C%20999000041000168106%20%3E%23150%2C%20999000051000168108%20%3D258684004%20%7D%29%20%7D%29%20OR%20%28%28%28%20%3C%3C%5E929360071000036103%20%3A%20%7B732943007%20%3D387458008%20%2C%20999000041000168106%20%3E%23150%2C%20999000051000168108%20%3D258684004%20%7D%20%29%20OR%20%28%3C%3C%5E%20929360081000036101%20%3A%20%7B%20774160008%20%3D%20%28%3C%3C%5E929360071000036103%20%3A%20%7B732943007%20%3D387458008%20%2C%20999000041000168106%20%3E%23150%2C%20999000051000168108%20%3D258684004%20%7D%29%20%7D%20%29%29.774158006%20%29%20OR%20%2861756011000036104%20OR%20412096001%20OR%2061789011000036100%20%29%29%20%29%29%29')).exists()"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "memberOfAntithromboticMedicationContained"
    * language = #text/fhirpath
    // MR should be authored in the last 12 months, SELECT contained Medications resources where IDs are referenced, and the codes are in the Antithrombotic medication code set
    * expression = "%medicationRequestArray.where(authoredOn > (now() - 12 months)).contained.where(resourceType = 'Medication' and id in (%medicationRequestArray.medication.select(reference.replace('#', '')))).where(code.memberOf('http://snomed.info/sct/32506021000036107?fhir_vs=ecl/%20%28%28%20%28%20%28%28%5E929360061000036106%20AND%20%3C%3C%20%287947003%20OR%20108979001%20OR%2066859009%20OR%20443312008%20OR%20704464003%20OR%20108971003%20OR%2048603004%20OR%20714788005%20OR%2047527007%20OR%20442539005%20OR%20703906002%20%29%29%20OR%20%28%3C%3C%5E929360071000036103%20AND%20%3C%3C%20%287947003%20OR%20108979001%20OR%2066859009%20OR%20443312008%20OR%20704464003%20OR%20108971003%20OR%2048603004%20OR%20714788005%20OR%2047527007%20OR%20442539005%20OR%20703906002%20%29%29%20OR%20%28%3C%3C%5E%20929360081000036101%20%3A%20%7B%20774160008%20%3D%20%3C%3C%20%287947003%20OR%20108979001%20OR%2066859009%20OR%20443312008%20OR%20704464003%20OR%20108971003%20OR%2048603004%20OR%20714788005%20OR%2047527007%20OR%20442539005%20OR%20703906002%20%29%20%7D%29%20OR%20%28%28%28%20%3C%3C%5E929360071000036103%20AND%20%3C%3C%20%287947003%20OR%20108979001%20OR%2066859009%20OR%20443312008%20OR%20704464003%20OR%20108971003%20OR%2048603004%20OR%20714788005%20OR%2047527007%20OR%20442539005%20OR%20703906002%20%29%20%29%20OR%20%28%3C%3C%5E%20929360081000036101%20%3A%20%7B%20774160008%20%3D%20%3C%3C%20%287947003%20OR%20108979001%20OR%2066859009%20OR%20443312008%20OR%20704464003%20OR%20108971003%20OR%2048603004%20OR%20714788005%20OR%2047527007%20OR%20442539005%20OR%20703906002%20%29%20%7D%20%29%29.774158006%20%29%29%20%29%29%20MINUS%20%28%20%28%20%28%28%3C%3C%5E929360071000036103%20%3A%20%7B732943007%20%3D387458008%20%2C%20999000041000168106%20%3E%23150%2C%20999000051000168108%20%3D258684004%20%7D%29%20OR%20%28%3C%3C%5E%20929360081000036101%20%3A%20%7B%20774160008%20%3D%20%28%3C%3C%5E929360071000036103%20%3A%20%7B732943007%20%3D387458008%20%2C%20999000041000168106%20%3E%23150%2C%20999000051000168108%20%3D258684004%20%7D%29%20%7D%29%20OR%20%28%28%28%20%3C%3C%5E929360071000036103%20%3A%20%7B732943007%20%3D387458008%20%2C%20999000041000168106%20%3E%23150%2C%20999000051000168108%20%3D258684004%20%7D%20%29%20OR%20%28%3C%3C%5E%20929360081000036101%20%3A%20%7B%20774160008%20%3D%20%28%3C%3C%5E929360071000036103%20%3A%20%7B732943007%20%3D387458008%20%2C%20999000041000168106%20%3E%23150%2C%20999000051000168108%20%3D258684004%20%7D%29%20%7D%20%29%29.774158006%20%29%20OR%20%2861756011000036104%20OR%20412096001%20OR%2061789011000036100%20%29%29%20%29%29%29')).exists()"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "memberOfInsulinMedicationReqMedication"
    * language = #text/fhirpath
    * expression = "%medicationRequestArray.where(medication.memberOf('http://snomed.info/sct/32506021000036107?fhir_vs=ecl/%20%28%28%28%20%5E929360061000036106%20AND%20%3C%3C39487003%20%29%20OR%20%28%20%3C%3C%5E929360071000036103%20AND%20%3C%3C39487003%20%29%20OR%20%28%3C%3C%5E%20929360081000036101%20%3A%20%7B%20774160008%20%3D%20%3C%3C%2039487003%20%7D%20%29%29%20OR%20%28%28%28%20%3C%3C%5E929360071000036103%20AND%20%3C%3C%2039487003%20%29%20OR%20%28%3C%3C%5E%20929360081000036101%20%3A%20%7B%20774160008%20%3D%20%3C%3C%2039487003%20%7D%20%29%29.774158006%20%29%29')).where(authoredOn > (now() - 12 months)).exists()"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "memberOfInsulinMedicationCode"
    * language = #text/fhirpath
    // SELECT Medications resources where IDs are referenced in MRs, MR should be authored in the last 12 months, and Medication codes are in the Insulin medications
    * expression = "%medicationRequestArray.where(resourceType = 'Medication' and id in %medicationRequestArray.where(authoredOn > (now() - 12 months)).medicationReference.select(reference.replace('Medication/', ''))).where(medication.memberOf('http://snomed.info/sct/32506021000036107?fhir_vs=ecl/%20%28%28%28%20%5E929360061000036106%20AND%20%3C%3C39487003%20%29%20OR%20%28%20%3C%3C%5E929360071000036103%20AND%20%3C%3C39487003%20%29%20OR%20%28%3C%3C%5E%20929360081000036101%20%3A%20%7B%20774160008%20%3D%20%3C%3C%2039487003%20%7D%20%29%29%20OR%20%28%28%28%20%3C%3C%5E929360071000036103%20AND%20%3C%3C%2039487003%20%29%20OR%20%28%3C%3C%5E%20929360081000036101%20%3A%20%7B%20774160008%20%3D%20%3C%3C%2039487003%20%7D%20%29%29.774158006%20%29%29')).exists()"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "memberOfInsulinMedicationContained"
    * language = #text/fhirpath
    // MR should be authored in the last 12 months, SELECT contained Medications resources where IDs are referenced, and the codes are Insulin medications
    * expression = "%medicationRequestArray.where(authoredOn > (now() - 12 months)).contained.where(resourceType = 'Medication' and id in (%medicationRequestArray.medication.select(reference.replace('#', '')))).where(code.memberOf('http://snomed.info/sct/32506021000036107?fhir_vs=ecl/%20%28%28%28%20%5E929360061000036106%20AND%20%3C%3C39487003%20%29%20OR%20%28%20%3C%3C%5E929360071000036103%20AND%20%3C%3C39487003%20%29%20OR%20%28%3C%3C%5E%20929360081000036101%20%3A%20%7B%20774160008%20%3D%20%3C%3C%2039487003%20%7D%20%29%29%20OR%20%28%28%28%20%3C%3C%5E929360071000036103%20AND%20%3C%3C%2039487003%20%29%20OR%20%28%3C%3C%5E%20929360081000036101%20%3A%20%7B%20774160008%20%3D%20%3C%3C%2039487003%20%7D%20%29%29.774158006%20%29%29')).exists()"


// Client-side filtering for %Condition used in CVD risk - ensures active types of clinicalStatus and a confirmed or unspecified verificationStatus
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "conditionArray"
    * language = #text/fhirpath
    * expression = "%Condition.entry.resource.where(clinicalStatus.coding.exists(code = 'active' or code = 'recurrence' or code = 'relapse')).where(verificationStatus.coding.all(code.empty() or code='confirmed'))"
// New diagnosis QuestionnaireResponse entries
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "newDiagnosisArray"
    * language = #text/fhirpath
    * expression = "%resource.repeat(item).where(linkId='newdiagnosis')"
// Atrial Fibrillation exists in %ConditionArray
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "conditionAtrialFibrillationExists"
    * language = #text/fhirpath
    * expression = "%conditionArray.where(code.memberOf('http://snomed.info/sct/32506021000036107?fhir_vs=ecl/(%3C%3C49436004)')).exists()"
// Atrial Fibrillation exists in %newDiagnosisArray
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "newDiagnosisAtrialFibrillationExists"
    * language = #text/fhirpath
    * expression = "%newDiagnosisArray.item.answer.where(valueCoding.memberOf('http://snomed.info/sct/32506021000036107?fhir_vs=ecl/(%3C%3C49436004)')).exists()"
// Diabetes 2 condition resources in %ConditionArray
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "memberOfDiabetesResourceArray"
    * language = #text/fhirpath
    * expression = "%conditionArray.where(code.memberOf('http://snomed.info/sct/32506021000036107?fhir_vs=ecl/(%3C%3C44054006)'))"
// Diabetes 2 exists in %memberOfDiabetesResourceArray
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "conditionDiabetesExists"
    * language = #text/fhirpath
    * expression = "%memberOfDiabetesResourceArray.exists()"
// Diabetes 2 exists in newDiagnosisArray
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "newDiagnosisDiabetesExists"
    * language = #text/fhirpath
    * expression = "%newDiagnosisArray.item.where(linkId='2da85994-2d5e-42f1-8a81-abf44f397468').answer.where(valueCoding.memberOf('http://snomed.info/sct/32506021000036107?fhir_vs=ecl/(%3C%3C44054006)')).exists()"

// Additional Diabetes details pre-population logic
  // Years (as integer) since diabetes onset date - from patient record
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "conditionDiabetesYears"
    * language = #text/fhirpath
    * expression = "today().toString().substring(0,4).toInteger() - %memberOfDiabetesResourceArray[0].onset.toString().substring(0,4).toInteger()"
  // Onset date of new diabetes diagnosis (SCT coded)
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "newDiagnosisDiabetesOnsetDate"
    * language = #text/fhirpath
    * expression = "%newDiagnosisArray.where(item.where(linkId='2da85994-2d5e-42f1-8a81-abf44f397468').answer.where(valueCoding.memberOf('http://snomed.info/sct/32506021000036107?fhir_vs=ecl/(%3C%3C44054006)')).exists()).item.where(linkId='4d55bffb-3286-4a23-a785-3b9c346d464d').answer.value.first()"    
  // Years (as integer) since diabetes onset date - from new diagnosis
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "newDiagnosisDiabetesYears"
    * language = #text/fhirpath
    * expression = "today().toString().substring(0,4).toInteger() - %newDiagnosisDiabetesOnsetDate.toString().substring(0,4).toInteger()"
  // Years (as integer) since diabetes onset date - max from patient record or new diagnosis
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "diabetesYearsFinal"
    * language = #text/fhirpath
    * expression = "(%newDiagnosisDiabetesYears | %conditionDiabetesYears).max()"

// CVD risk weight pre-population value
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "bmiWeightDecimalPrepop"
    * language = #text/fhirpath
    * expression = "%ObsBodyWeightLatest.where(effective > (now() - 12 months)).value.value"
// CVD risk height pre-population value
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "bmiHeightDecimalPrepop"
    * language = #text/fhirpath
    * expression = "%ObsBodyHeightLatest.where(effective > (%patient.birthDate + 18 years)).value.value/100"
// CVD risk insulin use pre-population value
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "insulinUseBooleanPrepop"
    * language = #text/fhirpath
    * expression = "%memberOfInsulinMedicationReqMedication or %memberOfInsulinMedicationCode or %memberOfInsulinMedicationContained or {}"

//Previous CVD risk result variables
  //fhir-query to get all CVD risk result Observations for the patient, sorted by date descending
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "CVDRiskResult"
    * language = #application/x-fhir-query
    * expression = "Observation?code=441829007&_sort=-date&patient={{%patient.id}}"
  //client-side filtering to get the latest CVD risk result with a final/amended/corrected status
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "CVDRiskResultLatest"
    * language = #text/fhirpath
    * expression = "%CVDRiskResult.entry.resource.where(status = 'final' or status = 'amended' or status = 'corrected').first()"
  //CVD risk result value as a string with interpretation (e.g. "15% High")
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "CVDRiskResultValue"
    * language = #text/fhirpath
    * expression = "%CVDRiskResultLatest.select((((value.ofType(Quantity).comparator + value.ofType(Quantity).value.toString() + value.ofType(Quantity).unit | value.ofType(Quantity).value.toString() + value.ofType(Quantity).unit).first() | (value.ofType(Range).low.value.toString() + ' - ' + value.ofType(Range).high.value.toString() + value.ofType(Range).high.unit)).first()) + ' ' + interpretation.coding.display)"
  //CVD risk result date as a string
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "CVDRiskResultDateString"
    * language = #text/fhirpath
    * expression = "%CVDRiskResultLatest.effective.toString()"
  //CVD risk result date formatted as "DD MMM YYYY"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "CVDRiskResultDateFormatted"
    * language = #text/fhirpath
    * expression = "%CVDRiskResultDateString.substring(8,2).toInteger().toString() + ' ' + %CVDRiskResultDateString.substring(5,2).replace('01','Jan').replace('02','Feb').replace('03','Mar').replace('04','Apr').replace('05','May').replace('06','Jun').replace('07','Jul').replace('08','Aug').replace('09','Sep').replace('10','Oct').replace('11','Nov').replace('12','Dec') + ' ' + %CVDRiskResultDateString.substring(0,4)"

//variables to drive enableWhen logic for CVD risk items
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
      * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract].extension[template].valueReference.reference = "#CVDRiskResultTemplate"
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
        * answerValueSet = "#CVDRiskCategory-1"
//Online calculator variables view
  * item[+]
    * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression].valueExpression
      * language = #text/fhirpath
      * expression = "%AusCVDRiskiAccessAnswer != true or %AusCVDRiskiAccessAnswer.empty()"
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
        * expression = "%CVDSexAtBirth"
      * linkId = "3dbb0e63-3b28-4567-8ef3-bac242fd95f6"
      * text = "Sex at birth"
      * type = #choice
      * repeats = false
      * answerOption[+].valueCoding = $SCT#248152002
      * answerOption[+].valueCoding = $SCT#248153007
    * item[+]
      * extension[sdc-questionnaire-calculatedExpression].valueExpression
        * language = #text/fhirpath
        * expression = "iif(%CVDSmokingStatusNew.exists(), %CVDSmokingStatusNew, %ObsTobaccoSmokingStatusLatest.value.coding.where(system='http://snomed.info/sct').first())"
      * linkId = "333007c7-47a9-482b-af11-e55484abf2ae"
      * text = "Smoking status"
      * type = #choice
      * repeats = false
      * answerValueSet = "#CVDRiskSmokingStatus-1"
    * item[+]
      * extension[sdc-questionnaire-calculatedExpression].valueExpression
        * language = #text/fhirpath
        * expression = "iif(%CVDSystolicBloodPressureValue.exists() and %CVDSystolicBloodPressureDate > (now() - 2 years), %CVDSystolicBloodPressureValue, iif(%ObsBloodPressureSittingLatest.where(effective > (now() - 2 years)).exists(), %ObsBloodPressureSittingLatest.component.where(code.coding.exists(code='407554009')).value.value.round(0), %ObsBloodPressureLatest.where(effective > (now() - 2 years)).component.where(code.coding.exists(code='271649006')).value.value.round(0)))"
      * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unit].valueCoding = $UCUM#mm[Hg]
      * linkId = "818ce640-c8dd-457d-b607-3aaa8da38524"
      * text = "Systolic blood pressure"
      * type = #integer
      * repeats = false
      * item[+]
        * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#unit
        * linkId = "ddea5a62-a8c1-4b15-b667-7b69babec8cd"
        * text = "mm Hg"
        * type = #display
    * item[+]
      * linkId = "cvdrisk-cholesterolgroup"
      * text = "Cholesterol"
        * extension[+]
          * url = "https://smartforms.csiro.au/ig/StructureDefinition/QuestionnaireItemTextHidden"
          * valueBoolean = true
      * type = #group
      * repeats = false
      * item[+]
        * extension[sdc-questionnaire-initialExpression].valueExpression
          * language = #text/fhirpath
          * expression = "%totalHDLRatioPrePop"
        * linkId = "cvdrisk-totalhdlratio"
        * text = "Ratio of total cholesterol to HDL cholesterol"
        * type = #decimal
        * repeats = false
      * item[+]
        * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression].valueExpression
          * language = #text/fhirpath
          * expression = "%totalHDLRatioValue.empty()"
        * extension[sdc-questionnaire-initialExpression].valueExpression
          * language = #text/fhirpath
          * expression = "%ObsTotalCholesterolLatestCurrent.value.value"
        * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unit].valueCoding = $UCUM#mmol/L
        * linkId = "99932a93-8135-47b2-933b-fd751b34b7af"
        * text = "Total Cholesterol"
        * type = #decimal
        * repeats = false
        * item[+]
          * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#unit
          * linkId = "fcfbfc9f-e400-4aae-993f-ea54096e7361"
          * text = "mmol/L"
          * type = #display
      * item[+]
        * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression].valueExpression
          * language = #text/fhirpath
          * expression = "%totalHDLRatioValue.empty()"
        * extension[sdc-questionnaire-initialExpression].valueExpression
          * language = #text/fhirpath
          * expression = "%ObsHDLCholesterolLatestCurrent.value.value"
        * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unit].valueCoding = $UCUM#mmol/L
        * linkId = "c14b4513-1e20-461d-97f4-4631711adc65"
        * text = "HDL Cholesterol"
        * type = #decimal
        * repeats = false
        * item[+]
          * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#unit
          * linkId = "2ba61002-b642-4b28-9e66-dc2b060c4e0e"
          * text = "mmol/L"
          * type = #display
//Use of CVD Medicines
    * item[+]
      * linkId = "cvdrisk-meds-group"
      * type = #group
      * repeats = false
      * text = "Use of CVD medicines within last 6 months"
      * item[+]
        * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#check-box
        * extension[sdc-questionnaire-initialExpression].valueExpression
          * language = #text/fhirpath
          // By adding "or {}" at the end, it will return an empty result if the expression is not true - ensuring that the initial value is not set to false
          * expression = "%memberOfBpLoweringMedicationReqMedication or %memberOfBpLoweringMedicationCode or %memberOfBpLoweringMedicationContained or {}"
        * linkId = "cvdrisk-bp-lowering-meds-boolean"
        * type = #boolean
        * repeats = false
        * text = "Blood pressure-lowering medicines"
      * item[+]
        * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#check-box
        * extension[sdc-questionnaire-initialExpression].valueExpression
          * language = #text/fhirpath
           // By adding "or {}" at the end, it will return an empty result if the expression is not true - ensuring that the initial value is not set to false
          * expression = "%memberOfLipidModifyingMedicationReqMedication or %memberOfLipidModifyingMedicationCode or %memberOfLipidModifyingMedicationContained or {}"
        * linkId = "lipid-modifying-meds-boolean"
        * type = #boolean
        * repeats = false
        * text = "Lipid-modifying medicines"
      * item[+]
        * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#check-box
        * extension[sdc-questionnaire-initialExpression].valueExpression
          * language = #text/fhirpath
           // By adding "or {}" at the end, it will return an empty result if the expression is not true - ensuring that the initial value is not set to false
          * expression = "%memberOfAntithromboticMedicationReqMedication or %memberOfAntithromboticMedicationCode or %memberOfAntithromboticMedicationContained or {}"
        * linkId = "antithrombotic-meds-boolean"
        * type = #boolean
        * repeats = false
        * text = "Antithrombotic medicines"
// End of CVD Medicines
// Atrial Fibrillation
    * item[+]
      * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression].valueExpression
        * description = "CVD Atrial Fibrillation Check"
        * language = #text/fhirpath
        * expression = "%conditionAtrialFibrillationExists or %newDiagnosisAtrialFibrillationExists or {}"
      * linkId = "history-atrial-fibrillation-boolean"
      * type = #boolean
      * repeats = false
      * text = "History of atrial fibrillation"    
// Postcode
    * item[+]
      * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression].valueExpression
        * description = "CVD Risk Postcode"
        * language = #text/fhirpath
        * expression = "%postcode"
      * linkId = "fa8f03ca-9a5a-4ed1-a866-db26e567352a"
      * text = "Postcode"
      * type = #string
// Diabetes
    * item[+]
      * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression].valueExpression
        * language = #text/fhirpath
        * expression = "%conditionDiabetesExists or %newDiagnosisDiabetesExists or {}"
      * linkId = "1c1eea28-6c82-4b7b-aaa3-8655ce70f2fd"
      * text = "Diabetes"
      * type = #boolean
      * repeats = false
// Start of Additional Diabetes Details Group    
    * item[+]
      * linkId = "cvdrisk-additional-diabetes-details-group"
      * type = #group
      * repeats = false
      * text = "Additional diabetes details"
  // Years since diabetes diagnosis
      * item[+]
        * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression].valueExpression
          * description = "Diabetes Years Final"
          * language = #text/fhirpath
          * expression = "%diabetesYearsFinal"
        * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unit].valueCoding = $UCUM#a
        * linkId = "cvdrisk-diabetes-years-integer"
        * text = "Years since diabetes diagnosis"
        * type = #integer
        * repeats = false
        * item[+]
          * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#unit
          * linkId = "cvdrisk-diabetes-years-unit"
          * text = "years"
          * type = #display
  // HbA1c
      * item[+]       
        * extension[sdc-questionnaire-initialExpression].valueExpression
          * language = #text/fhirpath
          * expression = "%hba1cMmolDecimalPrepop"
        * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unit].valueCoding = $UCUM#mmol/mol
        * linkId = "cvdrisk-hba1c-mmol-decimal"
        * text = "Glycated haemoglobin (HbA1c)"
        * type = #decimal
        * item[+] 
          * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#unit
          * linkId = "cvdrisk-hba1c-mmol-unit"
          * text = "mmol/mol"
          * type = #display
  // uACR
      * item[+]       
        * extension[sdc-questionnaire-initialExpression].valueExpression
          * language = #text/fhirpath
          * expression = "%uacrDecimalPrepop"
        * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unit].valueCoding = $UCUM#mg/mmol
        * linkId = "cvdrisk-uacr-decimal"
        * text = "uACR"
        * type = #decimal
        * item[+] 
          * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#unit
          * linkId = "cvdrisk-uacr-unit"
          * text = "mg/mmol"
          * type = #display
  // eGFR
      * item[+]       
        * extension[sdc-questionnaire-initialExpression].valueExpression
          * language = #text/fhirpath
          * expression = "%egfrDecimalPrepop"
        * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unit].valueCoding = $UCUM#mL/min/{1.73_m2}
        * linkId = "cvdrisk-egfr-decimal"
        * text = "eGFR"
        * type = #decimal
        * item[+] 
          * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#unit
          * linkId = "cvdrisk-egfr-unit"
          * text = "mL/min/1.73 m²"
          * type = #display
  // BMI
      * item[+] 
        * linkId = "cvdrisk-bmi-group"
        * text = "Body mass index (BMI)"
        * type = #group
        * repeats = false
        * item[+]       
          * extension[sdc-questionnaire-initialExpression].valueExpression
            * language = #text/fhirpath
            * expression = "iif(%weight.exists() and %CVDWeightNewResultDate > (now() - 12 months), %weight, %bmiWeightDecimalPrepop)"
          * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unit].valueCoding = $UCUM#kg
          * linkId = "cvdrisk-bmi-weight-decimal"
          * text = "Weight"
          * type = #decimal
          * item[+] 
            * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#unit
            * linkId = "cvdrisk-bmi-weight-unit"
            * text = "kg"
            * type = #display
        * item[+]       
          * extension[sdc-questionnaire-initialExpression].valueExpression
            * language = #text/fhirpath
            * expression = "iif(%height.exists() and %CVDHeightNewResultDate > (%patient.birthDate + 18 years), %height, %bmiHeightDecimalPrepop)"
          * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unit].valueCoding = $UCUM#m
          * linkId = "cvdrisk-bmi-height-decimal"
          * text = "Height"
          * type = #decimal
          * item[+] 
            * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#unit
            * linkId = "cvdrisk-bmi-height-unit"
            * text = "m"
            * type = #display
  // Insulin Use
      * item[+]       
        * extension[sdc-questionnaire-initialExpression].valueExpression
          * language = #text/fhirpath
          * expression = "%insulinUseBooleanPrepop"
        * linkId = "cvdrisk-insulin-use-boolean"
        * text = "Use of insulin within last 6 months"
        * type = #boolean
// END of Additional Diabetes group 

  * item[+]
    * linkId = "f8022f3f-21fe-42c0-8abd-95f24e2e37e5"
    * text = "Health priorities, actions and follow-up"
    * type = #text
    * repeats = false  
  * item[+]
    * linkId = "MarkComplete-2"
    * text = "Mark section as complete"
      * extension[http://hl7.org/fhir/StructureDefinition/rendering-xhtml].valueString = "<div xmlns=\"http://www.w3.org/1999/xhtml\">\r\n<head>\r\n    <style type=\"text/css\">\r\n        .alert {\r\n            padding: 0.875rem;\r\n            margin-bottom: 1rem;\r\n            font-size: 0.875rem;\r\n            color: #29712D;\r\n            border-radius: 0.5rem;\r\n            background-color: #D9E8DA;\r\n            font-weight: 700;\r\n        max-width: 205px;\r\n        }\r\n    </style>\r\n</head>\r\n<body>\r\n<div class=\"alert\">Mark section as complete</div>\r\n</body>\r\n</div>"
    * type = #boolean
    * repeats = false
