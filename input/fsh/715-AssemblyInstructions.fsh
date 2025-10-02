Alias: $LNC = http://loinc.org
Alias: $SCT = http://snomed.info/sct
Alias: $UCUM = http://unitsofmeasure.org

Instance: AssemblyInstructions
InstanceOf: Questionnaire
Usage: #example
Title: "Aboriginal and Torres Strait Islander Health Check"
Description: "Aboriginal and Torres Strait Islander Health Check assessment form."

* contained[+] = YesNo
* contained[+] = YesNoNA
* contained[+] = YesNoNotAskedDeclined
* contained[+] = clinical-condition-1
* contained[+] = administrative-gender
* contained[+] = condition-clinical
* contained[+] = AboriginalTorresStraitIslander
* contained[+] = PrimaryCarerParentGrandparent
* contained[+] = australian-pronouns-1
* contained[+] = australian-states-territories-2
* contained[+] = gender-identity-response-1
* contained[+] = biological-sex-1
* contained[+] = biological-sex-2
* contained[+] = SmokingQuitStatus-1
* contained[+] = TobaccoUseStatus-1
* contained[+] = CervicalScreeningStatus-1

//assemble expectation
* extension[+]
  * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-assemble-expectation"
  * valueCode = #assemble-root

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

//fhir query variables
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "Condition"
    * language = #application/x-fhir-query
    * expression = "Condition?patient={{%patient.id}}&category=http://terminology.hl7.org/CodeSystem/condition-category|problem-list-item"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "ObsBloodPressure"
    * language = #application/x-fhir-query
    * expression = "Observation?code=85354-9&_sort=-date&patient={{%patient.id}}" 
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "ObsTobaccoSmokingStatus"
    * language = #application/x-fhir-query
    * expression = "Observation?code=72166-2&_sort=-date&patient={{%patient.id}}"  
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "SexAtBirthCoding"
    * language = #text/fhirpath
    * expression = "%patient.extension.where(exists(url='http://hl7.org/fhir/StructureDefinition/individual-recordedSexOrGender' and extension.where(exists(url='type' and value.coding.code='1515311000168102')) and extension.where(url='effectivePeriod').value.end.empty())).extension.where(url='value').value.coding"

//client side filtering on Observations
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "ObsBloodPressureLatest"
    * language = #text/fhirpath
    * expression = "%ObsBloodPressure.entry.resource.where(status = 'final' or status = 'amended' or status = 'corrected').first()"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "ObsTobaccoSmokingStatusLatest"
    * language = #text/fhirpath
    * expression = "%ObsTobaccoSmokingStatus.entry.resource.where(status = 'final' or status = 'amended' or status = 'corrected').first()"


// CVD Risk Extensions
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "Condition"
    * language = #application/x-fhir-query
    * expression = "Condition?category=problem-list-item&patient={{%patient.id}}"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "MedicationRequest"
    * language = #application/x-fhir-query
    * expression = "MedicationRequest?status=active,completed&patient={{%patient.id}}&_include=MedicationRequest:medication"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "ObsTobaccoSmokingStatus"
    * language = #application/x-fhir-query
    * expression = "Observation?code=1747861000168109&patient={{%patient.id}}"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "ObsBodyHeight"
    * language = #application/x-fhir-query
    * expression = "Observation?code=8302-2&patient={{%patient.id}}"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "ObsBodyWeight"
    * language = #application/x-fhir-query
    * expression = "Observation?code=29463-7&patient={{%patient.id}}"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "ObsBloodPressureSitting"
    * language = #application/x-fhir-query
    * expression = "Observation?code=163035008&patient={{%patient.id}}"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "ObsTotalCholesterol"
    * language = #application/x-fhir-query
    * expression = "Observation?code=14647-2&patient={{%patient.id}}"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "ObsHDLCholesterol"
    * language = #application/x-fhir-query
    * expression = "Observation?code=14646-4&patient={{%patient.id}}"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "ObsTotalCholHDLRatio"
    * language = #application/x-fhir-query
    * expression = "Observation?code=32309-7&patient={{%patient.id}}"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "ObsHbA1C"
    * language = #application/x-fhir-query
    * expression = "Observation?code=59261-8&patient={{%patient.id}}"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "ObsuACR"
    * language = #application/x-fhir-query
    * expression = "Observation?code=32294-1&patient={{%patient.id}}"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "ObseGFR"
    * language = #application/x-fhir-query
    * expression = "Observation?code=62238-1&patient={{%patient.id}}"
