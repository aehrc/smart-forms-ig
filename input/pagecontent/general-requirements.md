### General Requirements
Systems compatible with the Smart Health Checks (SHC) App are required to support healthcare client and provider information conforming to profiles, AND implement the interaction requirements of relevant actor's capability statements defined in this implementation guide.

The requirements of the FHIR standard and [FHIR Conformance Rules](http://hl7.org/fhir/conformance-rules.html) apply, and define the conformance verbs - **SHALL**, **SHALL NOT**, **SHOULD**, **SHOULD NOT**, **MAY**.

This page documents how CapabilityStatements declare conformance to the SHC profiles and their FHIR interactions. It also defines the expectations for mandatory and *Must Support* elements. Authorisation to a healthcare client's record is supported using [SMART App Launch v2.2.0 implementation guide](https://hl7.org/fhir/smart-app-launch).


### Conformance Artifacts
The [Artefacts](artifacts.html) page lists the SHC profiles defined for this implementation guide. Core profile [StructureDefinitions]({{site.data.fhir.path}}structuredefinition.html) defines the minimum elements, extensions, vocabularies, and value sets which **SHALL** be present when using the profile. Many profile pages also contain additional guidance.

The profile elements consist of both mandatory and *Must Support* elements. Mandatory elements are elements with a minimum cardinality of 1 (min=1). The base FHIR [*Must Support*]({{site.data.fhir.path}}profiling.html#mustsupport) guidance requires specifications to define the support expected for profile elements labelled *Must Support*. The sections below explain how these elements are displayed and define the rules for interpreting profile elements and sub-elements labelled mandatory and *Must Support* for [SHC Host FHIR Server](ActorDefinition-SHCHostFHIRServer.html) and [SHC App](ActorDefinition-SHCApp.html).


#### Capability Statements 

The [capability statement](capability-statements.html) page lists the capability statements that are to be supported by systems implementing the SHC actors in this IG. 

### Exchange Format Support

In FHIR, resources are commonly exchanged in multiple formats including JSON and XML. The SHC App is a JavaScript-based app and hence mandates the support of JSON. 

### Profile and Interaction Support
The SHC systems support the SHC *profiles* to represent clinical information and the SHC REST API *interactions* to access that information. Therefore, the [SHC Host FHIR Server](ActorDefinition-SHCHostFHIRServer.html) must implement and support SHC profiles AND interactions to be compatible with the [SHC App](ActorDefinition-SHCApp.html).

#### Profile Support
Profile support refers to the support of the SHC profiles, such that the system exposes FHIR resources that adhere to the SHC profiles' content model. Specifically, a [SHC Host FHIR Server](ActorDefinition-SHCHostFHIRServer.html) with SHC profile support:
* **SHALL** communicate all profile data elements that are mandatory by that profile's StructureDefinition. 

#### Interaction Support
Interaction support refers to a system that supports the SHC REST API interactions. Specifically, a server with SHC Interaction support:
* **SHALL** implement the REST API behavior according to the FHIR specification, including *read*, *search*, *create* and *patch* interactions as required, and the required search parameters as defined in the [SHC Host FHIR Server CapabilityStatement](CapabilityStatement-SHCHostFHIRServerCapabilityStatement.html#resourcesSummary1).
* **SHALL** specify the full capability details from the SHC Host FHIR Server CapabilityStatement it claims to implement, including mandatory support for _FHIR transactions_.

### Must Support and Obligations

In the context of SHC, [Obligations](https://hl7.org/fhir/extensions/CodeSystem-obligation.html) defines how an actor ([SHC Host FHIR Server](ActorDefinition-SHCHostFHIRServer.html) or [SHC App](ActorDefinition-SHCApp.html)) must “support” a given element. All [*Must Support*]({{site.data.fhir.path}}conformance-rules.html#mustSupport) elements in this IG are accompanied by an explicit obligation, which identifies structured expectations for a given actor. If a *Must Support* element has no obligation for a given actor, that element need not be supported by that actor. 

SHC profiles are derived from AU Core profiles, hence any elements flagged as *Must Support* in AU Core are also *Must Support* in the SHC profiles of this implementation guide. The SHC Host FHIR Server and SHC App actors are derived from AU Core Responder and AU Core Requester respectively, hence the actor obligations are inherited from AU Core as the default obligations in the SHC profiles. Additional obligations constrain and augment these defaults as required, to support the prepopulation and writeback requirements of each actor in this implementation guide.

The actor obligations of *Must Support* elements are specified in the element description of each SHC profile.

#### Obligation Code Definitions
The Obligation codes are defined in the FHIR Extensions [Obligation Codes ValueSet](https://hl7.org/fhir/extensions/ValueSet-obligation.html). The Obligation codes used within this implementation guide are summarised below, with descriptions of how the data elements are expected to be supported by each actor.

Obligations are specified for each actor in the context of two sets of interactions defined in the [Smart Health Checks Interactions](index.html#smart-health-checks-interactions):
1. data access for prepopulation of the Health Check; and
2. writeback of data to the SHC Host FHIR Server.

The figure below illustrates the relationship between the SHC and AU Core actors, the default *Must Support* Obligations inherited from AU Core actors, and the additional Obligations of each SHC actor specified for the Prepopulation and Writeback interactions.

<div><img alt="Obligations overview.png" src="ObligationsOverview-derivedFrom.png" style="max-width:60%; height:auto; padding:30px;"/></div>

#### Obligations for SHC Host FHIR Server
A [SHC Host FHIR Server](ActorDefinition-SHCHostFHIRServer.html) actor **SHALL** support the data usage expectations specified in the Obligations of the [SHC Host FHIR Server](ActorDefinition-SHCHostFHIRServer.html) actor for each *Must Support* element. 

The [SHC Host FHIR Server](ActorDefinition-SHCHostFHIRServer.html) actor derives from AU Core Responder actor, hence the *Must Support* elements in SHC profiles that are derived from AU Core profiles inherit the default `SHALL:populate-if-known` obligation for data access interactions. This requires the [SHC Host FHIR Server](ActorDefinition-SHCHostFHIRServer.html) to populate an element if that element is available. There are a few potential reasons why a *Must Support* element may not be available, for example:
* a system may not have the capability to collect a data element, therefore is not expected to ever provide a value
* for a particular patient, a value may not be available for a data element, but in some cases a value is provided
* a value is available, but the [SHC App](ActorDefinition-SHCApp.html) or its user is not authorized to access the data, therefore the value is not provided.

The SHC profiles may specify additional obligations for the [SHC Host FHIR Server](ActorDefinition-SHCHostFHIRServer.html) actor related to data access for prepopulation and writeback interactions. These include:

Code | Interactions | SHC Host FHIR Server Obligations
--- | --- | ---
[SHALL:populate-if-known](https://hl7.org/fhir/extensions/CodeSystem-obligation.html#obligation-SHALL.58populate-if-known) | Prepopulation | Indicates the element **SHALL** be populated where a value is known, it is important for prepopulation, however missing data is allowed.
[SHALL:populate](https://hl7.org/fhir/extensions/CodeSystem-obligation.html#obligation-SHALL.58populate) | Prepopulation | Indicates the element **SHALL** be capable of being populated when a value is known and allowed to be shared. It is required for search queries or prepopulation and hence always populated. 
[SHOULD:populate](https://hl7.org/fhir/extensions/CodeSystem-obligation.html#obligation-SHOULD.58populate) | Prepopulation | Indicates the element **SHOULD** be capable of being populated. It is important for prepopulation, however missing data is allowed. 
[SHALL:persist](https://hl7.org/fhir/extensions/CodeSystem-obligation.html#obligation-SHALL.58persist) | Writeback (create) | Indicates where the element is populated, the value **SHALL** be stored in a persistent store.
[SHALL:process](https://hl7.org/fhir/extensions/CodeSystem-obligation.html#obligation-SHALL.58process) | Writeback (patch) | Indicates the element **SHALL** be processed as part of a PATCH interaction, where the element's related parameter value replace the existing stored value. 

#### Obligations for SHC App
The [SHC App](ActorDefinition-SHCApp.html) actor **SHALL** support the data usage expectations specified in the Obligations of the [SHC App](ActorDefinition-SHCApp.html) actor for each *Must Support* data element.  The [SHC App](ActorDefinition-SHCApp.html) actor derives from the AU Core Requester actor, hence the *Must Support* elements in SHC profiles that are derived from AU Core profiles inherit the default `SHALL:no-error` obligation for data access interactions. This requires the [SHC App](ActorDefinition-SHCApp.html) actor to accept resources containing any valid value for the element without error, including missing data and data absent reason codes and extensions.

The SHC profiles may specify additional obligations for the [SHC App](ActorDefinition-SHCApp.html) actor related to data access for prepopulation and writeback interactions, these may include:

Code | Interactions | SHC App Obligations
--- | --- | ---
[SHALL:process](https://hl7.org/fhir/extensions/CodeSystem-obligation.html#obligation-SHALL.58process) | Prepopulation | Indicates the element **SHALL** be processed as part of prepopulation. 
[SHALL:populate-if-known](https://hl7.org/fhir/extensions/CodeSystem-obligation.html#obligation-SHALL.58populate-if-known) | Writeback (create and patch) | Indicates the element **SHALL** be populated when a value is available, either from prepopulation or user entry.
[SHALL:populate](https://hl7.org/fhir/extensions/CodeSystem-obligation.html#obligation-SHALL.58populate) | Writeback (create and patch) | Indicates the element **SHALL** be populated as a value will always be known and allowed to be shared. 

#### Must Support - Resource References

Some elements labelled as *Must Support* allow references to multiple resource types or profiles (e.g. `MedicationStatement.reasonReference`).  These *Must Support* elements and their actor obligations could be inherited from the base AU Core profile. Since [SHC Host FHIR Server](ActorDefinition-SHCHostFHIRServer.html) and [SHC App](ActorDefinition-SHCApp.html) are derived from AU Core Responder and AU Core Requester actors respectively: 

* [SHC Host FHIR Server](ActorDefinition-SHCHostFHIRServer.html) **SHALL** populate a known reference value to *at least one* resource type or profile allowed by the element
* [SHC App](ActorDefinition-SHCApp.html) **SHALL** accept with no error *all* resource types or profiles allowed by the element.

Additionally, SHC actor obligations that support writeback can be specified on elements that reference multiple resource types or profiles. In this case: 
* [SHC Host FHIR Server](ActorDefinition-SHCHostFHIRServer.html) **SHALL** persist a valid reference for *all* resource types or profiles allowed by the element
* [SHC App](ActorDefinition-SHCApp.html) **SHALL** correctly populate a reference to *at least one* resource type or profile allowed by the element.

As of this version of the SHC IG, there are no SHC profiles with *Must Support* element with writeback obligations that allow multiple resource types or profiles. The writeback obligations guidance above is provided in case a future version of this IG does allow a *Must Support* element with multiple resource types or profiles.

#### Must Support - Choice of Data Types

Some elements labelled as *Must Support* allow values of different data types (e.g., `Condition.onset[x]`). These 'choice elements' can inherit the *Must Support* label and obligations from the base AU Core profile. Since [SHC Host FHIR Server](ActorDefinition-SHCHostFHIRServer.html) and [SHC App](ActorDefinition-SHCApp.html) are derived from AU Core Responder and AU Core Requester actors respectively, the SHC actor obligations default to their respective AU Core actor obligations and can have additional obligations specific to them. The following guidance describes how these obligations are to be interpreted for various scenarios.

##### Inherited AU Core Obligations
Where a 'choice element' (e.g. `Condition.onset[x]`) has *Must Support* inherited from AU Core, the following conformance requirements apply:
* [SHC Host FHIR Server](ActorDefinition-SHCHostFHIRServer.html) **SHALL** populate choice elements using *at least one* data type if a value is known 
* [SHC App](ActorDefinition-SHCApp.html) **SHALL** accept with no error for *all* data types.

For example, when claiming conformance to the [Smart Health Checks Condition](StructureDefinition-SHCCondition.html):
* [SHC Host FHIR Server](ActorDefinition-SHCHostFHIRServer.html) **SHALL** populate a known value using either `Condition.onsetDateTime`, `Condition.onsetAge`, `Condition.onsetPeriod` or `Condition.onsetRange` depending on type of data available
* [SHC App](ActorDefinition-SHCApp.html) **SHALL** accept without error valid data in either `Condition.onsetDateTime`, `Condition.onsetAge`, `Condition.onsetPeriod` or `Condition.onsetRange`.

##### Additional SHC Obligations
###### Prepopulation
SHC actors can have additional obligations applied to 'choice elements' to support prepopulation requirements. 

A 'choice element' with an inherited AU Core *Must Support* can also label a specific data type as *Must Support* with [SHC Host FHIR Server](ActorDefinition-SHCHostFHIRServer.html) obligation of `SHOULD:populate` and [SHC App](ActorDefinition-SHCApp.html) obligation of `SHALL:process`. In this case, the:
* [SHC Host FHIR Server](ActorDefinition-SHCHostFHIRServer.html) **SHALL** populate a known value in the choice element, and **SHOULD** populate the choice element using the *Must Support* data type
* [SHC App](ActorDefinition-SHCApp.html) **SHALL** accept without error all valid data types, and **SHALL** process the choice element using the *Must Support* data type. 

For example, when claiming conformance to the [Smart Health Checks Condition](StructureDefinition-SHCCondition.html):
* [SHC Host FHIR Server](ActorDefinition-SHCHostFHIRServer.html) **SHALL** populate *at least one* of `Condition.onsetDateTime`, `Condition.onsetAge`, `Condition.onsetPeriod` or `Condition.onsetRange` if a value is known, and **SHOULD** populate `Condition.onsetDateTime`
* [SHC App](ActorDefinition-SHCApp.html) **SHALL** accept without error valid data in `Condition.onsetDateTime`, `Condition.onsetAge`, `Condition.onsetPeriod` or `Condition.onsetRange`, and **SHALL** process `Condition.onsetDateTime`.

###### Writeback
AU Core actors do not have obligation requirements related to writeback, therefore the writeback requirements for SHC *Must Support* elements will be specified solely using SHC actor obligations.

A 'choice element' supports writeback when a specific data type is labelled *Must Support* with [SHC Host FHIR Server](ActorDefinition-SHCHostFHIRServer.html) obligation of `SHALL:persist` and [SHC App](ActorDefinition-SHCApp.html) obligations of `SHALL:populate-if-known` or `SHALL:populate`. In this case:
* [SHC Host FHIR Server](ActorDefinition-SHCHostFHIRServer.html) **SHALL** persist a valid value from the 'choice element' using the *Must Support* data type 
* [SHC App](ActorDefinition-SHCApp.html) **SHALL** correctly populate a known value, or able to populate when allowed to share, the 'choice element' using the *Must Support* data type.

For example, when claiming conformance to the [Smart Health Checks Condition](StructureDefinition-SHCCondition.html):
* [SHC Host FHIR Server](ActorDefinition-SHCHostFHIRServer.html) **SHALL** persist a valid value from `Condition.onsetDateTime`
* [SHC App](ActorDefinition-SHCApp.html) **SHALL** correctly populate a known Condition.onset[x] value using the `Condition.onsetDateTime`.

On rare occasions, elements with prepopulation and writeback requirements are labelled as *Must Support* on the 'choice element' without any specific *Must Support* datatype. In this case, the [SHC Host FHIR Server](ActorDefinition-SHCHostFHIRServer.html) obligations of `SHALL:populate-if-known` and `SHALL:persist`, and [SHC App](ActorDefinition-SHCApp.html) obligations of `SHALL:process` and `SHALL:populate-if-known` are applicable. For choice elements with prepopulation and writeback requirements:  
* [SHC Host FHIR Server](ActorDefinition-SHCHostFHIRServer.html) **SHALL** correctly populate a known value for the choice element using *at least one* data type allowed by the element
* [SHC Host FHIR Server](ActorDefinition-SHCHostFHIRServer.html) **SHALL** persist a valid value for *all* data types allowed by the element
* [SHC App](ActorDefinition-SHCApp.html) **SHALL** process valid data for *all* data types of the choice element
* [SHC App](ActorDefinition-SHCApp.html) **SHALL** correctly populate a known value for the choice element using *at least one* data type allowed by the element.

For example, when claiming conformance to the [Smart Health Checks Questionnaire Response](StructureDefinition-SHCQuestionnaireResponse.html):
* [SHC Host FHIR Server](ActorDefinition-SHCHostFHIRServer.html) **SHALL** populate a known value using *at least one* of types allowed for `QuestionnaireResponse.item.answer.value[x]`
* [SHC Host FHIR Server](ActorDefinition-SHCHostFHIRServer.html) **SHALL** persist a valid value for *all* data types allowed for `QuestionnaireResponse.item.answer.value[x]`
* [SHC App](ActorDefinition-SHCApp.html) **SHALL** process valid value for *all* data types allowed for `QuestionnaireResponse.item.answer.value[x]`
* [SHC App](ActorDefinition-SHCApp.html) **SHALL** populate a known value using *at least one* of types allowed for `QuestionnaireResponse.item.answer.value[x]`.

Note that [Smart Health Checks Questionnaire Response](StructureDefinition-SHCQuestionnaireResponse.html) does not derive from an AU Core profile and hence has no inherited actor obligations. Therefore, this profile's *Must Support* obligation requirements are defined using SHC actors.

#### Missing Data
There are situations when information on a particular data element is missing, and the source system does not know the reason for the absence of data.

##### Optional And Must Support Elements
If the [SHC Host FHIR Server](ActorDefinition-SHCHostFHIRServer.html) does not have data for an element with a minimum cardinality = 0 (including elements labelled *Must Support*), the data element **SHALL** be omitted from the resource.

##### Required And Must Support Elements

If the [SHC Host FHIR Server](ActorDefinition-SHCHostFHIRServer.html) does not have data to be included, the reason for the absence has to be specified as follows:

1. For non-coded data elements, use the [DataAbsentReason Extension]({{site.data.fhir.path}}extension-data-absent-reason.html) in the data type.
2. For coded data elements:
     - *example*, *preferred*, or *extensible* binding strengths (CodeableConcept datatypes):
       - if the source systems have text but no coded data, only the text element is used.
       - if there is neither text nor codes representing actual (i.e., non-exceptional) concepts:
         - use the appropriate exceptional concept code from the value set if available
         - use the appropriate concept code from the [DataAbsentReason Value Set]({{site.data.fhir.path}}valueset-data-absent-reason.html) if the value set does not have it.
     - *required* binding strength (CodeableConcept or code datatypes):
       - use the appropriate exceptional concept code from the value set

##### Accepting and Processing Must Support Elements With Missing Data
A [SHC App](ActorDefinition-SHCApp.html) **SHALL** be able to accept resource instances containing data elements asserting missing data without error. This is *except* for when the *Must Support* element has an [SHC App](ActorDefinition-SHCApp.html) obligation of `SHALL:process` and an [SHC Host FHIR Server](ActorDefinition-SHCHostFHIRServer.html) obligation of `SHALL:populate`, where the [SHC App](ActorDefinition-SHCApp.html) **MAY** report an error due to not being able to perform the prepropulation process.

