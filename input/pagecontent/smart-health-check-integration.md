This page provides an overview of the integration requirements for a practice management system to launch the Smart Health Checks Application. The requirements outlined are based on a reference architecture that includes separately hosted services to support the Smart Health Check solution. Other deployment architectures are possible but will have additional requirements not covered in this page or implementation guide generally. 

### Solution Overview

#### Overview

The Smart Health Checks Application (SHCA) is a standards-based data collection application supporting the Aboriginal and Torres Strait Islander Health Check assessment (henceforth referred to as, Health Check). It allows a Practice Management System (PMS) to support the collection of Health Check data without the need to implement and maintain each Health Check within the PMS itself. The PMS is integrated with the SHCA using HL7 FHIR standards and associated implementation guides as part of implementing the App Launch, Authorization Service and FHIR Server Application Programming Interfaces.

#### Assumptions and Constraints

This solution integration assumes the following:
1. The PMS is a desktop application deployed on-premise within a primary care organisation’s private network or cloud-based virtual private network.
1. The PMS user agent will have access to SHCA and associated Ontoserver terminology service and Smart Health Checks Forms Server using public internet.
1. The PMS Authorization Service will allow secure access from the PMS user agent hosting the SHCA within the private network or public internet when required.
1. The PMS FHIR Server will allow secure access from the PMS user agent hosting the SHCA within the private network or public internet when required.
1. The PMS Authorization Service will maintain secure storage of launch context, authorization codes and access tokens as recommended by OAuth 2.0 specifications.
1. The PMS FHIR Server will maintain storage of FHIR QuestionnaireResponse resources.
1. The PMS FHIR Server will retrieve (read or search) the supported patient and user data from the PMS data store.
1. The PMS FHIR Server will save (create) the supported patient data to the PMS data store.

### Logical View

#### High Level Solution Architecture

The high-level architecture of the Smart Health Check solution is shown in the figure below. The solution consists of a PMS integrated with Smart Health Check Common Services. The PMS represents any existing or future PMS, on-premise or cloud-based, provided by any vendor whilst the Smart Health Check Common Services shared by the multiple and various PMS instances. The Smart Health Check Common Services is not limited to a single centralised deployment, it could be deployed within a jurisdiction, regionally or by a vendor as deemed appropriate.

<div><img src="architecture.png" alt="High Level Solution Architecture" style="max-width:60%;height:auto;padding:30px;"></div>

The PMS uses the FHIR SMART App Launch framework to launch the SHCA with a unique launch context that correlates to the current user, current patient, current patient visit and required Health Check.

The SHCA should be integrated within the PMS using an embedded web browser or inline frame (iframe). When necessary, the SHCA may be loaded as a separate web browser instance.

As part of the SHCA launch sequence, the App will request authorization to access the patient health data using the PMS Authorization Service. The authorize request allows the PMS to grant the App an authorization code that enables the App to then retrieve an access token to the FHIR Server and the App launch data associated with the specified launch context.

Using the App launch data, such as the Patient ID, user’s Practitioner ID and Health Check Questionnaire identifier, the SHCA will execute FHIR read and search requests against the PMS FHIR Server using the retrieved access token, to retrieve the patient health data required to pre-populate the requested Health Check. On completion of the Health Check the SHCA will send FHIR create requests and supply new patient information to the PMS FHIR server.

The user records Health Check data within the SHCA and the Health Check response data is saved as draft or completed using the FHIR Server QuestionnaireResponse create or update request.

##### Practice Management System Components
###### PMS App
The PMS App is an existing practice management system provided by a PMS software provider. The system may be deployed on-premise where the application and database servers are located within confines or control of the primary care organization. An on-premise system would normally be considered a desktop application, where the application executes on multiple workstations connected to a centralised database server. There are also some systems using a hybrid of on-premise and cloud infrastructure.

In the context of the Smart Health Check solution, the PMS App has a dependency on the PMS Authorization Service to stash launch context details such as the current patient, current user, current patient visit and the Health Check form to be filled, which can be retrieved later by the SHCA. 

The PMS also has a dependency on the SHCA, which provides the standards-based Health Check data capture functionality provided by the Smart Health Check solution.

###### PMS Authorization Service
The PMS Authorization Service is an OAuth authorisation server that supports SMART App Launch context, which enables a third-party application, such as the SHCA, to request access to patient data in the context of a user’s workflow.

