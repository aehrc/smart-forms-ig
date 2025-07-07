### Introduction
This implementation guide is provided to support the integration of the Smart Health Checks App within a patient management system enabling users to complete health check assessments such as the Aboriginal and Torres Strait Islander Health Check.

The Smart Health Checks App is a FHIR-based client application aimed at demonstrating effective undertaking of healthcare assessments. It leverages [SMART App Launch](https://build.fhir.org/ig/HL7/smart-app-launch/app-launch.html), [Structured Data Capture specification](http://build.fhir.org/ig/HL7/sdc/index.html) and [AU Core](https://hl7.org.au/fhir/core/) to improve clinical workflow, enhance the usefulness of information in the practice record and improve interoperability of health information to support better clinical outcomes. 

The Smart Health Checks App is based on the CSIRO Smart Forms App which was provided as a [Reference Implementation](reference-implementation.html) of using FHIR standards and implementation guides to provide reusable software components that can be applied within Australian healthcare software systems to support uses cases such as national health check assessment forms.

### Smart Health Checks Actors
The following figure provides an overview of the actors involved in the Smart Health Checks (SHC) solution.

<img alt="Actors Overview" src="overviewactors.png" style="width:100%; max-width:750px; float:none"/>


#### SHC App

The SHC App allows a user of the SHC Host to launch the SHC App for filling out a health check form prepopulated with authorized patient health information retrieved from the SHC Host FHIR Server and writeback the collected form data. 

The SHC App actor is implemented by the CSIRO Smart Forms App.

#### SHC Host

The SHC Host allows a user to launch the SHC App within an embedded or externally launched web browser to fill out a health check form. 

The SHC Host actor is implemented by the patient management system.

#### SHC Host FHIR Server

The SHC Host FHIR Server allows the SHC App to retrieve patient health information and writeback collected health check data.

The SHC Host actor is implemented by the patient management system.

#### SHC Host Authorization Server

The SHC Host Authorization Server allows the SHC App to request authorisation from the user to access patient health information to prepopulate and write back health checks data using the SHC Host FHIR Server.

### Smart Health Checks Interactions

The Smart Health Check App follows a standard set of interactions which are summarised as:
1. App Launch: The SHC User initiates the SHC Host to launch SHC App with a context of the current user, patient and health check form.
2. SMART Authorization Configuration: The SHC App uses SHC Host FHIR Server to locate the SHC Host Authorization Server endpoints and capability.
3. Authorization Request: SHC App redirects to the SHC Host Authorization Server to authorise access to patient health information using the SHC Host FHR Server. The SHC User may be prompted to permit or deny access to the requested data.
4. Authorization Callback: The SHC Host redirects back to the SHC App to proceed with the authorised launch of the health check form.
5. Token Request: SHC App requests an access token and associated launch context, including user, patient and health check form, from the SHC Host Authorization Server.
6. Prepopulate Health Check: SHC App uses the launch context to use the SHC Host FHIR Server to:
    1. read Practitioner;
    2. read Patient; 
    3. read or search QuestionnaireResponse; and 
    4. various search requests to prepopulate the health check form 

    <img alt="Launch Interactions" src="launchinteractions.png" style="width:100%; max-width:750px; float:none"/>

7. Fill and Save Health Check: The user fills out the health check form and saves the form data.
8. Writeback Questionnaire Response: The health check form data is written back to the SHC Host FHIR Server as a QuestionnaireResponse.
9. Writeback Extract Transaction: The health check form data extracted from a completed form as FHIR Resources are written back to the SHC Host FHIR Server as transaction Bundle.

    <img alt="Writeback extract" src="writebackdraftqr.png" style="width:100%; max-width:750px; float:none"/>

    <img alt="Writeback extract" src="writebackqrextract.png" style="width:100%; max-width:750px; float:none"/>

### Dependencies

{% include dependency-table.xhtml %}

Smart Forms is also dependent on:
- Terminology published in Australia's [National Clinical Terminology Service](https://www.healthterminologies.gov.au/access-clinical-terminology/access-fhir-terminology-resources/)

In addition, the following FHIR implementation guides are referenced:
- [SMART App Launch](http://www.hl7.org/fhir/smart-app-launch)


### Usage

This document is a working specification that may be directly implemented by FHIR<sup>&reg;&copy;</sup> system producers.

FHIR<sup>&reg;&copy;</sup> connectathon events are key to the verification of the guide as being suitable for 
implementation. This implementation guide will be used as the basis for Australian connectathon events.


### How to read this guide

This guide is divided into several pages which are listed at the top of each page in the menu bar.

- [Home](index.html): This page provides the introduction and scope for this guide.
- Guidance
  - [Reference Implementation](reference-implementation.html): This page describes software components of a Smart Forms reference implementation.
  - [Smart Health Check Integration](smart-health-check-integration.html): This page provides an overview of the integration requirements to launch the Smart Health Check Application.
  - [Informative Guidance](informative-guidance.html): This page provides some informative material that implementers may find useful but does not represent normative requirements.
- FHIR Artefacts: These pages provide detailed descriptions and formal definitions for all the FHIR artefacts defined in this guide.
  - [Artefact Summary](artifacts.html): This page lists all of the FHIR artefacts defined in this guide.
  - [Questionnaires](questionnaires.html): This page lists all of the Questionnaire resources defined in this guide.
  - [Profiles and Extensions](profiles-and-extensions.html): This page lists all of the StructureDefinition resources defined in this guide.
  - [Capability Statements](capability-statements.html): This page lists all of the CapabilityStatement resources defined in this guide.
  - [Actor Definitions](actor-definitions.html): This page lists all of the ActorDefinition resources defined in this guide.
  - [Terminology](terminology.html): This page lists all of the ValueSet, CodeSystem and ConceptMap resources defined in this guide.
- [Downloads](downloads.html): This page provides links to downloadable artefacts including the Smart Forms FHIR NPM package.


### Collaboration
This guide is the product of collaborative work undertaken with participants from:

* Australian Government Department of Health and Aged Care
* National Aboriginal Community Controlled Health Organisation
* The Royal Australian College of General Practitioners
* Primary Care Data Quality Foundations Working Group
* Australian FHIR Implementers Community
* CSIRO Australian e-Health Research Centre 












