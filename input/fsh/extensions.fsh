Extension: ContainedResourceReference
Id: ContainedResourceReference
Title: "Contained Resource Reference"
Description: "This extension is intended to be used as a work around to a known bug whereby contained resources that are not referenced with the type, 'Reference' are removed before a resource is created in a HAPI FHIR server. This is problematic when referencing with the type, 'canonical'. The extension can be used to reference contained resources so they are retained when added to a HAPI FHIR server."

* value[x] only Reference

Extension: ConditionEnvironmentAcquired
Id: ConditionEnvironmentAcquired
Title: "Condition Location"
Description: "The location where the condition was acquired."

* ^context.type = #element
* ^context.expression = "Condition"
* value[x] 1..
* value[x] only CodeableConcept or Reference(Location)
