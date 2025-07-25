Extension: ContainedResourceReference
Id: ContainedResourceReference
Title: "Contained Resource Reference"
Description: "This extension is intended to be used as a work around to a known bug whereby contained resources that are not referenced with the type, 'Reference' are removed before a resource is created in a HAPI FHIR server. This is problematic when referencing with the type, 'canonical'. The extension can be used to reference contained resources so they are retained when added to a HAPI FHIR server."

* value[x] 1..
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

Extension: QuestionnaireItemTextHidden
Id: QuestionnaireItemTextHidden
Title: "Questionnaire Item Text Hidden"
Description: "This custom extension is used to indicate that the text of a Questionnaire item should be hidden in the user interface. This is useful for items where the text is not intended to be displayed to the user but is still needed for other processes."
Context: Questionnaire.item.text

* . 0..1
* . ^short = "Don't display text to user"
* . ^definition = "If true, indicates that the text of an item should not be displayed to the user."
* value[x] 1..
* value[x] only boolean

Extension: GranularRepopulateSync
Id: GranularRepopulateSync
Title: "Granular Repopulate Sync"
Description: "This custom extension is used to add a UI component that allows a user to repopulate an individual Questionnaire item with the latest data from the FHIR server. This is useful for updating specific items without having to refresh the entire form."
Context: Questionnaire.item

* . 0..1
* . ^short = "Granular repopulate sync"
* . ^definition = "If true, the item will be able to be individually repopulated with the latest data from the FHIR server."
* value[x] 1..
* value[x] only boolean

Extension: GroupHideAddItemButton
Id: GroupHideAddItemButton
Title: "Group Hide Add Item Button"
Description: "This custom extension is used to hide the UI component that allows a user to add new items for repeating groups in a Questionnaire. This is useful for preventing users from adding additional items to a group when it is not appropriate to do so, such as when a group is intended to be prepopulated with existing data but no new ones added by the user."
Context: Questionnaire.item

* ^contextInvariant = "type='group' and repeats=true"
* . 0..1
* . ^short = "Group hide add item button"
* . ^definition = "If true, the UI component that allows a user to add new items will be hidden."
* value[x] 1..
* value[x] only boolean