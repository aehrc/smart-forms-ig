### Usage Scenarios

This profile supports updating AllergyIntolerance resource elements that are applicable to Smart Health Checks using the FHIRPath patch method. FHIRPath patch uses the Parameters resource to describe how a patch operation should be performed.

The elements that can be updated using this profile are as follows:

<table>
    <tr>
        <th>Profile</th>
        <th>Element path</th>
    </tr>
    <tr>
        <td><a href="StructureDefinition-SHCAllergyIntolerance.html">Smart Health Checks AllergyIntolerance</a></td>
        <td><ul><li><code>AllergyIntolerance.clinicalStatus</code></li><li><code>AllergyIntolerance.note[0].text</code></li></ul></td>
    </tr>
</table>

### Profile Specific Implementation Guidance

- `Parameters.parameter.part:path.value[x]:valueString` **SHALL** identify one of the relevant AllergyIntolerance element paths included in the [Smart Health Checks Patch AllergyIntolerance Element Path value set](ValueSet-SHCPatchAllergyIntoleranceElementPath.html): `AllergyIntolerance` or `AllergyIntolerance.note[0]`.
- `Parameters.parameter.part:name.value[x]:valueString` **SHALL** identify one of the relevant AllergyIntolerance element paths included in the [Smart Health Checks Patch AllergyIntolerance Element Name value set](ValueSet-SHCPatchAllergyIntoleranceElementName.html): `clinicalStatus`, `note` or `text`.
- When the path value is `AllergyIntolerance` and the name value is `clinicalStatus`: 
  - `Parameters.parameter.part:value.value[x]` **SHALL** be of type `CodeableConcept`
  - `Parameters.parameter.part:value.value[x]:valueCodeableConcept` **SHALL** have a value from the [Allergy Intolerance Clinical Status Minimal value set](ValueSet-AllergyIntoleranceClinicalStatusMinimal.html).
- When the path value is `AllergyIntolerance` and the name value is `note`:
  - `Parameters.parameter.part:value.value[x]` **SHALL** be of type `Annotation`. 
- When the path value is `AllergyIntolerance.note[0]` and the name value is `text`:
  - `Parameters.parameter.part:value.value[x]` **SHALL** be of type `markdown`. 

Illustrative examples are provided.