###### PMS FHIR Server
The PMS FHIR Server is a standards-based Application Programming Interface (API) that enables personal health information to be securely exchanged with the PMS. The FHIR Server uses the HL7 FHIR standard that specifies the type of data and behaviour that can be provided by the API. The FHIR Server also allows health information, such as a Health Check response (i.e. FHIR QuestionnaireResponse) to be stored in the PMS, which may be supported natively within the PMS data store or as a separate FHIR data repository.

The PMS FHIR Server has a dependency on the PMS App where it accesses the patient data and user records from the PMS data store. 

##### Smart Forms Common Services Components
As noted earlier, the Smart Health Check Common Services does not have to be limited to a single centralised deployment, however, a reference implementation is hosted. See the [Reference Implementation](reference-implementation.html) page for more details.

###### Smart Health Checks Application
The SHCA is a browser-based web application that uses industry standards to provide a common user interface for the Smart Health Checks solution. The SHCA uses a Single Page Application (SPA) paradigm that allows a modern JavaScript enabled web browser to host the application without any logic executed or patient data stored on the server. 

The SHCA, uses the [HL7 Structured Data Capture (SDC) Implementation Guide (IG)](https://hl7.org/fhir/uv/sdc/STU3/index.html) to implement a rendering of Health Check forms defined using FHIR Questionnaire resources and represent the data captured using FHIR QuestionnaireResponse resources. The SDC IG provides guidance and extensions that enables the SHCA to provide advanced rending, pre-population, data extraction, dynamic behaviour and forms modularisation in a standardised manner. This means the SHCA is also capable of supporting any compatible form defined in accordance with the HL7 Structured Data Capture (SDC) Implementation Guide (IG).

The SHCA has a dependency on the PMS Authorization Service to request access to the PMS patient data with permissions authorised as part of the authorization flow.

The SHCA has a dependency on the PMS FHIR Server to access the patient data required to pre-populate the Health Check form, store the captured Health Check data and write back patient data.

The SHCA has a dependency on the Smart Forms Server that provides the Health Check form as a FHIR Questionnaire resource. Since the SHCA is hosted within the PMS User agent, the request to retrieve the Questionnaire resource originates from the PMS User agent to the Smart Forms Server over the public internet.

The SHCA also has a dependency on the Ontoserver terminology server that maintains the value sets required in a Health Check form and expand filtered lists of coded concepts such as diagnoses and body sites. The Ontoserver requests that originate from the SHCA will also be transported over the public internet.

###### Smart Forms Server
The Smart Forms Server is an implementation of a FHIR Server specifically used to support the management of forms represented as FHIR Questionnaire resources. 

The Smart Forms Server will also be used during the Health Check form development to maintain reusable Questionnaire modules assembled into the combined Health Check form used by the SHCA.

###### Ontoserver
Ontoserver is a terminology server with a FHIR API that allows the SHCA to access FHIR ValueSet resources used in Health Checks and evaluate filtered expansions at runtime based on user entered lookahead requests for concepts such as diagnoses, medications and body sites.

### Practice Management System Requirements

The conformance requirements for a system launching the SHCA and exchanging patient data are described by the [SHC Host FHIR Server CapabilityStatement](CapabilityStatement-SHCHostFHIRServerCapabilityStatement.html). This resource forms the normative requirements for integrating the Smart Health Check solution.

The two main capabilties required for integration are:
1. SMART App Launch Services; and
1. FHIR Server

#### SMART App Launch Services
A PMS will be required to implement SMART App Launch following the EHR launch flow. The [SMART App Launch implementation guide](https://hl7.org/fhir/smart-app-launch/STU2.2/index.html) describes the requirements in detail. Where needed, additional detail is provided below.

##### App Registration
The PMS Authorization Service will require a one-time setup to register the SHCA.

The registration details below can be used.

| Attribute    | Details                                          |
|--------------|--------------------------------------------------|
| Client name  | Smart Health Checks Application                  |
| Client ID    | smart-health-checks-application                  |
| Launch URL   | https://healthchecks.smartforms.io/launch        |
| Redirect URI | https://healthchecks.smartforms.io/              |

##### Launch Context
To support SHCA launch, the PMS will need to store the required launch context in representation and at a secure location accessible by the PMS Authorization Service. The launch context will be supplied as a `launch` parameter in the launch request using a unique and opaque launch identifier. It will also be verified against the `launch` parameter supplied in the authorization request.

The SHCA has the following launch context requirements:

| Parameter          | Condition |  Description                                                                                                                                                                                                                                   |
|--------------------|-----------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| patient	         | required  | Current patient identifier used to retrieve the Patient via FHIR Server.                                                                                                                                                                       |
| encounter	         | optional  | Current patient visit identifier used to retrieve the Encounter via FHIR Server.                                                                                                                                                               |
| sub	             | required	 | Unique identifier of the user as known by the PMS authorization service.                                                                                                                                                                       |
| preferred_username | optional  | Username used to login to PMS.                                                                                                                                                                                                                 |
| fhirUser	         | required	 | Current user identifier used to retrieve the user’s Practitioner resource via the FHIR API.                                                                                                                                                    |
| fhirContext        | required  | The Health Check Questionnaire context to be launched <br/> `[{ "role": "http://ns.electronichealth.net.au/smart/role/new", "type": "Questionnaire", "canonical": " http://www.health.gov.au/assessments/mbs/715" }]` |

##### Authorization Request
SHCA will request the following access scopes in the authorization request `scope` parameter:
* `launch`
* `openid`
* `fhirUser`
* `online_access`
* `patient/AllergyIntolerance.cus`
* `patient/Condition.cus`
* `patient/Encounter.r`
* `patient/Immunization.cs`
* `patient/Medication.r`
* `patient/MedicationStatement.cus`
* `patient/Observation.cs`
* `patient/Patient.r`
* `patient/QuestionnaireResponse.crus`
* `user/Practitioner.r`
* `launch/questionnaire?role=http://ns.electronichealth.net.au/smart/role/new`

#### FHIR Server
A PMS will need to provide a FHIR compatible service that supports the requirements of the SHCA. 

Fundamental requirements are defined in the [core FHIR<sup>&reg;&copy;</sup> specification]({{site.data.fhir.path}}) and Australian localisation requirements of the core FHIR<sup>&reg;&copy;</sup> specification are defined in [AU&nbsp;Core](https://hl7.org.au/fhir/core/1.0.0) and [AU&nbsp;Base](https://hl7.org.au/fhir/5.0.0). Additional detail is provided below.

The PMS FHIR Server requirements are described by the [SHC Host FHIR Server CapabilityStatement](CapabilityStatement-SHCHostFHIRServerCapabilityStatement.html). 

A summary of the required FHIR endpoints, resources and RESTful interactions are shown below. If there are any variations between this page and the CapabilityStatement above, the CapabilityStatement takes precedence.

* .well-known/smart-configuration (in accordance with the [SMART App Launch implementation guide](https://hl7.org/fhir/smart-app-launch/STU2.2/app-launch.html#retrieve-well-knownsmart-configuration))
* [Smart Health Checks AllergyIntolerance](StructureDefinition-SHCAllergyIntolerance.html) - `create`, `patch`, `search`
* [Smart Health Checks Condition](StructureDefinition-SHCCondition.html) - `create`, `patch`, `search`
* [Smart Health Checks Encounter](StructureDefinition-SHCEncounter.html) - `read`
* [Smart Health Checks Immunization](StructureDefinition-SHCImmunization.html) - `create`, `search`
* [Smart Health Checks Medication](StructureDefinition-SHCMedication.html) - `read`
* [Smart Health Checks MedicationStatement](StructureDefinition-SHCMedicationStatement.html) - `create`, `patch`, `search`
* Observations
    * [Smart Health Checks Blood Pressure](StructureDefinition-SHCBloodPressure.html) - `create`, `search`
    * [Smart Health Checks Body Height](StructureDefinition-SHCBodyHeight.html) - `create`, `search`
    * [Smart Health Checks Body Weight](StructureDefinition-SHCBodyWeight.html) - `create`, `search`
    * [Smart Health Checks Head Circumference](StructureDefinition-SHCHeadCircumference.html) - `create`, `search`
    * [Smart Health Checks Heart Rate](StructureDefinition-SHCHeartRate.html) - `create`, `search`
    * [Smart Health Checks Heart Rhythm](StructureDefinition-SHCHeartRhythm.html) - `create`, `search`
    * [Smart Health Checks Pathology Result](StructureDefinition-SHCPathologyResult.html) - `search`    
    * [Smart Health Checks Smoking Status](StructureDefinition-SHCSmokingStatus.html) - `create`, `search`
    * [Smart Health Checks Waist Circumference](StructureDefinition-SHCWaistCircumference.html) - `create`, `search`
* [Smart Health Checks Patient](StructureDefinition-SHCPatient.html) - `read`
* [Smart Health Checks Practitioner](StructureDefinition-SHCPractitioner.html) - `read`
* [Smart Health Checks Questionnaire Response](StructureDefinition-SHCQuestionnaireResponse.html) - `create`, `read`, `update`, `search`

