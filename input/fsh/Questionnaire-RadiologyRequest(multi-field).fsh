Alias: $LNC = http://loinc.org
Alias: $SCT = http://snomed.info/sct
Alias: $UCUM = http://unitsofmeasure.org
Alias: $questionnaire-item-control = http://hl7.org/fhir/questionnaire-item-control
Alias: $display-category = http://hl7.org/fhir/questionnaire-display-category

Instance: RadiologyRequestFormMultifieldDemonstrator
InstanceOf: Questionnaire
Usage: #definition
Title: "Radiology Request Form (multifield demonstrator)"
Description: "Radiology Request Form (multifield demonstrator)"

//launch context
* extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext"
* extension[=].extension[+].url = "name"
* extension[=].extension[=].valueCoding = http://hl7.org/fhir/uv/sdc/CodeSystem/launchContext#patient
* extension[=].extension[+].url = "type"
* extension[=].extension[=].valueCode = #Patient
* extension[=].extension[+].url = "description"
* extension[=].extension[=].valueString = "The patient that is to be used to pre-populate the form"

* extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext"
* extension[=].extension[+].url = "name"
* extension[=].extension[=].valueCoding = http://hl7.org/fhir/uv/sdc/CodeSystem/launchContext#user
* extension[=].extension[+].url = "type"
* extension[=].extension[=].valueCode = #Practitioner
* extension[=].extension[+].url = "description"
* extension[=].extension[=].valueString = "The practitioner user that is to be used to pre-populate the form"

* extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext"
* extension[=].extension[+].url = "name"
* extension[=].extension[=].valueCoding = http://hl7.org/fhir/uv/sdc/CodeSystem/launchContext#encounter
* extension[=].extension[+].url = "type"
* extension[=].extension[=].valueCode = #Encounter
* extension[=].extension[+].url = "description"
* extension[=].extension[=].valueString = "The encounter that is to be used to pre-populate the form"

//fhir query variables
* extension[+].url = "http://hl7.org/fhir/StructureDefinition/variable"
* extension[=].valueExpression[+].name = "PractitionerRole"
* extension[=].valueExpression[=].language = #application/x-fhir-query
* extension[=].valueExpression[=].expression = "PractitionerRole?practitioner={{%user.id}}"
/*
// Structure Map
* extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-targetStructureMap"
* extension[=].valueCanonical = "https://smartforms.csiro.au/ig/StructureMap/AURadiologyReqFormExtract"
*/
// Metadata
* meta.profile[+] = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-render"
* meta.profile[+] = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-pop-exp"
* name = "RadiologyRequestMultifieldDemonstrator"
* title = "Radiology Request Form (multifield demonstrator)"
* status = #draft
* experimental = true
* subjectType[+] = #Patient
* date = "2024-09-03"
* jurisdiction.coding = urn:iso:std:iso:3166#AU

    // Provider
* item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-itemPopulationContext"
* item[=].extension[=].valueExpression[+].name = "PractitionerRoleRepeat"
* item[=].extension[=].valueExpression[=].language = #text/fhirpath
* item[=].extension[=].valueExpression[=].expression = "%PractitionerRole.entry.resource"
* item[=].linkId = "radiology-order"
* item[=].text = "Order details"
* item[=].type = #group
* item[=].repeats = false
* item[=].required = true

* item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].extension[=].valueExpression[=].expression = "now().toString()"
* item[=].item[=].linkId = "radiology-order-number"
* item[=].item[=].text = "Order number"
* item[=].item[=].type = #string
* item[=].item[=].repeats = false
* item[=].item[=].required = true

* item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].extension[=].valueExpression[=].expression = "'PractitionerRole/' + %PractitionerRoleRepeat.id"
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-hidden"
* item[=].item[=].extension[=].valueBoolean = true
* item[=].item[=].linkId = "radiology-order-requesterreference"
* item[=].item[=].text = "Requester reference"
* item[=].item[=].type = #string
* item[=].item[=].repeats = false

* item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].extension[=].valueExpression[=].expression = "%PractitionerRoleRepeat.identifier.where(system='http://ns.electronichealth.net.au/id/medicare-provider-number').value"
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-hidden"
* item[=].item[=].extension[=].valueBoolean = true
* item[=].item[=].linkId = "radiology-order-requesterdisplay"
* item[=].item[=].text = "Requester display"
* item[=].item[=].type = #string
* item[=].item[=].repeats = false

    // Service details
