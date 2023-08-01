An open source reference implementation has been developed to demonstrate the Smart Forms solution.

The source code and additional information is available at the [Smart Forms GitHub repository](https://github.com/aehrc/smart-forms).

### Components

#### Smart Forms Application

Try it out here: <https://www.smartforms.io/>

A web application supporting the rendering of Questionnaire resources and authoring of QuestionnaireResponse resources. The app leverages [SMART App Launch](https://hl7.org/fhir/smart-app-launch/index.html) and [Structured Data Capture](http://hl7.org/fhir/uv/sdc/).

#### Smart Forms Server

Publicly available endpoint here: <https://api.smartforms.io/fhir>

A Questionnaire-hosting Forms Server API that supports the [$assemble](http://hl7.org/fhir/uv/sdc/OperationDefinition-Questionnaire-assemble.html) operation. This API is built on the [HAPI-FHIR Starter Project](https://github.com/hapifhir/hapi-fhir-jpaserver-starter).

#### Clinical System Simulator

Try it out here: <https://ehr.smartforms.io/>

A simple simulator showing a patient summary screen with a launch button to perform an [Aboriginal and Torres Strait Islander Health Check](Questionnaire-AboriginalTorresStraitIslanderHealthCheck.html). The patient and user are preselected but can be changed on the Configuration page. The simulator is supported by the [SMART Launcher](https://launch.smarthealthit.org/).

### High Level Solution Architecture

The high-level architecture of the Smart Forms solution is shown in Figure 1. The solution consists of a Patient Management System (PMS) integrated with Smart Forms Common Services. 
The PMS consists of:
1. a PMS App;
2. a PMS Authorization Service; and
3. a PMS FHIR Server.

The Smart Forms Common Service is not limited to a single centralised deployment, it could be deployed within a jurisdiction, regionally or by vendor as deemed appropriate.  

<div>
<img src="SmartForms_SolnSum_HighLevel.png" alt="High Level Solution Architecture" />
</div>

*Figure 1: High Level Solution Architecture* 

The components that support the Smart Forms solution are outlined below.  
#### PMS Components
##### PMS App
The PMS App is an existing practice management system provided by a PMS software provider. The system may be deployed on-premise where the application and database servers are located within confines or control of the primary care organization. An on-premise system would normally considered a desktop application, where the application executes on multiple workstations connected to a centralized database server. There are also some systems using a hybrid of on-premise and cloud infrastructure.

In the context of the Smart Health Check solution, the PMS App has a dependency on the PMS Authorization Service to stash launch context details such as the current patient, current user, current patient visit and the health check form to be filled, which can be retrieved later by the Smart Forms App. 

The PMS also has a dependency on the Smart Forms App, which provides the standards-based health check data capture functionality provided by the Smart Health Check solution.

##### PMS Authorization Service
The PMS Authorization Service is an OAuth authorisation server that supports SMART App Launch context, which enables a third-party application, such as the Smart Forms App, to request access to patient data in the context of a user’s workflow.

##### PMS FHIR Server
The PMS FHIR Server is a standards-based Application Programming Interface (API) that enables personal health information to be securely retrieved from the PMS. The FHIR Server uses the HL7 FHIR standard that specifies the type of data and behaviour that can be provided by the API. The FHIR Server also allows health information, such as a health check response (i.e. FHIR QuestionnaireResponse) to be stored in the PMS, which may be supported natively within the PMS data store or as a separate FHIR data repository.

The PMS FHIR Server has a dependency on the PMS App where it accesses the patient data and user records from the PMS data store. 

#### Smart Forms Common Services Components
##### Smart Forms App
The Smart Forms App is a browser-based Web application that uses industry standards to provide a common user interface for the Smart Health Check solution. The Smart Forms App uses a Single Page Application (SPA) paradigm that allows a modern JavaScript enabled Web browser to host the application without any logic executed or patient data stored on the server. 

The Smart Forms App, uses the HL7 Structured Data Capture (SDC) Implementation Guide (IG) to implement a rendering of health check forms defined using FHIR Questionnaire resources and represent the data captured using FHIR QuestionnaireResponse resources. The SDC IG provides guidance and extensions that enables the Smart Forms App to provide advanced rending, pre-population, dynamic behaviour and forms modularisation in a standardised manner. This enables the Smart Forms App to be used for any compatible health check form defined in accordance with the HL7 Structured Data Capture (SDC) Implementation Guide (IG).

The Smart Forms App has a dependency on the PMS Authorization Service to request access to the PMS patient data with permissions authorised as part of the authorization flow. 

The Smart Forms App has a dependency on the PMS FHIR Server to access the patient data required to pre-populate the health check form and store the captured health check data.

The Smart Forms App has a dependency on the Smart Forms Server that provides the health check forms as a FHIR Questionnaire resource. Since the Smart Forms App is hosted within the PMS User agent, the request to retrieve the Questionnaire resource originates from the PMS User agent to the Smart Forms Server over the public internet.

The Smart Forms App also has a dependency on the Ontoserver terminology server that maintains the value sets required in a health check form and expand filtered lists of coded concepts such as diagnoses and body sites. The Ontoserver requests that originate from the Smart Forms App will also be transported over the public internet.


##### Smart Forms Server
The Smart Forms Server is an implementation of a FHIR Server specifically used to support the management of health check forms represented as FHIR Questionnaire resources. 

The Smart Forms Server will also be used during the health check form development to maintain reusable Questionnaire modules assembled into the combined health check form used by the Smart Forms App.


##### Ontoserver
Ontoserver is a terminology server with a FHIR API that allows the Smart Forms App to access FHIR ValueSet resourcess used in health checks and evaluate filtered expansions at runtime based on user entered lookahead requests for concepts such as diagnoses, medications and body sites.
