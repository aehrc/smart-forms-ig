The following actor definitions have been defined for this implementation guide. 

- [SHC App](ActorDefinition-SHCApp.html)
    - The SHC App allows a user of the SHC Host to launch the SHC App for filling out a health check form prepopulated with a authorized patient health information retrieved from the SHC Host FHIR Server and writeback the collected form data.

- [SHC Host](ActorDefinition-SHCHost.html)
    - The SHC Host allows a user to launch the SHC App within an embedded or externally launched web browser to fill out a health check form.
    
- [SHC Host Authorization Server](ActorDefinition-SHCHostAuthorizationServer.html)
    - The SHC Host Authorization Server allows the SHC App to request authorisation from the PMS user to access patient health information to prepopulate and write back health checks data using the PMS FHIR Server.

- [SHC Host FHIR Server](ActorDefinition-SHCHostFHIRServer.html)
    - The SHC Host FHIR Server allows the SHC App to retrieve patient health information and write back collected health check data.