* item[+].linkId = "radiology-service"
* item[=].text = "Service details"
* item[=].type = #group
* item[=].repeats = true
* item[=].required = true

// Terminology POC variables
* item[=].item[+].extension[+].url = "http://hl7.org/fhir/StructureDefinition/variable"
* item[=].item[=].extension[=].valueExpression[+].name = "procedureFocus"
* item[=].item[=].extension[=].valueExpression[=].language = #text/fhirpath
* item[=].item[=].extension[=].valueExpression[=].expression = "item.repeat(item).where(linkId='radiology-service-examination-components-modality').answer.value"
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/variable"
* item[=].item[=].extension[=].valueExpression[+].name = "procedureFocusCode"
* item[=].item[=].extension[=].valueExpression[=].language = #text/fhirpath
* item[=].item[=].extension[=].valueExpression[=].expression = "%procedureFocus.code"
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/variable"
* item[=].item[=].extension[=].valueExpression[+].name = "procedureFocusDisplay"
* item[=].item[=].extension[=].valueExpression[=].language = #text/fhirpath
* item[=].item[=].extension[=].valueExpression[=].expression = "%procedureFocus.display"
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/variable"
* item[=].item[=].extension[=].valueExpression[+].name = "bodySite"
* item[=].item[=].extension[=].valueExpression[=].language = #text/fhirpath
* item[=].item[=].extension[=].valueExpression[=].expression = "item.repeat(item).where(linkId='radiology-service-examination-components-bodysite').answer.value"
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/variable"
* item[=].item[=].extension[=].valueExpression[+].name = "bodySiteCode"
* item[=].item[=].extension[=].valueExpression[=].language = #text/fhirpath
* item[=].item[=].extension[=].valueExpression[=].expression = "%bodySite.code"
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/variable"
* item[=].item[=].extension[=].valueExpression[+].name = "bodySiteDisplay"
* item[=].item[=].extension[=].valueExpression[=].language = #text/fhirpath
* item[=].item[=].extension[=].valueExpression[=].expression = "%bodySite.display"
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/variable"
* item[=].item[=].extension[=].valueExpression[+].name = "laterality"
* item[=].item[=].extension[=].valueExpression[=].language = #text/fhirpath
* item[=].item[=].extension[=].valueExpression[=].expression = "item.repeat(item).where(linkId='radiology-service-examination-components-laterality').answer.value"
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/variable"
* item[=].item[=].extension[=].valueExpression[+].name = "lateralityCode"
* item[=].item[=].extension[=].valueExpression[=].language = #text/fhirpath
* item[=].item[=].extension[=].valueExpression[=].expression = "%laterality.code"
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/variable"
* item[=].item[=].extension[=].valueExpression[+].name = "lateralityDisplay"
* item[=].item[=].extension[=].valueExpression[=].language = #text/fhirpath
* item[=].item[=].extension[=].valueExpression[=].expression = "%laterality.display"
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/variable"
* item[=].item[=].extension[=].valueExpression[+].name = "contrast"
* item[=].item[=].extension[=].valueExpression[=].language = #text/fhirpath
* item[=].item[=].extension[=].valueExpression[=].expression = "item.repeat(item).where(linkId='radiology-service-examination-components-contrast').answer.value"
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/variable"
* item[=].item[=].extension[=].valueExpression[+].name = "contrastCode"
* item[=].item[=].extension[=].valueExpression[=].language = #text/fhirpath
* item[=].item[=].extension[=].valueExpression[=].expression = "%contrast.code"
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/variable"
* item[=].item[=].extension[=].valueExpression[+].name = "contrastDisplay"
* item[=].item[=].extension[=].valueExpression[=].language = #text/fhirpath
* item[=].item[=].extension[=].valueExpression[=].expression = "%contrast.display"
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/variable"
* item[=].item[=].extension[=].valueExpression[+].name = "lateralityEnabled"
* item[=].item[=].extension[=].valueExpression[=].language = #text/fhirpath
* item[=].item[=].extension[=].valueExpression[=].expression = "iif(%bodySiteCode.exists(), %bodySiteCode.memberOf('http://snomed.info/sct?fhir_vs=refset/723264001'), false )"
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/variable"
* item[=].item[=].extension[=].valueExpression.name = "bodySiteDependency"
* item[=].item[=].extension[=].valueExpression.language = #text/fhirpath
* item[=].item[=].extension[=].valueExpression.expression = "iif(%bodySiteCode.exists(), 'dependency.element=BodySite&dependency.concept.coding.system=http://snomed.info/sct&dependency.concept.coding.code=' + %bodySiteCode + '&', 'dependency.element=BodySite&dependency.concept.coding.system=http://terminology.hl7.org/CodeSystem/data-absent-reason&dependency.concept.coding.code=unknown&')"
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/variable"
* item[=].item[=].extension[=].valueExpression.name = "lateralityDependency"
* item[=].item[=].extension[=].valueExpression.language = #text/fhirpath
* item[=].item[=].extension[=].valueExpression.expression = "iif(%lateralityCode.exists(), 'dependency.element=Laterality&dependency.concept.coding.system=http://snomed.info/sct&dependency.concept.coding.code=' + %lateralityCode + '&', 'dependency.element=Laterality&dependency.concept.coding.system=http://terminology.hl7.org/CodeSystem/data-absent-reason&dependency.concept.coding.code=unknown&')"
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/variable"
* item[=].item[=].extension[=].valueExpression.name = "contrastDependency"
* item[=].item[=].extension[=].valueExpression.language = #text/fhirpath
* item[=].item[=].extension[=].valueExpression.expression = "iif(%contrastCode.empty() and %procedureFocusCode='27483000', 'dependency.element=Contrast&dependency.concept.coding.system=http://snomed.info/sct&dependency.concept.coding.code=373066001&', iif(%contrastCode.exists() and %procedureFocusCode!='27483000', 'dependency.element=Contrast&dependency.concept.coding.system=http://snomed.info/sct&dependency.concept.coding.code=' + %contrastCode + '&', 'dependency.element=Contrast&dependency.concept.coding.system=http://terminology.hl7.org/CodeSystem/data-absent-reason&dependency.concept.coding.code=unknown&'))"
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/variable"
* item[=].item[=].extension[=].valueExpression.name = "translateAdditionalParams"
* item[=].item[=].extension[=].valueExpression.language = #text/fhirpath
* item[=].item[=].extension[=].valueExpression.expression = "%bodySiteDependency+%lateralityDependency+%contrastDependency"
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/variable"
* item[=].item[=].extension[=].valueExpression.name = "procedureRequest"
* item[=].item[=].extension[=].valueExpression.language = #text/fhirpath
* item[=].item[=].extension[=].valueExpression.expression = "iif(%procedureFocus.exists(), %terminologies.translate('http://erequestingexample.org.au/fhir/ConceptMap/radiology-services-map-1', %procedureFocus, %translateAdditionalParams).parameter.where(exists(name='match' and part.where(exists(name='equivalence' and value='equivalent')))).part.where(name='concept').value, {})"
// Body site codings
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/variable"
* item[=].item[=].extension[=].valueExpression[+].name = "bodySitesXray"
* item[=].item[=].extension[=].valueExpression[=].language = #text/fhirpath
* item[=].item[=].extension[=].valueExpression[=].expression = "%terminologies.expand('http://erequestingexample.org.au/fhir/ValueSet/radiology-body-structure-X-ray').expansion.contains"
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/variable"
* item[=].item[=].extension[=].valueExpression[+].name = "bodySitesPlainXray"
* item[=].item[=].extension[=].valueExpression[=].language = #text/fhirpath
* item[=].item[=].extension[=].valueExpression[=].expression = "%terminologies.expand('http://erequestingexample.org.au/fhir/ValueSet/radiology-body-structure-Plain-X-Ray').expansion.contains"
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/variable"
* item[=].item[=].extension[=].valueExpression[+].name = "bodySitesUS"
* item[=].item[=].extension[=].valueExpression[=].language = #text/fhirpath
* item[=].item[=].extension[=].valueExpression[=].expression = "%terminologies.expand('http://erequestingexample.org.au/fhir/ValueSet/radiology-body-structure-Ultrasound-imaging').expansion.contains"
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/variable"
* item[=].item[=].extension[=].valueExpression[+].name = "bodySitesDiagRadContrast"
* item[=].item[=].extension[=].valueExpression[=].language = #text/fhirpath
* item[=].item[=].extension[=].valueExpression[=].expression = "%terminologies.expand('http://erequestingexample.org.au/fhir/ValueSet/radiology-body-structure-X-ray-with-contrast').expansion.contains"
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/variable"
* item[=].item[=].extension[=].valueExpression[+].name = "bodySitesAngio"
* item[=].item[=].extension[=].valueExpression[=].language = #text/fhirpath
* item[=].item[=].extension[=].valueExpression[=].expression = "%terminologies.expand('http://erequestingexample.org.au/fhir/ValueSet/radiology-body-structure-Angiography').expansion.contains"
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/variable"
* item[=].item[=].extension[=].valueExpression[+].name = "bodySitesFluoro"
* item[=].item[=].extension[=].valueExpression[=].language = #text/fhirpath
* item[=].item[=].extension[=].valueExpression[=].expression = "%terminologies.expand('http://erequestingexample.org.au/fhir/ValueSet/radiology-body-structure-Fluoroscopy').expansion.contains"
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/variable"
* item[=].item[=].extension[=].valueExpression[+].name = "bodySitesCT"
* item[=].item[=].extension[=].valueExpression[=].language = #text/fhirpath
* item[=].item[=].extension[=].valueExpression[=].expression = "%terminologies.expand('http://erequestingexample.org.au/fhir/ValueSet/radiology-body-structure-CT').expansion.contains"
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/variable"
* item[=].item[=].extension[=].valueExpression[+].name = "bodySitesMRI"
* item[=].item[=].extension[=].valueExpression[=].language = #text/fhirpath
* item[=].item[=].extension[=].valueExpression[=].expression = "%terminologies.expand('http://erequestingexample.org.au/fhir/ValueSet/radiology-body-structure-MRI').expansion.contains"
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/variable"
* item[=].item[=].extension[=].valueExpression[+].name = "bodySitesAll"
* item[=].item[=].extension[=].valueExpression[=].language = #text/fhirpath
* item[=].item[=].extension[=].valueExpression[=].expression = "%terminologies.expand('http://erequestingexample.org.au/fhir/ValueSet/radiology-body-structure-1').expansion.contains"


