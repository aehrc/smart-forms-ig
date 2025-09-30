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
Alias: $au-core-headcircum = http://hl7.org.au/fhir/core/StructureDefinition/au-core-headcircum
Alias: $au-core-waistcircum = http://hl7.org.au/fhir/core/StructureDefinition/au-core-waistcircum
Alias: $au-core-heartrate = http://hl7.org.au/fhir/core/StructureDefinition/au-core-heartrate
Alias: $au-core-bloodpressure = http://hl7.org.au/fhir/core/StructureDefinition/au-core-bloodpressure
Alias: $au-core-condition = http://hl7.org.au/fhir/core/StructureDefinition/au-core-condition
Alias: $au-core-allergyintolerance = http://hl7.org.au/fhir/core/StructureDefinition/au-core-allergyintolerance
Alias: $au-core-immunization = http://hl7.org.au/fhir/core/StructureDefinition/au-core-immunization
Alias: $au-core-medicationstatement = http://hl7.org.au/fhir/core/StructureDefinition/au-core-medicationstatement


Alias: $observation-category = http://terminology.hl7.org/CodeSystem/observation-category

Instance:   SmokingStatusTemplate
InstanceOf: Observation
Usage:  #inline  
* status = #final
* category[+] = $observation-category#social-history
* code.coding[+] = $SCT#1747861000168109
* code.coding[+] = $LNC#72166-2
* code.text = "Smoking status"
* subject.reference.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* subject.reference.extension[=].valueString = "%resource.subject.reference"
* effectiveDateTime.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* effectiveDateTime.extension[=].valueString = "%resource.repeat(item).where(linkId='substanceuse-smoking-smokingstatus-group-newdate').answer.value.toDateTime()"
* valueCodeableConcept.coding.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* valueCodeableConcept.coding.extension[=].valueString = "$this.answer.value"

Instance:   BodyHeightLengthTemplate
InstanceOf: Observation
Usage:  #inline  
* status = #final
* category[+] = $observation-category#vital-signs
* code.coding[+] = $LNC#8302-2
* code.coding[+] = $SCT#50373000
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
InstanceOf: Observation
Usage:  #inline  
* status = #final
* category[+] = $observation-category#vital-signs
* code.coding[+] = $LNC#8302-2
* code.coding[+] = $SCT#50373000
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
InstanceOf: Observation
Usage:  #inline  
* status = #final
* category[+] = $observation-category#vital-signs
* code.coding[+] = $LNC#29463-7
* code.coding[+] = $SCT#27113001
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
InstanceOf: Observation
Usage:  #inline  
* status = #final
* category[+] = $observation-category#vital-signs
* code.coding[+] = $LNC#9843-4
* code.coding[+] = $SCT#363812007
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
InstanceOf: Observation
Usage:  #inline  
* status = #final
* category[+] = $observation-category#vital-signs
* code.coding[+] = $LNC#8280-0
* code.coding[+] = $SCT#276361009
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
InstanceOf: Observation
Usage:  #inline  
* status = #final
* category[+] = $observation-category#vital-signs
* code.coding[+] = $LNC#8867-4
* code.coding[+] = $SCT#364075005
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
InstanceOf: Observation
Usage:  #inline  
* status = #final
* category[+] = $observation-category#vital-signs
* code.coding[+] = $LNC#8884-9
* code.coding[+] = $SCT#364074009
* code.text = "Heart rhythm"
* subject.reference.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* subject.reference.extension[=].valueString = "%resource.subject.reference"
* effectiveDateTime.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* effectiveDateTime.extension[=].valueString = "%resource.repeat(item).where(linkId='obs-heartrhythm-newdate').answer.value.toDateTime()"
* valueCodeableConcept.coding.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* valueCodeableConcept.coding.extension[=].valueString = "$this.answer.value"

Instance:   BloodPressureTemplate
InstanceOf: Observation
Usage:  #inline  
* status = #final
* category[+] = $observation-category#vital-signs
* code.coding[+] = $LNC#85354-9
* code.coding[+] = $SCT#75367002
* code.text = "Blood pressure"
* subject.reference.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* subject.reference.extension[=].valueString = "%resource.subject.reference"
* effectiveDateTime.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* effectiveDateTime.extension[=].valueString = "%resource.repeat(item).where(linkId='bp-newbp-date').answer.value.toDateTime()"
* component[+].code.coding[+] = $LNC#8480-6
* component[=].code.coding[+] = $SCT#271649006
* component[=].code.text = "Systolic"
* component[=].valueQuantity.value.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* component[=].valueQuantity.value.extension[=].valueString = "$this.answer.value.toDecimal()"
* component[=].valueQuantity.unit = "mm[Hg]"
* component[=].valueQuantity.system = $UCUM
* component[=].valueQuantity.code = #mm[Hg]
* component[+].code.coding[+] = $LNC#8462-4
* component[=].code.coding[+] = $SCT#271650006
* component[=].code.text = "Diastolic"
* component[=].valueQuantity.value.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* component[=].valueQuantity.value.extension[=].valueString = "%resource.repeat(item).where(linkId='bp-newbp-diastolic').answer.value.toDecimal()"
* component[=].valueQuantity.unit = "mm[Hg]"
* component[=].valueQuantity.system = $UCUM
* component[=].valueQuantity.code = #mm[Hg]



