Alias: $LNC = http://loinc.org
Alias: $SCT = http://snomed.info/sct
Alias: $UCUM = http://unitsofmeasure.org

Alias: $condition-category = http://terminology.hl7.org/CodeSystem/condition-category
Alias: $sdc-questionnaire-templateExtractContext = http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractContext

Alias: $au-core-bodyheight = http://hl7.org.au/fhir/core/StructureDefinition/au-core-bodyheight
Alias: $au-core-bodyweight = http://hl7.org.au/fhir/core/StructureDefinition/au-core-bodyweight
Alias: $au-core-waistcircum = http://hl7.org.au/fhir/core/StructureDefinition/au-core-waistcircum
Alias: $au-core-heartrate = http://hl7.org.au/fhir/core/StructureDefinition/au-core-heartrate
Alias: $au-core-bloodpressure = http://hl7.org.au/fhir/core/StructureDefinition/au-core-bloodpressure
Alias: $au-core-condition = http://hl7.org.au/fhir/core/StructureDefinition/au-core-condition

Alias: $observation-category = http://terminology.hl7.org/CodeSystem/observation-category

Instance:   BodyHeight
InstanceOf: $au-core-bodyheight
Usage:  #inline  
* status = #final
* category[VSCat] = $observation-category#vital-signs
* code.coding[BodyHeightCode] = $LNC#8302-2
* code.coding[snomedBodyHeightCode] = $SCT#50373000
* code.text = "Height"
* subject.reference.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* subject.reference.extension[=].valueString = "'Patient/' + %resource.repeat(item).where(linkId='patientIdExamination').answer.value"
* effectiveDateTime.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* effectiveDateTime.extension[=].valueString = "%resource.repeat(item).where(linkId='c666ac96-1e64-40e2-8e0b-7d0187bb3e50').answer.value.toDateTime()"
* valueQuantity.value.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* valueQuantity.value.extension[=].valueString = "%resource.repeat(item).where(linkId='7035c7e7-ada3-4c6b-9ea8-f39666f5d4ea').answer.value"
* valueQuantity.unit = "cm"
* valueQuantity.system = $UCUM
* valueQuantity.code = #cm

Instance:   BodyWeight
InstanceOf: $au-core-bodyweight
Usage:  #inline  
* status = #final
* category[VSCat] = $observation-category#vital-signs
* code.coding[BodyWeightCode] = $LNC#29463-7
* code.coding[snomedBodyWeightCode] = $SCT#27113001
* code.text = "Weight"
* subject.reference.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* subject.reference.extension[=].valueString = "'Patient/' + %resource.repeat(item).where(linkId='patientIdExamination').answer.value"
* effectiveDateTime.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* effectiveDateTime.extension[=].valueString = "%resource.repeat(item).where(linkId='92cdc1c7-eb6c-4f6d-9bd9-ae726a0e0d3d').answer.value.toDateTime()"
* valueQuantity.value.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* valueQuantity.value.extension[=].valueString = "%resource.repeat(item).where(linkId='443bd584-684a-449c-ab6e-9d07da4df9fa').answer.value"
* valueQuantity.unit = "kg"
* valueQuantity.system = $UCUM
* valueQuantity.code = #kg

Instance:   WaistCircumference
InstanceOf: $au-core-waistcircum
Usage:  #inline  
* status = #final
* category[VSCat] = $observation-category#vital-signs
* code.coding[loincWaistCircumCode] = $LNC#8280-0
* code.coding[snomedWaistCircumCode] = $SCT#276361009
* code.text = "Waist circumference"
* subject.reference.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* subject.reference.extension[=].valueString = "'Patient/' + %resource.repeat(item).where(linkId='patientIdExamination').answer.value"
* effectiveDateTime.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* effectiveDateTime.extension[=].valueString = "%resource.repeat(item).where(linkId='3eb3b929-e67a-4331-8949-b8447b66a4c7').answer.value.toDateTime()"
* valueQuantity.value.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* valueQuantity.value.extension[=].valueString = "%resource.repeat(item).where(linkId='8df0f5d8-821d-4f71-b3c1-d164616ea2f5').answer.value"
* valueQuantity.unit = "cm"
* valueQuantity.system = $UCUM
* valueQuantity.code = #cm