* item[=].item[=].linkId = "radiology-service-examination"
* item[=].item[=].text = "Examination"
* item[=].item[=].type = #group
* item[=].item[=].repeats = false
* item[=].item[=].required = true

* item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/StructureDefinition/variable"
* item[=].item[=].item[=].extension[=].valueExpression[+].name = "bodySiteOptions"
* item[=].item[=].item[=].extension[=].valueExpression[=].language = #text/fhirpath
* item[=].item[=].item[=].extension[=].valueExpression[=].expression = "iif(%procedureFocusCode='363680008', %bodySitesXray, iif(%procedureFocusCode='168537006', %bodySitesPlainXray, iif(%procedureFocusCode='16310003', %bodySitesUS, iif(%procedureFocusCode='27483000', %bodySitesDiagRadContrast, iif(%procedureFocusCode='77343006', %bodySitesAngio, iif(%procedureFocusCode='44491008', %bodySitesFluoro,  iif(%procedureFocusCode='77477000', %bodySitesCT, iif(%procedureFocusCode='113091000', %bodySitesMRI, %bodySitesAll))))))))"
* item[=].item[=].item[=].linkId = "radiology-service-examination-components"
* item[=].item[=].item[=].text = "Procedure components"
* item[=].item[=].item[=].type = #group
* item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].required = false