* extension[+]
  * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext"
  * extension[0]
    * url = "name"
    * valueCoding = $launchContext#patient
  * extension[+]
    * url = "type"
    * valueCode = #Patient
  * extension[+]
    * url = "description"
    * valueString = "The patient that is to be used to pre-populate the form"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "conditionArray"
    * language = #text/fhirpath
    * expression = "%Condition.entry.resource.where(clinicalStatus.coding.exists(code = 'active' or code = 'recurrence' or code = 'relapse'))"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "medicationRequestArray"
    * language = #text/fhirpath
    * expression = "%MedicationRequest.entry.resource.where(intent = 'order' or  intent = 'original-order' or intent='reflex-order' or intent='filler-order' or intent='instance-order' or resourceType = 'Medication')"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "obsTobaccoSmokingStatus"
    * language = #text/fhirpath
    * expression = "%ObsTobaccoSmokingStatus.entry.resource.where(status = 'final' or status = 'amended' or status = 'corrected').first()"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "obsBodyHeight"
    * language = #text/fhirpath
    * expression = "%ObsBodyHeight.entry.resource.where(status = 'final' or status = 'amended' or status = 'corrected').first()"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "obsBodyWeight"
    * language = #text/fhirpath
    * expression = "%ObsBodyWeight.entry.resource.where(status = 'final' or status = 'amended' or status = 'corrected').first()"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "obsBloodPressure"
    * language = #text/fhirpath
    * expression = "%ObsBloodPressure.entry.resource.where(status = 'final' or status = 'amended' or status = 'corrected').first()"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "obsBloodPressureSitting"
    * language = #text/fhirpath
    * expression = "%ObsBloodPressureSitting.entry.resource.where(status = 'final' or status = 'amended' or status = 'corrected').first()"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "obsTotalCholesterol"
    * language = #text/fhirpath
    * expression = "%ObsTotalCholesterol.entry.resource.where(status = 'final' or status = 'amended' or status = 'corrected').first()"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "obsHDLCholesterol"
    * language = #text/fhirpath
    * expression = "%ObsHDLCholesterol.entry.resource.where(status = 'final' or status = 'amended' or status = 'corrected').first()"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "obsTotalCholHDLRatio"
    * language = #text/fhirpath
    * expression = "%ObsTotalCholHDLRatio.entry.resource.where(status = 'final' or status = 'amended' or status = 'corrected').first()"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "obsHbA1C"
    * language = #text/fhirpath
    * expression = "%ObsHbA1C.entry.resource.where(status = 'final' or status = 'amended' or status = 'corrected').first()"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "obsuACR"
    * language = #text/fhirpath
    * expression = "%ObsuACR.entry.resource.where(status = 'final' or status = 'amended' or status = 'corrected').first()"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "obseGFR"
    * language = #text/fhirpath
    * expression = "%ObseGFR.entry.resource.where(status = 'final' or status = 'amended' or status = 'corrected').first()"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "memberOfBpLoweringMedicationReqMedication"
    * language = #text/fhirpath
    * expression = "%medicationRequestArray.where(medication.memberOf('http://snomed.info/sct/32506021000036107?fhir_vs=ecl/(((%20%5E929360061000036106%20AND%20(%3C%3C%2041549009%20OR%20%3C%3C%2033252009%20OR%20%3C%3C%2045518007%20OR%20%3C%3C%2096308008%20OR%20%3C%3C%2048698004%20)%20)%20OR%20(%20%3C%3C%5E929360071000036103%20AND%20(%3C%3C%2041549009%20OR%20%3C%3C%2033252009%20OR%20%3C%3C%2045518007%20OR%20%3C%3C%2096308008%20OR%20%3C%3C%2048698004%20)%20)%20OR%20(%3C%3C%5E%20929360081000036101%20%3A%20%7B%20774160008%20%3D%20(%3C%3C%2041549009%20OR%20%3C%3C%2033252009%20OR%20%3C%3C%2045518007%20OR%20%3C%3C%2096308008%20OR%20%3C%3C%2048698004%20)%20%7D%20))%20OR%20(((%20%3C%3C%5E929360071000036103%20AND%20(%3C%3C%2041549009%20OR%20%3C%3C%2033252009%20OR%20%3C%3C%2045518007%20OR%20%3C%3C%2096308008%20OR%20%3C%3C%2048698004%20)%20)%20OR%20(%3C%3C%5E%20929360081000036101%20%3A%20%7B%20774160008%20%3D%20(%3C%3C%2041549009%20OR%20%3C%3C%2033252009%20OR%20%3C%3C%2045518007%20OR%20%3C%3C%2096308008%20OR%20%3C%3C%2048698004%20)%20%7D%20)).774158006%20))')).where(authoredOn > (now() - 12 months)).exists()"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "memberOfBpLoweringMedicationCode"
    * language = #text/fhirpath
    * expression = "%medicationRequestArray.where(resourceType = 'Medication' and id in %medicationRequestArray.where(authoredOn > (now() - 12 months)).medicationReference.select(reference.replace('Medication/', ''))).where(code.memberOf('http://snomed.info/sct/32506021000036107?fhir_vs=ecl/(((%20%5E929360061000036106%20AND%20(%3C%3C%2041549009%20OR%20%3C%3C%2033252009%20OR%20%3C%3C%2045518007%20OR%20%3C%3C%2096308008%20OR%20%3C%3C%2048698004%20)%20)%20OR%20(%20%3C%3C%5E929360071000036103%20AND%20(%3C%3C%2041549009%20OR%20%3C%3C%2033252009%20OR%20%3C%3C%2045518007%20OR%20%3C%3C%2096308008%20OR%20%3C%3C%2048698004%20)%20)%20OR%20(%3C%3C%5E%20929360081000036101%20%3A%20%7B%20774160008%20%3D%20(%3C%3C%2041549009%20OR%20%3C%3C%2033252009%20OR%20%3C%3C%2045518007%20OR%20%3C%3C%2096308008%20OR%20%3C%3C%2048698004%20)%20%7D%20))%20OR%20(((%20%3C%3C%5E929360071000036103%20AND%20(%3C%3C%2041549009%20OR%20%3C%3C%2033252009%20OR%20%3C%3C%2045518007%20OR%20%3C%3C%2096308008%20OR%20%3C%3C%2048698004%20)%20)%20OR%20(%3C%3C%5E%20929360081000036101%20%3A%20%7B%20774160008%20%3D%20(%3C%3C%2041549009%20OR%20%3C%3C%2033252009%20OR%20%3C%3C%2045518007%20OR%20%3C%3C%2096308008%20OR%20%3C%3C%2048698004%20)%20%7D%20)).774158006%20))')).exists()"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "memberOfBpLoweringMedicationContained"
    * language = #text/fhirpath
    * expression = "%medicationRequestArray.where(authoredOn > (now() - 12 months)).contained.where(resourceType = 'Medication' and id in (%medicationRequestArray.medication.select(reference.replace('#', '')))).where(code.memberOf('http://snomed.info/sct/32506021000036107?fhir_vs=ecl/(((%20%5E929360061000036106%20AND%20(%3C%3C%2041549009%20OR%20%3C%3C%2033252009%20OR%20%3C%3C%2045518007%20OR%20%3C%3C%2096308008%20OR%20%3C%3C%2048698004%20)%20)%20OR%20(%20%3C%3C%5E929360071000036103%20AND%20(%3C%3C%2041549009%20OR%20%3C%3C%2033252009%20OR%20%3C%3C%2045518007%20OR%20%3C%3C%2096308008%20OR%20%3C%3C%2048698004%20)%20)%20OR%20(%3C%3C%5E%20929360081000036101%20%3A%20%7B%20774160008%20%3D%20(%3C%3C%2041549009%20OR%20%3C%3C%2033252009%20OR%20%3C%3C%2045518007%20OR%20%3C%3C%2096308008%20OR%20%3C%3C%2048698004%20)%20%7D%20))%20OR%20(((%20%3C%3C%5E929360071000036103%20AND%20(%3C%3C%2041549009%20OR%20%3C%3C%2033252009%20OR%20%3C%3C%2045518007%20OR%20%3C%3C%2096308008%20OR%20%3C%3C%2048698004%20)%20)%20OR%20(%3C%3C%5E%20929360081000036101%20%3A%20%7B%20774160008%20%3D%20(%3C%3C%2041549009%20OR%20%3C%3C%2033252009%20OR%20%3C%3C%2045518007%20OR%20%3C%3C%2096308008%20OR%20%3C%3C%2048698004%20)%20%7D%20)).774158006%20))')).exists()"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "memberOfLipidModifyingMedicationReqMedication"
    * language = #text/fhirpath
    * expression = "%medicationRequestArray.where(medication.memberOf('http://snomed.info/sct/32506021000036107?fhir_vs=ecl/(((%20%5E929360061000036106%20AND%20(%3C%3C%20108600003%20OR%20%3C%3C%2096307003%20OR%20%3C%3C%2096305006%20OR%20%3C%3C%2096304005%20OR%20%3C%3C%20319982006%20OR%20%3C%3C%20319937007%20OR%20%3C%3C%2072824008%20OR%20%3C%3C%2077035009%20OR%20%3C%3C%2066971004%20OR%20%3C%3C%20408041006%20OR%20%3C%3C%2035282000%20OR%20%3C%3C%2063639004%20)%20)%20OR%20(%20%3C%3C%5E929360071000036103%20AND%20(%3C%3C%20108600003%20OR%20%3C%3C%2096307003%20OR%20%3C%3C%2096305006%20OR%20%3C%3C%2096304005%20OR%20%3C%3C%20319982006%20OR%20%3C%3C%20319937007%20OR%20%3C%3C%2072824008%20OR%20%3C%3C%2077035009%20OR%20%3C%3C%2066971004%20OR%20%3C%3C%20408041006%20OR%20%3C%3C%2035282000%20OR%20%3C%3C%2063639004%20)%20)%20OR%20(%3C%3C%5E%20929360081000036101%20%3A%20%7B%20774160008%20%3D%20(%3C%3C%20108600003%20OR%20%3C%3C%2096307003%20OR%20%3C%3C%2096305006%20OR%20%3C%3C%2096304005%20OR%20%3C%3C%20319982006%20OR%20%3C%3C%20319937007%20OR%20%3C%3C%2072824008%20OR%20%3C%3C%2077035009%20OR%20%3C%3C%2066971004%20OR%20%3C%3C%20408041006%20OR%20%3C%3C%2035282000%20OR%20%3C%3C%2063639004%20)%20%7D%20))%20OR%20(((%20%3C%3C%5E929360071000036103%20AND%20(%3C%3C%20108600003%20OR%20%3C%3C%2096307003%20OR%20%3C%3C%2096305006%20OR%20%3C%3C%2096304005%20OR%20%3C%3C%20319982006%20OR%20%3C%3C%20319937007%20OR%20%3C%3C%2072824008%20OR%20%3C%3C%2077035009%20OR%20%3C%3C%2066971004%20OR%20%3C%3C%20408041006%20OR%20%3C%3C%2035282000%20OR%20%3C%3C%2063639004%20)%20)%20OR%20(%3C%3C%5E%20929360081000036101%20%3A%20%7B%20774160008%20%3D%20(%3C%3C%20108600003%20OR%20%3C%3C%2096307003%20OR%20%3C%3C%2096305006%20OR%20%3C%3C%2096304005%20OR%20%3C%3C%20319982006%20OR%20%3C%3C%20319937007%20OR%20%3C%3C%2072824008%20OR%20%3C%3C%2077035009%20OR%20%3C%3C%2066971004%20OR%20%3C%3C%20408041006%20OR%20%3C%3C%2035282000%20OR%20%3C%3C%2063639004%20)%20%7D%20)).774158006%20))')).where(authoredOn > (now() - 12 months)).exists()"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "memberOfLipidModifyingMedicationCode"
    * language = #text/fhirpath
    * expression = "%medicationRequestArray.where(resourceType = 'Medication' and id in %medicationRequestArray.where(authoredOn > (now() - 12 months)).medicationReference.select(reference.replace('Medication/', ''))).where(code.memberOf('http://snomed.info/sct/32506021000036107?fhir_vs=ecl/(((%20%5E929360061000036106%20AND%20(%3C%3C%20108600003%20OR%20%3C%3C%2096307003%20OR%20%3C%3C%2096305006%20OR%20%3C%3C%2096304005%20OR%20%3C%3C%20319982006%20OR%20%3C%3C%20319937007%20OR%20%3C%3C%2072824008%20OR%20%3C%3C%2077035009%20OR%20%3C%3C%2066971004%20OR%20%3C%3C%20408041006%20OR%20%3C%3C%2035282000%20OR%20%3C%3C%2063639004%20)%20)%20OR%20(%20%3C%3C%5E929360071000036103%20AND%20(%3C%3C%20108600003%20OR%20%3C%3C%2096307003%20OR%20%3C%3C%2096305006%20OR%20%3C%3C%2096304005%20OR%20%3C%3C%20319982006%20OR%20%3C%3C%20319937007%20OR%20%3C%3C%2072824008%20OR%20%3C%3C%2077035009%20OR%20%3C%3C%2066971004%20OR%20%3C%3C%20408041006%20OR%20%3C%3C%2035282000%20OR%20%3C%3C%2063639004%20)%20)%20OR%20(%3C%3C%5E%20929360081000036101%20%3A%20%7B%20774160008%20%3D%20(%3C%3C%20108600003%20OR%20%3C%3C%2096307003%20OR%20%3C%3C%2096305006%20OR%20%3C%3C%2096304005%20OR%20%3C%3C%20319982006%20OR%20%3C%3C%20319937007%20OR%20%3C%3C%2072824008%20OR%20%3C%3C%2077035009%20OR%20%3C%3C%2066971004%20OR%20%3C%3C%20408041006%20OR%20%3C%3C%2035282000%20OR%20%3C%3C%2063639004%20)%20%7D%20))%20OR%20(((%20%3C%3C%5E929360071000036103%20AND%20(%3C%3C%20108600003%20OR%20%3C%3C%2096307003%20OR%20%3C%3C%2096305006%20OR%20%3C%3C%2096304005%20OR%20%3C%3C%20319982006%20OR%20%3C%3C%20319937007%20OR%20%3C%3C%2072824008%20OR%20%3C%3C%2077035009%20OR%20%3C%3C%2066971004%20OR%20%3C%3C%20408041006%20OR%20%3C%3C%2035282000%20OR%20%3C%3C%2063639004%20)%20)%20OR%20(%3C%3C%5E%20929360081000036101%20%3A%20%7B%20774160008%20%3D%20(%3C%3C%20108600003%20OR%20%3C%3C%2096307003%20OR%20%3C%3C%2096305006%20OR%20%3C%3C%2096304005%20OR%20%3C%3C%20319982006%20OR%20%3C%3C%20319937007%20OR%20%3C%3C%2072824008%20OR%20%3C%3C%2077035009%20OR%20%3C%3C%2066971004%20OR%20%3C%3C%20408041006%20OR%20%3C%3C%2035282000%20OR%20%3C%3C%2063639004%20)%20%7D%20)).774158006%20))')).exists()"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "memberOfLipidModifyingMedicationContained"
    * language = #text/fhirpath
    * expression = "%medicationRequestArray.where(authoredOn > (now() - 12 months)).contained.where(resourceType = 'Medication' and id in (%medicationRequestArray.medication.select(reference.replace('#', '')))).where(code.memberOf('http://snomed.info/sct/32506021000036107?fhir_vs=ecl/(((%20%5E929360061000036106%20AND%20(%3C%3C%20108600003%20OR%20%3C%3C%2096307003%20OR%20%3C%3C%2096305006%20OR%20%3C%3C%2096304005%20OR%20%3C%3C%20319982006%20OR%20%3C%3C%20319937007%20OR%20%3C%3C%2072824008%20OR%20%3C%3C%2077035009%20OR%20%3C%3C%2066971004%20OR%20%3C%3C%20408041006%20OR%20%3C%3C%2035282000%20OR%20%3C%3C%2063639004%20)%20)%20OR%20(%20%3C%3C%5E929360071000036103%20AND%20(%3C%3C%20108600003%20OR%20%3C%3C%2096307003%20OR%20%3C%3C%2096305006%20OR%20%3C%3C%2096304005%20OR%20%3C%3C%20319982006%20OR%20%3C%3C%20319937007%20OR%20%3C%3C%2072824008%20OR%20%3C%3C%2077035009%20OR%20%3C%3C%2066971004%20OR%20%3C%3C%20408041006%20OR%20%3C%3C%2035282000%20OR%20%3C%3C%2063639004%20)%20)%20OR%20(%3C%3C%5E%20929360081000036101%20%3A%20%7B%20774160008%20%3D%20(%3C%3C%20108600003%20OR%20%3C%3C%2096307003%20OR%20%3C%3C%2096305006%20OR%20%3C%3C%2096304005%20OR%20%3C%3C%20319982006%20OR%20%3C%3C%20319937007%20OR%20%3C%3C%2072824008%20OR%20%3C%3C%2077035009%20OR%20%3C%3C%2066971004%20OR%20%3C%3C%20408041006%20OR%20%3C%3C%2035282000%20OR%20%3C%3C%2063639004%20)%20%7D%20))%20OR%20(((%20%3C%3C%5E929360071000036103%20AND%20(%3C%3C%20108600003%20OR%20%3C%3C%2096307003%20OR%20%3C%3C%2096305006%20OR%20%3C%3C%2096304005%20OR%20%3C%3C%20319982006%20OR%20%3C%3C%20319937007%20OR%20%3C%3C%2072824008%20OR%20%3C%3C%2077035009%20OR%20%3C%3C%2066971004%20OR%20%3C%3C%20408041006%20OR%20%3C%3C%2035282000%20OR%20%3C%3C%2063639004%20)%20)%20OR%20(%3C%3C%5E%20929360081000036101%20%3A%20%7B%20774160008%20%3D%20(%3C%3C%20108600003%20OR%20%3C%3C%2096307003%20OR%20%3C%3C%2096305006%20OR%20%3C%3C%2096304005%20OR%20%3C%3C%20319982006%20OR%20%3C%3C%20319937007%20OR%20%3C%3C%2072824008%20OR%20%3C%3C%2077035009%20OR%20%3C%3C%2066971004%20OR%20%3C%3C%20408041006%20OR%20%3C%3C%2035282000%20OR%20%3C%3C%2063639004%20)%20%7D%20)).774158006%20))')).exists()"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "memberOfAntithromboticMedicationReqMedication"
    * language = #text/fhirpath
    * expression = "%medicationRequestArray.where(medication.memberOf('http://snomed.info/sct/32506021000036107?fhir_vs=ecl/(((%20%5E929360061000036106%20AND%20(%3C%3C%207947003%20OR%20108979001%20OR%20%3C%3C%2066859009%20OR%20%3C%3C%20443312008%20OR%20%3C%3C%20704464003%20OR%20%3C%3C%20108971003%20OR%20%3C%3C%2048603004%20OR%20%3C%3C%20714788005%20OR%20%3C%3C%2047527007%20OR%20%3C%3C%20442539005%20OR%20%3C%3C%20703906002%20)%20)%20OR%20(%20%3C%3C%5E929360071000036103%20AND%20(%3C%3C%207947003%20OR%20108979001%20OR%20%3C%3C%2066859009%20OR%20%3C%3C%20443312008%20OR%20%3C%3C%20704464003%20OR%20%3C%3C%20108971003%20OR%20%3C%3C%2048603004%20OR%20%3C%3C%20714788005%20OR%20%3C%3C%2047527007%20OR%20%3C%3C%20442539005%20OR%20%3C%3C%20703906002%20)%20)%20OR%20(%3C%3C%5E%20929360081000036101%20%3A%20%7B%20774160008%20%3D%20(%3C%3C%207947003%20OR%20108979001%20OR%20%3C%3C%2066859009%20OR%20%3C%3C%20443312008%20OR%20%3C%3C%20704464003%20OR%20%3C%3C%20108971003%20OR%20%3C%3C%2048603004%20OR%20%3C%3C%20714788005%20OR%20%3C%3C%2047527007%20OR%20%3C%3C%20442539005%20OR%20%3C%3C%20703906002%20)%20%7D%20))%20OR%20(((%20%3C%3C%5E929360071000036103%20AND%20(%3C%3C%207947003%20OR%20108979001%20OR%20%3C%3C%2066859009%20OR%20%3C%3C%20443312008%20OR%20%3C%3C%20704464003%20OR%20%3C%3C%20108971003%20OR%20%3C%3C%2048603004%20OR%20%3C%3C%20714788005%20OR%20%3C%3C%2047527007%20OR%20%3C%3C%20442539005%20OR%20%3C%3C%20703906002%20)%20)%20OR%20(%3C%3C%5E%20929360081000036101%20%3A%20%7B%20774160008%20%3D%20(%3C%3C%207947003%20OR%20108979001%20OR%20%3C%3C%2066859009%20OR%20%3C%3C%20443312008%20OR%20%3C%3C%20704464003%20OR%20%3C%3C%20108971003%20OR%20%3C%3C%2048603004%20OR%20%3C%3C%20714788005%20OR%20%3C%3C%2047527007%20OR%20%3C%3C%20442539005%20OR%20%3C%3C%20703906002%20)%20%7D%20)).774158006%20))')).where(authoredOn > (now() - 12 months)).exists()"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "memberOfAntithromboticMedicationCode"
    * language = #text/fhirpath
    * expression = "%medicationRequestArray.where(resourceType = 'Medication' and id in %medicationRequestArray.where(authoredOn > (now() - 12 months)).medicationReference.select(reference.replace('Medication/', ''))).where(code.memberOf('http://snomed.info/sct/32506021000036107?fhir_vs=ecl/(((%20%5E929360061000036106%20AND%20(%3C%3C%207947003%20OR%20108979001%20OR%20%3C%3C%2066859009%20OR%20%3C%3C%20443312008%20OR%20%3C%3C%20704464003%20OR%20%3C%3C%20108971003%20OR%20%3C%3C%2048603004%20OR%20%3C%3C%20714788005%20OR%20%3C%3C%2047527007%20OR%20%3C%3C%20442539005%20OR%20%3C%3C%20703906002%20)%20)%20OR%20(%20%3C%3C%5E929360071000036103%20AND%20(%3C%3C%207947003%20OR%20108979001%20OR%20%3C%3C%2066859009%20OR%20%3C%3C%20443312008%20OR%20%3C%3C%20704464003%20OR%20%3C%3C%20108971003%20OR%20%3C%3C%2048603004%20OR%20%3C%3C%20714788005%20OR%20%3C%3C%2047527007%20OR%20%3C%3C%20442539005%20OR%20%3C%3C%20703906002%20)%20)%20OR%20(%3C%3C%5E%20929360081000036101%20%3A%20%7B%20774160008%20%3D%20(%3C%3C%207947003%20OR%20108979001%20OR%20%3C%3C%2066859009%20OR%20%3C%3C%20443312008%20OR%20%3C%3C%20704464003%20OR%20%3C%3C%20108971003%20OR%20%3C%3C%2048603004%20OR%20%3C%3C%20714788005%20OR%20%3C%3C%2047527007%20OR%20%3C%3C%20442539005%20OR%20%3C%3C%20703906002%20)%20%7D%20))%20OR%20(((%20%3C%3C%5E929360071000036103%20AND%20(%3C%3C%207947003%20OR%20108979001%20OR%20%3C%3C%2066859009%20OR%20%3C%3C%20443312008%20OR%20%3C%3C%20704464003%20OR%20%3C%3C%20108971003%20OR%20%3C%3C%2048603004%20OR%20%3C%3C%20714788005%20OR%20%3C%3C%2047527007%20OR%20%3C%3C%20442539005%20OR%20%3C%3C%20703906002%20)%20)%20OR%20(%3C%3C%5E%20929360081000036101%20%3A%20%7B%20774160008%20%3D%20(%3C%3C%207947003%20OR%20108979001%20OR%20%3C%3C%2066859009%20OR%20%3C%3C%20443312008%20OR%20%3C%3C%20704464003%20OR%20%3C%3C%20108971003%20OR%20%3C%3C%2048603004%20OR%20%3C%3C%20714788005%20OR%20%3C%3C%2047527007%20OR%20%3C%3C%20442539005%20OR%20%3C%3C%20703906002%20)%20%7D%20)).774158006%20))')).exists()"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "memberOfAntithromboticMedicationContained"
    * language = #text/fhirpath
    * expression = "%medicationRequestArray.where(authoredOn > (now() - 12 months)).contained.where(resourceType = 'Medication' and id in (%medicationRequestArray.medication.select(reference.replace('#', '')))).where(code.memberOf('http://snomed.info/sct/32506021000036107?fhir_vs=ecl/(((%20%5E929360061000036106%20AND%20(%3C%3C%207947003%20OR%20108979001%20OR%20%3C%3C%2066859009%20OR%20%3C%3C%20443312008%20OR%20%3C%3C%20704464003%20OR%20%3C%3C%20108971003%20OR%20%3C%3C%2048603004%20OR%20%3C%3C%20714788005%20OR%20%3C%3C%2047527007%20OR%20%3C%3C%20442539005%20OR%20%3C%3C%20703906002%20)%20)%20OR%20(%20%3C%3C%5E929360071000036103%20AND%20(%3C%3C%207947003%20OR%20108979001%20OR%20%3C%3C%2066859009%20OR%20%3C%3C%20443312008%20OR%20%3C%3C%20704464003%20OR%20%3C%3C%20108971003%20OR%20%3C%3C%2048603004%20OR%20%3C%3C%20714788005%20OR%20%3C%3C%2047527007%20OR%20%3C%3C%20442539005%20OR%20%3C%3C%20703906002%20)%20)%20OR%20(%3C%3C%5E%20929360081000036101%20%3A%20%7B%20774160008%20%3D%20(%3C%3C%207947003%20OR%20108979001%20OR%20%3C%3C%2066859009%20OR%20%3C%3C%20443312008%20OR%20%3C%3C%20704464003%20OR%20%3C%3C%20108971003%20OR%20%3C%3C%2048603004%20OR%20%3C%3C%20714788005%20OR%20%3C%3C%2047527007%20OR%20%3C%3C%20442539005%20OR%20%3C%3C%20703906002%20)%20%7D%20))%20OR%20(((%20%3C%3C%5E929360071000036103%20AND%20(%3C%3C%207947003%20OR%20108979001%20OR%20%3C%3C%2066859009%20OR%20%3C%3C%20443312008%20OR%20%3C%3C%20704464003%20OR%20%3C%3C%20108971003%20OR%20%3C%3C%2048603004%20OR%20%3C%3C%20714788005%20OR%20%3C%3C%2047527007%20OR%20%3C%3C%20442539005%20OR%20%3C%3C%20703906002%20)%20)%20OR%20(%3C%3C%5E%20929360081000036101%20%3A%20%7B%20774160008%20%3D%20(%3C%3C%207947003%20OR%20108979001%20OR%20%3C%3C%2066859009%20OR%20%3C%3C%20443312008%20OR%20%3C%3C%20704464003%20OR%20%3C%3C%20108971003%20OR%20%3C%3C%2048603004%20OR%20%3C%3C%20714788005%20OR%20%3C%3C%2047527007%20OR%20%3C%3C%20442539005%20OR%20%3C%3C%20703906002%20)%20%7D%20)).774158006%20))')).exists()"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "memberOfInsulinMedicationReqMedication"
    * language = #text/fhirpath
    * expression = "%medicationRequestArray.where(medication.memberOf('http://snomed.info/sct/32506021000036107?fhir_vs=ecl/(%3C%3C39487003%20OR%20(%3C%20781405001%20%3A%20774160008%20%3D%20%3C%3C%2039487003%20))')).where(authoredOn > (now() - 12 months)).exists()"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "memberOfInsulinMedicationCode"
    * language = #text/fhirpath
    * expression = "%medicationRequestArray.where(resourceType = 'Medication' and id in %medicationRequestArray.where(authoredOn > (now() - 12 months)).medicationReference.select(reference.replace('Medication/', ''))).where(medication.memberOf('http://snomed.info/sct/32506021000036107?fhir_vs=ecl/(%3C%3C39487003%20OR%20(%3C%20781405001%20%3A%20774160008%20%3D%20%3C%3C%2039487003%20))')).exists()"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "memberOfInsulinMedicationContained"
    * language = #text/fhirpath
    * expression = "%medicationRequestArray.where(authoredOn > (now() - 12 months)).contained.where(resourceType = 'Medication' and id in (%medicationRequestArray.medication.select(reference.replace('#', '')))).where(code.memberOf('http://snomed.info/sct/32506021000036107?fhir_vs=ecl/(%3C%3C39487003%20OR%20(%3C%20781405001%20%3A%20774160008%20%3D%20%3C%3C%2039487003%20))')).exists()"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "memberOfDiabetesResourceArray"
    * language = #text/fhirpath
    * expression = "%conditionArray.where(code.memberOf('http://snomed.info/sct/32506021000036107?fhir_vs=ecl/(%3C%3C44054006)'))"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "totalHDLRatioPrePop"
    * language = #text/fhirpath
    * expression = "iif(%obsTotalCholesterol.where(resource.effective > (now() - 5 years)).exists() and %obsHDLCholesterol.where(resource.effective > (now() - 5 years)).exists(), (%obsTotalCholesterol.value.value/%obsHDLCholesterol.value.value).round(2), %obsTotalCholHDLRatio.where(effective > (now() - 5 years)).value.value.round(2))"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "totalHDLRatioPrePopExists"
    * language = #text/fhirpath
    * expression = "%totalHDLRatioPrePop.exists()"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "diabetesYearsIntegerPrePop"
    * language = #text/fhirpath
    * expression = "today().toString().substring(0,4).toInteger() - %memberOfDiabetesResourceArray[0].onset.toString().substring(0,4).toInteger()"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "hba1cMmolDecimalPrepop"
    * language = #text/fhirpath
    * expression = "%obsHbA1C.where(effective > (now() - 12 months)).value.value"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "uacrDecimalPrepop"
    * language = #text/fhirpath
    * expression = "%obsuACR.where(effective > (now() - 18 months)).value.value"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "egfrDecimalPrepop"
    * language = #text/fhirpath
    * expression = "%obseGFR.where(effective > (now() - 12 months)).value.value"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "bmiWeightDecimalPrepop"
    * language = #text/fhirpath
    * expression = "%obsBodyWeight.where(effective > (now() - 12 months)).value.value"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "bmiHeightDecimalPrepop"
    * language = #text/fhirpath
    * expression = "%obsBodyHeight.where(effective > (%patient.birthDate + 18 years)).value.value/100"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "insulinUseBooleanPrepop"
    * language = #text/fhirpath
    * expression = "%memberOfInsulinMedicationReqMedication or %memberOfInsulinMedicationCode or %memberOfInsulinMedicationContained or {}"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "chronicKidneyDiseaseValue"
    * language = #text/fhirpath
    * expression = "%resource.descendants().item.where(linkId='moderate-severe-chronic-kidney-disease-boolean').answer.value"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "hypercholesterolaemiaValue"
    * language = #text/fhirpath
    * expression = "%resource.descendants().item.where(linkId='familial-hypercholesterolaemia-boolean').answer.value"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "automaticHighRiskVar"
    * language = #text/fhirpath
    * expression = "iif(%chronicKidneyDiseaseValue.exists() or %hypercholesterolaemiaValue.exists(), %chronicKidneyDiseaseValue or %hypercholesterolaemiaValue, false)"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "sexValue"
    * language = #text/fhirpath
    * expression = "%resource.descendants().item.where(linkId='56ef44bb-3d1d-4972-aad1-834b69185d61').answer.value.code"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "sexVar"
    * language = #text/fhirpath
    * expression = "iif(%sexValue.exists(), %sexValue, '248152002')"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "ageValue"
    * language = #text/fhirpath
    * expression = "%resource.descendants().item.where(linkId='age-integer').answer.value"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "ageVar"
    * language = #text/fhirpath
    * expression = "iif(%ageValue.exists(), %ageValue, 30)"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "generalAgeEquationFemale"
    * language = #text/fhirpath
    * expression = "0.0905192 * (%ageVar - 58.47472)"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "generalAgeEquationMale"
    * language = #text/fhirpath
    * expression = "0.0691512 * (%ageVar - 53.77579)"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "diabetesAgeEquationFemale"
    * language = #text/fhirpath
    * expression = "0.0607418 * (%ageVar - 57.8318)"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "diabetesAgeEquationMale"
    * language = #text/fhirpath
    * expression = "0.0510591 * (%ageVar - 56.57672)"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "seifaValue"
    * language = #text/fhirpath
    * expression = "%resource.descendants().item.where(linkId='seifa-integer').answer.value"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "nzDepValue"
    * language = #text/fhirpath
    * description = "NZDep = (N + 1) − SeifaQuintile"
    * expression = "iif(%seifaValue != 2.6, 6 - %seifaValue, 2.6)"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "nzDepVar"
    * language = #text/fhirpath
    * expression = "iif(%nzDepValue.exists(), %nzDepValue, 2.6)"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "generalNZDepEquationFemale"
    * language = #text/fhirpath
    * expression = "0.0978413 * (%nzDepVar - 2.625575)"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "generalNZDepEquationMale"
    * language = #text/fhirpath
    * expression = "0.0900502 * (%nzDepVar - 2.628206)"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "diabetesNZDepEquationFemale"
    * language = #text/fhirpath
    * expression = "0.1111981 * (%nzDepVar - 3.033218)"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "diabetesNZDepEquationMale"
    * language = #text/fhirpath
    * expression = "0.0931026 * (%nzDepVar - 2.906154)"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "smokingStatusValue"
    * language = #text/fhirpath
    * expression = "%resource.descendants().item.where(linkId='b639a3a8-f476-4cc8-b5c7-f5d2abb23511').answer.value.code"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "smokingStatusVar"
    * language = #text/fhirpath
    * expression = "iif(%smokingStatusValue.exists(), %smokingStatusValue, '266919005')"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "generalSmokingStatusEquationFemale"
    * language = #text/fhirpath
    * expression = "iif(%smokingStatusVar = '266919005', 0, iif(%smokingStatusVar = '8517006', 0.1162342, iif(%smokingStatusVar = '77176002', 0.8235061, 0)))"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "generalSmokingStatusEquationMale"
    * language = #text/fhirpath
    * expression = "iif(%smokingStatusVar = '266919005', 0, iif(%smokingStatusVar = '8517006', 0.0635803, iif(%smokingStatusVar = '77176002', 0.5782258, 0)))"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "diabetesSmokingStatusEquationFemale"
    * language = #text/fhirpath
    * expression = "iif(%smokingStatusVar = '266919005', 0, iif(%smokingStatusVar = '8517006', 0, iif(%smokingStatusVar = '77176002', 0.7319247, 0)))"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "diabetesSmokingStatusEquationMale"
    * language = #text/fhirpath
    * expression = "iif(%smokingStatusVar = '266919005', 0, iif(%smokingStatusVar = '8517006', 0, iif(%smokingStatusVar = '77176002', 0.318424, 0)))"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "atrialFibrillationValue"
    * language = #text/fhirpath
    * expression = "%resource.descendants().item.where(linkId='history-atrial-fibrillation-boolean').answer.value"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "atrialFibrillationVar"
    * language = #text/fhirpath
    * expression = "iif(%atrialFibrillationValue.exists(), %atrialFibrillationValue, false)"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "generalAtrialFibrillationEquationFemale"
    * language = #text/fhirpath
    * expression = "iif(%atrialFibrillationVar = true, 0.709571, 0)"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "generalAtrialFibrillationEquationMale"
    * language = #text/fhirpath
    * expression = "iif(%atrialFibrillationVar = true, 0.474629, 0)"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "diabetesAtrialFibrillationEquationFemale"
    * language = #text/fhirpath
    * expression = "iif(%atrialFibrillationVar = true, 0.4150528, 0)"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "diabetesAtrialFibrillationEquationMale"
    * language = #text/fhirpath
    * expression = "iif(%atrialFibrillationVar = true, 0.3149766, 0)"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "diabetesValue"
    * language = #text/fhirpath
    * expression = "%resource.descendants().item.where(linkId='diabetes-boolean').answer.value"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "diabetesVar"
    * language = #text/fhirpath
    * expression = "iif(%diabetesValue.exists(), %diabetesValue, false)"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "generalDiabetesEquationFemale"
    * language = #text/fhirpath
    * expression = "iif(%diabetesVar = true, 0.6207569, 0)"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "generalDiabetesEquationMale"
    * language = #text/fhirpath
    * expression = "iif(%diabetesVar = true, 0.5829839, 0)"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "yearsSinceT2DValue"
    * language = #text/fhirpath
    * expression = "%resource.descendants().item.where(linkId='diabetes-years-integer').answer.value"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "yearsSinceT2DVar"
    * language = #text/fhirpath
    * expression = "iif(%yearsSinceT2DValue.exists(), %yearsSinceT2DValue, 0)"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "diabetesYearsSinceT2DEquationFemale"
    * language = #text/fhirpath
    * expression = "0.011011 * (%yearsSinceT2DVar - 5.222868)"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "diabetesYearsSinceT2DEquationMale"
    * language = #text/fhirpath
    * expression = "0.0117042 * (%yearsSinceT2DVar - 5.255285)"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "sbpValue"
    * language = #text/fhirpath
    * expression = "%resource.descendants().item.where(linkId='sbp-decimal').answer.value"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "sbpVar"
    * language = #text/fhirpath
    * expression = "iif(%sbpValue.exists(), %sbpValue, 75)"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "generalSBPEquationFemale"
    * language = #text/fhirpath
    * expression = "0.0114172 * (%sbpVar - 129.2052)"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "generalSBPEquationMale"
    * language = #text/fhirpath
    * expression = "0.0139242 * (%sbpVar - 129.1706)"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "diabetesSBPEquationFemale"
    * language = #text/fhirpath
    * expression = "0.0084873 * (%sbpVar - 132.2317)"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "diabetesSBPEquationMale"
    * language = #text/fhirpath
    * expression = "0.004488 * (%sbpVar - 131.8995)"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "totalHDLRatioValue"
    * language = #text/fhirpath
    * expression = "%resource.descendants().item.where(linkId='total-hdl-ratio-decimal').answer.value"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "totalCholValue"
    * language = #text/fhirpath
    * expression = "%resource.descendants().item.where(linkId='total-chol-decimal').answer.value"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "hdlCholValue"
    * language = #text/fhirpath
    * expression = "%resource.descendants().item.where(linkId='hdl-chol-decimal').answer.value"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "totalHDLRatioVar"
    * language = #text/fhirpath
    * expression = "iif(%totalHDLRatioValue.exists(), %totalHDLRatioValue, iif(%totalCholValue.exists() and %hdlCholValue.exists(), (%totalCholValue/%hdlCholValue).round(2), 1.08))"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "generalTotalHDLRatioEquationFemale"
    * language = #text/fhirpath
    * expression = "0.1067098 * (%totalHDLRatioVar - 3.641988)"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "generalTotalHDLRatioEquationMale"
    * language = #text/fhirpath
    * expression = "0.1350063 * (%totalHDLRatioVar - 4.325589)"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "diabetesTotalHDLRatioEquationFemale"
    * language = #text/fhirpath
    * expression = "0.1025064 * (%totalHDLRatioVar - 3.882821)"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "diabetesTotalHDLRatioEquationMale"
    * language = #text/fhirpath
    * expression = "0.0858267 * (%totalHDLRatioVar - 4.267316)"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "weightValue"
    * language = #text/fhirpath
    * expression = "%resource.descendants().item.where(linkId='bmi-weight-decimal').answer.value"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "heightValue"
    * language = #text/fhirpath
    * expression = "%resource.descendants().item.where(linkId='bmi-height-decimal').answer.value"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "bmiValue"
    * language = #text/fhirpath
    * expression = "(%weightValue/(%heightValue.power(2))).round(1)"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "bmiVar"
    * language = #text/fhirpath
    * expression = "iif(%bmiValue.exists(), %bmiValue, 18.5)"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "generalBmiEquation"
    * language = #text/fhirpath
    * expression = "0"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "diabetesBmiEquationFemale"
    * language = #text/fhirpath
    * expression = "0.0112387 * (%bmiVar - 30.33892)"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "diabetesBmiEquationMale"
    * language = #text/fhirpath
    * expression = "0.0156861 * (%bmiVar - 29.21475)"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "eGFRDecimalValue"
    * language = #text/fhirpath
    * expression = "%resource.descendants().item.where(linkId='egfr-decimal').answer.value"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "eGFR90BooleanEnabled"
    * language = #text/fhirpath
    * expression = "%resource.descendants().item.where(linkId='egfr-90-boolean').answer.value"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "eGFRValue"
    * language = #text/fhirpath
    * expression = "iif(%eGFR90BooleanEnabled = true, 100, %eGFRDecimalValue)"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "eGFRVar"
    * language = #text/fhirpath
    * expression = "iif(%eGFRValue.exists(), %eGFRValue, 100)"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "diabetesEGFREquationFemale"
    * language = #text/fhirpath
    * expression = "-0.0082137 * (%eGFRVar - 88.38233)"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "diabetesEGFREquationMale"
    * language = #text/fhirpath
    * expression = "-0.002239 * (%eGFRVar - 88.15267)"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "hbA1cMmolValue"
    * language = #text/fhirpath
    * expression = "%resource.descendants().item.where(linkId='hba1c-mmol-decimal').answer.value"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "hbA1cPercentageValue"
    * language = #text/fhirpath
    * expression = "%resource.descendants().item.where(linkId='hba1c-percentage-decimal').answer.value"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "hbA1cPercentageConvertedToMmol"
    * language = #text/fhirpath
    * expression = "10.93 * %hbA1cPercentageValue - 23.5"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "hbA1cValue"
    * language = #text/fhirpath
    * expression = "iif(%hbA1cMmolValue.exists(), %hbA1cMmolValue, iif(%hbA1cPercentageConvertedToMmol.exists(), hbA1cPercentageConvertedToMmol , {}))"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "hbA1cVar"
    * language = #text/fhirpath
    * expression = "iif(%hbA1cValue.exists(), %hbA1cValue, 39)"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "diabetesHbA1cEquationFemale"
    * language = #text/fhirpath
    * expression = "0.0109019 * (%hbA1cVar - 56.06538)"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "diabetesHbA1cEquationMale"
    * language = #text/fhirpath
    * expression = "0.0065082 * (%hbA1cVar - 57.84909)"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "uACRValue"
    * language = #text/fhirpath
    * expression = "%resource.descendants().item.where(linkId='uacr-decimal').answer.value"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "uACRVar"
    * language = #text/fhirpath
    * expression = "iif(%uACRValue.exists(), %uACRValue, 3)"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "diabetesUACREquationFemale"
    * language = #text/fhirpath
    * expression = "iif(%uACRVar >= 3 and %uACRVar <= 30, 0.2030524, iif(%uACRVar > 30, 0.7023991, 0))"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "diabetesUACREquationMale"
    * language = #text/fhirpath
    * expression = "iif(%uACRVar >= 3 and %uACRVar <= 30, 0.4277236, iif(%uACRVar > 30, 0.803022, 0))"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "insulinValue"
    * language = #text/fhirpath
    * expression = "%resource.descendants().item.where(linkId='insulin-use-boolean').answer.value"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "insulinVar"
    * language = #text/fhirpath
    * expression = "iif(%insulinValue.exists(), %insulinValue, false)"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "diabetesInsulinEquationFemale"
    * language = #text/fhirpath
    * expression = "iif(%insulinVar = true, 0.2966913, 0)"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "diabetesInsulinEquationMale"
    * language = #text/fhirpath
    * expression = "iif(%insulinVar = true, 0.3899748, 0)"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "oralDiabetesMedsValue"
    * language = #text/fhirpath
    * expression = "true"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "oralDiabetesMedsVar"
    * language = #text/fhirpath
    * expression = "iif(%oralDiabetesMedsValue.exists(), %oralDiabetesMedsValue, true)"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "diabetesOralDiabetesMedsEquationFemale"
    * language = #text/fhirpath
    * expression = "iif(%oralDiabetesMedsVar = true, 0.1594838, 0)"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "diabetesOralDiabetesMedsEquationMale"
    * language = #text/fhirpath
    * expression = "iif(%oralDiabetesMedsVar = true, 0.1316217, 0)"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "bpLoweringMedsValue"
    * language = #text/fhirpath
    * expression = "%resource.descendants().item.where(linkId='bp-lowering-meds-boolean').answer.value"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "bpLoweringMedsVar"
    * language = #text/fhirpath
    * expression = "iif(%bpLoweringMedsValue.exists(), %bpLoweringMedsValue, false)"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "generalBpLoweringMedsEquationFemale"
    * language = #text/fhirpath
    * expression = "iif(%bpLoweringMedsVar = true, 0.3092255, 0)"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "generalBpLoweringMedsEquationMale"
    * language = #text/fhirpath
    * expression = "iif(%bpLoweringMedsVar = true, 0.2676661, 0)"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "diabetesBpLoweringMedsEquationFemale"
    * language = #text/fhirpath
    * expression = "iif(%bpLoweringMedsVar = true, 0.1671067, 0)"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "diabetesBpLoweringMedsEquationMale"
    * language = #text/fhirpath
    * expression = "iif(%bpLoweringMedsVar = true, 0.1674871, 0)"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "lipidModifyingMedsValue"
    * language = #text/fhirpath
    * expression = "%resource.descendants().item.where(linkId='lipid-modifying-meds-boolean').answer.value"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "lipidModifyingMedsVar"
    * language = #text/fhirpath
    * expression = "iif(%lipidModifyingMedsValue.exists(), %lipidModifyingMedsValue, false)"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "generalLipidModifyingMedsEquationFemale"
    * language = #text/fhirpath
    * expression = "iif(%lipidModifyingMedsVar = true, -0.0863215, 0)"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "generalLipidModifyingMedsEquationMale"
    * language = #text/fhirpath
    * expression = "iif(%lipidModifyingMedsVar = true, -0.0383788, 0)"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "diabetesLipidModifyingMedsEquationFemale"
    * language = #text/fhirpath
    * expression = "iif(%lipidModifyingMedsVar = true, -0.2702909, 0)"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "diabetesLipidModifyingMedsEquationMale"
    * language = #text/fhirpath
    * expression = "iif(%lipidModifyingMedsVar = true, -0.0616832, 0)"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "antithromboticMedsValue"
    * language = #text/fhirpath
    * expression = "%resource.descendants().item.where(linkId='antithrombotic-meds-boolean').answer.value"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "antithromboticMedsVar"
    * language = #text/fhirpath
    * expression = "iif(%antithromboticMedsValue.exists(), %antithromboticMedsValue, false)"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "generalAntithromboticMedsEquationFemale"
    * language = #text/fhirpath
    * expression = "iif(%antithromboticMedsVar = true, 0.1622663, 0)"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "generalAntithromboticMedsEquationMale"
    * language = #text/fhirpath
    * expression = "iif(%antithromboticMedsVar = true, 0.0981934, 0)"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "diabetesAntithromboticMedsEquationFemale"
    * language = #text/fhirpath
    * expression = "iif(%antithromboticMedsVar, 0.1205109, 0)"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "diabetesAntithromboticMedsEquationMale"
    * language = #text/fhirpath
    * expression = "iif(%antithromboticMedsVar, 0.0273617, 0)"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "generalAgeXDiabetesEquationFemale"
    * language = #text/fhirpath
    * expression = "iif(%diabetesVar = true, -0.0230893 * (%ageVar - 58.47472), 0)"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "generalAgeXDiabetesEquationMale"
    * language = #text/fhirpath
    * expression = "iif(%diabetesVar = true, -0.018881 * (%ageVar - 53.77579), 0)"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "generalAgeXSBPEquationFemale"
    * language = #text/fhirpath
    * expression = "-0.0002353 * (%ageVar - 58.47472) * (%sbpVar - 129.2052)"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "generalAgeXSBPEquationMale"
    * language = #text/fhirpath
    * expression = "-0.0001952 * (%ageVar - 53.77579) * (%sbpVar - 129.1706)"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "generalAgeXBplMedsEquationFemale"
    * language = #text/fhirpath
    * expression = "iif(%bpLoweringMedsVar = true, -0.0066143 * (%sbpVar - 129.2052), 0)"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "generalAgeXBplMedsEquationMale"
    * language = #text/fhirpath
    * expression = "iif(%bpLoweringMedsVar = true, -0.0054419 * (%sbpVar - 129.1706), 0)"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "generalSumFemale"
    * language = #text/fhirpath
    * expression = "(%generalAgeEquationFemale + %generalNZDepEquationFemale + %generalSmokingStatusEquationFemale + %generalAtrialFibrillationEquationFemale + %generalDiabetesEquationFemale + %generalSBPEquationFemale + %generalTotalHDLRatioEquationFemale + %generalBmiEquation + %generalBpLoweringMedsEquationFemale + %generalLipidModifyingMedsEquationFemale + %generalAntithromboticMedsEquationFemale + %generalAgeXDiabetesEquationFemale + %generalAgeXSBPEquationFemale + %generalAgeXBplMedsEquationFemale)"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "generalSumMale"
    * language = #text/fhirpath
    * expression = "(%generalAgeEquationMale + %generalNZDepEquationMale + %generalSmokingStatusEquationMale + %generalAtrialFibrillationEquationMale + %generalDiabetesEquationMale + %generalSBPEquationMale + %generalTotalHDLRatioEquationMale + %generalBmiEquation + %generalBpLoweringMedsEquationMale + %generalLipidModifyingMedsEquationMale + %generalAntithromboticMedsEquationMale + %generalAgeXDiabetesEquationMale + %generalAgeXSBPEquationMale + %generalAgeXBplMedsEquationMale)"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "diabetesSumFemale"
    * language = #text/fhirpath
    * expression = "(%diabetesAgeEquationFemale + %diabetesNZDepEquationFemale + %diabetesSmokingStatusEquationFemale + %diabetesAtrialFibrillationEquationFemale + %diabetesYearsSinceT2DEquationFemale + %diabetesBmiEquationFemale + %diabetesSBPEquationFemale + %diabetesTotalHDLRatioEquationFemale + %diabetesEGFREquationFemale + %diabetesHbA1cEquationFemale + %diabetesUACREquationFemale + %diabetesInsulinEquationFemale + %diabetesOralDiabetesMedsEquationFemale + %diabetesBpLoweringMedsEquationFemale + %diabetesLipidModifyingMedsEquationFemale + %diabetesAntithromboticMedsEquationFemale)"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "diabetesSumMale"
    * language = #text/fhirpath
    * expression = "(%diabetesAgeEquationMale + %diabetesNZDepEquationMale + %diabetesSmokingStatusEquationMale + %diabetesAtrialFibrillationEquationMale + %diabetesYearsSinceT2DEquationMale + %diabetesBmiEquationMale + %diabetesSBPEquationMale + %diabetesTotalHDLRatioEquationMale + %diabetesEGFREquationMale + %diabetesHbA1cEquationMale + %diabetesUACREquationMale + %diabetesInsulinEquationMale + %diabetesOralDiabetesMedsEquationMale + %diabetesBpLoweringMedsEquationMale + %diabetesLipidModifyingMedsEquationMale + %diabetesAntithromboticMedsEquationMale)"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "generalCvdScoreFemale"
    * language = #text/fhirpath
    * expression = "(1 - (0.9828361).power(%generalSumFemale.exp())) * 100"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "generalCvdScoreMale"
    * language = #text/fhirpath
    * expression = "(1 - (0.9728782).power(%generalSumMale.exp())) * 100"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "diabetesCvdScoreFemale"
    * language = #text/fhirpath
    * expression = "(1 - (0.9664823).power(%diabetesSumFemale.exp())) * 100"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "diabetesCvdScoreMale"
    * language = #text/fhirpath
    * expression = "(1 - (0.9483001).power(%diabetesSumMale.exp())) * 100"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "ageBetween30and44"
    * language = #text/fhirpath
    * expression = "%ageVar >= 30 and %ageVar <= 44"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "ageBetween45and49"
    * language = #text/fhirpath
    * expression = "%ageVar >= 45 and %ageVar <= 49"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "ageBetween50and54"
    * language = #text/fhirpath
    * expression = "%ageVar >= 50 and %ageVar <= 54"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "ageBetween55and59"
    * language = #text/fhirpath
    * expression = "%ageVar >= 55 and %ageVar <= 59"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "ageBetween60and64"
    * language = #text/fhirpath
    * expression = "%ageVar >= 60 and %ageVar <= 64"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "ageBetween65and69"
    * language = #text/fhirpath
    * expression = "%ageVar >= 65 and %ageVar <= 69"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "ageBetween70and74"
    * language = #text/fhirpath
    * expression = "%ageVar >= 70 and %ageVar <= 74"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "ageBetween75and79"
    * language = #text/fhirpath
    * expression = "%ageVar >= 75 and %ageVar <= 79"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "recalibrationFactorFemale"
    * language = #text/fhirpath
    * expression = "iif(%ageBetween30and44=true, 1.3, iif(%ageBetween45and49=true, 1.2, iif(%ageBetween50and54=true, 1.2, iif(%ageBetween55and59=true, 1.0, iif(%ageBetween60and64=true, 0.9, iif(%ageBetween65and69=true, 0.8, iif(%ageBetween70and74=true, 0.7, iif(%ageBetween75and79=true, 0.7, 1))))))))"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "recalibrationFactorMale"
    * language = #text/fhirpath
    * expression = "iif(%ageBetween30and44=true, 1.1, iif(%ageBetween45and49=true, 1.1, iif(%ageBetween50and54=true, 1.1, iif(%ageBetween55and59=true, 1.0, iif(%ageBetween60and64=true, 0.9, iif(%ageBetween65and69=true, 0.8, iif(%ageBetween70and74=true, 0.8, iif(%ageBetween75and79=true, 0.8, 1))))))))"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "generalRecalibratedCvdScore"
    * language = #text/fhirpath
    * expression = "iif(%sexVar = '248152002', %generalCvdScoreFemale * %recalibrationFactorFemale, %generalCvdScoreMale * %recalibrationFactorMale)"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "diabetesRecalibratedCvdScore"
    * language = #text/fhirpath
    * expression = "iif(%sexVar = '248152002', %diabetesCvdScoreFemale * %recalibrationFactorFemale, %diabetesCvdScoreMale * %recalibrationFactorMale)"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "additionalDiabetesDetailsValue"
    * language = #text/fhirpath
    * expression = "%resource.descendants().item.where(linkId='additional-diabetes-details-boolean').answer.value"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "additionalDiabetesDetailsVar"
    * language = #text/fhirpath
    * expression = "iif(%diabetesVar = true, iif(%additionalDiabetesDetailsValue.exists(), %additionalDiabetesDetailsValue, false), false)"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "finalCvdScore"
    * language = #text/fhirpath
    * expression = "iif(%additionalDiabetesDetailsVar = true, %diabetesRecalibratedCvdScore, %generalRecalibratedCvdScore)"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "cvdCategory"
    * language = #text/fhirpath
    * expression = "iif(%finalCvdScore.exists(), iif(%finalCvdScore <= 4, '75976002', iif(%finalCvdScore <= 9, '25594002', '15508007')), '75976002')"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "reclassificationDecision"
    * language = #text/fhirpath
    * expression = "%resource.descendants().item.where(linkId='reclassification-decision-button').answer.value.code"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "enableWhenNoHighRiskNoOutOfAgeRange"
    * language = #text/fhirpath
    * expression = "(%ageValue.empty() or (%ageValue >= 30 and %ageValue <= 79)) and ((%hypercholesterolaemiaValue.empty() or %hypercholesterolaemiaValue = false) and (%chronicKidneyDiseaseValue.empty() or %chronicKidneyDiseaseValue = false))"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "enableWhenNoHighRiskNoOutOfAgeRangeNoDiabetes"
    * language = #text/fhirpath
    * expression = "(%ageValue.empty() or (%ageValue >= 30 and %ageValue <= 79)) and ((%hypercholesterolaemiaValue.empty() or %hypercholesterolaemiaValue = false) and (%chronicKidneyDiseaseValue.empty() or %chronicKidneyDiseaseValue = false)) and (%additionalDiabetesDetailsVar = true)"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "enableWhenNoHighRiskNoOutOfAgeRangeNoTotalHDLRatio"
    * language = #text/fhirpath
    * expression = "(%ageValue.empty() or (%ageValue >= 30 and %ageValue <= 79)) and ((%hypercholesterolaemiaValue.empty() or %hypercholesterolaemiaValue = false) and (%chronicKidneyDiseaseValue.empty() or %chronicKidneyDiseaseValue = false)) and %totalHDLRatioValue.empty()"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "enableWhenNoHighRiskNoOutOfAgeRangeNoTotalAndHDLChol"
    * language = #text/fhirpath
    * expression = "(%ageValue.empty() or (%ageValue >= 30 and %ageValue <= 79)) and ((%hypercholesterolaemiaValue.empty() or %hypercholesterolaemiaValue = false) and (%chronicKidneyDiseaseValue.empty() or %chronicKidneyDiseaseValue = false)) and (%totalCholValue.empty() and %hdlCholValue.empty())"
