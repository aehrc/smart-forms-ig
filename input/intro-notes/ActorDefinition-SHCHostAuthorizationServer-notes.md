### SHC Host Authorization Server Interactions

#### Authorization Request

The Health Check App responds to the PMS browser to redirect to the authorization URL with the required authorization request parameters including the response_type, client_id, redirect_uri, scope, aud, state, code_challenge, code_challenge_method and launch. 
The Authorization Server, if required by PMS organization policies, may respond with a data access consent form where the PMS User grants the App access to the requested data. 

#### Authorization Callback
When granted, the Authorization Server response redirects the PMS browser back to the Health Check App authorization callback (redirect_uri) endpoint with a code parameter.

#### Token Request
The Health Check App authorization callback extracts the code parameter and uses the token_endpoint URL to exchange it for an access token. The HTTP POST request body includes the required parameters including the code, grant_type, client_id, redirect_uri and code_verifier. 

The Authorization Server response contains the token_type, access_token, id_token, scope and the relevant launch context data stashed by the PMS such as patient, encounter and health check questionnaire, which can be used to retrieve by Id the respective FHIR resources from the PMS FHIR API.

The id_token is a signed JWT that contains an encoding of user details, including a fhirUser reference that can be used to retrieve from the FHIR API a FHIR resource representing the user.