* item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item[=].item[=].item[=].item[=].extension[=].valueCodeableConcept = $questionnaire-item-control#drop-down
* item[=].item[=].item[=].item[=].linkId = "radiology-service-examination-components-modality"
* item[=].item[=].item[=].item[=].text = "Procedure focus"
* item[=].item[=].item[=].item[=].type = #choice
* item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[=].required = true
* item[=].item[=].item[=].item[=].answerValueSet = "http://erequestingexample.org.au/fhir/ValueSet/radiology-procedure-1"

* item[=].item[=].item[=].item[+].extension[0].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item[=].item[=].item[=].item[=].extension[=].valueCodeableConcept = $questionnaire-item-control#drop-down
* item[=].item[=].item[=].item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression"
* item[=].item[=].item[=].item[=].extension[=].valueExpression.language = #text/fhirpath
* item[=].item[=].item[=].item[=].extension[=].valueExpression.expression = "%procedureFocus.empty()"
* item[=].item[=].item[=].item[=].linkId = "radiology-service-examination-components-bodysite-all"
* item[=].item[=].item[=].item[=].text = "Body site"
* item[=].item[=].item[=].item[=].type = #choice
* item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[=].readOnly = true
* item[=].item[=].item[=].item[=].answerValueSet = "http://erequestingexample.org.au/fhir/ValueSet/radiology-body-structure-1"
* item[=].item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-displayCategory"
* item[=].item[=].item[=].item[=].item[=].extension[=].valueCodeableConcept = $display-category#instructions
* item[=].item[=].item[=].item[=].item[=].linkId = "radiology-service-examination-components-bodysite-all-instructions"
* item[=].item[=].item[=].item[=].item[=].text = "Select procedure focus"
* item[=].item[=].item[=].item[=].item[=].type = #display

