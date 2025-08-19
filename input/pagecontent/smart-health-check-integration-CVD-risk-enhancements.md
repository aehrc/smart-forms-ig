This page extends the [Smart Health Check Integration](smart-health-check-integration.html) guide, which describes the requirements for a Practice Management System (PMS) to launch the Smart Health Checks Application (SHCA). It focuses on integrating the AusCVDRisk-i calculator to support a streamlined CVD risk workflow within the Health Check.

### Background

The Smart Health Checks Application (SHCA) and Aus CVD Risk Calculator (AusCVDRisk-i) are both digital health tools that leverage HL7 FHIR Questionnaire resources to support standards-based data collection and integration into clinical workflows.

Both solutions utilise the SMART App Launch protocol for authentication and integration with Practice Management Systems (PMS).
The Aboriginal and Torres Strait Islander Health Check assessment (henceforth referred to as, Health Check) is implemented as a generic, reusable Questionnaire that can be rendered by any Structured Data Capture (SDC)-conformant renderer. Aus CVD Risk-i, by contrast, operates as a standalone SMART App.

One of the main goals of this project is to extend integration to support a streamlined Aus CVD Risk calculation workflow by integrating the Aus CVD Risk-i calculator into the Health Check's workflow.


#### Integration Complexity

While both solutions rely on similar standards and components, integrating their workflows in a standards-based way has proven more complex than initially anticipated.

The recommended option (as of now) involves launching Aus CVD Risk-i as a separate app via a link embedded in the Health Check form, supported by extended functionality to SMART App Launch implementation in the PMS.

The Health Check will also contain a “sync” function to bring in CVD risk results from Aus CVD Risk-i (written back into the PMS) into the Health Check form.

### Technical Solution

#### Overview

This implementation involves passing the Aus CVD Risk-i launch link as a launch context (using an Endpoint FHIR resource) when launching the SHCA, making the clickable link accessible within the Health Check form.

**This solution is in draft form. It is actively being reviewed and implementers are encouraged to provide feedback.**

#### Assumptions and Constraints

