This page provides implementation guidance on integrating a Practice Management System (PMS) with the Smart Health Checks Application (SHC App) based on the FHIR [SMART App Launch Implementation Guide](https://hl7.org/fhir/smart-app-launch/STU2.2/). 

The PMS **SHALL** implement components that comply with the [SHC Host](ActorDefinition-SHCHost.html), [SHC Host FHIR Server](ActorDefinition-SHCHostFHIRServer.html) and [SHC Host Authorization Server](ActorDefinition-SHCHostAuthorizationServer.html) actors specified in this implementation guide, to integrate with the SHC App by supporting the required [Smart Health Checks Interactions](index.html#smart-health-checks-interactions) summarised on the [Home](index.html#smart-health-checks-interactions) page. 

This SHC App Integration page will provide additional guidance on implementing these Smart Health Checks Interactions.

### SHC App Registration 
To establish a trust relationship between the PMS and the SHC App that enables the SHC App to be launched and exchange patient data with the PMS, the SHC Host Authorization Server is required to have a once-off client registration configured with the following settings. 

| Attribute    | Value                                          |
|--------------|--------------------------------------------------|
| Client Name  | Smart Health Checks Application                  |
| Client ID    | smart-health-checks-application                  |
| Redirect URIs | https://healthchecks.smartforms.io/             |

How this client registration is performed is not specified in this implementation guide and it is the responsibility of the PMS admininstrator to ensure the client details are configured as specified above.

Note that the Client ID is assigned by the SHC App to allow multiple PMSs to launch the app without it maintaining a Client ID for each SHC Host Authorization Server. If the Client ID can not be assigned in the SHC Host Authorization Server, please contact AEHRC to arrange a workaround.

The SHC App requests the following scopes, these can be configured in the SHC Host Authorization Server client registration details as required.
- launch
- openid
- fhirUser
- online_access
- patient/AllergyIntolerance.cus
- patient/Condition.cus
- patient/Encounter.r
- patient/Immunization.cs
- patient/Medication.r
- patient/MedicationStatement.cus
- patient/Observation.cs
- patient/Patient.r
- patient/QuestionnaireResponse.crus
- user/Practitioner.r
- launch/questionnaire?role=http://ns.electronichealth.net.au/smart/role/new

Other client registration details that may need to be configured in the SHC Host Authorization Server based on the [Client Metadata fields defined in the OAuth 2.0 Dynamic Client Registration Protocol](https://datatracker.ietf.org/doc/html/rfc7591#section-2) are shown below. 

| Attribute    | Value            |
|--------------|--------------------|
| Grant Type   | authorization_code |
| Response Type | code              |
| Token Endpoint Auth Method | none |

Note that there is no requirement by this implementation guide to implement the OAuth 2.0 Dynamic Client Registration Protocol, it is referenced here only as a guide of the metadata that may need to be configured in some authorization server implementations.

### SHC App Launch
The SHC User initiates the SHC Host to launch SHC App with a context of the current user, patient and health check questionnaire. 

The SHC App Launch request has the following parameters as specified for [App Launch: EHR Launch in the SMART App Launch Implementation Guide](https://hl7.org/fhir/smart-app-launch/app-launch.html#launch-app-ehr-launch).

| Parameter | Condition | Description |
|-----------|-----------|-------------|
| iss | required | Base URL of the PMS FHIR Server |
| launch | required | Launch identifier used to retrieve the launch context as part of the authorization process |

The SHC App Launch URL **SHOULD** be configured in the SHC Host and amended with the launch and iss parameters and their values as shown above. The base SHC App Launch URL is provided in the table below. 

| Attribute            | Value          |
|----------------------|----------------|
| SHC App Launch URL   | https://healthchecks.smartforms.io/launch |

The SHC Host initiates the launch sequence by invoking a HTTP GET request in a Web browser agent (as a new browser tab or iframe) with the launch described above including the launch and iss parameters as shown in the example below.

```
https://healthchecks.smartforms.io/launch?iss=https%3A%2F%2Fserver.com.au/fhir&launch=15fd8cc0b5ce4e4b9ab1cb83495412f5
```

The response to the SHC App Launch request will be a HTTP response that will be processed as usual by the Web browser agent that initiated the request. Under normal conditions the response will contain a HTML page or a HTTP redirect response.

#### Launch Context

The launch context will need to be made available to the SHC Host Authorization Server in order for it to pass this launch context to the SHC App in the response to the token request. The means by which the launch context is shared with the SHC Host Authorization Server is not specified by this implementation guide. It is the responsibility of the SHC Host and SHC Host Authorization Server implementation to ensure the context is shared reliably and populated as required in the token request response.

The full set of launch contexts that **SHOULD** be supported by the SHC Host and provided to the SHC App are shown in the table below.

| Parameter | Condition | Description |
|-----------|-----------|-------------|
| patient	  | required  | Current patient identifier used to retrieve the Patient via FHIR Server |
| encounter	| optional  | Current patient visit identifier used to retrieve the Encounter via FHIR Server |
| sub	      | required  | Unique identifier of the user as known by the PMS authorization service |
| preferred_username | optional  | Username used to login to PMS |
| fhirUser	         | required	 | Current user identifier used to retrieve the user’s Practitioner resource via the FHIR API |
| fhirContext        | required  | Health Check Questionnaire context to be launched <br/> `[{ "role": "http://ns.electronichealth.net.au/smart/role/new", "type": "Questionnaire", "canonical": " http://www.health.gov.au/assessments/mbs/715" }]` |

An opache launch identifier that references the launch context is provided in the `launch` parameter of the SHC App Launch URL as described above.

### SMART Authorization Configuration
The SHC App uses the SHC Host FHIR Server to locate the SHC Host Authorization Server endpoints and capability.

The SHC Host FHIR Server **SHALL** provide a `.well-known/smart-configuration` endpoint as described in the [SMART App Launch Implementation Guide](https://hl7.org/fhir/smart-app-launch/STU2.2/app-launch.html#retrieve-well-knownsmart-configuration).

#### SMART Configuration Response

The expected `.well-known/smart-configuration` response elements are shown in the table below.

| Attribute    | Condition | Details |
|--------------|---------- | --------|
| issuer | required | Authorization server’s Issuer URI (authorization server base URL) |
| jwks_uri | optional | Authorization server’s JSON Web Key Set URL |
| authorization_endpoint | required | Authorization server’s authorization URL |
| grant_types_supported | required | Authorization endpoint grant types supported. Expected value: `authorization_code`. |
| token_endpoint | required | Authorization server’s token URL |
| token_endpoint_auth_method | optional | The App is a public client, and hence does not have a client secret. Expected value: `none`. |
| registration_endpoint | optional | Authorization server registration endpoint |
| scopes_supported | optional | List of authorization and launch context scopes supported by the authorization server |
| response_types_supported | required | Authorization response types supported. Expected value: `code`. |
| code_challenge_methods_supported | optional | Code challenge method supported. Expected value: `S256`. |
| capabilities | optional | SMART capabilities supported by the server. Expected capabilities include:<br/>• `launch-ehr`<br/>• `authorize-post`<br/>• `client-public`<br/>• `context-ehr-patient`<br/>• `context-ehr-encounter`<br/>• `permission-v2`<br/>• `permission-patient`<br/>• `permission-user`. |

### Authorization Request
The SHC Host Authorization Server **SHALL** implement the OAuth 2.0 Authorization Code flow as required by the FHIR SMART App Launch Implementation Guide. 

As part of the SHC App launch sequence, the SHC App redirects the browser agent to the SHC Host Authorization Server to request authorisation to access patient health information from the SHC Host FHIR Server. The SHC User may be prompted to permit or deny access to the requested data.

The SHC Host Authorization Server **SHALL** provide an Authorization Request endpoint for both HTTP GET and HTTP POST methods with the following parameters as specified  in the [SMART App Launch implementation guide](https://hl7.org/fhir/smart-app-launch/STU2.2/app-launch.html#step-4-authorization-code). 

| Parameter | Condition | Description | 
| --------- | ----------- | --- |
| response_type | required | Fixed value: code |
| client_id | required | Client identifier for the registered SHC App |
| redirect_uri | required | Redirect URI for the registered SHC App |
| launch | required | Launch identifier provided in the launch request correlates to the stashed launch context |
| scope | required | Space delimited list of authorization scopes requested by the SHC App |
| state | required | An unpredictable unique identifier used to correlate the authorization request with the subsequent redirect response |
| aud | required | Base URL of the FHIR server the SHC App is requesting access to |
| code_challenge | optional | PKCE code challenge generated by the SHC App | 
| code_challenge_method | Required when code_challenge exists | PKCE code challenge method |

The SHC App will use the HTTP GET method only, but the HTTP POST method is supported to comply with the FHIR SMART App Launch Implementation Guide conformance requirements.

#### Authorization GET Request
In the case of a HTTP GET request, the query parameters **SHALL** be URL encoded as shown in request example below.

```
GET https://https://auth.pmsserver.com.au/oauth/authorize?response_type=code&client_id=c6807eb65497423e8ef56f05956afb0f&scope=launch%20openid%20fhirUser%20online_access%20patient%2FPatient.rs%20patient%2FCondition.rs%20patient%2FObservation.rs%20patient%2FEncounter.rs%20patient%2FQuestionnaireResponse.crus&redirect_uri=https%3A%2F%2Fsmartforms.csiro.au&state=NhlJ741C31hRDf8v&aud=https%3A%2F%2Fpmsserver.com.au/fhir&launch=15fd8cc0b5ce4e4b9ab1cb83495412f5&code_challenge=E9Melhoa2OwvFrEMTJguCHaoeK1t8URWbuGJSstwcM&code_challenge_method=S256
```

#### Authorization POST Request
When the request is invoked using HTTP POST, the parameters are provided in the body of the request represented using the Web form URL encoding and indicated in the HTTP `Content-Type` header as `application/x-www-form-urlencoded`. An example of HTTP Post request is shown below.

```
POST /oauth/authorize
Content-Type: application/x-www-form-urlencoded
Host: https://auth.pmsserver.com.au

response_type=code&client_id=c6807eb65497423e8ef56f05956afb0f&scope=launch%20openid%20fhirUser%20online_access%20patient%2FPatient.rs%20patient%2FCondition.rs%20patient%2FObservation.rs%20patient%2FEncounter.rs%20patient%2FQuestionnaireResponse.crus&redirect_uri=https%3A%2F%2Fsmartforms.csiro.au&state=NhlJ741C31hRDf8v&aud=https%3A%2F%2Fpmsserver.com.au%2Ffhir&launch=15fd8cc0b5ce4e4b9ab1cb83495412f5&code_challenge=E9Melhoa2OwvFrEMTJguCHaoeK1t8URWbuGJSstw-cM&code_challenge_method=S256
```

### Authorization Callback
The SHC Host Authorization Server responds back to the SHC App with a HTTP redirect response with a HTTP status code of `302 Found` to proceed with the authorised launch of the SHC App. 

#### Authorization Granted Response
When the authorization request is granted, the authorization callback response contains a `Location` header URL matching the `redirect_uri` parameter provided in the request with the parameters shown in the table below.

| Parameter | Description | 
| --------- | --- |
| code | The authorization code. |
| state | The state value provided in the authorization request to correlate this redirect response with the request. |

#### Authorization Error Response
When an error occurs during the authorization callback request, an error response is returned as a HTTP Redirect with a HTTP status
code of `302 Found`. The `Location` header URL matches the `redirect_uri` parameter provided in the request shown in the the table.

| Parameter | Description | 
| --------- | --- |
| error | The error code from the following set:<br/>• `invalid_request`<br/>• `unauthorized_client`<br/>• `access_denied`<br/>• `unsupported_response_type`<br/>• `invalid_scope`<br/>• `server_error` – unexpected server error, equivalent to HTTP 500 Internal Server Error status code<br/>• `temporarily_unavailable` – server temporarily unavailable, equivalent to HTTP 503 Server Unavailable status code |
| error_description | Optional human readable description of the error |

An example of the response is shown below.

```
HTTP 302 Found
Location: https://smartforms.csiro.au?error=unauthorized_client&error_description=redirect_uri%20does%20not%20match%20client%20registration
```

When the Web browser client receives the authorize request response, the application **SHALL** display the error details and not attempt to access the SHC Host FHIR Server.

#### Code Challenge
The `code_challenge` parameter provides mitigation against authorization code interception attacks based on the Proof Key for Code Exchange (PKCE) internet standard RFC 7636. The following is provided for information only.

A `code_challenge` is generated by the client for each authorize request and provided in the request by following the steps below:

1. Generate a code verifier as a random string with a length between 43 and 128 using characters from [A-Z] / [a-z] / [0-9] / "-" / "." / "_" / "~". <br/>For example:
`dBjftJeZ4CVP-mB92K27uhbUJU1p1r_wW1gFWFOEjXk`
2. Hash the code verifier string using SHA-256 hashing algorithm
3. Encode the hashed string using the Base64 URL encoding (i.e. ensure +, / and = characters are replaced as per [section 5 of RFC4648](https://www.rfc-editor.org/rfc/rfc4648#section-5)).

### Token Request
The SHC App requests an access token and associated launch context from the SHC Host Authorization Server.

The token request is a HTTP POST with the following parameters as specified in the FHIR SMART App Launch Implementation Guide.

| Parameter | Condition | Description |
| --------- | --------- | ----------- |
| grant_type | required | Fixed value: `authorization_code` |
| code | required | code parameter value returned in authorize response |
| client_id | required | Client identifier for the registered SHC App | 
| redirect_uri | required | Redirect URI for the registered SHC App | 
| code_verifier | optional | PKCE code used to verify this request against the `code_challenge` provided in the preceding authorize request |

An example of the token request is shown below.

```
POST /oauth/token
Content-Type: application/x-www-form-urlencoded
Host: https://auth.pmsserver.com.au

grant_type=authorization_code&code=c1c3b2fe54334efb901e34b095f837dd&client_id=c6807eb65497423e8ef56f05956afb0f&redirect_uri=https%3A%2F%2Fsmartforms.csiro.au&code_verifier=dBjftJeZ4CVP-mB92K27uhbUJU1p1r_wW1gFWFOEjXk
```

#### Token Response

The token response contains a JSON payload in the body with the following elements:

| Element | Condition | Description |
| ------- | --------- | ----------- |
| access_token | required | Access token |
| token_type | required | Fixed value: `Bearer` |
| expires_in | required | Number of seconds the access token is valid. Nominally tokens are short lived, for example one hour (3600 seconds). |
| scope | required | Space delimited list of scopes granted to the SHC App as part of the authorize process. The list of scopes may not be the same as what was requested. |
| id_token | required | Encoded identity using a JSON Web Token (JWT) per the OpenID Connect Core 1.0 specifications. When decoded and verified, the token contains identity details of the user that launched the app and a FHIR Practitioner resource reference representing the user. The `id_token` is provided when the `openid fhirUser` scopes are requested and granted. |
| ~~refresh_token~~ | ~~optional~~ | ~~An token that can be used to request a new access token to continue a session beyond the current access token expiry time. A refresh token is only provided when requested using the `online_access` scope.~~ |
| patient | required | FHIR Patient id provided in the launch context |
| encounter | optional | FHIR Encounter id provided in the launch context |
| fhirContext | required | A list of other FHIR resource references that have been requested as launch context. Each `fhirContext` item has a relative or canonical reference to a FHIR resource and a role represented as the canonical URL of the FHIR resource type. When a specified health check form is requested, the Questionnaire canonical URL **SHALL** be provided in the `fhirContext`. |

#### Access Token
The access token is opaque to the client and its representation **SHOULD** only be known by the SHC FHIR Authorization Server and SHC Host FHIR Server.

This implementation guide does not specify the representation of the access token, but OAuth 2.0 implementations commonly use either an opaque key used to retrieve the token context from the authorization service using an introspection request, or an encoded [JSON Web Token (JWT)](https://www.rfc-editor.org/rfc/rfc7519.html) signed using [JSON Web Signature (JWS)](https://datatracker.ietf.org/doc/html/rfc7515).

#### ID Token 
The SHC Host Authorization Server **SHALL** provide a correctly encoded `id_token` element in the token response when the SHC App specifies the `openid` scope in the Authorization Request. 

The ID Token is an encoded set of security claims used to securely identify the user of the launch session as specified in the [OpenID Connect Core 1.0 (OIDC)](https://openid.net/specs/openid-connect-core-1_0-final.html#IDToken) specification. The claims are represented as a JSON Web Token (JWT) encoded using JSON Web Signature (JWS) Compact serialization. 

The SHC Host Authorization Server **SHALL** provide a `fhirUser` claim that references the FHIR resource representing the user when the SHC App specifies the `fhirUser` scope in the Authorization Request as specified in the [SMART App Launch Implementation Guide](https://hl7.org/fhir/smart-app-launch/scopes-and-launch-context.html#scopes-for-requesting-identity-data). 

The ID Token is composed of three parts:
* JWS Protected Header
* JWS Payload
* JWS Signature

Each of these three parts are BASE64URL encoded and concatenated with a period (‘.’) as the delimited as outlined below:
```
BASE64URL({JWS Protected Header}) + '.'
+ BASE64URL({JWS Payload}) + '.'
+ BASE64URL({JWS Signature})
```

##### JWS Protected Header 
The JWS Protected Header has two elements as described below.

| Element | Description |
| ------- | ----------- |
| typ | Fixed value: `JWT` |
| alg | Signature algorithm (RSA SHA-256). Fixed value: `RS256`. |

An example is shown below.

```
{"typ":"JWT","alg":"RS256"}
```

This is Base64URL encode as shown below.

```
eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9
```

##### JWS Payload
The JWS Payload claims required by the [OIDC specification](https://openid.net/specs/openid-connect-core-1_0-final.html#IDToken) and [SMART App Launch](https://hl7.org/fhir/smart-app-launch/scopes-and-launch-context.html#scopes-for-requesting-identity-data) fhirUser claims are described below.

| Element | Description |
| ------- | ----------- |
| sub | Unique identifier of the user as known by the PMS authorization service |
| iss | Authorization service issuer |
| aud | Client URI |
| fhirUser | FHIR Practitioner reference | 
| preferred_username | Optional username used by the user to login to the PMS | 
| iat | Token issued at |
| exp | Token expiry time |

An example of the JWS Payload is shown below.

```
{
  "sub":"f256d3ba-bb70-4613-a631-825d500c57fa",
  "iss":"https://auth.pmsserver.com.au",
  "aud":"https://smartforms.csiro.au",
  "fhirUser":"Practitioner/f256d3ba-bb70-4613-a631-825d500c57fa",
  "preferred_username":"janedoe",
  "iat":1690903483,
  "exp":1690907083
}
```

Below is Base64URL encoded JWS Payload.

```
eyAKICJzdWIiOiJmMjU2ZDNiYS1iYjcwLTQ2MTMtYTYzMS04MjVkNTAwYzU3ZmEiLCAKICJpc3MiOiJodHRwczovL2F1dGgucG1zc2VydmVyLmNvbS5hdSIsIAogImF1ZCI6Imh0dHBzOi8vc21hcnRmb3Jtcy5jc2lyby5hdSIsIAogImZoaXJVc2VyIjoiUHJhY3RpdGlvbmVyL2YyNTZkM2JhLWJiNzAtNDYxMy1hNjMxLTgyNWQ1MDBjNTdmYSIsIAogInByZWZlcnJlZF91c2VybmFtZSI6ImphbmVkb2UiLCAKICJpYXQiOjE2OTA5MDM0ODMsIAogImV4cCI6MTY5MDkwNzA4MyAKfSA
```

##### JWS Signature
The JWS Signature uses the RSA PKCS1 SHA-256 algorithm where the input string is the concatenation of the JWS Protected Header and JWS Payload delimited with a period (`.`). For example:

```
eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyAKICJzdWIiOiJmMjU2ZDNiYS1iYjcwLTQ2MTMtYTYzMS04MjVkNTAwYzU3ZmEiLCAKICJpc3MiOiJodHRwczovL2F1dGgucG1zc2VydmVyLmNvbS5hdSIsIAogImF1ZCI6Imh0dHBzOi8vc21hcnRmb3Jtcy5jc2lyby5hdSIsIAogImZoaXJVc2VyIjoiUHJhY3RpdGlvbmVyL2YyNTZkM2JhLWJiNzAtNDYxMy1hNjMxLTgyNWQ1MDBjNTdmYSIsIAogInByZWZlcnJlZF91c2VybmFtZSI6ImphbmVkb2UiLCAKICJpYXQiOjE2OTA5MDM0ODMsIAogImV4cCI6MTY5MDkwNzA4MyAKfSA
```

The input string is signed using the Authorization server’s private key and the resulting octets are encoded using BASE64URL as shown below.

```
XHuRvmNvJJvJotJ9EOOy49Prc_zv9krh8bLdXUqYdp85A55woHaogGPrK-_XltDrltV13NTqJQVMUD1YaXUwyZGsVITjdjHsURt0ei09wWfkVB9aMFDkO6p5WuEOmkr--ZOmnDl298WVROnkKvqCRgBVc8-dfk9BvCo1o_ZdWER5zcvlD9xFlZIqJ7-iM0s9c0YhOMjp2ZJTvSOxEBEcSV3xn2M1ZYQMTRrUlUtuBHtasUcqXVpqBYmWJGIo_GqWi7aD821kIMvvE275wnp5H76CXLQYxMLvnuUVK2ogmULjegn9JcOI9gOZz0a3B2VzkE3Cc6naIOoP_c8zZnF9w
```

The resulting ID token after concatenating the three parts is shown below.

```
eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyAKICJzdWIiOiJmMjU2ZDNiYS1iYjcwLTQ2MTMtYTYzMS04MjVkNTAwYzU3ZmEiLCAKICJpc3MiOiJodHRwczovL2F1dGgucG1zc2VydmVyLmNvbS5hdSIsIAogImF1ZCI6Imh0dHBzOi8vc21hcnRmb3Jtcy5jc2lyby5hdSIsIAogImZoaXJVc2VyIjoiUHJhY3RpdGlvbmVyL2YyNTZkM2JhLWJiNzAtNDYxMy1hNjMxLTgyNWQ1MDBjNTdmYSIsIAogInByZWZlcnJlZF91c2VybmFtZSI6ImphbmVkb2UiLCAKICJpYXQiOjE2OTA5MDM0ODMsIAogImV4cCI6MTY5MDkwNzA4MyAKfSA.XHuRvmNvJJvJotJ9EOOy49Prc_zv9krh8bLdXUqYdp85A55woHaogGPrK-_XltDrltV13NTqJQVMUD1YaXUwyZGsVITjdjHsURt0ei09wWfkVB9aMFDkO6p5WuEOmkr--ZOmnDl298WVROnkKvqCRgBVc8-dfk9BvCo1o_ZdWER5zcvlD9xFlZIqJ7-iM0s9c0YhOMjp2ZJTvSOxEBEcSV3xn2M1ZYQMTRrUlUtuBHtasUcqXVpqBYmWJGIo_GqWi7aD821kIMvvE275wnp5H76CXLQYxMLvnuUVK2ogmULjegn9JcOI9gOZz0a3B2VzkE3Cc6naIOoP_c8zZnF9w
```

The ID token example above can be decoded and verified using the JWT debugger at https://jwt.io/ with the following JSON Web Key (JWK).
```
{
  "kty": "RSA",
  "kid": "cc34c0a0-bd5a-4a3c-a50d-a2a7db7643df",
  "use": "sig",
  "n": "pjdss8ZaDfEH6K6U7GeW2nxDqR4IP049fk1fK0lndimbMMVBdPv_hSpm8T8EtBDxrUdi1OHZfMhUixGaut-3nQ4GG9nM249oxhCtxqqNvEXrmQRGqczyLxuh-fKn9Fg--hS9UpazHpfVAFnB5aCfXoNhPuI8oByyFKMKaOVgHNqP5NBEqabiLftZD3W_lsFCPGuzr4Vp0YS7zS2hDYScC2oOMu4rGU1LcMZf39p3153Cq7bS2Xh6Yvw5pwzFYZdjQxDn8x8BG3fJ6j8TGLXQsbKH1218_HcUJRvMwdpbUQG5nvA2GXVqLqdwp054Lzk9_B_f1lVrmOKuHjTNHq48w",
  "e": "AQAB"
}
```

### Prepopulate Health Check
The SHC App uses the launch context to access patient data using the SHC Host FHIR Server. This includes:

1. read Practitioner
2. read Patient
3. read Encounter
4. read or search QuestionnaireResponse
5. various search requests to prepopulate the health check form.

The SHC Host FHIR Server **SHALL** support the SHC profiles and interactions as specified in the [SHC Host FHIR Server CapabilityStatement](CapabilityStatement-SHCHostFHIRServerCapabilityStatement.html). 

A summary of the required SHC profiles and interactions are shown below. 

| Profile | Read | Search | 
| ------- | ---- | ------ | 
| [Smart Health Checks AllergyIntolerance](StructureDefinition-SHCAllergyIntolerance.html) | | **Y** |
| [Smart Health Checks Condition](StructureDefinition-SHCCondition.html) | | **Y** |
| [Smart Health Checks Encounter](StructureDefinition-SHCEncounter.html) | **Y** | |
| [Smart Health Checks Immunization](StructureDefinition-SHCImmunization.html) | | **Y** |
| [Smart Health Checks Medication](StructureDefinition-SHCMedication.html) | **Y** | |
| [Smart Health Checks MedicationStatement](StructureDefinition-SHCMedicationStatement.html) | | **Y** |
| [Smart Health Checks Patient](StructureDefinition-SHCPatient.html) | **Y** | |
| [Smart Health Checks Practitioner](StructureDefinition-SHCPractitioner.html) | **Y** | |
| [Smart Health Checks Questionnaire Response](StructureDefinition-SHCQuestionnaireResponse.html) | **Y** | **Y** |

If there are any variations between this page and the CapabilityStatement above, the CapabilityStatement takes precedence.

### Fill and Save Health Check
The user fills out the health check form and saves the form data using the following writeback requests.

#### Writeback Questionnaire Response

The health check form data is written back to the SHC Host FHIR Server as a QuestionnaireResponse.

The SHC Host FHIR Server **SHALL** support the SHC QuestionnaireResponse profile and writeback interactions as specified in the [SHC Host FHIR Server CapabilityStatement](CapabilityStatement-SHCHostFHIRServerCapabilityStatement.html). A summary is shown below.

| Profile | Create | Update | 
| ------- | ---- | ------ | 
| [Smart Health Checks Questionnaire Response](StructureDefinition-SHCQuestionnaireResponse.html) | **Y** | **Y** |

#### Writeback Extract Transaction

The health check form data extracted from a completed form as FHIR Resources are written back to the SHC Host FHIR Server as a transaction Bundle that complies with the [Smart Health Checks Extract Bundle](StructureDefinition-SHCExtractBundle.html) profile.

The SHC Host FHIR Server **SHALL** support the SHC writeback interactions, including the system wide transaction interaction, and the associated SHC profiles as specified in the [SHC Host FHIR Server CapabilityStatement](CapabilityStatement-SHCHostFHIRServerCapabilityStatement.html). 

The Writeback Extract Transaction could include a combination of FHIR 'create' and 'patch' interactions for the various FHIR Resource types. These are summarised in the sections below. If there are any variations between this page and the CapabilityStatement above, the CapabilityStatement takes precedence.

##### Create Writeback Interactions
A summary of the SHC profiles that could be included as a FHIR `create` interaction are shown below. 

| Profile | Create |
| --- | --- |
| [Smart Health Checks AllergyIntolerance](StructureDefinition-SHCAllergyIntolerance.html) | **Y** |
| [Smart Health Checks Condition](StructureDefinition-SHCCondition.html) | **Y** |
| [Smart Health Checks Immunization](StructureDefinition-SHCImmunization.html) | **Y** |
| [Smart Health Checks MedicationStatement](StructureDefinition-SHCMedicationStatement.html) | **Y** |
| **Observations** |  | 
| • [Smart Health Checks Blood Pressure](StructureDefinition-SHCBloodPressure.html) | **Y** |
| • [Smart Health Checks Body Height](StructureDefinition-SHCBodyHeight.html) | **Y** |
| • [Smart Health Checks Body Weight](StructureDefinition-SHCBodyWeight.html) | **Y** |
| • [Smart Health Checks Head Circumference](StructureDefinition-SHCHeadCircumference.html) | **Y** |
| • [Smart Health Checks Heart Rate](StructureDefinition-SHCHeartRate.html) | **Y** |
| • [Smart Health Checks Heart Rhythm](StructureDefinition-SHCHeartRhythm.html) | **Y** |
| • [Smart Health Checks Smoking Status](StructureDefinition-SHCSmokingStatus.html) | **Y** |
| • [Smart Health Checks Waist Circumference](StructureDefinition-SHCWaistCircumference.html) | **Y** |

##### Patch Writeback Interactions
The FHIR `patch` interaction uses the FHIR `Parameters` resource type as the body of the interaction request. These `Parameters` resources will comply with the [Smart Health Checks Patch](StructureDefinition-SHCPatch.html) Parameters profile. A summary of the SHC profiles and the resource element path that could be updated using the Writeback Extract Transaction as a FHIR `patch` interaction are shown below. 

| Profile | Patch | Patch element path  |
| --- | --- | --- |
| [Smart Health Checks AllergyIntolerance](StructureDefinition-SHCAllergyIntolerance.html)  | **Y** | `clinicalStatus`<br/>`note[0].text` |
| [Smart Health Checks Condition](StructureDefinition-SHCCondition.html)  | **Y** | `clinicalStatus`<br/>`abatement` |
| [Smart Health Checks MedicationStatement](StructureDefinition-SHCMedicationStatement.html)  | **Y** | `status`<br/>`dosage[0].text`<br/>`note[0].text` |
