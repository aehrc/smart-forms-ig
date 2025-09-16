### Usage Scenarios

This profile supports updating resources relevant to Smart Health Checks using the FHIRPath patch method. FHIRPath patch uses the Parameters resource to describe how a patch operation should be performed.

It describes how to represent patch operations against several specific elements in three different resource types. The resources and elements that can be updated using this profile are as follows:

| Profile | Element path |
| --- | --- |
| [Smart Health Checks AllergyIntolerance](StructureDefinition-SHCAllergyIntolerance.html)  | `clinicalStatus`<br/>`note[0].text` |
| [Smart Health Checks Condition](StructureDefinition-SHCCondition.html)  | `clinicalStatus`<br/>`abatement` |
| [Smart Health Checks MedicationStatement](StructureDefinition-SHCMedicationStatement.html)  | `status`<br/>`dosage[0].text`<br/>`note[0].text` |

### Profile Specific Implementation Guidance

#### SHC AllergyIntolerance
- `Parameters.parameter.part:path.value[x]:valueString` **SHALL** identify one of the relevant AllergyIntolerance reource paths included in the [Smart Health Checks Patch Path value set](ValueSet-SHCPatchPath.html): `AllergyIntolerance.clinicalStatus` or `AllergyIntolerance.note[0].text`.
- When the path value is `AllergyIntolerance.clinicalStatus`: 
  - `Parameters.parameter.part:value.value[x]` **SHALL** be of type `CodeableConcept`.
  - `Parameters.parameter.part:value.value[x]:valueCodeableConcept.coding` **SHALL** have a value from the [Allergy Intolerance Clinical Status Minimal value set](ValueSet-AllergyIntoleranceClinicalStatusMinimal.html).
- When the path value is `AllergyIntolerance.note[0].text`:
  - `Parameters.parameter.part:value.value[x]` **SHALL** be of type `markdown`. 

#### SHC Condition
- `Parameters.parameter.part:path.value[x]:valueString` **SHALL** identify one of the relevant Condition resource paths included in the [Smart Health Checks Patch Path value set](ValueSet-SHCPatchPath.html): `Condition.clinicalStatus` or `Condition.abatement`.
- When the path value is `Condition.clinicalStatus`:
  - `Parameters.parameter.part:value.value[x]` **SHALL** be of type `CodeableConcept`.
  - `Parameters.parameter.part:value.value[x]:valueCodeableConcept.coding` **SHALL** have a value from the [Condition Clinical Status Codes value set]({{site.data.fhir.path}}valueset-condition-clinical.html).
- When the path value is `Condition.abatement`:
  - `Parameters.parameter.part:value.value[x]` **SHALL** be of type `dateTime`. 

#### SHC MedicationStatement
- `Parameters.parameter.part:path.value[x]:valueString` **SHALL** identify one of the relevant MedicationStatement reource paths included in the [Smart Health Checks Patch Path value set](ValueSet-SHCPatchPath.html): `MedicationStatement.status`, `MedicationStatement.note[0].text` or `MedicationStatement.dosage[0].text`.
- When the path value is `MedicationStatement.status`:
  - `Parameters.parameter.part:value.value[x]` **SHALL** be of type `code`.
  - `Parameters.parameter.part:value.value[x]:valueCode` **SHALL** have a value from the [Medication Statement Status Limited value set](ValueSet-AllergyIntoleranceClinicalStatusMinimal.html).
- When the path value is `MedicationStatement.note[0].text`:
  - `Parameters.parameter.part:value.value[x]` **SHALL** be of type `markdown`.
- When the path value is `MedicationStatement.dosage[0].text`:
  - `Parameters.parameter.part:value.value[x]` **SHALL** be of type `string`.


Examples are provided to illustrate Parameters resources to patch the supported elements and resources.
