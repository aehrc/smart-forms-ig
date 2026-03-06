### Usage Scenarios

This profile supports MedicationStatement resources being exchanged for the purposes of both prepopulation and writeback.

### Profile Specific Implementation Guidance

MedicationStatement resources can include medication detail as:
1. `MedicationStatement.medicationCodeableConcept`
1. `MedicationStatement.medicationReference` with a reference to a [Smart Health Checks Medication](StructureDefinition-SHCMedication.html) resource using a [contained]({{site.data.fhir.path}}references.html#contained) resource
1. `MedicationStatement.medicationReference` with a reference to a [Smart Health Checks Medication](StructureDefinition-SHCMedication.html) resource using an external resource

For prepopulation, a [SHC Host FHIR Server](ActorDefinition-SHCHostFHIRServer.html) **SHALL** respond to search requests made by a [SHC App](ActorDefinition-SHCApp.html) by providing any one of the three variations listed. Obligations describing this are included in the profile and can be seen as:
- SHC Host FHIR Server [SHALL:populate-if-known](https://hl7.org/fhir/extensions/CodeSystem-obligation.html#obligation-SHALL.58populate-if-known) both `MedicationStatement.medicationCodeableConcept` and `MedicationStatement.medicationReference`.
- SHC App [SHALL:process](https://hl7.org/fhir/extensions/CodeSystem-obligation.html#obligation-SHALL.58process) both `MedicationStatement.medicationCodeableConcept` and `MedicationStatement.medicationReference`.


For writeback, a [SHC Host FHIR Server](ActorDefinition-SHCHostFHIRServer.html) **SHALL** consume resources that have been produced by a [SHC App](ActorDefinition-SHCApp.html). The SHC App will only produce the `MedicationStatement.medicationCodeableConcept` variant. Obligations describing this are included in the profile and can be seen as:
- SHC Host FHIR Server [SHALL:persist](https://hl7.org/fhir/extensions/CodeSystem-obligation.html#obligation-SHALL.58persist) `MedicationStatement.medicationCodeableConcept`.
- SHC App [SHALL:populate-if-known](https://hl7.org/fhir/extensions/CodeSystem-obligation.html#obligation-SHALL.58populate-if-known) `MedicationStatement.medicationCodeableConcept`.