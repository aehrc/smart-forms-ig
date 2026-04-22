### Usage Scenarios
The following are supported usage scenarios for this profile:
* Retrieve and search for medication detail referenced by a patient's medication use statements for the purposes of prepopulating the Aboriginal and Torres Strait Islander Health Check form
* Record a patient's medication detail in the Aboriginal and Torres Strait Islander Health Check form

### Profile Specific Implementation Guidance

Medication resources **MAY** be used to represent medication detail when referenced from a [Smart Health Checks MedicationStatement](StructureDefinition-SHCMedicationStatement.html) resource. [SHC Host FHIR Server](ActorDefinition-SHCHostFHIRServer.html) actors that represent medication detail with an external reference to a Medication resource **SHALL** support returning Medication resources in response to a MedicationStatement search with `_include=MedicationStatement:medication`.

For writeback, a [SHC App](ActorDefinition-SHCApp.html) will record medication detail using `MedicationStatement.medicationCodeableConcept` directly rather than a separate Medication resource.