Instance:   AllergyIntoleranceTemplate
InstanceOf: AllergyIntolerance
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

/*
Instance: AllergyIntoleranceClinicalStatusPatchTemplate
InstanceOf: Parameters
Usage: #inline


* parameter[+].name = "operation"
* parameter[=].part[+].name = "type"
* parameter[=].part[=].valueCode = #add
* parameter[=].part[+].name = "path"
* parameter[=].part[=].valueString = "AllergyIntolerance"
* parameter[=].part[+].name = "name"
* parameter[=].part[=].valueString = "clinicalStatus"
* parameter[=].part[+].name = "value"
* parameter[=].part[=].valueCodeableConcept.coding.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* parameter[=].part[=].valueCodeableConcept.coding.extension[=].valueString = "iif(item.where(linkId='allergysummary-status-hidden').answer.value.exists() and item.where(linkId='allergysummary-status').answer.value.empty(), ' ', iif(item.where(linkId='allergysummary-comment').answer.value.exists(), item.where(linkId='allergysummary-status').answer.value.first()))"
* parameter[=].part[+].name = "pathLabel"
* parameter[=].part[=].valueString = "Clinical status"
*/

Instance: AllergyIntolerancePatchTemplate
InstanceOf: Parameters
Usage: #inline


* parameter[+].name = "operation"
* parameter[=].part[+].name = "type"
* parameter[=].part[=].valueCode = #add
* parameter[=].part[+].name = "path"
* parameter[=].part[=].valueString = "AllergyIntolerance"
* parameter[=].part[+].name = "name"
* parameter[=].part[=].valueString = "clinicalStatus"
* parameter[=].part[+].name = "value"
* parameter[=].part[=].valueCodeableConcept.coding.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
// This logic ensures that if the hidden field has a value (indicating a prepop value exists) and the visible field is empty (a user has deleted it), a single space is used to clear the existing value in the AllergyIntolerance resource. If both fields have values, it uses the visible field's value.
* parameter[=].part[=].valueCodeableConcept.coding.extension[=].valueString = "iif(item.where(linkId='allergysummary-status-hidden').answer.value.exists() and item.where(linkId='allergysummary-status').answer.value.empty(), ' ', iif(item.where(linkId='allergysummary-status-hidden').answer.value.exists() and item.where(linkId='allergysummary-status').answer.value.exists(), item.where(linkId='allergysummary-status').answer.value.first()))"
* parameter[=].part[+].name = "pathLabel"
* parameter[=].part[=].valueString = "Clinical status"


* parameter[+].name = "operation"
* parameter[=].part[+].name = "type"
* parameter[=].part[=].valueCode = #add
* parameter[=].part[+].name = "path"
* parameter[=].part[=].valueString.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* parameter[=].part[=].valueString.extension[=].valueString = "iif(item.where(linkId='allergysummary-comment-hidden').answer.value.exists(), 'AllergyIntolerance.note[0]', 'AllergyIntolerance')"
* parameter[=].part[+].name = "name"
* parameter[=].part[=].valueString.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* parameter[=].part[=].valueString.extension[=].valueString = "iif(item.where(linkId='allergysummary-comment-hidden').answer.value.exists(), 'text', 'note')"
* parameter[=].part[+].name.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* parameter[=].part[=].name.extension[=].valueString = "iif(item.where(linkId='allergysummary-comment-hidden').answer.value.exists(), 'value')"
* parameter[=].part[=].valueMarkdown.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
// This logic ensures that if the hidden field has a value (indicating a prepop value exists) and the visible field is empty (a user has deleted it), a single space is used to clear the existing value in the AllergyIntolerance resource. If both fields have values, it uses the visible field's value.
* parameter[=].part[=].valueMarkdown.extension[=].valueString = "iif(item.where(linkId='allergysummary-comment-hidden').answer.value.exists() and item.where(linkId='allergysummary-comment').answer.value.empty(), ' ', iif(item.where(linkId='allergysummary-comment-hidden').answer.value.exists() and item.where(linkId='allergysummary-comment').answer.value.exists(), item.where(linkId='allergysummary-comment').answer.value.first()))"
* parameter[=].part[+].name.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* parameter[=].part[=].name.extension[=].valueString = "iif(item.where(linkId='allergysummary-comment-hidden').answer.value.empty(), 'value')"
* parameter[=].part[=].valueAnnotation.text.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* parameter[=].part[=].valueAnnotation.text.extension[=].valueString = "iif(item.where(linkId='allergysummary-comment-hidden').answer.value.empty(), item.where(linkId='allergysummary-comment').answer.value.first())"
* parameter[=].part[+].name = "pathLabel"
* parameter[=].part[=].valueString = "Comment"
/*
//delete
* parameter[+].name = "operation"
* parameter[=].part[+].name = "type"
* parameter[=].part[=].valueCode = #delete
* parameter[=].part[+].name = "path"
* parameter[=].part[=].valueString.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* parameter[=].part[=].valueString.extension[=].valueString = "iif(item.where(linkId='allergysummary-status-hidden').answer.value.exists() and item.where(linkId='allergysummary-status').answer.value.empty(), 'AllergyIntolerance.clinicalStatus')"
*/


