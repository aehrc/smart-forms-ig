### Solution Overview
#### High Level Solution Architecture

The high-level architecture of the Smart Forms solution is shown in Figure 1. The solution consists of a Patient Management System (PMS) integrated with Smart Forms Common Services. 
The PMS consists of:
1. a PMS App;
2. a PMS Auth Server; and
3. a PMS FHIR API.

The Smart Forms Common Service is not limited to a single centralised deployment, it could be deployed within a jurisdiction, regionally or by vendor as deemed appropriate.  

![High Level Solution Architecture](SmartForms_SolnSum_HighLevel.png)  
*Figure 1: High Level Solution Architecture* 


The components that support the Smart Forms solution are outlined below.  
##### PMS Components
###### PMS App
The App may be deployed on-premise where the App and database servers are located within confines or control of the organisation. An on-premise App would normally be considered to be a desktop App, where the App executes on multiple workstations connected to a centralised database server. Alternatively, an App may be cloud-based, where the App is deployed on infrastructure hosted on cloud infrastructure, in secure data centres. A cloud-based App would normally be accessed using public networks and an internet browser. Some Apps may use a hybrid of on-premise and cloud infrastructure.
In the context of the Smart Forms solution, each App has a dependency on the PMS Auth Server to stash launch context details such as the current patient, current user and the form to be filled, which can be retrieved later by the Smart Forms App. 
The PMS also has an obvious dependency on the Smart Forms App which provides the standards-based assessment form data capture functionality provided by the Smart Forms solution.

###### PMS Auth Server
The PMS Auth Server is a standards-based Authorisation Server that enables a third-party application such as the Smart Forms App to request access to patient data. The Smart Forms App was originally launched by a user of an App within the context of a patient’s health record, data associated with this context is provided by the App and stashed temporarily using a unique launch identifier prior to the Smart Forms App launch.
The PMS Auth Server has a dependency on the App where it is necessary to retrieve any additional launch context requested by the Smart Forms App that wasn’t included in the context originally stashed, such as an episode identifier.

###### PMS FHIR API
The PMS FHIR API is a standards-based Application Programming Interface (API) that enables patient health record data to be securely accessed from the PMS App. The API uses the HL7 FHIR standard that specifies both the capability and types of data that can be utilised via the API. The FHIR API may also allow patient health content to be stored back within the PMS, which may be supported natively within the PMS App database or as a separate datastore of FHIR data.
The PMS FHIR API has a dependency on the PMS App where it accesses the patient health record data from the App’s database.
The FHIR API interaction requirements are described later in Section 3 but are also summarised below.

##### Smart Forms Common Services Components
###### Smart Forms App
The Smart Forms App is a Browser-based application that uses industry standards to provide a common user interface for the Smart Forms solution. The Smart Forms App uses a Single Page Application paradigm that allows the application to be downloaded using a standard modern web browser and executed without any application logic being executed on a web server. The Smart Forms App, uses the HL7 Structured Data Capture (SDC) Implementation Guide (IG) to implement a rendering of forms defined using FHIR Questionnaire resources and represent the captured data using FHIR QuestionnaireResponse resources. The SDC IG provides guidance and extensions that enables the Smart Forms App to provide advanced rending, pre-population, dynamic behaviour and forms modularisation in a standardised manner. This enables the Smart Forms App to be used for any health assessment form defined in accordance with the HL7 Structured Data Capture (SDC) Implementation Guide (IG).
The Smart Forms App has a dependency on the PMS Auth Server to request access to the PMS with the permissions specified as part of the launch context. 
The Smart Forms App also has a dependency on the PMS FHIR API to access the patient health record data it requires to prepopulate the assessment form and store the captured form data where required. 
The Smart Forms App also has a dependency on the Smart Forms Server for managing the assessment forms as a FHIR Questionnaire resource.
The Smart Forms App also has a dependency on the Ontoserver terminology server that maintains the code systems and value sets required in an assessment form and assist providing filtered lists for large complex concepts such as diagnoses and body sites.

###### Smart Forms Server
The Smart Forms Server is an implementation of a FHIR Server specifically used to support the management of assessment forms represented as FHIR Questionnaire resources. The form server will also be used during the assessment form development to maintain reusable Questionnaire modules that can be assembled into large assessment forms that can be used natively by the Smart Forms App.

###### Ontoserver
Ontoserver is a terminology server that uses a FHIR API to allow the Smart Forms App to access and maintain code systems and value sets as standard FHIR resources. Furthermore, Ontoserver provides standardised operations that enables the Smart Forms App to provide smart filtered lists of values for concepts such as diagnoses, medications and body sites.
Ontoserver is able to make available the terminology required for filling in assessment forms. This includes SNOMED CT-AU and any terminology required by the Questionnaire that has been defined as FHIR resources.
