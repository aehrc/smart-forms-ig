Alias: $LNC = http://loinc.org
Alias: $SCT = http://snomed.info/sct
Alias: $UCUM = http://unitsofmeasure.org


Alias: $sdc-questionnaire-templateExtractContext = http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractContext
Alias: $condition-category = http://terminology.hl7.org/CodeSystem/condition-category
Alias: $condition-clinical = http://terminology.hl7.org/CodeSystem/condition-clinical
Alias: $allergyintolerance-clinical = http://terminology.hl7.org/CodeSystem/allergyintolerance-clinical

Alias: $au-core-smokingstatus = http://hl7.org.au/fhir/core/StructureDefinition/au-core-smokingstatus
Alias: $au-core-bodyheight = http://hl7.org.au/fhir/core/StructureDefinition/au-core-bodyheight
Alias: $au-core-bodyweight = http://hl7.org.au/fhir/core/StructureDefinition/au-core-bodyweight
Alias: $au-core-au-core-headcircum = http://hl7.org.au/fhir/core/StructureDefinition/au-core-headcircum
Alias: $au-core-waistcircum = http://hl7.org.au/fhir/core/StructureDefinition/au-core-waistcircum
Alias: $au-core-heartrate = http://hl7.org.au/fhir/core/StructureDefinition/au-core-heartrate
Alias: $au-core-bloodpressure = http://hl7.org.au/fhir/core/StructureDefinition/au-core-bloodpressure
Alias: $au-core-condition = http://hl7.org.au/fhir/core/StructureDefinition/au-core-condition
Alias: $au-core-allergyintolerance = http://hl7.org.au/fhir/core/StructureDefinition/au-core-allergyintolerance
Alias: $au-core-immunization = http://hl7.org.au/fhir/core/StructureDefinition/au-core-immunization
Alias: $au-core-medicationstatement = http://hl7.org.au/fhir/core/StructureDefinition/au-core-medicationstatement


Alias: $observation-category = http://terminology.hl7.org/CodeSystem/observation-category

Instance:   SmokingStatusTemplate
InstanceOf: SHCSmokingStatus
Usage:  #inline  
* status = #final
* category[socialHistory] = $observation-category#social-history
* code.coding[+] = $SCT#1747861000168109
* code.coding[loincSmokingStatus][+] = $LNC#72166-2
* code.text = "Smoking status"
* subject.reference.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* subject.reference.extension[=].valueString = "%resource.subject.reference"
* effectiveDateTime.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* effectiveDateTime.extension[=].valueString = "%resource.repeat(item).where(linkId='substanceuse-smoking-smokingstatus-group-newdate').answer.value.toDateTime()"
* valueCodeableConcept.coding.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* valueCodeableConcept.coding.extension[=].valueString = "$this.answer.value"

Instance:   BodyHeightLengthTemplate
InstanceOf: SHCBodyHeight
Usage:  #inline  
* status = #final
* category[VSCat] = $observation-category#vital-signs
* code.coding[BodyHeightCode] = $LNC#8302-2
* code.coding[snomedBodyHeightCode] = $SCT#50373000
* code.text = "Height"
* subject.reference.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* subject.reference.extension[=].valueString = "%resource.subject.reference"
* effectiveDateTime.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* effectiveDateTime.extension[=].valueString = "%resource.repeat(item).where(linkId='obs-lengthheight-newdate').answer.value.toDateTime()"
* valueQuantity.value.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* valueQuantity.value.extension[=].valueString = "$this.answer.value"
* valueQuantity.unit = "cm"
* valueQuantity.system = $UCUM
* valueQuantity.code = #cm

Instance:   BodyHeightTemplate
InstanceOf: SHCBodyHeight
Usage:  #inline  
* status = #final
* category[VSCat] = $observation-category#vital-signs
* code.coding[BodyHeightCode] = $LNC#8302-2
* code.coding[snomedBodyHeightCode] = $SCT#50373000
* code.text = "Height"
* subject.reference.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* subject.reference.extension[=].valueString = "%resource.subject.reference"
* effectiveDateTime.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* effectiveDateTime.extension[=].valueString = "%resource.repeat(item).where(linkId='obs-height-newdate').answer.value.toDateTime()"
* valueQuantity.value.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* valueQuantity.value.extension[=].valueString = "$this.answer.value"
//* valueQuantity.value.extension[=].valueString = "%resource.repeat(item).where(linkId='7035c7e7-ada3-4c6b-9ea8-f39666f5d4ea').answer.value"
* valueQuantity.unit = "cm"
* valueQuantity.system = $UCUM
* valueQuantity.code = #cm

