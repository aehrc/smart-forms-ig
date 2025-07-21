### General Requirements
Systems compatible with the Smart Health Checks (SHC) App are required to support healthcare client and provider information conforming to profiles, AND implement the interaction requirements of relevant actor's capability statements defined in this implementation guide.

The requirements of the FHIR standard and [FHIR Conformance Rules](http://hl7.org/fhir/conformance-rules.html) apply, and define the conformance verbs - SHALL, SHALL NOT, SHOULD, SHOULD NOT, MAY.

This page documents how CapabilityStatements declare conformance to the SHC profiles and their FHIR interactions. It also defines the expectations for mandatory and *Must Support* elements. Authorisation to a healthcare client's record is supported using [SMART App Launch v2.2.0 implementation guide](https://hl7.org/fhir/smart-app-launch).


### Conformance Artifacts
The [Artifacts](artifacts.html) page lists the SHC profiles defined for this implementation guide. Core profile [StructureDefinitions]({{site.data.fhir.path}}structuredefinition.html) defines the minimum elements, extensions, vocabularies, and value sets which SHALL be present when using the profile. Many profile pages also contain additional guidance.

The profile elements consist of both mandatory and *Must Support* elements. Mandatory elements are elements with a minimum cardinality of 1 (min=1). The base [FHIR *Must Support*]({{site.data.fhir.path}}profiling.html#mustsupport) guidance requires specifications to define the support expected for profile elements labeled *Must Support*. The sections below explain how these elements are displayed and define the rules for interpreting profile elements and sub-elements labeled mandatory and *Must Support* for [SHC Host FHIR Server](ActorDefinition-SHCHostFHIRServer.html) and [SHC App](ActorDefinition-SHCApp.html).


#### Capability Statements 

The [capability statement](capability-statements.html) page lists the capability statements that are to be supported by systems implementing the SHC actors in this IG. 

### Exchange Format Support

In FHIR, resources are commonly exchanged in multiple formats including JSON and XML. The SHC App is a JavaScript-based app and hence mandates the support of JSON. 

### Profile and Interaction Support
The SHC systems support the SHC *profiles* to represent clinical information and the SHC REST API *interactions* to access that information. Therefore, the [SHC Host FHIR Server](ActorDefinition-SHCHostFHIRServer.html) must implement and support SHC profiles AND interactions to be compatible with the [SHC App](ActorDefinition-SHCApp.html).

#### Profile Support
Profile support refers to the support of the SHC profiles, such that the system exposes FHIR resources that adhere to the SHC profiles' content model. Specifically, a [SHC Host FHIR Server](ActorDefinition-SHCHostFHIRServer.html) with SHC profile support:
* SHALL communicate all profile data elements that are mandatory by that profile's StructureDefinition. 

#### Interaction Support
Interaction support refers to a system that supports the SHC REST API interactions. Specifically, a server with SHC Interaction support:
* SHALL implement the REST API behavior according to the FHIR specification, including *read*, *search*, *create* and *patch* interactions as required, and the required search parameters as defined in the [SHC Host FHIR Server CapabilityStatement](CapabilityStatement-SHCHostFHIRServerCapabilityStatement.html#resourcesSummary1).
* SHALL specify the full capability details from the SHC Host FHIR Server CapabilityStatement it claims to implement, including mandatory support for _FHIR transactions_.

### Must Support and Obligations

In the context of SHC, [Obligations](https://hl7.org/fhir/extensions/CodeSystem-obligation.html) defines how an actor ([SHC Host FHIR Server](ActorDefinition-SHCHostFHIRServer.html) or [SHC App](ActorDefinition-SHCApp.html)) must “support” a given element. All [*Must Support*]({{site.data.fhir.path}}conformance-rules.html#mustSupport) elements in this IG are accompanied by an explicit obligation, which identifies structured expectations for a given actor. If a *Must Support* element has no obligation for a given actor, that element need not be supported by that actor. Obligations can be found in the formal view section of a resource.

When information on a particular data element is not present, and the reason for absence is unknown, [SHC Host FHIR Server](ActorDefinition-SHCHostFHIRServer.html) SHALL NOT include the data elements in the resource instance returned as part of the query results. Conversely, the [SHC App](ActorDefinition-SHCApp.html) SHALL be able to accept without error resource instances containing data elements asserting missing information.

#### Obligations for SHC Host FHIR Server
[SHC Host FHIR Server](ActorDefinition-SHCHostFHIRServer.html) conforming to a profile in SHC SHALL support the behavior defined in the Obligations section for the [SHC Host FHIR Server](ActorDefinition-SHCHostFHIRServer.html) actor under a given data element. Implementers may notice that many of the SHC Obligations on [SHC Host FHIR Server](ActorDefinition-SHCHostFHIRServer.html) are SHALL:populate-if-known, which requires that [SHC Host FHIR Server](ActorDefinition-SHCHostFHIRServer.html) populate an element if that element is available. There are a few potential reasons why a *Must Support* element may not be available, for example:
* Elements for a particular patient are not available. For example, a system may not have the technical capability to collect a data element and therefore is not expected to respond with a value when queried.
* Elements are available, but the [SHC App](ActorDefinition-SHCApp.html) is not authorized to access the data.

##### Missing Data
There are situations when information on a particular data element is missing, and the source system does not know the reason for the absence of data.

###### Missing Must-Support and Optional Data
If the [SHC Host FHIR Server](ActorDefinition-SHCHostFHIRServer.html) does not have data for an element with a minimum cardinality = 0 (including elements labeled *Must Support*), the data element SHALL be omitted from the resource.

Note: an [SHC Host FHIR Server](ActorDefinition-SHCHostFHIRServer.html) may have no data to be included either because there is no data or because the data available is not pertinent.

###### Missing Must Support and Required Data
If an [SHC Host FHIR Server](ActorDefinition-SHCHostFHIRServer.html) does not have data to be included, the reason for the absence has to be specified as follows:

1. For non-coded data elements, use the [DataAbsentReason Extension]({{site.data.fhir.path}}extension-data-absent-reason.html) in the data type.
2. For coded data elements:
     - *example*, *preferred*, or *extensible* binding strengths (CodeableConcept datatypes):
       - if the source systems have text but no coded data, only the text element is used.
       - if there is neither text nor codes representing actual (i.e., non-exceptional) concepts:
         - use the appropriate exceptional concept code from the value set if available
         - use the appropriate concept code from the [DataAbsentReason Value Set]({{site.data.fhir.path}}valueset-data-absent-reason.html) if the value set does not have it.
     - *required* binding strength (CodeableConcept or code datatypes):
       - use the appropriate exceptional concept code from the value set

#### Obligations for SHC App
The [SHC App](ActorDefinition-SHCApp.html) SHALL support the behavior defined in the Obligations section for the [SHC App](ActorDefinition-SHCApp.html) actor under a given data element.  The [SHC App](ActorDefinition-SHCApp.html) applies different processing for SHC profile elements labelled as *Must Support*, these may include:

Code | Definition | Notes
--- | --- | ---
[MAY:ignore](https://hl7.org/fhir/extensions/CodeSystem-obligation.html#obligation-MAY.58ignore) | Conformant applications MAY not make any use of the value of this element if received. | This is a null statement and is the default behavior or consuming systems if other obligations are not specified.
[SHALL:handle](https://hl7.org/fhir/extensions/CodeSystem-obligation.html#obligation-SHALL.58handle) | Conformant applications SHALL handle the meaning of this element correctly. |  This rule is vague in that it doesn't specify any particular handling of the element. But it's important because an application that ignores this element is non-conformant. A good example would be a status code of 'entered-in-error' - how exactly a Resource Consumer handles this depends on the use case etc., but the application can never simply ignore such a status code. Note that whether the resource or information from it is stored for later use is irrelevant - when the resource or information in it is processed, the consequences of the element are considered.
[SHALL:display](https://hl7.org/fhir/extensions/CodeSystem-obligation.html#obligation-SHALL.58display) | Conformant applications SHALL display the value of this element when presenting the data from the resource to a human user. | Exactly how it is displayed is not specified, but it means that a human looking at the content of the resource is made aware of the value of the element so that they can consider the meaning of the resource.
[SHALL:process](https://hl7.org/fhir/extensions/CodeSystem-obligation.html#obligation-SHALL.58process) | Conformant applications SHALL consider the value of this element when processing the resource as specified by the IG. | This implies that the IG that specifies this obligation provides details about what processing is to be performed, and the obligation specifically relates to the processing specified in the IG.

#### Obligation Code Definitions
Further clarification on the obligation code defined for an actor can be found by clicking the hyperlink on the obligation or by navigating to [obligation code value set](https://hl7.org/fhir/extensions/CodeSystem-obligation.html). 

In the context of this implementation guide, additional details for the obligations specified on data elements throughout are provided here. 

Obligations for each actor are defined with two categories of interactions in mind. Each category is the set of interactions, as described in the [Smart Health Checks Interactions](index.html#smart-health-checks-interactions) section, for:
1. prepopulating the Health Check; and
2. writing data back to the SHC Host FHIR Server.

<div><img alt="Obligations overview.png" src="ObligationsOverview.png" style="max-width:60%; height:auto; padding:30px;"/></div>

The obligation codes have been specified according to the following rationale:

Code | SHC Host FHIR Server | SHC App
--- | --- | ---
[SHALL:populate](https://hl7.org/fhir/extensions/CodeSystem-obligation.html#obligation-SHALL.58populate) | Indicates the element is required for accurate prepopulation or writeback. Additionally, if there is a prepopulation search query with a parameter that relies on an element, it SHALL be included. | Indicates the element will be included in a resource for writeback. There is no reason the SHC App won't know this information.
[SHALL:populate-if-known](https://hl7.org/fhir/extensions/CodeSystem-obligation.html#obligation-SHALL.58populate-if-known) | Indicates thes element is important for prepopulating a field in the form, however if it is missing, population will not be inaccurate, it will just not occur. | Indicates that if it is known, the element will be included in a resource for writeback. A reason it may not be known, is if a user has not recorded it and is therefore not included in the QuestionnaireResponse.
[SHALL:process](https://hl7.org/fhir/extensions/CodeSystem-obligation.html#obligation-SHALL.58process) | Indicates that when the element is included in a resource by the SHC App, it should be processed and considered for accurate writeback. | Indicates the SHC App will process the element and use it for prepopulating a QuestionnaireResponse or for generating a transaction bundle for writeback.

#### Must Support - Resource References

Some elements labeled as *Must Support* reference multiple resource types or profiles (e.g., `QuestionnaireResponse.author`). [SHC Host FHIR Server](ActorDefinition-SHCHostFHIRServer.html) SHALL support *at least one* referenced resource or profile for each element listed in the table below. The [SHC App](ActorDefinition-SHCApp.html) SHALL support *all* referenced resources or profiles listed in the table below.

For example, when claiming conformance to the SHC QuestionnaireResponse profile:

* [SHC Host FHIR Server](ActorDefinition-SHCHostFHIRServer.html) **SHALL** be capable of providing a QuestionnaireResponse.author with a valid reference to an AU Core Practitioner profile, an AU Core PractitionerRole profile, an AU Core Patient profile, or any combination of them if the element is available
* [SHC App](ActorDefinition-SHCApp.html) **SHALL** be capable of processing a QuestionnaireResponse.author with a valid reference to an AU Core Practitioner profile, AU Core PractitionerRole profile, and an AU Core Patient profile.

#### Must Support - Choice of Data Types

Some elements labeled as *Must Support* allow different data types (e.g., `Observation.effective[x]`) for their content. [SHC Host FHIR Server](ActorDefinition-SHCHostFHIRServer.html) SHALL support *at least one* data type for each element listed in the table below. [SHC App](ActorDefinition-SHCApp.html) SHALL support *all* data types listed in the table below.

For example, when claiming conformance to the AU Core Diagnostic Result Observation profile:

* [SHC Host FHIR Server](ActorDefinition-SHCHostFHIRServer.html) **SHALL** be capable of populating `Observation.effectiveDateTime`, `Observation.effectivePeriod`, or both if the element is available.
* [SHC App](ActorDefinition-SHCApp.html) **SHALL** be capable of processing `Observation.effectiveDateTime` and `Observation.effectivePeriod`

Systems **MAY** support populating and processing other choice elements not listed in the table (such as `Observation.effectiveInstant`), but this is not a requirement.
