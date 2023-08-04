/*
Instance: SFLauncherServerAboriginalTorresStraitIslanderHealthCheck
InstanceOf: CapabilityStatement
Usage: #definition
* name = "SmartFormsLauncherServerAboriginalTorresStraitIslanderHealthCheck"
* title = "Smart Forms Launcher Server for the Aboriginal and Torres Strait Islander Health Check"
* description = "This CapabilityStatement describes the expected capabilities for systems to launch and exchange data with the [Smart Forms client application](CapabilityStatement-SmartFormsApplication.html) to support the [Aboriginal and Torres Strait Islander Health Check](Questionnaire-AboriginalTorresStraitIslanderHealthCheck.html). It lists the server's conformance expectations for the resource types required as a launch context, resource types required to support prepopulation of the form, and QuestionnaireResponse requirements for managing form responses. These expectations include supported FHIR profiles, RESTful operations, and search parameters."
* status = #draft
* experimental = false
* date = "2023-06-16"
* publisher = "AEHRC CSIRO"
* jurisdiction = urn:iso:std:iso:3166#AU
* kind = #requirements

* instantiates[+] = "http://hl7.org.au/fhir/core/CapabilityStatement/au-core-server"
* instantiates[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* instantiates[=].extension[0].valueCode = #SHALL
* instantiates[+] = "http://hl7.org/fhir/uv/sdc/CapabilityStatement/sdc-form-response-manager"
* instantiates[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* instantiates[=].extension[0].valueCode = #SHOULD
* instantiates[+] = "http://hl7.org/fhir/uv/sdc/CapabilityStatement/sdc-form-archiver"
* instantiates[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* instantiates[=].extension[0].valueCode = #SHOULD

* fhirVersion = #4.0.1

* format[+] = #json
* format[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* format[=].extension[0].valueCode = #SHALL

* implementationGuide[+] = "http://hl7.org/fhir/smart-app-launch/ImplementationGuide/hl7.fhir.uv.smart-app-launch"
* implementationGuide[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* implementationGuide[=].extension[0].valueCode = #SHALL
* implementationGuide[+] = "http://hl7.org/fhir/uv/sdc/ImplementationGuide/hl7.fhir.uv.sdc"
* implementationGuide[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* implementationGuide[=].extension[0].valueCode = #SHOULD

* rest.mode = #server
* rest.documentation = "<div><p>A Smart Forms Launcher Server <strong>SHALL</strong>:</p><ol><li>Support the <a href=\"https://build.fhir.org/ig/hl7au/au-fhir-core/StructureDefinition-au-core-patient.html\">AU Core Patient resource profile</a>.</li> <li>Support the <a href=\"https://build.fhir.org/ig/hl7au/au-fhir-core/StructureDefinition-au-core-practitioner.html\">AU Core Practitioner resource profile</a>.</li> <li>Support the <a href=\"https://build.fhir.org/ig/hl7au/au-fhir-core/StructureDefinition-au-core-encounter.html\">AU Core Encounter resource profile</a>.</li><li>Support the <a href=\"https://build.fhir.org/ig/hl7au/au-fhir-core/StructureDefinition-au-core-condition.html\">AU Core Condition resource profile</a>.</li> <li>Support the <a href=\"https://build.fhir.org/ig/hl7au/au-fhir-core/profiles-and-extensions.html#observation\">AU Core Observation resource profiles</a>.</li><li>Implement the RESTful behavior according to the FHIR specification.</li><li>Support JSON source formats for all interactions.</li></ol></div>"

* rest.security.cors = true
* rest.security.cors.extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.security.cors.extension[0].valueCode = #SHALL
* rest.security.service = http://terminology.hl7.org/CodeSystem/restful-security-service#SMART-on-FHIR
* rest.security.service.extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.security.service.extension[0].valueCode = #SHALL
* rest.security.description = "<div> <p>A Smart Forms Launcher Server <strong>SHALL</strong>:</p><ol> <li>Support CORS headers</li><li>Support SMART on FHIR security services</li></ol> <p>See the <a href=\"http://hl7.org/fhir/uv/sdc/STU3/security.html\">Structured Data Capture Security Details</a> section for general considerations and recommendations.</p></div>"

* rest.resource[+].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].extension[0].valueCode = #SHALL
* rest.resource[=].type = #Patient
* rest.resource[=].profile = "http://hl7.org.au/fhir/core/StructureDefinition/au-core-patient"
* rest.resource[=].profile.extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].profile.extension[0].valueCode = #SHALL
* rest.resource[=].documentation = "<div> <p>The server <strong>SHALL</strong> support the Patient resource, AU Core profile and the conformance expectations for the Patient resource.</p></div>"
* rest.resource[=].interaction[0].code = #read
* rest.resource[=].interaction[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction[0].extension[0].valueCode = #SHALL

* rest.resource[+].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].extension[0].valueCode = #SHALL
* rest.resource[=].type = #Practitioner
* rest.resource[=].profile = "http://hl7.org.au/fhir/core/StructureDefinition/au-core-practitioner"
* rest.resource[=].profile.extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].profile.extension[0].valueCode = #SHALL
* rest.resource[=].documentation = "<div> <p>The server <strong>SHALL</strong> support the Practitioner resource, AU Core profile and the conformance expectations for the Practitioner resource.</p></div>"
* rest.resource[=].interaction[0].code = #read
* rest.resource[=].interaction[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction[0].extension[0].valueCode = #SHALL

* rest.resource[+].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].extension[0].valueCode = #SHALL
* rest.resource[=].type = #Encounter
* rest.resource[=].profile = "http://hl7.org.au/fhir/core/StructureDefinition/au-core-encounter"
* rest.resource[=].profile.extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].profile.extension[0].valueCode = #SHALL
* rest.resource[=].documentation = "<div> <p>The server <strong>SHALL</strong> support the Encounter resource, AU Core profile and the conformance expectations for the Encounter resource.</p></div>"
* rest.resource[=].interaction[0].code = #read
* rest.resource[=].interaction[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction[0].extension[0].valueCode = #SHALL

* rest.resource[+].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].extension[0].valueCode = #SHALL
* rest.resource[=].type = #Condition
* rest.resource[=].profile = "http://hl7.org.au/fhir/core/StructureDefinition/au-core-condition"
* rest.resource[=].profile.extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].profile.extension[0].valueCode = #SHALL
* rest.resource[=].documentation = "<div> <p>The server <strong>SHALL</strong> support the Condition resource, the AU Core profile and the conformance expectations for the Condition resource.</p></div>"
* rest.resource[=].interaction[0].code = #search-type
* rest.resource[=].interaction[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction[0].extension[0].valueCode = #SHALL
* rest.resource[=].searchParam[0].name = "patient"
* rest.resource[=].searchParam[0].definition = "http://hl7.org/fhir/SearchParameter/clinical-patient"
* rest.resource[=].searchParam[0].type = #reference
* rest.resource[=].searchParam[0].documentation = "<div><p>The client <strong>SHALL</strong> provide at least a id value and <strong>MAY</strong> provide both the Type and id values. The server <strong>SHALL</strong> support both.</p></div>"
* rest.resource[=].searchParam[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[0].extension[0].valueCode = #SHALL

* rest.resource[+].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].extension[=].valueCode = #SHALL
* rest.resource[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest.resource[=].extension[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].extension[=].extension[=].valueCode = #SHALL
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "patient"
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "code"
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "_count"
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "_sort"
* rest.resource[=].type = #Observation
* rest.resource[=].profile = "http://hl7.org.au/fhir/core/StructureDefinition/au-core-observation"
* rest.resource[=].profile.extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].profile.extension[0].valueCode = #SHALL
* rest.resource[=].supportedProfile[+] = "http://hl7.org.au/fhir/core/StructureDefinition/au-core-smokingstatus"
* rest.resource[=].supportedProfile[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].supportedProfile[=].extension[0].valueCode = #SHALL
* rest.resource[=].supportedProfile[+] = "http://hl7.org.au/fhir/core/StructureDefinition/au-core-bodyheight"
* rest.resource[=].supportedProfile[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].supportedProfile[=].extension[0].valueCode = #SHALL
* rest.resource[=].supportedProfile[+] = "http://hl7.org.au/fhir/core/StructureDefinition/au-core-bodyweight"
* rest.resource[=].supportedProfile[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].supportedProfile[=].extension[0].valueCode = #SHALL
* rest.resource[=].supportedProfile[+] = "http://hl7.org.au/fhir/core/StructureDefinition/au-core-bmi"
* rest.resource[=].supportedProfile[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].supportedProfile[=].extension[0].valueCode = #SHALL
* rest.resource[=].supportedProfile[+] = "http://hl7.org.au/fhir/core/StructureDefinition/au-core-headcircum"
* rest.resource[=].supportedProfile[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].supportedProfile[=].extension[0].valueCode = #SHALL
* rest.resource[=].supportedProfile[+] = "http://hl7.org.au/fhir/core/StructureDefinition/au-core-waistcircum"
* rest.resource[=].supportedProfile[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].supportedProfile[=].extension[0].valueCode = #SHALL
* rest.resource[=].supportedProfile[+] = "http://hl7.org.au/fhir/core/StructureDefinition/au-core-bloodpressure"
* rest.resource[=].supportedProfile[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].supportedProfile[=].extension[0].valueCode = #SHALL
* rest.resource[=].supportedProfile[+] = "http://hl7.org.au/fhir/core/StructureDefinition/au-core-heartrate"
* rest.resource[=].supportedProfile[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].supportedProfile[=].extension[0].valueCode = #SHALL
* rest.resource[=].supportedProfile[+] = "http://hl7.org.au/fhir/core/StructureDefinition/au-core-lipid-result"
* rest.resource[=].supportedProfile[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].supportedProfile[=].extension[0].valueCode = #SHALL
* rest.resource[=].documentation = "<div> <p>The server <strong>SHALL</strong> support the Observation resource, the AU Core profiles listed and the conformance expectations for the Observation resource.</p></div>"
* rest.resource[=].interaction[0].code = #search-type
* rest.resource[=].interaction[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction[0].extension[0].valueCode = #SHALL
* rest.resource[=].searchParam[+].name = "patient"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/clinical-patient"
* rest.resource[=].searchParam[=].type = #reference
* rest.resource[=].searchParam[=].documentation = "<div> <p>The client <strong>SHALL</strong> provide at least a id value and <strong>MAY</strong> provide both the Type and id values. The server <strong>SHALL</strong> support both. </p></div>"
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[0].valueCode = #SHALL
* rest.resource[=].searchParam[+].name = "code"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/clinical-code"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].documentation = "<div> <p>The client <strong>SHALL</strong> provide at least a code value and <strong>MAY</strong> provide both the code and system values. The server <strong>SHALL</strong> support both.</p></div>"
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[0].valueCode = #SHALL
* rest.resource[=].searchParam[+].name = "_count"
* rest.resource[=].searchParam[=].type = #number
* rest.resource[=].searchParam[=].documentation = "<div> <p>The client and server <strong>SHALL</strong> support search result limiting.</p></div>"
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[0].valueCode = #SHALL
* rest.resource[=].searchParam[+].name = "_sort"
* rest.resource[=].searchParam[=].type = #string
* rest.resource[=].searchParam[=].documentation = "<div> <p>The client and server <strong>SHALL</strong> support search result sorting by date and <strong>MAY</strong> support other values.</p></div>"
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[0].valueCode = #SHALL

* rest.resource[+].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].extension[=].valueCode = #SHALL
* rest.resource[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest.resource[=].extension[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].extension[=].extension[=].valueCode = #SHALL
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "patient"
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "_count"
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "_sort"
* rest.resource[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest.resource[=].extension[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].extension[=].extension[=].valueCode = #SHALL
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "patient"
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "_count"
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "_sort"
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "questionnaire"
* rest.resource[=].type = #QuestionnaireResponse
* rest.resource[=].profile = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaireresponse"
* rest.resource[=].profile.extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].profile.extension[0].valueCode = #SHALL
* rest.resource[=].documentation = "<div> <p>The server <strong>SHALL</strong> support the QuestionnaireResponse resource, Structured Data Capture profile and the conformance expectations for the QuestionnaireResponse resource.</p></div>"
* rest.resource[=].interaction[+].code = #read
* rest.resource[=].interaction[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction[=].extension[0].valueCode = #SHALL
* rest.resource[=].interaction[+].code = #search-type
* rest.resource[=].interaction[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction[=].extension[0].valueCode = #SHALL
* rest.resource[=].interaction[+].code = #create
* rest.resource[=].interaction[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction[=].extension[0].valueCode = #SHALL
* rest.resource[=].interaction[+].code = #update
* rest.resource[=].interaction[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction[=].extension[0].valueCode = #SHALL

* rest.resource[=].versioning = #versioned-update
* rest.resource[=].versioning.extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].versioning.extension[0].valueCode = #SHALL

* rest.resource[=].searchParam[+].name = "patient"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/QuestionnaireResponse-patient"
* rest.resource[=].searchParam[=].type = #reference
* rest.resource[=].searchParam[=].documentation = "<div> <p>The client <strong>SHALL</strong> provide at least a id value and <strong>MAY</strong> provide both the Type and id values. The server <strong>SHALL</strong> support both. </p></div>"
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[0].valueCode = #SHALL
* rest.resource[=].searchParam[+].name = "questionnaire"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/QuestionnaireResponse-questionnaire"
* rest.resource[=].searchParam[=].type = #reference
* rest.resource[=].searchParam[=].documentation = "<div> <p>The client <strong>SHALL</strong> provide at least a id value and <strong>MAY</strong> provide both the Type and id values. The server <strong>SHALL</strong> support both.</p> <p>The client and server <strong>SHALL</strong> support chained search questionnaire.title using the :contains modifier.</p></div>"
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[0].valueCode = #SHALL
* rest.resource[=].searchParam[+].name = "_count"
* rest.resource[=].searchParam[=].type = #number
* rest.resource[=].searchParam[=].documentation = "<div> <p>The client and server <strong>SHALL</strong> support search result limiting.</p></div>"
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[0].valueCode = #SHALL
* rest.resource[=].searchParam[+].name = "_sort"
* rest.resource[=].searchParam[=].type = #string
* rest.resource[=].searchParam[=].documentation = "<div> <p>The client and server <strong>SHALL</strong> support search result sorting by authored and <strong>MAY</strong> support other values.</p></div>"
* rest.resource[=].searchParam[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension[0].valueCode = #SHALL



Instance: SmartFormsServer
InstanceOf: CapabilityStatement
Usage: #definition
* name = "SmartFormsServer"
* title = "Smart Forms Server"
* description = "This CapabilityStatement describes the capabilities of the Smart Forms Server. The Smart Forms Server provides a definitional repository of resources that a client application can retrieve for use in a Smart Forms context. The capabilities listed include supported FHIR profiles, RESTful operations, and search parameters."
* status = #draft
* experimental = false
* date = "2023-06-16"
* publisher = "AEHRC CSIRO"
* kind = #capability
* instantiates[+] = "http://hl7.org/fhir/uv/sdc/CapabilityStatement/sdc-form-manager"
* software
  * name = "Smart Forms Server"
* fhirVersion = #4.0.1
* format[0] = #json
* format[1] = #xml

* rest.mode = #server
* rest.documentation = "The Smart Forms Server provides interactions for hosting Questionnaire resources and the assembly of modular Questionnaires."


* rest.resource[+].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "url"
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "version"
* rest.resource[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "_count"
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "_sort"
* rest.resource[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "title"
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "_count"
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "_sort"
* rest.resource[=].type = #Questionnaire
* rest.resource[=].profile = "http://hl7.org/fhir/StructureDefinition/Questionnaire"
* rest.resource[=].supportedProfile = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire"
* rest.resource[=].supportedProfile = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-modular"
* rest.resource[=].interaction[+].code = #read
* rest.resource[=].interaction[=].code = #search-type
* rest.resource[=].searchParam[+].name = "url"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Questionnaire-url"
* rest.resource[=].searchParam[=].type = #uri
* rest.resource[=].searchParam[+].name = "version"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Questionnaire-version"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[+].name = "title"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Questionnaire-title"
* rest.resource[=].searchParam[=].type = #string
* rest.resource[=].searchParam[=].documentation = "<div> <p>The client supports search using the :contains modifier.</p></div>"
* rest.resource[=].searchParam[+].name = "_count"
* rest.resource[=].searchParam[=].type = #number
* rest.resource[=].searchParam[=].documentation = "<div> <p>The server supports search result limiting.</p></div>"
* rest.resource[=].searchParam[+].name = "_sort"
* rest.resource[=].searchParam[=].type = #string
* rest.resource[=].searchParam[=].documentation = "<div> <p>The server supports search result sorting by date and <strong>MAY</strong> support other values.</p></div>"
* rest.resource[=].operation[0].name = "assemble"
* rest.resource[=].operation[0].definition = "http://hl7.org/fhir/uv/sdc/OperationDefinition/Questionnaire-assemble"



Instance: SmartFormsApplication
InstanceOf: CapabilityStatement
Usage: #definition
* name = "SmartFormsApplication"
* title = "Smart Forms Application"
* description = "This CapabilityStatement describes the capabilities of the Smart Forms Application. These capabilities include supported FHIR profiles, RESTful operations, and search parameters. It covers supported tasks such as SMART App launch context, prepopulation and completion of forms."
* status = #draft
* experimental = false
* date = "2023-06-16"
* publisher = "AEHRC CSIRO"
* kind = #capability
* instantiates[+] = "http://hl7.org/fhir/uv/sdc/CapabilityStatement/sdc-form-filler"
* software.name = "Smart Forms Application"
* fhirVersion = #4.0.1
* format[0] = #json
* implementationGuide[+] = "http://hl7.org/fhir/smart-app-launch/ImplementationGuide/hl7.fhir.uv.smart-app-launch"

* rest.mode = #client
* rest.documentation = "The Smart Forms Application performs interactions to support SMART App Launch, form prepopulation and form filling. The interactions performed for prepopulation are not listed here as they can vary greatly and are defined in the Questionnaire instance."
* rest.security.cors = true
* rest.security.service = http://terminology.hl7.org/CodeSystem/restful-security-service#SMART-on-FHIR
* rest.security.description = "SMART App Launch supported to allow secure data exchange."

* rest.resource[+].type = #Patient
* rest.resource[=].profile = "http://hl7.org/fhir/StructureDefinition/Patient"
* rest.resource[=].supportedProfile = "http://hl7.org.au/fhir/core/StructureDefinition/au-core-patient"
* rest.resource[=].interaction[0].code = #read

* rest.resource[+].type = #Practitioner
* rest.resource[=].profile = "http://hl7.org/fhir/StructureDefinition/Practitioner"
* rest.resource[=].supportedProfile = "http://hl7.org.au/fhir/core/StructureDefinition/au-core-practitioner"
* rest.resource[=].interaction[0].code = #read

* rest.resource[+].type = #Encounter
* rest.resource[=].profile = "http://hl7.org/fhir/StructureDefinition/Encounter"
* rest.resource[=].supportedProfile = "http://hl7.org.au/fhir/core/StructureDefinition/au-core-encounter"
* rest.resource[=].interaction[0].code = #read

* rest.resource[+].type = #Condition
* rest.resource[=].profile = "http://hl7.org/fhir/StructureDefinition/Condition"
* rest.resource[=].supportedProfile[+] = "http://hl7.org.au/fhir/core/StructureDefinition/au-core-condition"
* rest.resource[=].interaction[0].code = #search-type
* rest.resource[=].searchParam[0].name = "patient"
* rest.resource[=].searchParam[0].definition = "http://hl7.org/fhir/SearchParameter/clinical-patient"
* rest.resource[=].searchParam[0].type = #reference
* rest.resource[=].searchParam[0].documentation = "<div><p>The client <strong>SHALL</strong> provide at least a id value and <strong>MAY</strong> provide both the Type and id values. The server <strong>SHALL</strong> support both.</p></div>"

* rest.resource[+].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "patient"
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "code"
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "_count"
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "_sort"
* rest.resource[=].type = #Observation
* rest.resource[=].profile = "http://hl7.org/fhir/StructureDefinition/Observation"
* rest.resource[=].supportedProfile[+] = "http://hl7.org.au/fhir/core/StructureDefinition/au-core-observation"
* rest.resource[=].supportedProfile[+] = "http://hl7.org.au/fhir/core/StructureDefinition/au-core-smokingstatus"
* rest.resource[=].supportedProfile[+] = "http://hl7.org.au/fhir/core/StructureDefinition/au-core-bodyheight"
* rest.resource[=].supportedProfile[+] = "http://hl7.org.au/fhir/core/StructureDefinition/au-core-bodyweight"
* rest.resource[=].supportedProfile[+] = "http://hl7.org.au/fhir/core/StructureDefinition/au-core-bmi"
* rest.resource[=].supportedProfile[+] = "http://hl7.org.au/fhir/core/StructureDefinition/au-core-headcircum"
* rest.resource[=].supportedProfile[+] = "http://hl7.org.au/fhir/core/StructureDefinition/au-core-waistcircum"
* rest.resource[=].supportedProfile[+] = "http://hl7.org.au/fhir/core/StructureDefinition/au-core-bloodpressure"
* rest.resource[=].supportedProfile[+] = "http://hl7.org.au/fhir/core/StructureDefinition/au-core-heartrate"
* rest.resource[=].supportedProfile[+] = "http://hl7.org.au/fhir/core/StructureDefinition/au-core-lipid-result"
* rest.resource[=].interaction[0].code = #search-type
* rest.resource[=].searchParam[+].name = "patient"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/clinical-patient"
* rest.resource[=].searchParam[=].type = #reference
* rest.resource[=].searchParam[=].documentation = "<div> <p>The client <strong>SHALL</strong> provide at least a id value and <strong>MAY</strong> provide both the Type and id values. The server <strong>SHALL</strong> support both. </p></div>"
* rest.resource[=].searchParam[+].name = "code"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/clinical-code"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].documentation = "<div> <p>The client <strong>SHALL</strong> provide at least a code value and <strong>MAY</strong> provide both the code and system values. The server <strong>SHALL</strong> support both.</p></div>"
* rest.resource[=].searchParam[+].name = "_count"
* rest.resource[=].searchParam[=].type = #number
* rest.resource[=].searchParam[=].documentation = "<div> <p>The client supports search result limiting.</p></div>"
* rest.resource[=].searchParam[+].name = "_sort"
* rest.resource[=].searchParam[=].type = #string
* rest.resource[=].searchParam[=].documentation = "<div> <p>The client supports search result sorting by date and <strong>MAY</strong> support other values.</p></div>"

* rest.resource[+].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "url"
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "version"
* rest.resource[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "_count"
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "_sort"
* rest.resource[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "title"
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "_count"
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "_sort"
* rest.resource[=].type = #Questionnaire
* rest.resource[=].profile = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire"
* rest.resource[=].interaction[+].code = #search-type
* rest.resource[=].interaction[+].code = #create
* rest.resource[=].searchParam[+].name = "url"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Questionnaire-url"
* rest.resource[=].searchParam[=].type = #uri
* rest.resource[=].searchParam[+].name = "version"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Questionnaire-version"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[+].name = "title"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Questionnaire-title"
* rest.resource[=].searchParam[=].type = #string
* rest.resource[=].searchParam[=].documentation = "<div> <p>The client supports search using the :contains modifier.</p></div>"
* rest.resource[=].searchParam[+].name = "_count"
* rest.resource[=].searchParam[=].type = #number
* rest.resource[=].searchParam[=].documentation = "<div> <p>The client supports search result limiting.</p></div>"
* rest.resource[=].searchParam[+].name = "_sort"
* rest.resource[=].searchParam[=].type = #string
* rest.resource[=].searchParam[=].documentation = "<div> <p>The client supports search result sorting by date and <strong>MAY</strong> support other values.</p></div>"
* rest.resource[=].operation[+].name = "assemble"
* rest.resource[=].operation[=].definition = "http://hl7.org/fhir/uv/sdc/OperationDefinition/Questionnaire-assemble"
* rest.resource[=].operation[+].name = "populate"
* rest.resource[=].operation[=].definition = "http://hl7.org/fhir/uv/sdc/OperationDefinition/Questionnaire-populate"

* rest.resource[+].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "patient"
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "_count"
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "_sort"
* rest.resource[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "patient"
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "_count"
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "_sort"
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "questionnaire"
* rest.resource[=].type = #QuestionnaireResponse
* rest.resource[=].profile = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaireresponse"
* rest.resource[=].interaction[+].code = #read
* rest.resource[=].interaction[+].code = #search-type
* rest.resource[=].interaction[+].code = #create
* rest.resource[=].interaction[+].code = #update
* rest.resource[=].searchParam[+].name = "patient"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/QuestionnaireResponse-patient"
* rest.resource[=].searchParam[=].type = #reference
* rest.resource[=].searchParam[=].documentation = "<div> <p>The client <strong>SHALL</strong> provide at least a id value and <strong>MAY</strong> provide both the Type and id values. The server <strong>SHALL</strong> support both. </p></div>"
* rest.resource[=].searchParam[+].name = "questionnaire"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/QuestionnaireResponse-questionnaire"
* rest.resource[=].searchParam[=].type = #reference
* rest.resource[=].searchParam[=].documentation = "<div> <p>The client <strong>SHALL</strong> provide at least a id value and <strong>MAY</strong> provide both the Type and id values. The server <strong>SHALL</strong> support both.</p> <p>The client and server <strong>SHALL</strong> support chained search questionnaire.title using the :contains modifier.</p></div>"
* rest.resource[=].searchParam[+].name = "_count"
* rest.resource[=].searchParam[=].type = #number
* rest.resource[=].searchParam[=].documentation = "<div> <p>The client supports search result limiting.</p></div>"
* rest.resource[=].searchParam[+].name = "_sort"
* rest.resource[=].searchParam[=].type = #string
* rest.resource[=].searchParam[=].documentation = "<div> <p>The client supports search result sorting by authored and <strong>MAY</strong> support other values.</p></div>"

* rest.resource[+].type = #ValueSet
* rest.resource[=].profile = "http://hl7.org/fhir/StructureDefinition/ValueSet"
* rest.resource[=].operation[0].name = "expand"
* rest.resource[=].operation[0].definition = "http://hl7.org/fhir/OperationDefinition/ValueSet-expand"


* rest.interaction[+].code = #transaction
* rest.interaction[+].code = #batch
*/