// Variable to hold new diagnosis entries
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "newDiagnosisArray"
    * language = #text/fhirpath
    * expression = "%resource.descendants().item.where(linkId='newdiagnosis')"


// Variable to hold Condition from prepop Atrial Fibrillation
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "conditionAtrialFibrillationExists"
    * language = #text/fhirpath
    * expression = "%Condition.entry.resource.where(code.memberOf('http://snomed.info/sct/32506021000036107?fhir_vs=ecl/(%3C%3C49436004)')).exists()"

// Variable to hold newDiagnosisArray  Atrial Fibrillation items
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "newDiagnosisAtrialFibrillationExists"
    * language = #text/fhirpath
    * expression = "%newDiagnosisArray.item.answer.where(valueCoding.memberOf('http://snomed.info/sct/32506021000036107?fhir_vs=ecl/(%3C%3C49436004)')).exists()"


// New Regular Medications Array
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "newRegularMedicationsArray"
    * language = #text/fhirpath
    * expression = "%resource.descendants().item.where(linkId='regularmedications-summary-new')"


// BP Lowering Medications exists on new medications summary
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "memberOfBpLoweringNewMedicationExists"
    * language = #text/fhirpath
    * expression = "%newRegularMedicationsArray.item.answer.where(valueCoding.memberOf('http://snomed.info/sct/32506021000036107?fhir_vs=ecl/(((%20%5E929360061000036106%20AND%20(%3C%3C%2041549009%20OR%20%3C%3C%2033252009%20OR%20%3C%3C%2045518007%20OR%20%3C%3C%2096308008%20OR%20%3C%3C%2048698004%20)%20)%20OR%20(%20%3C%3C%5E929360071000036103%20AND%20(%3C%3C%2041549009%20OR%20%3C%3C%2033252009%20OR%20%3C%3C%2045518007%20OR%20%3C%3C%2096308008%20OR%20%3C%3C%2048698004%20)%20)%20OR%20(%3C%3C%5E%20929360081000036101%20%3A%20%7B%20774160008%20%3D%20(%3C%3C%2041549009%20OR%20%3C%3C%2033252009%20OR%20%3C%3C%2045518007%20OR%20%3C%3C%2096308008%20OR%20%3C%3C%2048698004%20)%20%7D%20))%20OR%20(((%20%3C%3C%5E929360071000036103%20AND%20(%3C%3C%2041549009%20OR%20%3C%3C%2033252009%20OR%20%3C%3C%2045518007%20OR%20%3C%3C%2096308008%20OR%20%3C%3C%2048698004%20)%20)%20OR%20(%3C%3C%5E%20929360081000036101%20%3A%20%7B%20774160008%20%3D%20(%3C%3C%2041549009%20OR%20%3C%3C%2033252009%20OR%20%3C%3C%2045518007%20OR%20%3C%3C%2096308008%20OR%20%3C%3C%2048698004%20)%20%7D%20)).774158006%20))')).exists()"

