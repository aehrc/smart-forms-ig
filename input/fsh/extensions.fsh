Extension: ContainedResourceReference
Id: ContainedResourceReference
Title: "Contained Resource Reference"
Description: "This extension is intended to be used as a work around to a known bug whereby contained resources that are not referenced with the type, 'Reference' are removed before a resource is created in a HAPI FHIR server. This is problematic when referencing with the type, 'canonical'. The extension can be used to reference contained resources so they are retained when added to a HAPI FHIR server."

* value[x] only Reference

Extension: TemplateExtractExtensionExtended
Parent: http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract
Id: TemplateExtractExtensionExtended
Title: "Template Extract Extension Extended"
Description: "This extension is used to extend the Template Extract Extension to include additional information."

* extension contains type 0..1
* extension[type] ^short = "Patch resource type"
* extension[type] ^definition = "When templating a Parameters resource, this is the kind of resource to be patched. It is used to help populate the request url."
* extension[type].value[x] 1..
* extension[type].value[x] only code
* extension[type].value[x] from ResourceType (required)