Instance:   HeartRate
InstanceOf: $au-core-heartrate
Usage:  #inline  
* status = #final
* category[VSCat] = $observation-category#vital-signs
* code.coding[HeartRateCode] = $LNC#8867-4
* code.coding[snomedHeartRateCode] = $SCT#364075005
* code.text = "Heart rate"
* subject.reference.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* subject.reference.extension[=].valueString = "'Patient/' + %resource.repeat(item).where(linkId='patientIdExamination').answer.value"
* effectiveDateTime.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* effectiveDateTime.extension[=].valueString = "%resource.repeat(item).where(linkId='feeac08f-2ba6-4048-80a2-10b3f90cf5e3').answer.value.toDateTime()"
* valueQuantity.value.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* valueQuantity.value.extension[=].valueString = "%resource.repeat(item).where(linkId='49029ef0-eaa8-44f8-b26a-177820c82dfd').answer.value.toDecimal()"
* valueQuantity.unit = "/min"
* valueQuantity.system = $UCUM
* valueQuantity.code = #/min

Instance:   HeartRhythm
InstanceOf: Observation
Usage:  #inline  
* status = #final
* category = $observation-category#vital-signs
* code.coding[+] = $LNC#8884-9
* code.coding[+] = $SCT#364074009
* code.text = "Heart rhythm"
* subject.reference.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* subject.reference.extension[=].valueString = "'Patient/' + %resource.repeat(item).where(linkId='patientIdExamination').answer.value"
* effectiveDateTime.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* effectiveDateTime.extension[=].valueString = "%resource.repeat(item).where(linkId='eeb56682-0eae-4428-9c37-0e63852026c0').answer.value.toDateTime()"
* valueCodeableConcept.coding.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* valueCodeableConcept.coding.extension[=].valueString = "%resource.repeat(item).where(linkId='99a8eb6f-a36a-4daf-99d7-27bfde0d4bb1').answer.value"

Instance:   BloodPressure
InstanceOf: $au-core-bloodpressure
Usage:  #inline  
* status = #final
* category[VSCat] = $observation-category#vital-signs
* code.coding[BPCode] = $LNC#85354-9
* code.coding[snomedBPCode] = $SCT#75367002
* code.text = "Blood pressure"
* subject.reference.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* subject.reference.extension[=].valueString = "'Patient/' + %resource.repeat(item).where(linkId='patientIdExamination').answer.value"
* effectiveDateTime.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* effectiveDateTime.extension[=].valueString = "%resource.repeat(item).where(linkId='a005050c-ed79-46ed-ac14-2fc1496059a5').answer.value.toDateTime()"
* component[SystolicBP].code.coding[SBPCode] = $LNC#8480-6
* component[SystolicBP].code.coding[snomedSBP] = $SCT#271649006
* component[SystolicBP].code.text = "Systolic"
* component[SystolicBP].valueQuantity.value.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* component[SystolicBP].valueQuantity.value.extension[=].valueString = "%resource.repeat(item).where(linkId='e68b660d-cfd2-4b89-957a-c96a4c73a5fd').answer.value.toDecimal()"
* component[SystolicBP].valueQuantity.unit = "mm[Hg]"
* component[SystolicBP].valueQuantity.system = $UCUM
* component[SystolicBP].valueQuantity.code = #mm[Hg]
* component[DiastolicBP].code.coding[DBPCode] = $LNC#8462-4
* component[DiastolicBP].code.coding[snomedDBP] = $SCT#271650006
* component[DiastolicBP].code.text = "Diastolic"
* component[DiastolicBP].valueQuantity.value.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* component[DiastolicBP].valueQuantity.value.extension[=].valueString = "%resource.repeat(item).where(linkId='867b0022-f812-4f80-b287-79686c972b15').answer.value.toDecimal()"
* component[DiastolicBP].valueQuantity.unit = "mm[Hg]"
* component[DiastolicBP].valueQuantity.system = $UCUM
* component[DiastolicBP].valueQuantity.code = #mm[Hg]

Instance:   Condition
InstanceOf: $au-core-condition
Usage:  #inline  
* clinicalStatus.coding.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* clinicalStatus.coding.extension[=].valueString = "%resource.repeat(item).where(linkId='a7e056be-fb6f-4f7f-b04d-5b809e1e18e3').answer.value"
* category.coding = $condition-category#problem-list-item
* code.coding.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* code.coding.extension[=].valueString = "%resource.repeat(item).where(linkId='2da85994-2d5e-42f1-8a81-abf44f397468').answer.value"
* subject.reference.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* subject.reference.extension[=].valueString = "'Patient/' + %resource.repeat(item).where(linkId='patientIdMedicalHistory').answer.value"
* onsetDateTime.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* onsetDateTime.extension[=].valueString = "%resource.repeat(item).where(linkId='e4524654-f6de-4717-b288-34919394d46b').answer.value.toDateTime()"