// Lipid-modifying Medications exists on new medications summary


* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "memberOfLipidModifyingNewMedicationExists"
    * language = #text/fhirpath
    * expression = "%newRegularMedicationsArray.item.answer.where(valueCoding.memberOf('http://snomed.info/sct/32506021000036107?fhir_vs=ecl/(((%20%5E929360061000036106%20AND%20(%3C%3C%20108600003%20OR%20%3C%3C%2096307003%20OR%20%3C%3C%2096305006%20OR%20%3C%3C%2096304005%20OR%20%3C%3C%20319982006%20OR%20%3C%3C%20319937007%20OR%20%3C%3C%2072824008%20OR%20%3C%3C%2077035009%20OR%20%3C%3C%2066971004%20OR%20%3C%3C%20408041006%20OR%20%3C%3C%2035282000%20OR%20%3C%3C%2063639004%20)%20)%20OR%20(%20%3C%3C%5E929360071000036103%20AND%20(%3C%3C%20108600003%20OR%20%3C%3C%2096307003%20OR%20%3C%3C%2096305006%20OR%20%3C%3C%2096304005%20OR%20%3C%3C%20319982006%20OR%20%3C%3C%20319937007%20OR%20%3C%3C%2072824008%20OR%20%3C%3C%2077035009%20OR%20%3C%3C%2066971004%20OR%20%3C%3C%20408041006%20OR%20%3C%3C%2035282000%20OR%20%3C%3C%2063639004%20)%20)%20OR%20(%3C%3C%5E%20929360081000036101%20%3A%20%7B%20774160008%20%3D%20(%3C%3C%20108600003%20OR%20%3C%3C%2096307003%20OR%20%3C%3C%2096305006%20OR%20%3C%3C%2096304005%20OR%20%3C%3C%20319982006%20OR%20%3C%3C%20319937007%20OR%20%3C%3C%2072824008%20OR%20%3C%3C%2077035009%20OR%20%3C%3C%2066971004%20OR%20%3C%3C%20408041006%20OR%20%3C%3C%2035282000%20OR%20%3C%3C%2063639004%20)%20%7D%20))%20OR%20(((%20%3C%3C%5E929360071000036103%20AND%20(%3C%3C%20108600003%20OR%20%3C%3C%2096307003%20OR%20%3C%3C%2096305006%20OR%20%3C%3C%2096304005%20OR%20%3C%3C%20319982006%20OR%20%3C%3C%20319937007%20OR%20%3C%3C%2072824008%20OR%20%3C%3C%2077035009%20OR%20%3C%3C%2066971004%20OR%20%3C%3C%20408041006%20OR%20%3C%3C%2035282000%20OR%20%3C%3C%2063639004%20)%20)%20OR%20(%3C%3C%5E%20929360081000036101%20%3A%20%7B%20774160008%20%3D%20(%3C%3C%20108600003%20OR%20%3C%3C%2096307003%20OR%20%3C%3C%2096305006%20OR%20%3C%3C%2096304005%20OR%20%3C%3C%20319982006%20OR%20%3C%3C%20319937007%20OR%20%3C%3C%2072824008%20OR%20%3C%3C%2077035009%20OR%20%3C%3C%2066971004%20OR%20%3C%3C%20408041006%20OR%20%3C%3C%2035282000%20OR%20%3C%3C%2063639004%20)%20%7D%20)).774158006%20))')).exists()"
