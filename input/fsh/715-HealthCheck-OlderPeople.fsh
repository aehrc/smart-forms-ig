Alias: $LNC = http://loinc.org
Alias: $SCT = http://snomed.info/sct
Alias: $UCUM = http://unitsofmeasure.org

Instance: 715-HealthCheck-OlderPeople
InstanceOf: Questionnaire
Usage: #definition
Title: "715 Health Check for Older People"
Description: "Root questionnaire for Aboriginal and Torres Strait Islander Health Checks - Older People"

* contained[+] = PrePopQuery

* extension[sdc-questionnaire-assemble-expectation].valueCode = #assemble-root
* extension[sdc-questionnaire-launchContext].extension[name].valueCoding = http://hl7.org/fhir/uv/sdc/CodeSystem/launchContext#patient
* extension[sdc-questionnaire-launchContext].extension[type].valueCode = #Patient
* extension[sdc-questionnaire-launchContext].extension[description].valueString = "The patient that is to be used to pre-populate the form"
* extension[sdc-questionnaire-sourceQueries].valueReference = Reference(PrePopQuery)

* meta.profile[+] = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-render"
* meta.profile[+] = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-modular"
//* meta.profile[+] = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-pop-obsn"
//* meta.profile[+] = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-extr-obsn"
* url = "http://www.health.gov.au/assessments/mbs/715/715-HealthCheck-OlderPeople"
* name = "715-HealthCheck-OlderPeople"
* title = "715 Health Check for Older People"
* status = #draft
* experimental = true
* subjectType[+] = #Patient
* date = "2022-05-24"
* jurisdiction.coding = urn:iso:std:iso:3166#AU

// Root 
* item[+] 
  * linkId = "685c2d35-747f-4156-8b91-af64074573ca"
  * text = "Aboriginal and Torres Strait Islander health check - Adults (≥50 years)"
  * type = #group
  // About The Health Check
  * item[+] 
    * extension[sdc-questionnaire-subQuestionnaire].valueCanonical = "http://www.health.gov.au/assessments/mbs/715/715-AboutTheHealthCheck|0.1.0"
    * linkId = "86770e6f-4f3b-42bf-987a-cf16ada35917"
    * text = "Sub-questionnaire [http://www.health.gov.au/assessments/mbs/715/715-AboutTheHealthCheck|0.1.0] not available. Unable to display all questions."
    * type = #display
 