Instance:   BodyWeightTemplate
InstanceOf: SHCBodyWeight
Usage:  #inline  
* status = #final
* category[VSCat] = $observation-category#vital-signs
* code.coding[BodyWeightCode] = $LNC#29463-7
* code.coding[snomedBodyWeightCode] = $SCT#27113001
* code.text = "Weight"
* subject.reference.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* subject.reference.extension[=].valueString = "%resource.subject.reference"
* effectiveDateTime.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* effectiveDateTime.extension[=].valueString = "%resource.repeat(item).where(linkId='obs-weight-newdate').answer.value.toDateTime()"
* valueQuantity.value.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* valueQuantity.value.extension[=].valueString = "$this.answer.value"
* valueQuantity.unit = "kg"
* valueQuantity.system = $UCUM
* valueQuantity.code = #kg

Instance:   HeadCircumferenceTemplate
InstanceOf: SHCHeadCircumference
Usage:  #inline  
* status = #final
* category[VSCat] = $observation-category#vital-signs
* code.coding[HeadCircumCode] = $LNC#9843-4
* code.coding[snomedHeadCircumCode] = $SCT#363812007
* code.text = "Head circumference"
* subject.reference.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* subject.reference.extension[=].valueString = "%resource.subject.reference"
* effectiveDateTime.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* effectiveDateTime.extension[=].valueString = "%resource.repeat(item).where(linkId='obs-headcircumference-newdate').answer.value.toDateTime()"
* valueQuantity.value.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* valueQuantity.value.extension[=].valueString = "$this.answer.value"
* valueQuantity.unit = "cm"
* valueQuantity.system = $UCUM
* valueQuantity.code = #cm

Instance:   WaistCircumferenceTemplate
InstanceOf: SHCWaistCircumference
Usage:  #inline  
* status = #final
* category[VSCat] = $observation-category#vital-signs
* code.coding[loincWaistCircumCode] = $LNC#8280-0
* code.coding[snomedWaistCircumCode] = $SCT#276361009
* code.text = "Waist circumference"
* subject.reference.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* subject.reference.extension[=].valueString = "%resource.subject.reference"
* effectiveDateTime.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* effectiveDateTime.extension[=].valueString = "%resource.repeat(item).where(linkId='obs-waistcircumference-newdate').answer.value.toDateTime()"
* valueQuantity.value.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* valueQuantity.value.extension[=].valueString = "$this.answer.value"
* valueQuantity.unit = "cm"
* valueQuantity.system = $UCUM
* valueQuantity.code = #cm

Instance:   HeartRateTemplate
InstanceOf: SHCHeartRate
Usage:  #inline  
* status = #final
* category[VSCat] = $observation-category#vital-signs
* code.coding[HeartRateCode] = $LNC#8867-4
* code.coding[snomedHeartRateCode] = $SCT#364075005
* code.text = "Heart rate"
* subject.reference.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* subject.reference.extension[=].valueString = "%resource.subject.reference"
* effectiveDateTime.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* effectiveDateTime.extension[=].valueString = "%resource.repeat(item).where(linkId='obs-heartrate-newdate').answer.value.toDateTime()"
* valueQuantity.value.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* valueQuantity.value.extension[=].valueString = "$this.answer.value.toDecimal()"
* valueQuantity.unit = "/min"
* valueQuantity.system = $UCUM
* valueQuantity.code = #/min

Instance:   HeartRhythmTemplate
InstanceOf: SHCHeartRhythm
Usage:  #inline  
* status = #final
* category[vitalSignsCategory] = $observation-category#vital-signs
* code.coding[loincHeartRhythmCode] = $LNC#8884-9
* code.coding[snomedHeartRhythmCode] = $SCT#364074009
* code.text = "Heart rhythm"
* subject.reference.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* subject.reference.extension[=].valueString = "%resource.subject.reference"
* effectiveDateTime.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* effectiveDateTime.extension[=].valueString = "%resource.repeat(item).where(linkId='obs-heartrhythm-newdate').answer.value.toDateTime()"
* valueCodeableConcept.coding.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* valueCodeableConcept.coding.extension[=].valueString = "$this.answer.value"