// AntithromboticMediationReqMedication exists on new medications summary
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "memberOfAntithromboticMedicationNewMedicationExists"
    * language = #text/fhirpath
    * expression = "%newRegularMedicationsArray.item.answer.where(valueCoding.memberOf('http://snomed.info/sct/32506021000036107?fhir_vs=ecl/(((%20%5E929360061000036106%20AND%20(%3C%3C%207947003%20OR%20108979001%20OR%20%3C%3C%2066859009%20OR%20%3C%3C%20443312008%20OR%20%3C%3C%20704464003%20OR%20%3C%3C%20108971003%20OR%20%3C%3C%2048603004%20OR%20%3C%3C%20714788005%20OR%20%3C%3C%2047527007%20OR%20%3C%3C%20442539005%20OR%20%3C%3C%20703906002%20)%20)%20OR%20(%20%3C%3C%5E929360071000036103%20AND%20(%3C%3C%207947003%20OR%20108979001%20OR%20%3C%3C%2066859009%20OR%20%3C%3C%20443312008%20OR%20%3C%3C%20704464003%20OR%20%3C%3C%20108971003%20OR%20%3C%3C%2048603004%20OR%20%3C%3C%20714788005%20OR%20%3C%3C%2047527007%20OR%20%3C%3C%20442539005%20OR%20%3C%3C%20703906002%20)%20)%20OR%20(%3C%3C%5E%20929360081000036101%20%3A%20%7B%20774160008%20%3D%20(%3C%3C%207947003%20OR%20108979001%20OR%20%3C%3C%2066859009%20OR%20%3C%3C%20443312008%20OR%20%3C%3C%20704464003%20OR%20%3C%3C%20108971003%20OR%20%3C%3C%2048603004%20OR%20%3C%3C%20714788005%20OR%20%3C%3C%2047527007%20OR%20%3C%3C%20442539005%20OR%20%3C%3C%20703906002%20)%20%7D%20))%20OR%20(((%20%3C%3C%5E929360071000036103%20AND%20(%3C%3C%207947003%20OR%20108979001%20OR%20%3C%3C%2066859009%20OR%20%3C%3C%20443312008%20OR%20%3C%3C%20704464003%20OR%20%3C%3C%20108971003%20OR%20%3C%3C%2048603004%20OR%20%3C%3C%20714788005%20OR%20%3C%3C%2047527007%20OR%20%3C%3C%20442539005%20OR%20%3C%3C%20703906002%20)%20)%20OR%20(%3C%3C%5E%20929360081000036101%20%3A%20%7B%20774160008%20%3D%20(%3C%3C%207947003%20OR%20108979001%20OR%20%3C%3C%2066859009%20OR%20%3C%3C%20443312008%20OR%20%3C%3C%20704464003%20OR%20%3C%3C%20108971003%20OR%20%3C%3C%2048603004%20OR%20%3C%3C%20714788005%20OR%20%3C%3C%2047527007%20OR%20%3C%3C%20442539005%20OR%20%3C%3C%20703906002%20)%20%7D%20)).774158006%20))')).exists()"

