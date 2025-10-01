Extension: ContainedResourceReference
Id: ContainedResourceReference
Title: "Contained Resource Reference"
Description: "This extension is intended to be used as a work around to a known bug whereby contained resources that are not referenced with the type, 'Reference' are removed before a resource is created in a HAPI FHIR server. This is problematic when referencing with the type, 'canonical'. The extension can be used to reference contained resources so they are retained when added to a HAPI FHIR server."

* value[x] 1..
* value[x] only Reference

Extension: TemplateExtractExtensionPatchRequestUrl
Parent: Extension
Id: TemplateExtractExtensionPatchRequestUrl
Title: "Template Extract Extension Patch Request URL"
Description: "This extension is used to specify the value of the request URL for a bundle entry containing a Parameters resource for a PATCH method. It identifies the resource instance being patched and will specify both the resource type and the resource Id. It is to be used as a sub-extension of the [Extract Template - Resource](https://build.fhir.org/ig/HL7/sdc/StructureDefinition-sdc-questionnaire-templateExtract.html) extension."
Context: http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract

* . ^short = "A FHIRPath expression to evaluate the bundle entry request URL for a PATCH entry (string result)"
* . ^example[+].label = "FHIRPath expression to PATCH an AllergyIntolerance resource." 
* . ^example[=].valueString = "'AllergyIntolerance/' + item.where(linkId='allergyIntoleranceId').answer.value"
* value[x] 1..
* value[x] only string

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

Extension: QuestionnaireInitialExpressionRepopulatable 
Id: questionnaire-initialExpression-repopulatable
Title: "Questionnaire Initial Expression Repopulatable"
Description: "This custom extension is used to add a UI component that allows a user to repopulate an individual Questionnaire item with the latest data from the FHIR server. This is useful for updating specific items without having to refresh the entire form."
Context: Questionnaire.item

* ^contextInvariant = "(type = 'string' or type = 'text' or type = 'integer' or type = 'decimal') and (repeats=false or repeats.empty()) and (extension.where(url = 'http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression').exists())"
* . 0..1
* . ^short = "Questionnaire Initial Expression Repopulatable"
* . ^definition = "The value defines the repopulation behaviour of a Questionnaire item."
* value[x] 1..
* value[x] only code
* value[x] from QuestionnaireRepopulationBehavior (required)

Extension: GroupHideAddItemButton
Id: GroupHideAddItemButton
Title: "Group Hide Add Item Button"
Description: "This custom extension is used to hide the UI component that allows a user to add new items for repeating groups in a Questionnaire. This is useful for preventing users from adding additional groups when it is not appropriate to do so, such as when a group is intended to be prepopulated with existing data but no new ones added by the user."
Context: Questionnaire.item

* ^contextInvariant = "type='group' and repeats=true"
* . 0..1
* . ^short = "Group hide add item button"
* . ^definition = "If true, the UI component that allows a user to add new items will be hidden."
* value[x] 1..
* value[x] only boolean