Instance:   BloodPressureTemplate
InstanceOf: SHCBloodPressure
Usage:  #inline  
* status = #final
* category[VSCat] = $observation-category#vital-signs
* code.coding[BPCode] = $LNC#85354-9
* code.coding[snomedBPCode] = $SCT#75367002
* code.text = "Blood pressure"
* subject.reference.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* subject.reference.extension[=].valueString = "%resource.subject.reference"
* effectiveDateTime.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* effectiveDateTime.extension[=].valueString = "item.where(linkId='bp-newbp-date').answer.value.toDateTime()"
* component[SystolicBP].code.coding[SBPCode] = $LNC#8480-6
* component[SystolicBP].code.coding[snomedSBP] = $SCT#271649006
* component[SystolicBP].code.text = "Systolic"
* component[SystolicBP].valueQuantity.value.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* component[SystolicBP].valueQuantity.value.extension[=].valueString = "$this.answer.value.toDecimal()"
* component[SystolicBP].valueQuantity.unit = "mm[Hg]"
* component[SystolicBP].valueQuantity.system = $UCUM
* component[SystolicBP].valueQuantity.code = #mm[Hg]
* component[DiastolicBP].code.coding[DBPCode] = $LNC#8462-4
* component[DiastolicBP].code.coding[snomedDBP] = $SCT#271650006
* component[DiastolicBP].code.text = "Diastolic"
* component[DiastolicBP].valueQuantity.value.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* component[DiastolicBP].valueQuantity.value.extension[=].valueString = "%resource.repeat(item).where(linkId='bp-newbp-diastolic').answer.value.toDecimal()"
* component[DiastolicBP].valueQuantity.unit = "mm[Hg]"
* component[DiastolicBP].valueQuantity.system = $UCUM
* component[DiastolicBP].valueQuantity.code = #mm[Hg]



Instance:   AllergyIntoleranceTemplate
InstanceOf: SHCAllergyIntolerance
Usage:  #inline
* clinicalStatus.coding = $allergyintolerance-clinical#active
* code.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractContext"
* code.extension[=].valueString = "item.where(linkId='allergynew-substance').answer.value"
* code.coding.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* code.coding.extension[=].valueString = "ofType(Coding)"
* code.text.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* code.text.extension[=].valueString = "ofType(string)"
* patient.reference.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* patient.reference.extension[=].valueString = "%resource.subject.reference"
* note.text.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* note.text.extension[=].valueString = "item.where(linkId='allergynew-comment').answer.value"
* reaction.manifestation[+].extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractContext"
* reaction.manifestation[=].extension.valueString = "item.where(linkId='allergynew-manifestation').answer.value.ofType(Coding)"
* reaction.manifestation[=].coding.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* reaction.manifestation[=].coding.extension.valueString = "$this"
* reaction.manifestation[+].extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractContext"
* reaction.manifestation[=].extension.valueString = "item.where(linkId='allergynew-manifestation').answer.value.ofType(string)"
* reaction.manifestation[=].text.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* reaction.manifestation[=].text.extension.valueString = "$this"


Instance: AllergyIntolerancePatchTemplate
// InstanceOf: http://hl7.org/fhir/StructureDefinition/fhirpath-patch
InstanceOf: Parameters
Usage: #inline
* parameter[+].name = "operation"
* parameter[=].part[+].name = "type"
* parameter[=].part[=].valueCode = #replace
* parameter[=].part[+].name = "path"
* parameter[=].part[=].valueString = "AllergyIntolerance.clinicalStatus"
* parameter[=].part[+].name = "name"
* parameter[=].part[=].valueString = "clinicalStatus"
* parameter[=].part[+].name = "value"
* parameter[=].part[=].valueCodeableConcept.coding.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* parameter[=].part[=].valueCodeableConcept.coding.extension[=].valueString = "item.where(linkId='allergysummary-status').answer.value.first()"

Instance:   ImmunizationTemplate
InstanceOf: SHCImmunization
Usage:  #inline
* status = #completed
* vaccineCode.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractContext"
* vaccineCode.extension[=].valueString = "item.where(linkId='vaccinestoday-vaccine').answer.value"
* vaccineCode.coding.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* vaccineCode.coding.extension[=].valueString = "ofType(Coding)"
* vaccineCode.text.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* vaccineCode.text.extension[=].valueString = "ofType(string)"
* patient.reference.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* patient.reference.extension[=].valueString = "%resource.subject.reference"
* occurrenceDateTime.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* occurrenceDateTime.extension[=].valueString = "item.where(linkId='vaccinestoday-date').answer.value.toDateTime()"
* lotNumber.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* lotNumber.extension[=].valueString = "item.where(linkId='vaccinestoday-batch').answer.value"
* note.text.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* note.text.extension[=].valueString = "item.where(linkId='vaccinestoday-comment').answer.value"