// Diabetes 2 TODO Reconfirm if the code is only type 2 or all?
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "conditionDiabetesExists"
    * language = #text/fhirpath
    * expression = "%Condition.entry.resource.code.coding.where(system='http://snomed.info/sct' and code='44054006').exists()"

// Diabetes on new diagnosis array -  TODO Reconfirm if the code is only type 2 or all?
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "newDiagnosisDiabetesExists"
    * language = #text/fhirpath
    * expression = "%newDiagnosisArray.item.answer.valueCoding.where(system='http://snomed.info/sct' and code='44054006').exists()"
    // * expression = "%newDiagnosisArray.item.answer.where(valueCoding.memberOf('http://snomed.info/sct/32506021000036107?fhir_vs=ecl/(%3C%3C49436004)')).exists()"

// Diabetes onset Date Years Integer from new diagnosis
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "newDiagnosisDiabetesOnsetDateYearsInteger"
    * language = #text/fhirpath
    * expression = "today().toString().substring(0,4).toInteger() - iif(exists(%newDiagnosisArray.where(linkId='newdiagnosis' and item.answer.valueCoding.where(system='http://snomed.info/sct' and code='44054006')).item.where(text='Onset date').answer.valueDate), %newDiagnosisArray.where(linkId='newdiagnosis' and item.answer.valueCoding.where(system='http://snomed.info/sct' and code='44054006')).item.where(text='Onset date').answer.valueDate.toString().substring(0,4).toInteger(), today().toString().substring(0,4).toInteger())"
    // * expression = "%newDiagnosisArray.item.answer.where(valueCoding.memberOf('http://snomed.info/sct/32506021000036107?fhir_vs=ecl/(%3C%3C49436004)')).exists()"




// Diabetes on new diagnosis array and from prepop max years
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "diabetesYearsFinal"
    * language = #text/fhirpath
    * expression = "( %newDiagnosisDiabetesOnsetDateYearsInteger |  %diabetesYearsIntegerPrePop ).max()"


// get the weight date
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "weightDate"
    * language = #text/fhirpath
    * expression = "%resource.descendants().item.where(linkId='obs-weight-newdate').answer.valueDate"

// set the weight value that is the most recent one from observations and new observations, this should work even if one variable is empty. 
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "weightValueLatest"
    * language = #text/fhirpath
    * expression = "iif(%weightDate > %ObsBodyWeightDateString, %weight  ,  %ObsBodyWeightValue )"
// Get Patient's Admisistrative Gender - Map only if it is Male/Female
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "sexValueCode"
    * language = #text/fhirpath
    * expression = "%resource.descendants().item.where(linkId='56ef44bb-3d1d-4972-aad1-834b69185d61').answer.value"







//R5 preadoption extensions
* extension[+]
  * url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-Questionnaire.versionAlgorithm[x]"
  * valueCoding
    * system = "http://hl7.org/fhir/version-algorithm"
    * code = #semver

//workaround to stop server stripping of value sets referenced as canonical
* extension[+]
  * url = "https://smartforms.csiro.au/ig/StructureDefinition/ContainedResourceReference"
  * valueReference.reference = "#YesNoNA"
* extension[+]
  * url = "https://smartforms.csiro.au/ig/StructureDefinition/ContainedResourceReference"
  * valueReference.reference = "#YesNo"
* extension[+]
  * url = "https://smartforms.csiro.au/ig/StructureDefinition/ContainedResourceReference"
  * valueReference.reference = "#YesNoNotAskedDeclined"
* extension[+]
  * url = "https://smartforms.csiro.au/ig/StructureDefinition/ContainedResourceReference"
  * valueReference.reference = "#clinical-condition-1"
* extension[+]
  * url = "https://smartforms.csiro.au/ig/StructureDefinition/ContainedResourceReference"
  * valueReference.reference = "#administrative-gender"
* extension[+]
  * url = "https://smartforms.csiro.au/ig/StructureDefinition/ContainedResourceReference"
  * valueReference.reference = "#condition-clinical"
* extension[+]
  * url = "https://smartforms.csiro.au/ig/StructureDefinition/ContainedResourceReference"
  * valueReference.reference = "#AboriginalTorresStraitIslander"
* extension[+]
  * url = "https://smartforms.csiro.au/ig/StructureDefinition/ContainedResourceReference"
  * valueReference.reference = "#PrimaryCarerParentGrandparent"
* extension[+]
  * url = "https://smartforms.csiro.au/ig/StructureDefinition/ContainedResourceReference"
  * valueReference.reference = "#australian-pronouns-1"
* extension[+]
  * url = "https://smartforms.csiro.au/ig/StructureDefinition/ContainedResourceReference"
  * valueReference.reference = "#australian-states-territories-2"
* extension[+]
  * url = "https://smartforms.csiro.au/ig/StructureDefinition/ContainedResourceReference"
  * valueReference.reference = "#gender-identity-response-1"
* extension[+]
  * url = "https://smartforms.csiro.au/ig/StructureDefinition/ContainedResourceReference"
  * valueReference.reference = "#biological-sex-1"
* extension[+]
  * url = "https://smartforms.csiro.au/ig/StructureDefinition/ContainedResourceReference"
  * valueReference.reference = "#SmokingQuitStatus-1"
* extension[+]
  * url = "https://smartforms.csiro.au/ig/StructureDefinition/ContainedResourceReference"
  * valueReference.reference = "#TobaccoUseStatus-1"
* extension[+]
  * url = "https://smartforms.csiro.au/ig/StructureDefinition/ContainedResourceReference"
  * valueReference.reference = "#CervicalScreeningStatus-1"


* meta.profile[+] = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-modular"
* url = "http://www.health.gov.au/assessments/mbs/715"
* name = "AboriginalTorresStraitIslanderHealthCheck"
* title = "Aboriginal and Torres Strait Islander Health Check"
* status = #draft
* experimental = false
* subjectType[+] = #Patient
* date = "2025-03-14"
* jurisdiction.coding = urn:iso:std:iso:3166#AU

