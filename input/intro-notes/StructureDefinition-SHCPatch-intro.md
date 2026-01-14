### Usage Scenarios

This profile supports updating resources relevant to Smart Health Checks using the FHIRPath patch method. FHIRPath patch uses the Parameters resource to describe how a patch operation should be performed.

It describes how to represent patch operations against several specific elements in three different resource types. The resources and elements that can be updated using this profile are as follows:

<table>
    <tr>
        <th>Profile</th>
        <th>Patch element path</th>
    </tr>
    <tr>
        <td><a href="StructureDefinition-SHCAllergyIntolerance.html">Smart Health Checks AllergyIntolerance</a></td>
        <td><ul><li><code>clinicalStatus</code></li><li><code>note[0].text</code></li></ul></td>
    </tr>
    <tr>
        <td><a href="StructureDefinition-SHCCondition.html">Smart Health Checks Condition</a></td>
        <td><ul><li><code>clinicalStatus</code></li><li><code>abatement</code></li></ul></td>
    </tr>
    <tr>
        <td><a href="StructureDefinition-SHCMedicationStatement.html">Smart Health Checks MedicationStatement</a></td>
        <td><ul><li><code>status</code></li><li><code>dosage[0].text</code></li><li><code>note[0].text</code></li></ul></td>
    </tr>
</table>

### Profile Specific Implementation Guidance

Each resource to be patched requires a separate Parameters resource that includes the details of the operation. This section describes SHC Patch Parameters profile requirements applicable to updating each of the allowed resource profiles.

#### SHC AllergyIntolerance
- `Parameters.parameter.part:path.value[x]:valueString` **SHALL** identify one of the relevant AllergyIntolerance element paths included in the [Smart Health Checks Patch Path value set](ValueSet-SHCPatchPath.html): `AllergyIntolerance.clinicalStatus` or `AllergyIntolerance.note[0].text`.
- When the path value is `AllergyIntolerance.clinicalStatus`: 
  - `Parameters.parameter.part:value.value[x]` **SHALL** be of type `CodeableConcept`
  - `Parameters.parameter.part:value.value[x]:valueCodeableConcept.coding` **SHALL** have a value from the [Allergy Intolerance Clinical Status Minimal value set](ValueSet-AllergyIntoleranceClinicalStatusMinimal.html).
- When the path value is `AllergyIntolerance.note[0].text`:
  - `Parameters.parameter.part:value.value[x]` **SHALL** be of type `markdown`. 

#### SHC Condition
- `Parameters.parameter.part:path.value[x]:valueString` **SHALL** identify one of the relevant Condition element paths included in the [Smart Health Checks Patch Path value set](ValueSet-SHCPatchPath.html): `Condition.clinicalStatus` or `Condition.abatement`.
- When the path value is `Condition.clinicalStatus`:
  - `Parameters.parameter.part:value.value[x]` **SHALL** be of type `CodeableConcept`
  - `Parameters.parameter.part:value.value[x]:valueCodeableConcept.coding` **SHALL** have a value from the [Condition Clinical Status Codes value set](ValueSet-ConditionClinicalStatusMinimal.html).
- When the path value is `Condition.abatement`:
  - `Parameters.parameter.part:value.value[x]` **SHALL** be of type `dateTime`. 

#### SHC MedicationStatement
- `Parameters.parameter.part:path.value[x]:valueString` **SHALL** identify one of the relevant MedicationStatement element paths included in the [Smart Health Checks Patch Path value set](ValueSet-SHCPatchPath.html): `MedicationStatement.status`, `MedicationStatement.note[0].text` or `MedicationStatement.dosage[0].text`.
- When the path value is `MedicationStatement.status`:
  - `Parameters.parameter.part:value.value[x]` **SHALL** be of type `code`
  - `Parameters.parameter.part:value.value[x]:valueCode` **SHALL** have a value from the [Medication Statement Status Limited value set](ValueSet-AllergyIntoleranceClinicalStatusMinimal.html).
- When the path value is `MedicationStatement.note[0].text`:
  - `Parameters.parameter.part:value.value[x]` **SHALL** be of type `markdown`.
- When the path value is `MedicationStatement.dosage[0].text`:
  - `Parameters.parameter.part:value.value[x]` **SHALL** be of type `string`.


Examples are provided to illustrate Parameters resources to patch the supported elements and resources.

<div class="note" markdown="1">

`Parameters.parameter.part:value.value[x]` has *Must Support* obligations on each of the allowed data types. Due to a validation issue, it is not currently possible to have slices defined for both `valueCode` and `valueString`. For that reason, `valueString` is not currently defined as a slice and does not have *Must Support* obligations included in the StructureDefinition. 

`valueString` is to be considered a *Must Support* data type with the same obligations as the other allowed data types (as below).

| Obligations | Actor |
| --- | --- |
| `SHALL:process` | SHC Host FHIR Server |
| `SHALL:populate-if-known` | SHC App |

</div>
