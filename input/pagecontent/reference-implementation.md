An open source reference implementation has been developed to demonstrate the Smart Forms solution.

### Components

#### Smart Forms Application

Try it out here: <https://www.smartforms.io/>

A web application supporting the rendering of Questionnaire resources and authoring of QuestionnaireResponse resources. The app leverages [SMART App Launch](https://hl7.org/fhir/smart-app-launch/index.html) and [Structured Data Capture](http://hl7.org/fhir/uv/sdc/).

The source code and additional information is available at the [Smart Forms GitHub repository](https://github.com/aehrc/smart-forms).

If you are interested in using the rendering engine in your projects, a standalone package is published on NPM as [@aehrc/smart-forms-renderer](https://www.npmjs.com/package/@aehrc/smart-forms-renderer).

#### Smart Health Checks Application

Try it out here: <https://healthchecks.smartforms.io/>

An instance of the Smart Forms Application is hosted to act in the role of the SHC App. It serves as a Smart Health Checks Commons Services component.

For more information on this specific instance see the [SHC App Integration](shc-app-integration.html) page.


#### Smart Forms Server

Publicly available endpoint here: <https://smartforms.csiro.au/api/fhir>

A Questionnaire-hosting Forms Server API that supports the [$assemble](http://hl7.org/fhir/uv/sdc/OperationDefinition-Questionnaire-assemble.html) operation. This API is built on the [HAPI-FHIR Starter Project](https://github.com/hapifhir/hapi-fhir-jpaserver-starter).

#### Clinical System Simulator

Try it out here: <https://ehr.smartforms.io/>

A simple simulator showing a patient summary screen with a launch button to perform an [Aboriginal and Torres Strait Islander Health Check](Questionnaire-AboriginalTorresStraitIslanderHealthCheck.html). The patient, user and questionnaire are preselected but can be changed on the Configuration page. The simulator is supported by the [SMART Launcher](https://launch.smarthealthit.org/).

The source code is available at the [SMART-EHR-Launcher GitHub repository](https://github.com/aehrc/SMART-EHR-Launcher).