Instance:   ImmunizationTemplate
InstanceOf: Immunization
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
InstanceOf: Condition
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
InstanceOf: Parameters
Usage: #inline
* parameter[+].name = "operation"
* parameter[=].part[+].name = "type"
* parameter[=].part[=].valueCode = #add
* parameter[=].part[+].name = "path"
* parameter[=].part[=].valueString = "Condition"
* parameter[=].part[+].name = "name"
* parameter[=].part[=].valueString = "clinicalStatus"
* parameter[=].part[+].name = "value"
* parameter[=].part[=].valueCodeableConcept.coding.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
// This logic ensures that if the hidden field has a value (indicating a prepop value exists) and the visible field is empty (a user has deleted it), a single space is used to clear the existing value in the resource. If both fields have values, it uses the visible field's value.
* parameter[=].part[=].valueCodeableConcept.coding.extension[=].valueString = "iif(item.where(linkId='medicalhistory-status-hidden').answer.value.exists() and item.where(linkId='88bcfad7-386b-4d87-b34b-2e50482e4d2c').answer.value.empty(), ' ', iif(item.where(linkId='medicalhistory-status-hidden').answer.value.exists() and item.where(linkId='88bcfad7-386b-4d87-b34b-2e50482e4d2c').answer.value.exists(), item.where(linkId='88bcfad7-386b-4d87-b34b-2e50482e4d2c').answer.value.first()))"
* parameter[=].part[+].name = "pathLabel"
* parameter[=].part[=].valueString = "Clinical status"
* parameter[+].name = "operation"
* parameter[=].part[+].name = "type"
* parameter[=].part[=].valueCode = #add
* parameter[=].part[+].name = "path"
* parameter[=].part[=].valueString = "Condition"
* parameter[=].part[+].name = "name"
* parameter[=].part[=].valueString = "abatement"
* parameter[=].part[+].name = "value"
* parameter[=].part[=].valueDateTime.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
// This logic ensures that if the hidden field has a value (indicating a prepop value exists) and the visible field is empty (a user has deleted it), a single space is used to clear the existing value in the resource. If both fields have values, it uses the visible field's value.
* parameter[=].part[=].valueDateTime.extension[=].valueString = "iif(item.where(linkId='medicalhistory-abatementdate-hidden').answer.value.exists() and item.where(linkId='e4524654-f6de-4717-b288-34919394d46b').answer.value.empty(), ' ', iif(item.where(linkId='medicalhistory-abatementdate-hidden').answer.value.exists() and item.where(linkId='e4524654-f6de-4717-b288-34919394d46b').answer.value.exists(), item.where(linkId='e4524654-f6de-4717-b288-34919394d46b').answer.value.first()))"
* parameter[=].part[+].name = "pathLabel"
* parameter[=].part[=].valueString = "Abatement date"


Instance:   MedicationStatementTemplate
InstanceOf: MedicationStatement
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
InstanceOf: Parameters
Usage: #inline
* parameter[+].name = "operation"
* parameter[=].part[+].name = "type"
* parameter[=].part[=].valueCode = #add
* parameter[=].part[+].name = "path"
* parameter[=].part[=].valueString = "MedicationStatement"
* parameter[=].part[+].name = "name"
* parameter[=].part[=].valueString = "status"
* parameter[=].part[+].name = "value"
* parameter[=].part[=].valueCode.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
// This logic ensures that if the hidden field has a value (indicating a prepop value exists) and the visible field is empty (a user has deleted it), a single space is used to clear the existing value in the resource. If both fields have values, it uses the visible field's value.
* parameter[=].part[=].valueCode.extension[=].valueString = "iif(item.where(linkId='regularmedications-summary-current-status-hidden').answer.value.exists() and item.where(linkId='regularmedications-summary-current-status').answer.value.empty(), ' ', iif(item.where(linkId='regularmedications-summary-current-status-hidden').answer.value.exists() and item.where(linkId='regularmedications-summary-current-status').answer.value.exists(), item.where(linkId='regularmedications-summary-current-status').answer.value.code.first()))"
* parameter[=].part[+].name = "pathLabel"
* parameter[=].part[=].valueString = "Status"