* item[=].item[=].item[=].item[+].extension[0].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item[=].item[=].item[=].item[=].extension[=].valueCodeableConcept = $questionnaire-item-control#drop-down
* item[=].item[=].item[=].item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression"
* item[=].item[=].item[=].item[=].extension[=].valueExpression.language = #text/fhirpath
* item[=].item[=].item[=].item[=].extension[=].valueExpression.expression = "%procedureFocus.exists()"
* item[=].item[=].item[=].item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerExpression"
* item[=].item[=].item[=].item[=].extension[=].valueExpression.language = #text/fhirpath
* item[=].item[=].item[=].item[=].extension[=].valueExpression.expression = "%bodySiteOptions"
* item[=].item[=].item[=].item[=].linkId = "radiology-service-examination-components-bodysite"
* item[=].item[=].item[=].item[=].text = "Body site"
* item[=].item[=].item[=].item[=].type = #choice
* item[=].item[=].item[=].item[=].repeats = false

* item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item[=].item[=].item[=].item[=].extension[=].valueCodeableConcept = $questionnaire-item-control#radio-button
* item[=].item[=].item[=].item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression"
* item[=].item[=].item[=].item[=].extension[=].valueExpression.language = #text/fhirpath
* item[=].item[=].item[=].item[=].extension[=].valueExpression.expression = "%lateralityEnabled"
* item[=].item[=].item[=].item[=].linkId = "radiology-service-examination-components-laterality"
* item[=].item[=].item[=].item[=].text = "Laterality"
* item[=].item[=].item[=].item[=].type = #choice
* item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[=].answerValueSet = "http://erequestingexample.org.au/fhir/ValueSet/radiology-laterality-1"

* item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item[=].item[=].item[=].item[=].extension[=].valueCodeableConcept = $questionnaire-item-control#radio-button
* item[=].item[=].item[=].item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression"
* item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%procedureFocusCode!='27483000' or %procedureFocusCode.empty()"
* item[=].item[=].item[=].item[=].linkId = "radiology-service-examination-components-contrast"
* item[=].item[=].item[=].item[=].text = "Contrast"
* item[=].item[=].item[=].item[=].type = #choice
* item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[=].answerValueSet = "http://erequestingexample.org.au/fhir/ValueSet/radiology-contrast-1"

* item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item[=].item[=].item[=].item[=].extension[=].valueCodeableConcept = $questionnaire-item-control#radio-button
* item[=].item[=].item[=].item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression"
* item[=].item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%procedureFocusCode='27483000'"
* item[=].item[=].item[=].item[=].linkId = "radiology-service-examination-components-contrast-yes"
* item[=].item[=].item[=].item[=].text = "Contrast"
* item[=].item[=].item[=].item[=].type = #choice
* item[=].item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].item[=].readOnly = true
* item[=].item[=].item[=].item[=].answerOption[+].valueCoding = $SCT#373066001
* item[=].item[=].item[=].item[=].answerOption[=].initialSelected = true
* item[=].item[=].item[=].item[=].answerOption[+].valueCoding = $SCT#373067005