Instance:   ConditionTemplate
InstanceOf: SHCCondition
Usage:  #inline
* clinicalStatus.coding = $condition-clinical#active
* category.coding = $condition-category#problem-list-item
* code.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractContext"
* code.extension[=].valueString = "item.where(linkId='2da85994-2d5e-42f1-8a81-abf44f397468').answer.value"
* code.coding.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* code.coding.extension[=].valueString = "ofType(Coding)"
* code.text.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* code.text.extension[=].valueString = "ofType(string)"
* subject.reference.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* subject.reference.extension[=].valueString = "%resource.subject.reference"
* onsetDateTime.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* onsetDateTime.extension[=].valueString = "item.where(linkId='4d55bffb-3286-4a23-a785-3b9c346d464d').answer.value.toDateTime()"
* note.text.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* note.text.extension[=].valueString = "item.where(linkId='newdiagnosis-comment').answer.value"

Instance: ConditionPatchTemplate
// InstanceOf: http://hl7.org/fhir/StructureDefinition/fhirpath-patch
InstanceOf: Parameters
Usage: #inline
* parameter[+].name = "operation"
* parameter[=].part[+].name = "type"
* parameter[=].part[=].valueCode = #replace
* parameter[=].part[+].name = "path"
* parameter[=].part[=].valueString = "Condition.clinicalStatus"
* parameter[=].part[+].name = "name"
* parameter[=].part[=].valueString = "clinicalStatus"
* parameter[=].part[+].name = "value"
* parameter[=].part[=].valueCodeableConcept.coding.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* parameter[=].part[=].valueCodeableConcept.coding.extension[=].valueString = "item.where(linkId='88bcfad7-386b-4d87-b34b-2e50482e4d2c').answer.value.first()"
* parameter[+].name = "operation"
* parameter[=].part[+].name = "type"
* parameter[=].part[=].valueCode = #replace
* parameter[=].part[+].name = "path"
* parameter[=].part[=].valueString = "Condition.abatement"
* parameter[=].part[+].name = "name"
* parameter[=].part[=].valueString = "abatement"
* parameter[=].part[+].name = "value"
* parameter[=].part[=].valueDateTime.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* parameter[=].part[=].valueDateTime.extension[=].valueString = "item.where(linkId='e4524654-f6de-4717-b288-34919394d46b').answer.value.toDateTime()"


Instance:   MedicationStatementTemplate
InstanceOf: SHCMedicationStatement
Usage:  #inline
* status = #active
* medicationCodeableConcept.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractContext"
* medicationCodeableConcept.extension[=].valueString = "item.where(linkId='regularmedications-summary-new-medication').answer.value"
* medicationCodeableConcept.coding.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* medicationCodeableConcept.coding.extension[=].valueString = "ofType(Coding)"
* medicationCodeableConcept.text.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* medicationCodeableConcept.text.extension[=].valueString = "ofType(string)"
* subject.reference.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* subject.reference.extension[=].valueString = "%resource.subject.reference"
* dateAsserted.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* dateAsserted.extension[=].valueString = "now()"
* reasonCode[+].extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractContext"
* reasonCode[=].extension.valueString = "item.where(linkId='regularmedications-summary-new-reasoncode').answer.value.ofType(Coding)"
* reasonCode[=].coding.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* reasonCode[=].coding.extension.valueString = "$this"
* reasonCode[+].extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractContext"
* reasonCode[=].extension.valueString = "item.where(linkId='regularmedications-summary-new-reasoncode').answer.value.ofType(string)"
* reasonCode[=].text.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* reasonCode[=].text.extension.valueString = "$this"
* note.text.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* note.text.extension[=].valueString = "item.where(linkId='regularmedications-summary-new-comment').answer.value"
* dosage[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractContext"
* dosage[=].extension[=].valueString = "item.where(linkId='regularmedications-summary-new-dosage').answer.value"
* dosage[=].text.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* dosage[=].text.extension[=].valueString = "$this"

Instance: MedicationStatementPatchTemplate
// InstanceOf: http://hl7.org/fhir/StructureDefinition/fhirpath-patch
InstanceOf: Parameters
Usage: #inline
* parameter[+].name = "operation"
* parameter[=].part[+].name = "type"
* parameter[=].part[=].valueCode = #replace
* parameter[=].part[+].name = "path"
* parameter[=].part[=].valueString = "MedicationStatement.status"
* parameter[=].part[+].name = "name"
* parameter[=].part[=].valueString = "status"
* parameter[=].part[+].name = "value"
* parameter[=].part[=].valueCode.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* parameter[=].part[=].valueCode.extension[=].valueString = "item.where(linkId='regularmedications-summary-current-status').answer.value.code"