* parameter[+].name = "operation"
* parameter[=].part[+].name = "type"
* parameter[=].part[=].valueCode = #add
* parameter[=].part[+].name = "path"
* parameter[=].part[=].valueString.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* parameter[=].part[=].valueString.extension[=].valueString = "iif(item.where(linkId='regularmedications-summary-current-dosage-hidden').answer.value.exists(), 'MedicationStatement.dosage[0]', 'MedicationStatement')"
* parameter[=].part[+].name = "name"
* parameter[=].part[=].valueString.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* parameter[=].part[=].valueString.extension[=].valueString = "iif(item.where(linkId='regularmedications-summary-current-dosage-hidden').answer.value.exists(), 'text', 'dosage')"
* parameter[=].part[+].name.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* parameter[=].part[=].name.extension[=].valueString = "iif(item.where(linkId='regularmedications-summary-current-dosage-hidden').answer.value.exists(), 'value')"
* parameter[=].part[=].valueString.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
// This logic ensures that if the hidden field has a value (indicating a prepop value exists) and the visible field is empty (a user has deleted it), a single space is used to clear the existing value in the resource. If both fields have values, it uses the visible field's value.
* parameter[=].part[=].valueString.extension[=].valueString = "iif(item.where(linkId='regularmedications-summary-current-dosage-hidden').answer.value.exists() and item.where(linkId='regularmedications-summary-current-dosage').answer.value.empty(), ' ', iif(item.where(linkId='regularmedications-summary-current-dosage-hidden').answer.value.exists() and item.where(linkId='regularmedications-summary-current-dosage').answer.value.exists(), item.where(linkId='regularmedications-summary-current-dosage').answer.value.first()))"
* parameter[=].part[+].name.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* parameter[=].part[=].name.extension[=].valueString = "iif(item.where(linkId='regularmedications-summary-current-dosage-hidden').answer.value.empty(), 'value')"
* parameter[=].part[=].valueDosage.text.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* parameter[=].part[=].valueDosage.text.extension[=].valueString = "iif(item.where(linkId='regularmedications-summary-current-dosage-hidden').answer.value.empty(), item.where(linkId='regularmedications-summary-current-dosage').answer.value.first())"
* parameter[=].part[+].name = "pathLabel"
* parameter[=].part[=].valueString = "Dosage"

* parameter[+].name = "operation"
* parameter[=].part[+].name = "type"
* parameter[=].part[=].valueCode = #add
* parameter[=].part[+].name = "path"
* parameter[=].part[=].valueString.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* parameter[=].part[=].valueString.extension[=].valueString = "iif(item.where(linkId='regularmedications-summary-current-comment-hidden').answer.value.exists(), 'MedicationStatement.note[0]', 'MedicationStatement')"
* parameter[=].part[+].name = "name"
* parameter[=].part[=].valueString.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* parameter[=].part[=].valueString.extension[=].valueString = "iif(item.where(linkId='regularmedications-summary-current-comment-hidden').answer.value.exists(), 'text', 'note')"
* parameter[=].part[+].name.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* parameter[=].part[=].name.extension[=].valueString = "iif(item.where(linkId='regularmedications-summary-current-comment-hidden').answer.value.exists(), 'value')"
* parameter[=].part[=].valueMarkdown.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
// This logic ensures that if the hidden field has a value (indicating a prepop value exists) and the visible field is empty (a user has deleted it), a single space is used to clear the existing value in the resource. If both fields have values, it uses the visible field's value.
* parameter[=].part[=].valueMarkdown.extension[=].valueString = "iif(item.where(linkId='regularmedications-summary-current-comment-hidden').answer.value.exists() and item.where(linkId='regularmedications-summary-current-comment').answer.value.empty(), ' ', iif(item.where(linkId='regularmedications-summary-current-comment-hidden').answer.value.exists() and item.where(linkId='regularmedications-summary-current-comment').answer.value.exists(), item.where(linkId='regularmedications-summary-current-comment').answer.value.first()))"
* parameter[=].part[+].name.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* parameter[=].part[=].name.extension[=].valueString = "iif(item.where(linkId='regularmedications-summary-current-comment-hidden').answer.value.empty(), 'value')"
* parameter[=].part[=].valueAnnotation.text.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* parameter[=].part[=].valueAnnotation.text.extension[=].valueString = "iif(item.where(linkId='regularmedications-summary-current-comment-hidden').answer.value.empty(), item.where(linkId='regularmedications-summary-current-comment').answer.value.first())"
* parameter[=].part[+].name = "pathLabel"
* parameter[=].part[=].valueString = "Comment"