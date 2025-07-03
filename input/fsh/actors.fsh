Instance: SHCApp
InstanceOf: ActorDefinition
Usage: #definition
Description: "The SHC App is a system that a SHC Host can launch allowing a user to fill out a health check form, prepopulated with patient health information retrieved from the SHC Host FHIR Server, and writeback data collected in the form."

* name = "SHCApp"
* title = "SHC App"
* status = #draft
* experimental = false
* type = #system
* documentation = """The Smart Health Checks (SHC) App: 
- **SHALL** accept [App Launch](https://hl7.org/fhir/smart-app-launch/app-launch.html#launch-app-ehr-launch) request
- **SHALL** invoke [SMART Authorization Configuration](https://hl7.org/fhir/smart-app-launch/app-launch.html#retrieve-well-knownsmart-configuration) request
- **SHALL** redirect to [Authorization Request](https://hl7.org/fhir/smart-app-launch/app-launch.html#obtain-authorization-code)
- **SHALL** accept Authorization Callback request
- **SHALL** invoke [Token Request](https://hl7.org/fhir/smart-app-launch/app-launch.html#obtain-access-token)
- **SHALL** authorise FHIR API requests using Bearer access token per [SMART APP Launch Access FHIR API](https://hl7.org/fhir/smart-app-launch/app-launch.html#access-fhir-api)
- **SHALL** invoke read Practitioner request
- **SHALL** invoke read Patient request
- **SHALL** invoke search QuestionnaireResponse request
- **SHALL** invoke read QuestionnaireResponse request
- **SHALL** invoke create and update QuestionnaireResponse request
- **SHALL** invoke search and read requests for resources required by this IG to pre-populate questionnaire response
- **SHALL** invoke create and patch requests in a transaction Bundle for resources required by this IG
"""
* capabilities = "https://smartforms.csiro.au/ig/CapabilityStatement/SmartFormsApplication"

Instance: SHCHost
InstanceOf: ActorDefinition
Usage: #definition
Description: "The SHC Host is a system that allows a user to launch the SHC App within an embedded or externally launched web browser to fill out a health check form."

* name = "SHCHost"
* title = "SHC Host"
* status = #draft
* experimental = false
* type = #system
* documentation = """The SHC Host: 
- **SHALL** initiate [App Launch](https://hl7.org/fhir/smart-app-launch/app-launch.html#launch-app-ehr-launch) request
- **SHALL** support App launch context elements including:
  - patient
  - fhirUser
  - fhirContext with following items:
    - canonical: https://hl7.org/fhir/Questionnaire/example123, role: https://hl7.org/fhir/Questionnaire
    - ... 
"""

Instance: SHCHostAuthorizationServer
InstanceOf: ActorDefinition
Usage: #definition
Description: "The SHC Host Authorization Server allows the SHC App to request authorisation from the PMS user to access patient health information to prepopulate and write back health checks data using the PMS FHIR Server."

* name = "SHCHostAuthorizationServer"
* title = "SHC Host Authorization Server"
* status = #draft
* experimental = false
* type = #system
* documentation = """The SHC Host Authorization Server: 
- **SHALL** respond to [Authorization Request](https://hl7.org/fhir/smart-app-launch/app-launch.html#obtain-authorization-code)
- **SHALL** respond to [Token Request](https://hl7.org/fhir/smart-app-launch/app-launch.html#obtain-access-token)
- **SHALL** support SMART App Launch scopes: 
  - openid fhirUser
  - launch
  - user/Practitioner.r
  - patient/Patient.r
  - patient/*.rs
  - user/QuestionnaireResponse.crus
  - ...
"""

Instance: SHCHostFHIRServer
InstanceOf: ActorDefinition
Usage: #definition
Description: "The SHC Host FHIR Server allows the SHC App to retrieve patient health information and writeback collected health check data."

* name = "SHCHostFHIRServer"
* title = "SHC Host FHIR Server"
* status = #draft
* experimental = false
* type = #system
* documentation = """The SHC Host FHIR Server: 
- **SHALL** respond to [SMART Authorization Configuration`](https://hl7.org/fhir/smart-app-launch/app-launch.html#retrieve-well-knownsmart-configuration) request
- **SHALL** authorise FHIR API requests using Bearer access token per [SMART APP Launch Access FHIR API](https://hl7.org/fhir/smart-app-launch/app-launch.html#access-fhir-api)
- **SHALL** respond to read Practitioner request
- **SHALL** respond to read Patient request
- **SHALL** respond to search QuestionnaireResponse request
- **SHALL** respond to read QuestionnaireResponse request
- **SHALL** respond to create and update QuestionnaireResponse requests
- **SHALL** respond to search and read requests for resources required by this IG
- **SHALL** respond to create and patch requests in a transaction Bundle for resources required by this IG
"""
* capabilities = "https://smartforms.csiro.au/ig/CapabilityStatement/SFLauncherServerAboriginalTorresStraitIslanderHealthCheck"