* item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item[=].item[=].item[=].extension[=].valueCodeableConcept = $questionnaire-item-control#autocomplete
* item[=].item[=].item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression"
* item[=].item[=].item[=].extension[=].valueExpression.language = #text/fhirpath
* item[=].item[=].item[=].extension[=].valueExpression.expression = "%procedureFocus.empty()"
* item[=].item[=].item[=].linkId = "radiology-service-examination-procedure-all"
* item[=].item[=].item[=].text = "Procedure for request"
* item[=].item[=].item[=].type = #open-choice
* item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].required = false
* item[=].item[=].item[=].answerValueSet = "http://erequestingexample.org.au/fhir/ValueSet/radiology-services-1"

* item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item[=].item[=].item[=].extension[=].valueCodeableConcept = $questionnaire-item-control#radio-button
* item[=].item[=].item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression"
* item[=].item[=].item[=].extension[=].valueExpression.language = #text/fhirpath
* item[=].item[=].item[=].extension[=].valueExpression.expression = "%procedureFocus.exists() and %procedureRequest.exists()"
* item[=].item[=].item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerExpression"
* item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].extension[=].valueExpression[=].expression = "%procedureRequest"
* item[=].item[=].item[=].linkId = "radiology-service-examination-procedure"
* item[=].item[=].item[=].text = "Procedure for request"
* item[=].item[=].item[=].type = #choice
* item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].required = false

* item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression"
* item[=].item[=].item[=].extension[=].valueExpression.language = #text/fhirpath
* item[=].item[=].item[=].extension[=].valueExpression.expression = "%procedureFocus.exists() and %procedureRequest.empty()"
* item[=].item[=].item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression"
* item[=].item[=].item[=].extension[=].valueExpression[+].language = #text/fhirpath
* item[=].item[=].item[=].extension[=].valueExpression[=].expression = "(%procedureFocusDisplay)&(iif(%bodySiteDisplay.exists(), ', '&%bodySiteDisplay, ''))&(iif(%lateralityDisplay.exists(), ' ('&%lateralityDisplay&')', ''))&(iif(%contrastCode='373066001', ', with contrast', iif(%contrastCode='373067005', ', without contrast', '')))"
* item[=].item[=].item[=].linkId = "radiology-service-examination-procedure-text"
* item[=].item[=].item[=].text = "Procedure for request"
* item[=].item[=].item[=].type = #text
* item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].required = false
* item[=].item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-displayCategory"
* item[=].item[=].item[=].item[=].extension[=].valueCodeableConcept = $display-category#instructions
* item[=].item[=].item[=].item[=].linkId = "radiology-service-examination-procedure-text-instructions"
* item[=].item[=].item[=].item[=].text = "No matching catalogue request item. This is free text."
* item[=].item[=].item[=].item[=].type = #display


* item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item[=].item[=].item[=].extension[=].valueCodeableConcept = $questionnaire-item-control#drop-down
* item[=].item[=].item[=].linkId = "radiology-service-examination-priority"
* item[=].item[=].item[=].text = "Urgency"
* item[=].item[=].item[=].type = #choice
* item[=].item[=].item[=].repeats = false
* item[=].item[=].item[=].answerOption[+].valueCoding = http://hl7.org/fhir/request-priority|4.0.1#stat "Emergency"
* item[=].item[=].item[=].answerOption[+].valueCoding = http://hl7.org/fhir/request-priority|4.0.1#urgent "Urgent"
* item[=].item[=].item[=].answerOption[+].valueCoding = http://hl7.org/fhir/request-priority|4.0.1#routine "Routine"

* item[=].item[=].item[+].linkId = "radiology-service-examination-timing"
* item[=].item[=].item[=].text = "Service due"
* item[=].item[=].item[=].type = #dateTime
* item[=].item[=].item[=].repeats = false

* item[=].item[+].extension[+].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item[=].item[=].extension[=].valueCodeableConcept = $questionnaire-item-control#autocomplete
* item[=].item[=].linkId = "radiology-service-clinicalindication"
* item[=].item[=].text = "Clinical indication"
* item[=].item[=].type = #open-choice
* item[=].item[=].repeats = true
* item[=].item[=].answerValueSet = "https://healthterminologies.gov.au/fhir/ValueSet/reason-for-request-1"

* item[=].item[+].linkId = "radiology-service-clinicalnotes"
* item[=].item[=].text = "Clinical context"
* item[=].item[=].type = #text
* item[=].item[=].repeats = false

* item[=].item[+].linkId = "radiology-service-comment"
* item[=].item[=].text = "Comment"
* item[=].item[=].type = #text
* item[=].item[=].repeats = false
