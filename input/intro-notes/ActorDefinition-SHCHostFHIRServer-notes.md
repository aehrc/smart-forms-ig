#### SHC Host FHIR Server Interactions

##### SMART Authorization Configuration 
The Health Check App uses the iss parameter provided in the launch request as the base URL of the PMS FHIR API to retrieve the PMS Authorization Server configuration from the .well-known/smart-configuration endpoint. The response provides, amongst other configuration elements, the authorization_endpoint and token_endpoint URLs required in the subsequent steps. 

##### Prepopulate Health Check
The Health Check APP uses the access_token as the Authorization for any request to the PMS FHIR API including the retrieval of the fhirUser and patient resources. The Health Check App will also query any FHIR resource required in the health check’s Questionnaire pre-population expressions, using the patient context as search parameter values.

##### Fill and Submit Health Check
The PMS User fills out the health check form and when finished, submits the form.

##### Writeback Questionnaire Response
The Health Check App writes back the health check QuestionnaireResponse to the PMS FHIR Server using a FHIR Create request when the health check is new or a FHIR Update when a health check was previously saved as a draft and retrieved for further contribution.

##### Writeback Extract Transaction
The Health Check App will generate an extract transaction when a health check Questionnaire contains items with specified extract expressions. The extract transaction is a FHIR Bundle that the health check App will write back to the PMS FHIR API transaction endpoint. 

The resource types included in the extract transaction will be specified in the health check Questionnaire, hence the PMS is required to ensure it has writeback capability for any health check Questionnaire it launches. 

The extract transaction can include writeback requests using the following FHIR interactions:
1.	Create; or 
2.	Patch