// Root 
* item[+] 
  * linkId = "fd5af92e-c248-497a-8007-ee0952ccd4d9"  
  * type = #group
  * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl][+].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#tab-container
 //fhirpath variables
  * extension[http://hl7.org/fhir/StructureDefinition/variable][+].valueExpression
    * name = "age"
    * language = #text/fhirpath
    * expression = "item.where(linkId='5b224753-9365-44e3-823b-9c17e7394005').item.where(linkId='e2a16e4d-2765-4b61-b286-82cfc6356b30').answer.value"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][+].valueExpression
    * name = "postcode"
    * language = #text/fhirpath
    * expression = "item.where(linkId='5b224753-9365-44e3-823b-9c17e7394005').item.where(linkId='f1262ade-843c-4eba-a86d-51a9c97d134b').item.where(linkId='4e0dc185-f83e-4027-b7a8-ecb543d42c6d').item.where(linkId='3f61a1ea-1c74-4f52-8519-432ce861a74f').answer.value"
  // Health priorities summary variables
  * extension[http://hl7.org/fhir/StructureDefinition/variable][+].valueExpression
    * name = "HealthPrioritiesSummaryCurrentPriorities"
    * language = #text/fhirpath
    * expression = "item.where(linkId='b3a3eee2-f340-452e-9d05-d1f54f677b81').item.where(linkId='7cd424e5-7672-4e99-8a99-30b1fb3043fd').answer.value"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][+].valueExpression
    * name = "HealthPrioritiesSummaryMedicalHistory"
    * language = #text/fhirpath
    * expression = "item.where(linkId='28d5dbe4-1e65-487c-847a-847f544a6a91').item.where(linkId='62774152-8a6e-4449-af9f-87bdce8b9bf5').answer.value"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][+].valueExpression
    * name = "HealthPrioritiesSummaryRegularMedications"
    * language = #text/fhirpath
    * expression = "item.where(linkId='7dfe7c6a-ca7f-4ddf-9241-a7b918a9695a').item.where(linkId='aa9ff2ed-bcd2-406d-a9ff-89c201df2605').answer.value"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][+].valueExpression
    * name = "HealthPrioritiesSummaryAllergiesAdverseReactions"
    * language = #text/fhirpath
    * expression = "item.where(linkId='d4e4db07-a795-4a30-bd0f-9c109f96a22b').item.where(linkId='3e689aeb-69a1-4a9b-93bd-50377511dd9b').answer.value"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][+].valueExpression
    * name = "HealthPrioritiesSummaryFamilyHistory"
    * language = #text/fhirpath
    * expression = "item.where(linkId='01f67f0b-e3be-48d8-a2ad-4c54f469cd13').item.where(linkId='49ee4583-c608-41d4-a1e9-c06cf4292369').answer.value"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][+].valueExpression
    * name = "HealthPrioritiesSummarySocialEmotionalWellbeing"
    * language = #text/fhirpath
    * expression = "item.where(linkId='0a3c9c93-5836-4a5b-93e5-d7de559e053a').item.where(linkId='b5a00aad-2a8b-4ac3-87b2-4a5920ca22ee').answer.value"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][+].valueExpression
    * name = "HealthPrioritiesSummarySocialHistory"
    * language = #text/fhirpath
    * expression = "item.where(linkId='a5cc8a8f-89cf-470c-a6bd-ce9da2f64ee9').item.where(linkId='76d51512-b94a-4092-b3ae-a656fbb9c360').answer.value"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][+].valueExpression
    * name = "HealthPrioritiesSummaryHomeFamily"
    * language = #text/fhirpath
    * expression = "item.where(linkId='819b3305-bf93-4502-9986-242ea2ae5f43').item.where(linkId='08d2e80e-3bb4-4f67-8b1c-090b1ace225a').answer.value"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][+].valueExpression
    * name = "HealthPrioritiesSummaryLearningDevelopment"
    * language = #text/fhirpath
    * expression = "item.where(linkId='3e7d7246-98f8-4803-b063-8405ac30b086').item.where(linkId='5ab80929-5901-431d-bf68-67d532f5fa58').answer.value"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][+].valueExpression
    * name = "HealthPrioritiesSummaryLearningWorkAdults"
    * language = #text/fhirpath
    * expression = "item.where(linkId='5437e30d-8a0a-4785-974e-00a10d2a1df0').item.where(linkId='3569e514-a74b-4343-b31b-3395e58d991a').answer.value"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][+].valueExpression
    * name = "HealthPrioritiesSummaryLearningWorkOlder"
    * language = #text/fhirpath
    * expression = "item.where(linkId='dec713ae-246a-4961-95c9-0626bfebfed2').item.where(linkId='ed6f7800-e22a-4639-9d11-faf845513500').answer.value"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][+].valueExpression
    * name = "HealthPrioritiesSummaryMood"
    * language = #text/fhirpath
    * expression = "item.where(linkId='9559242e-9ffe-4e1f-a9fc-86d1fa62c4b9').item.where(linkId='db9a8650-42a2-4bd3-8066-7e09394120d5').answer.value"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][+].valueExpression
    * name = "HealthPrioritiesSummaryMemoryThinking"
    * language = #text/fhirpath
    * expression = "item.where(linkId='1bd58e7b-2cb7-45fb-965f-d5fa33d0bb4c').item.where(linkId='1f0e7fde-e964-4f36-9151-dbdc5e145f94').answer.value"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][+].valueExpression
    * name = "HealthPrioritiesSummaryChronicDiseaseAgeing"
    * language = #text/fhirpath
    * expression = "item.where(linkId='c5da020c-c4f3-437c-b658-ea7e7667514d').item.where(linkId='7292070b-8944-4a40-bcf6-9aaf1721e986').answer.value"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][+].valueExpression
    * name = "HealthPrioritiesSummaryScreeningPrograms"
    * language = #text/fhirpath
    * expression = "item.where(linkId='9674ffa0-2ad9-4ca3-80e6-e8bb0670a802').item.where(linkId='70f82c4b-d1f9-44d5-9903-bd7097799c05').answer.value"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][+].valueExpression
    * name = "HealthPrioritiesSummaryHealthyEating"
    * language = #text/fhirpath
    * expression = "item.where(linkId='ae7a3801-9491-4b1f-820c-678236d18f56').item.where(linkId='301789b0-8c6a-470d-8787-0ac6597e3bea').answer.value"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][+].valueExpression
    * name = "HealthPrioritiesSummaryPhysicalActivityScreenTimeNotOlder"
    * language = #text/fhirpath
    * expression = "item.where(linkId='74736baa-455b-41d2-af98-fb65cd463e97').item.where(linkId='ccbd7fbf-0d40-4cb3-82b3-ad2c7cc7bba2').answer.value"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][+].valueExpression
    * name = "HealthPrioritiesSummaryPhysicalActivityScreenTimeOlder"
    * language = #text/fhirpath
    * expression = "item.where(linkId='d56234a0-aafd-4c22-96c9-00ead8424f0b').item.where(linkId='25b8b8fd-adb1-48ab-aeae-528603668c4b').answer.value"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][+].valueExpression
    * name = "HealthPrioritiesSummarySubstanceUse"
    * language = #text/fhirpath
    * expression = "item.where(linkId='14a9fb5f-5b0e-4862-b143-08a11cd3ebf0').item.where(linkId='f8e1cc1f-f1a1-4eb3-8255-77d600f52831').answer.value"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][+].valueExpression
    * name = "HealthPrioritiesSummaryGambling"
    * language = #text/fhirpath
    * expression = "item.where(linkId='a7bb0dd2-4b2d-49c2-9da6-3cb0a4dd9240').item.where(linkId='2ab74c97-55d9-4fd9-968f-8962d62ea573').answer.value"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][+].valueExpression
    * name = "HealthPrioritiesSummarySexualHealthAdolescents"
    * language = #text/fhirpath
    * expression = "item.where(linkId='4b49c291-6e93-4b7e-be3b-15ef8bc207ad').item.where(linkId='b41572ba-cf36-4cec-addf-cb0b47fea63f').answer.value"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][+].valueExpression
    * name = "HealthPrioritiesSummarySexualHealthAdults"
    * language = #text/fhirpath
    * expression = "item.where(linkId='589b53a4-ceb2-41c0-850a-69438f9fd1cc').item.where(linkId='efd0735c-c379-471f-83bb-93b0392093aa').answer.value"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][+].valueExpression
    * name = "HealthPrioritiesSummarySexualHealthOlder"
    * language = #text/fhirpath
    * expression = "item.where(linkId='02048954-e9d7-424e-8c7b-6a3c495d7ce4').item.where(linkId='e9936322-e6fe-4cf7-ab61-22846a8fbb95').answer.value"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][+].valueExpression
    * name = "HealthPrioritiesSummaryEyeHealth"
    * language = #text/fhirpath
    * expression = "item.where(linkId='961da481-1698-4a1d-962b-a9c2185e335a').item.where(linkId='8dcdc04c-7655-4b47-88eb-8425f0cdc0d0').answer.value"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][+].valueExpression
    * name = "HealthPrioritiesSummaryEarHealthHearing"
    * language = #text/fhirpath
    * expression = "item.where(linkId='de71bbd0-178c-4974-9c75-55d5a48c66f7').item.where(linkId='ac87b23a-b022-4d62-9e82-1c56583bca34').answer.value"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][+].valueExpression
    * name = "HealthPrioritiesSummaryOralDentalHealth"
    * language = #text/fhirpath
    * expression = "item.where(linkId='bde9ab00-a20f-4a7c-9266-11f53f60c65f').item.where(linkId='875574fa-9769-42ca-8381-9e80c3e5233d').answer.value"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][+].valueExpression
    * name = "HealthPrioritiesSummarySkin"
    * language = #text/fhirpath
    * expression = "item.where(linkId='7d4772cb-a1cd-49d9-853f-883ccd8343a6').item.where(linkId='88d23fa4-df88-43ab-a1d0-69315d55c3bf').answer.value"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][+].valueExpression
    * name = "HealthPrioritiesSummaryImmunisation"
    * language = #text/fhirpath
    * expression = "item.where(linkId='205677d6-17c7-4285-a7c4-61aa02b6c816').item.where(linkId='bcd1c9f2-889e-41e5-8c2b-a70221c5cec5').answer.value"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][+].valueExpression
    * name = "HealthPrioritiesSummaryExamination"
    * language = #text/fhirpath
    * expression = "item.where(linkId='c587e3b6-b91a-40dc-9a16-179342d001e9').item.where(linkId='fcbfa6e1-c101-4675-969d-aa11027859c2').answer.value"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][+].valueExpression
    * name = "HealthPrioritiesSummaryAbsoluteCVDRisk"
    * language = #text/fhirpath
    * expression = "item.where(linkId='d95abe99-8ef2-4b97-bc88-a2901e2ebc9c').item.where(linkId='f8022f3f-21fe-42c0-8abd-95f24e2e37e5').answer.value"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][+].valueExpression
    * name = "HealthPrioritiesSummaryInvestigations"
    * language = #text/fhirpath
    * expression = "item.where(linkId='918f7f32-cdaf-4742-b33a-8254eda2d8bd').item.where(linkId='96a8d946-6078-4c85-9de8-3bf18d2c8150').answer.value"
  // Subquestionnnaire inputs  
  // About The Health Check
  * item[+] 
    * extension[sdc-questionnaire-subQuestionnaire].valueCanonical = "http://www.health.gov.au/assessments/mbs/715/AboutTheHealthCheck|0.3.0"
    * linkId = "cd3303a6-e3b6-4732-80e8-54d2bd740beb"
    * text = "Sub-questionnaire [http://www.health.gov.au/assessments/mbs/715/AboutTheHealthCheck|0.3.0] not available. Unable to display all questions."
    * type = #display
  // Consent
  * item[+] 
    * extension[sdc-questionnaire-subQuestionnaire].valueCanonical = "http://www.health.gov.au/assessments/mbs/715/Consent|0.3.0"
    * linkId = "fab52f87-22a6-4a54-9797-0bb6b0f5d2a2"
    * text = "Sub-questionnaire [http://www.health.gov.au/assessments/mbs/715/Consent|0.3.0] not available. Unable to display all questions."
    * type = #display
  // Patient Details
  * item[+] 
    * extension[sdc-questionnaire-subQuestionnaire].valueCanonical = "http://www.health.gov.au/assessments/mbs/715/PatientDetails|0.3.0"
    * linkId = "1d10910d-c195-4964-bdc6-98310a44719e"
    * text = "Sub-questionnaire [http://www.health.gov.au/assessments/mbs/715/PatientDetails|0.3.0] not available. Unable to display all questions."
    * type = #display
  // Current Priorities
  * item[+] 
    * extension[sdc-questionnaire-subQuestionnaire].valueCanonical = "http://www.health.gov.au/assessments/mbs/715/CurrentPriorities|0.3.0"
    * linkId = "7692f28c-7c0a-48ea-b27d-a8489974377d"
    * text = "Sub-questionnaire [http://www.health.gov.au/assessments/mbs/715/CurrentPriorities|0.3.0] not available. Unable to display all questions."
    * type = #display
  // Medical History and Current Problems
  * item[+] 
    * extension[sdc-questionnaire-subQuestionnaire].valueCanonical = "http://www.health.gov.au/assessments/mbs/715/MedicalHistoryCurrentProblems|0.3.0"
    * linkId = "15f83d80-f49a-4852-a20f-18db9b951e53"
    * text = "Sub-questionnaire [http://www.health.gov.au/assessments/mbs/715/MedicalHistory|0.3.0] not available. Unable to display all questions."
    * type = #display
  // Regular Medications
  * item[+] 
    * extension[sdc-questionnaire-subQuestionnaire].valueCanonical = "http://www.health.gov.au/assessments/mbs/715/RegularMedications|0.3.0"
    * linkId = "3a7151ef-d63b-4818-8367-03d394383a61"
    * text = "Sub-questionnaire [http://www.health.gov.au/assessments/mbs/715/RegularMedications|0.3.0] not available. Unable to display all questions."
    * type = #display
  // Allergies Adverse Reactions
  * item[+] 
    * extension[sdc-questionnaire-subQuestionnaire].valueCanonical = "http://www.health.gov.au/assessments/mbs/715/AllergiesAdverseReactions|0.3.0"
    * linkId = "334853dc-88d4-4cb1-a119-bb0ff6ea0516"
    * text = "Sub-questionnaire [http://www.health.gov.au/assessments/mbs/715/AllergiesAdverseReactions|0.3.0] not available. Unable to display all questions."
    * type = #display
  // Family History
  * item[+] 
    * extension[sdc-questionnaire-subQuestionnaire].valueCanonical = "http://www.health.gov.au/assessments/mbs/715/FamilyHistory|0.3.0"
    * linkId = "1ab9b519-85ce-48ee-a408-8f0b9b74d112"
    * text = "Sub-questionnaire [http://www.health.gov.au/assessments/mbs/715/FamilyHistory|0.3.0] not available. Unable to display all questions."
    * type = #display
  // Social And Emotional Wellbeing
  * item[+] 
    * extension[sdc-questionnaire-subQuestionnaire].valueCanonical = "http://www.health.gov.au/assessments/mbs/715/SocialAndEmotionalWellbeing|0.3.0"
    * linkId = "228b8d31-21e3-49a6-b802-984135908dca"
    * text = "Sub-questionnaire [http://www.health.gov.au/assessments/mbs/715/SocialAndEmotionalWellbeing|0.3.0] not available. Unable to display all questions."
    * type = #display
  // Social History Child
  * item[+] 
    * extension[sdc-questionnaire-subQuestionnaire].valueCanonical = "http://www.health.gov.au/assessments/mbs/715/SocialHistoryChild|0.3.0"
    * linkId = "a43517f9-538e-4a4d-8789-b6c3d44206ba"
    * text = "Sub-questionnaire [http://www.health.gov.au/assessments/mbs/715/SocialHistoryChild|0.3.0] not available. Unable to display all questions."
    * type = #display
  // Home And Family
  * item[+] 
    * extension[sdc-questionnaire-subQuestionnaire].valueCanonical = "http://www.health.gov.au/assessments/mbs/715/HomeAndFamily|0.3.0"
    * linkId = "8decf7bf-e24c-4d3d-815c-c53e269f004b"
    * text = "Sub-questionnaire [http://www.health.gov.au/assessments/mbs/715/HomeAndFamily|0.3.0] not available. Unable to display all questions."
    * type = #display
  // Learning And Development
  * item[+] 
    * extension[sdc-questionnaire-subQuestionnaire].valueCanonical = "http://www.health.gov.au/assessments/mbs/715/LearningAndDevelopment|0.3.0"
    * linkId = "3f554c37-7d0e-4b14-8f7f-a9ec665cc0a6"
    * text = "Sub-questionnaire [http://www.health.gov.au/assessments/mbs/715/LearningAndDevelopment|0.3.0] not available. Unable to display all questions."
    * type = #display
  // Learning And Work
  * item[+] 
    * extension[sdc-questionnaire-subQuestionnaire].valueCanonical = "http://www.health.gov.au/assessments/mbs/715/LearningAndWork|0.3.0"
    * linkId = "362bf381-23e5-4eee-963a-3de73e584da5"
    * text = "Sub-questionnaire [http://www.health.gov.au/assessments/mbs/715/LearningAndWork|0.3.0] not available. Unable to display all questions."
    * type = #display
  // Mood
  * item[+] 
    * extension[sdc-questionnaire-subQuestionnaire].valueCanonical = "http://www.health.gov.au/assessments/mbs/715/Mood|0.3.0"
    * linkId = "51a545fa-907f-40f0-9304-36bcab5a16b8"
    * text = "Sub-questionnaire [http://www.health.gov.au/assessments/mbs/715/Mood|0.3.0] not available. Unable to display all questions."
    * type = #display
  // Memory And Thinking
  * item[+] 
    * extension[sdc-questionnaire-subQuestionnaire].valueCanonical = "http://www.health.gov.au/assessments/mbs/715/MemoryAndThinking|0.3.0"
    * linkId = "4217646d-e8e4-4ac5-baa7-fae28937cda7"
    * text = "Sub-questionnaire [http://www.health.gov.au/assessments/mbs/715/MemoryAndThinking|0.3.0] not available. Unable to display all questions."
    * type = #display
  // Chronic Disease Ageing
  * item[+] 
    * extension[sdc-questionnaire-subQuestionnaire].valueCanonical = "http://www.health.gov.au/assessments/mbs/715/ChronicDiseaseAgeing|0.3.0"
    * linkId = "070eadcf-9e93-499e-8615-61991ab35b32"
    * text = "Sub-questionnaire [http://www.health.gov.au/assessments/mbs/715/ChronicDiseaseAgeing|0.3.0] not available. Unable to display all questions."
    * type = #display
  // Screening Programs
  * item[+] 
    * extension[sdc-questionnaire-subQuestionnaire].valueCanonical = "http://www.health.gov.au/assessments/mbs/715/ScreeningPrograms|0.3.0"
    * linkId = "56d4bc0b-3bf1-4d47-ac34-5a1de0902de1"
    * text = "Sub-questionnaire [http://www.health.gov.au/assessments/mbs/715/ScreeningPrograms|0.3.0] not available. Unable to display all questions."
    * type = #display
  // Healthy Eating
  * item[+] 
    * extension[sdc-questionnaire-subQuestionnaire].valueCanonical = "http://www.health.gov.au/assessments/mbs/715/HealthyEating|0.3.0"
    * linkId = "e0962739-c506-41d4-afd7-ab1b90db9cb4"
    * text = "Sub-questionnaire [http://www.health.gov.au/assessments/mbs/715/HealthyEating|0.3.0] not available. Unable to display all questions."
    * type = #display
  // Physical Activity And Screen Time
  * item[+] 
    * extension[sdc-questionnaire-subQuestionnaire].valueCanonical = "http://www.health.gov.au/assessments/mbs/715/PhysicalActivityAndScreenTime|0.3.0"
    * linkId = "63cfb279-cd7d-41ed-a54b-0c17b6efe609"
    * text = "Sub-questionnaire [http://www.health.gov.au/assessments/mbs/715/PhysicalActivityAndScreenTime|0.3.0] not available. Unable to display all questions."
    * type = #display
  // Red Flags Early Identification Guide For Children
  * item[+] 
    * extension[sdc-questionnaire-subQuestionnaire].valueCanonical = "http://www.health.gov.au/assessments/mbs/715/RedFlagsEarlyIdentificationGuide|0.3.0"
    * linkId = "db70690e-2199-495a-9919-53697efaf913"
    * text = "Sub-questionnaire [http://www.health.gov.au/assessments/mbs/715/RedFlagsEarlyIdentificationGuide|0.3.0] not available. Unable to display all questions."
    * type = #display    
  // Substance Use
  * item[+] 
    * extension[sdc-questionnaire-subQuestionnaire].valueCanonical = "http://www.health.gov.au/assessments/mbs/715/SubstanceUse|0.3.0"
    * linkId = "d1f66f56-75fa-4498-9c51-eb98e1644243"
    * text = "Sub-questionnaire [http://www.health.gov.au/assessments/mbs/715/SubstanceUse|0.3.0] not available. Unable to display all questions."
    * type = #display
  // Gambling
  * item[+] 
    * extension[sdc-questionnaire-subQuestionnaire].valueCanonical = "http://www.health.gov.au/assessments/mbs/715/Gambling|0.3.0"
    * linkId = "ea748251-bf77-4085-b912-e9002dfa02ca"
    * text = "Sub-questionnaire [http://www.health.gov.au/assessments/mbs/715/Gambling|0.3.0] not available. Unable to display all questions."
    * type = #display
  // SexualHealth
  * item[+] 
    * extension[sdc-questionnaire-subQuestionnaire].valueCanonical = "http://www.health.gov.au/assessments/mbs/715/SexualHealth|0.3.0"
    * linkId = "84bd802b-b3e1-4098-aa2c-2133f0e252f4"
    * text = "Sub-questionnaire [http://www.health.gov.au/assessments/mbs/715/SexualHealth|0.3.0] not available. Unable to display all questions."
    * type = #display
  // Eye Health
  * item[+] 
    * extension[sdc-questionnaire-subQuestionnaire].valueCanonical = "http://www.health.gov.au/assessments/mbs/715/EyeHealth|0.3.0"
    * linkId = "56ad8128-0e12-4779-8ff4-47dcff6b29b5"
    * text = "Sub-questionnaire [http://www.health.gov.au/assessments/mbs/715/EyeHealth|0.3.0] not available. Unable to display all questions."
    * type = #display
  // Ear Health And Hearing
  * item[+] 
    * extension[sdc-questionnaire-subQuestionnaire].valueCanonical = "http://www.health.gov.au/assessments/mbs/715/EarHealthAndHearing|0.3.0"
    * linkId = "a8161e91-7cff-403f-85e6-982a9bc8fca6"
    * text = "Sub-questionnaire [http://www.health.gov.au/assessments/mbs/715/EarHealthAndHearing|0.3.0] not available. Unable to display all questions."
    * type = #display
  // Oral And Dental Health
  * item[+] 
    * extension[sdc-questionnaire-subQuestionnaire].valueCanonical = "http://www.health.gov.au/assessments/mbs/715/OralAndDentalHealth|0.3.0"
    * linkId = "fe05d868-aaed-4921-9d49-4e7746bbe143"
    * text = "Sub-questionnaire [http://www.health.gov.au/assessments/mbs/715/OralAndDentalHealth|0.3.0] not available. Unable to display all questions."
    * type = #display
  // Skin
  * item[+] 
    * extension[sdc-questionnaire-subQuestionnaire].valueCanonical = "http://www.health.gov.au/assessments/mbs/715/Skin|0.3.0"
    * linkId = "64ec4c1c-0824-4b84-8d3f-40f6e066cb80"
    * text = "Sub-questionnaire [http://www.health.gov.au/assessments/mbs/715/Skin|0.3.0] not available. Unable to display all questions."
    * type = #display
  // Immunisation
  * item[+] 
    * extension[sdc-questionnaire-subQuestionnaire].valueCanonical = "http://www.health.gov.au/assessments/mbs/715/Immunisation|0.3.0"
    * linkId = "595737cd-3a94-442b-8be6-ab461c3181d2"
    * text = "Sub-questionnaire [http://www.health.gov.au/assessments/mbs/715/Immunisation|0.3.0] not available. Unable to display all questions."
    * type = #display
  // Examination
  * item[+] 
    * extension[sdc-questionnaire-subQuestionnaire].valueCanonical = "http://www.health.gov.au/assessments/mbs/715/Examination|0.3.0"
    * linkId = "3263611d-5813-4393-a660-d10166acd728"
    * text = "Sub-questionnaire [http://www.health.gov.au/assessments/mbs/715/Examination|0.3.0] not available. Unable to display all questions."
    * type = #display
  // Absolute CVD Risk Calculation
  * item[+] 
    * extension[sdc-questionnaire-subQuestionnaire].valueCanonical = "http://www.health.gov.au/assessments/mbs/715/AbsoluteCVDRiskCalculation|0.3.0"
    * linkId = "3a3b0810-e091-48ad-af50-913b0deaf663"
    * text = "Sub-questionnaire [http://www.health.gov.au/assessments/mbs/715/AbsoluteCVDRiskCalculation|0.3.0] not available. Unable to display all questions."
    * type = #display
  // Investigations
  * item[+] 
    * extension[sdc-questionnaire-subQuestionnaire].valueCanonical = "http://www.health.gov.au/assessments/mbs/715/Investigations|0.3.0"
    * linkId = "302d9437-25b9-41e3-9d66-138c352d32a8"
    * text = "Sub-questionnaire [http://www.health.gov.au/assessments/mbs/715/Investigations|0.3.0] not available. Unable to display all questions."
    * type = #display
  // Health Priorities Summary
  * item[+] 
    * extension[sdc-questionnaire-subQuestionnaire].valueCanonical = "http://www.health.gov.au/assessments/mbs/715/HealthPrioritiesSummary|0.3.0"
    * linkId = "ada45623-5e86-49ea-a00b-be0699364281"
    * text = "Sub-questionnaire [http://www.health.gov.au/assessments/mbs/715/HealthPrioritiesSummary|0.3.0] not available. Unable to display all questions."
    * type = #display
  // Finalising Health Check
  * item[+] 
    * extension[sdc-questionnaire-subQuestionnaire].valueCanonical = "http://www.health.gov.au/assessments/mbs/715/FinalisingHealthCheck|0.3.0"
    * linkId = "a6395946-872a-4f2e-b697-c74aa1ab9b8d"
    * text = "Sub-questionnaire [http://www.health.gov.au/assessments/mbs/715/FinalisingHealthCheck|0.3.0] not available. Unable to display all questions."
    * type = #display
  