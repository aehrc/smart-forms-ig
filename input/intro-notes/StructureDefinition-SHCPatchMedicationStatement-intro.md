### Usage Scenarios

This profile supports updating MedicationStatement resource elements that are applicable to Smart Health Checks using the FHIRPath patch method. FHIRPath patch uses the Parameters resource to describe how a patch operation should be performed. Parameters resources will be generated and included in a transaction bundle following completion of a health check form according to the form's extract definition.

The elements that can be updated using this profile are as follows:

<table>
    <tr>
        <th>Profile</th>
        <th>Element path</th>
    </tr>
    <tr>
        <td><a href="StructureDefinition-SHCMedicationStatement.html">Smart Health Checks MedicationStatement</a></td>
        <td><ul><li><code>MedicationStatement.status</code></li><li><code>MedicationStatement.dosage</code></li><li><code>MedicationStatement.dosage[0].text</code></li><li><code>MedicationStatement.note</code></li><li><code>MedicationStatement.note[0].text</code></li></ul></td>
    </tr>
</table>

### Profile Specific Implementation Guidance

- `Parameters.parameter.part:path.value[x]:valueString` **SHALL** identify one of the relevant MedicationStatement element paths included in the [Smart Health Checks Patch MedicationStatement Element Path value set](ValueSet-SHCPatchMedicationStatementElementPath.html): `MedicationStatement`, `MedicationStatement.dosage[0]`, or `MedicationStatement.note[0]`.
- `Parameters.parameter.part:name.value[x]:valueString` **SHALL** identify one of the relevant MedicationStatement element paths included in the [Smart Health Checks Patch MedicationStatement Element Name value set](ValueSet-SHCPatchMedicationStatementElementName.html): `status`, `text`, `dosage` or `note`.
- When the path value is `MedicationStatement` and the name value is `status`:
  - `Parameters.parameter.part:value.value[x]` **SHALL** be of type `code`
  - `Parameters.parameter.part:value.value[x]:valueCode` **SHALL** have a value from the [Medication Statement Status Limited value set](ValueSet-MedicationStatementStatusLimited.html).
  - See example [SHCPatchMedicationStatement1](Parameters-SHCPatchMedicationStatement1.html), [SHCPatchMedicationStatement3](Parameters-SHCPatchMedicationStatement3.html) or [SHCPatchMedicationStatement4](Parameters-SHCPatchMedicationStatement4.html).
- When the path value is `MedicationStatement` and the name value is `dosage`:
  - `Parameters.parameter.part:value.value[x]` **SHALL** be of type `Dosage`.
  - This combination of path and value is used where a resource does not contain a dosage and a new one is to be added. 
  - See example [SHCPatchMedicationStatement3](Parameters-SHCPatchMedicationStatement3.html).
- When the path value is `MedicationStatement.dosage[0]` and the name value is `text`:
  - `Parameters.parameter.part:value.value[x]` **SHALL** be of type `string`.
  - This combination of path and value is used where a resource already contains a dosage and the text has been modified so the text will be replaced.
  - See example [SHCPatchMedicationStatement2](Parameters-SHCPatchMedicationStatement2.html) or [SHCPatchMedicationStatement4](Parameters-SHCPatchMedicationStatement4.html).
- When the path value is `MedicationStatement` and the name value is `note`:
  - `Parameters.parameter.part:value.value[x]` **SHALL** be of type `Annotation`
  - This combination of path and value is used where a resource does not contain a note and a new one is to be added. .
  - See example [SHCPatchMedicationStatement2](Parameters-SHCPatchMedicationStatement2.html).
- When the path value is `MedicationStatement.note[0]` and the name value is `text`:
  - `Parameters.parameter.part:value.value[x]` **SHALL** be of type `markdown`.
  - This combination of path and value is used where a resource already contains a note and the text has been modified so the text will be replaced.
  - See example [SHCPatchMedicationStatement1](Parameters-SHCPatchMedicationStatement1.html).

<div class="note" markdown="1">

`Parameters.parameter.part:value.value[x]` has *Must Support* obligations on each of the allowed data types. Due to a validation issue, it is not currently possible to have slices defined for both `valueCode` and `valueString`. For this reason, `valueString` is not currently defined as a slice and does not have *Must Support* obligations included in the StructureDefinition. 

`valueString` is to be considered a *Must Support* data type with the same obligations as the other allowed data types (as below).

| Obligations | Actor |
| --- | --- |
| `SHALL:process` | SHC Host FHIR Server |
| `SHALL:populate-if-known` | SHC App |

</div>
