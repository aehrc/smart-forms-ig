Instance: SHCApp
InstanceOf: ActorDefinition
Usage: #definition
Description: "The SHC App allows a user of the SHC Host to launch the SHC App for filling out a health check form prepopulated with a authorized patient health information retrieved from the SHC Host FHIR Server and writeback the collected form data."

* name = "SHCApp"
* title = "SHC App"
* status = #draft
* experimental = false
* type = #system
* documentation = "SHC App"
* capabilities = "https://smartforms.csiro.au/ig/CapabilityStatement/SmartFormsApplication"

Instance: SHCHost
InstanceOf: ActorDefinition
Usage: #definition
Description: "The SHC Host allows a user to launch the SHC App within an embedded or externally launched web browser to fill out a health check form."

* name = "SHCHost"
* title = "SHC Host"
* status = #draft
* experimental = false
* type = #system
* documentation = "SHC Host"

Instance: SHCHostAuthorizationServer
InstanceOf: ActorDefinition
Usage: #definition
Description: "The SHC Host Authorization Server allows the SHC App to request authorisation from the PMS user to access patient health information to prepopulate and write back health checks data using the PMS FHIR Server."

* name = "SHCHostAuthorizationServer"
* title = "SHC Host Authorization Server"
* status = #draft
* experimental = false
* type = #system
* documentation = "SHC Host Authorization Server"

Instance: SHCHostFHIRServer
InstanceOf: ActorDefinition
Usage: #definition
Description: "The SHC Host FHIR Server allows the SHC App to retrieve patient health information and writeback collected health check data."

* name = "SHCHostFHIRServer"
* title = "SHC Host FHIR Server"
* status = #draft
* experimental = false
* type = #system
* documentation = "SHC Host FHIR Server"
* capabilities = "https://smartforms.csiro.au/ig/CapabilityStatement/SFLauncherServerAboriginalTorresStraitIslanderHealthCheck"