This solution integration assumes the following on top of the assumptions and constraints outlined in the [Smart Health Check Integration](smart-health-check-integration.html#assumptions-and-constraints) page:
1. The PMS user agent will have access to Aus CVD Risk-i and associated Ontoserver terminology service using public internet.
1. The PMS Authorization Service will allow secure access from the PMS user agent hosting Aus CVD Risk-i within the private network or public internet when required.
1. The PMS FHIR Server will allow secure access from the PMS user agent hosting Aus CVD Risk-i within the private network or public internet when required.
2. The PMS Authorization Service will maintain secure storage of an additional Endpoint launch context on top of SHCA Smart App Launch requirements.
1. The PMS FHIR Server will maintain storage of FHIR Endpoint resources, which may need to be removed once the endpoint is used.
1. The PMS FHIR Server will save (create) a CVD risk result to the PMS data store.

#### Sequence of steps
1.	The user launches the SHC App within the PMS.
2.	Before going through a standard SMART App Launch sequence for the SHC App, PMS creates a Aus CVD Risk-i launch link for one-time use. PMS saves this launch link as an Endpoint in its FHIR server.
Below is an draft example of the created Endpoint resource:
```json
{
  "resourceType": "Endpoint",
  "status": "active",
  "connectionType": {
    "system": "http://terminology.hl7.org/CodeSystem/endpoint-connection-type",
    "code": "hl7-fhir-rest"
  },
  "name": "AusCVDRisk-i Launch Endpoint",
  "managingOrganization": {
    "display": "National Heart Foundation of Australia"
  },
  "contact": [
    {
      "system": "email",
      "value": "cvdriskteam@heartfoundation.org.au",
      "use": "work"
    }
  ],
  "payloadType": [
    {
      "coding": [
        {
          "system": "urn:ihe:pcc:cm:2008",
          "code": "urn:ihe:pcc:cm:2008",
          "display": "Care Management (CM)"
        }
      ],
      "text": "Care Management Document"
    }
  ],
  "payloadMimeType": [
    "text/html"
  ],
  "address": "https://example.com/launch?iss={pms_fhir_server_base_url}&launch={arbitrary_launch_id}"
}
```

3.	The PMS creates a launch context entry referencing the newly created Endpoint resource as a [fhirContext](https://build.fhir.org/ig/HL7/smart-app-launch/scopes-and-launch-context.html#fhircontext-exp).
Below is a draft example of the Endpoint launch context role to be defined in the [fhirContext Role Registry](https://confluence.hl7.org/spaces/FHIRI/pages/202409650/fhirContext+Role+Registry):
```json
{
  "role": "https://smartforms.csiro.au/ig/smart/role/launch-aus-cvd-risk-i",
  "type": "Endpoint",
  "reference": "Endpoint/{endpoint_id}"
}
```
4.	PMS goes through the SHC SMART App Launch sequence as usual, passing the Endpoint launch context to the SHCA as part of the sequence.
5.	The SHC App passes the Endpoint launch context to the renderer.
6.	The renderer accesses the launch context using a [FHIRPath cqf-expression](https://build.fhir.org/ig/HL7/sdc/behavior.html#cqf-expression) and presents a clickable Aus CVD Risk-i launch link within the SHC UI.
7.	The user clicks the link to start the Aus CVD Risk calculation workflow. This action does not terminate the SHCA session.
8.	Aus CVD Risk-i performs the risk assessment and writes the risk score back to the PMS via the PMS FHIR API.
9.	The user returns to the SHCA session, where the latest risk result can be imported back into the Health Check form via a sync button.


#### Impacts/Considerations:
1.	The PMS needs to implement specific enhancements on top of the standard SMART App Launch workflow, particularly steps 2 and 3 outlined above. This includes storage for Endpoint resources and the dynamic creation and assignment of launch context based on the latest Aus CVD Risk-i launch link.
2.	The PMS App needs to support running multiple SMART apps simultaneously, similar to how browser tabs operate.
3.	Security and expiration-time considerations need to be assessed for a persisted Aus CVD Risk-i launch link within an Endpoint resource.


### Support for various PMS scenarios

This section outlines how the Health Check form accommodates different levels of PMS support for SMART App Launch and Aus CVD Risk-i integration.

#### Scenario 1: PMS supports both Health Check and Aus CVD Risk-i integration, with launch link enhancement**  
An Aus CVD Risk-i launch link is embedded within the Health Check Questionnaire definition.
This enables the most seamless user experience where a direct link to launch Aus CVD Risk-i can be displayed in the Health Check form.
Clinicians can use this link to open Aus CVD Risk-i in a new “tab” or “frame” within the PMS.  
The risk result is written back via Aus CVD Risk-i and can be brought back into the Health Check form via a sync button.

#### Scenario 2: PMS supports both Health Check and Aus CVD Risk-i integration, without launch link enhancement**  
Instructional text is included within the Health Check Questionnaire definition to prompt clinicians to manually launch Aus CVD Risk-i from the PMS interface.
This provides clear guidance, even if direct linking (from scenario 1) is not supported by the PMS.  
The risk result is written back via Aus CVD Risk-i and can be brought back into the Health Check form via a sync button.

#### Scenario 3: PMS supports Health Check only**  
A link to the [online Aus CVD Risk Calculator](https://www.cvdcheck.org.au/) is included in the Health Check Questionnaire definition.
This ensures clinicians still have access to the CVD risk assessment tool, even if PMS integration with Aus CVD Risk-i is unavailable.  
Manual transcription of the risk result is required from the online calculator back into the Health Check form, with the risk result written back via the SHCA.
A pre-populated section with CVD risk-relevant input variables is provided within the Health Check to assist the user.
