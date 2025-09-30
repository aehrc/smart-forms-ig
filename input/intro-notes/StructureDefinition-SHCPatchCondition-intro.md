### Usage Scenarios

This profile supports updating Condition resource elements that are applicable to Smart Health Checks using the FHIRPath patch method. FHIRPath patch uses the Parameters resource to describe how a patch operation should be performed.

The elements that can be updated using this profile are as follows:

<table>
    <tr>
        <th>Profile</th>
        <th>Element path</th>
    </tr>
    <tr>
        <td><a href="StructureDefinition-SHCCondition.html">Smart Health Checks Condition</a></td>
        <td><ul><li><code>Condition.clinicalStatus</code></li><li><code>Condition.abatement</code></li></ul></td>
    </tr>
</table>

### Profile Specific Implementation Guidance

- `Parameters.parameter.part:path.value[x]:valueString` **SHALL** identify one of the relevant Condition element paths included in the [Smart Health Checks Patch Condition Element Path value set](ValueSet-SHCPatchConditionElementPath.html): `Condition`.
- `Parameters.parameter.part:name.value[x]:valueString` **SHALL** identify one of the relevant Condition element paths included in the [Smart Health Checks Patch Condition Element Name value set](ValueSet-SHCPatchConditionElementName.html): `clinicalStatus` or `abatement`.
- When the path value is `Condition` and the name value is `clinicalStatus`: 
  - `Parameters.parameter.part:value.value[x]` **SHALL** be of type `CodeableConcept`
  - `Parameters.parameter.part:value.value[x]:valueCodeableConcept` **SHALL** have a value from the [Condition Clinical Status Codes value set]({{site.data.fhir.path}}valueset-condition-clinical.html).
- When the path value is `Condition` and the name value is `abatement`:
  - `Parameters.parameter.part:value.value[x]` **SHALL** be of type `dateTime`. 

Illustrative examples are provided.
