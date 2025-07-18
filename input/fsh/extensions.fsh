Extension: ContainedResourceReference
Id: ContainedResourceReference
Title: "Contained Resource Reference"
Description: "This extension is intended to be used as a work around to a known bug whereby contained resources that are not referenced with the type, 'Reference' are removed before a resource is created in a HAPI FHIR server. This is problematic when referencing with the type, 'canonical'. The extension can be used to reference contained resources so they are retained when added to a HAPI FHIR server."

* value[x] only Reference

Extension: TemplateExtractExtensionExtended
Parent: http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract
Id: TemplateExtractExtensionExtended
Title: "Template Extract Extension Extended"
Description: "This extension is used to extend the [Extract Template - Resource](https://build.fhir.org/ig/HL7/sdc/StructureDefinition-sdc-questionnaire-templateExtract.html) extension to include additional information that supports the extraction of a [Parameters](https://hl7.org/fhir/R4/parameters.html) resource to be used with the [FHIRPath patch](https://hl7.org/fhir/R4/fhirpatch.html) mechanism of updating resources. An additional subextension is included to specify the type of resource that is being patched, which is necessary for constructing the request URL of an entry in a transaction bundle."

* extension contains type 0..1
* extension[type] ^short = "Patch resource type"
* extension[type] ^definition = "When templating a Parameters resource, this is the kind of resource to be patched. It is used to construct the request URL for the entry in a transaction bundle."
* extension[type].value[x] 1..
* extension[type].value[x] only code
* extension[type].value[x] from ResourceType (required)