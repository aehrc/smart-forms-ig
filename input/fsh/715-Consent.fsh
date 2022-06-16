Alias: $LNC = http://loinc.org
Alias: $SCT = http://snomed.info/sct
Alias: $UCUM = http://unitsofmeasure.org

Instance: 715-Consent
InstanceOf: Questionnaire
Usage: #definition
Title: "715 Consent"
Description: "Sub-questionnaire for Aboriginal and Torres Strait Islander Health Checks"

* contained[+] = PrePopQuery

* extension[sdc-questionnaire-assemble-expectation].valueCode = #assemble-child
* extension[sdc-questionnaire-launchContext].extension[name].valueCoding = http://hl7.org/fhir/uv/sdc/CodeSystem/launchContext#patient
* extension[sdc-questionnaire-launchContext].extension[type].valueCode = #Patient
* extension[sdc-questionnaire-launchContext].extension[description].valueString = "The patient that is to be used to pre-populate the form"
* extension[sdc-questionnaire-sourceQueries].valueReference = Reference(PrePopQuery)

* meta.profile[+] = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-render"
* meta.profile[+] = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-modular"
//* meta.profile[+] = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-pop-obsn"
//* meta.profile[+] = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-extr-obsn"
* url = "http://www.health.gov.au/assessments/mbs/715/715-Consent"
* status = #draft
* experimental = true
* subjectType[+] = #Patient
* date = "2022-05-24"
* jurisdiction.coding = urn:iso:std:iso:3166#AU

* item[+]
  * linkId = "2e82032a-dc28-45f2-916e-862303d39fe5"
  * text = "Consent"
  * type = #group
  * repeats = false
  * item[+]
    * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#radio-button
    * linkId = "d1e1ab3d-1c6c-430b-8ae7-af56b8f0af55"
    * text = "Consent given after discussion of process and benefits of a health check"
    * type = #choice
    * repeats = false
    * answerValueSet = "https://aehrc.csiro.au/fhir/ValueSet/YesNoNA"
  * item[+]
    * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#radio-button
    * linkId = "c72933c7-349f-4fef-94ff-c424c69da6f3"
    * text = "Parent/primary caregiver present for health check"
    * type = #choice
    * repeats = false
    * answerValueSet = "https://aehrc.csiro.au/fhir/ValueSet/YesNoNA"  
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
      * linkId = "b7d116f9-0425-4cf1-8cde-fbf4dfaee550"
      * text = "Relationship to child"
      * type = #string // possibly add a constrained answerValueSet https://healthterminologies.gov.au/fhir/ValueSet/related-person-relationship-type-1
      * enableWhen[+]
        * question = "c72933c7-349f-4fef-94ff-c424c69da6f3"
        * operator = #=
        * answerCoding = http://terminology.hl7.org/CodeSystem/v2-0136#Y 
      * repeats = true
  * item[+]
    * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#radio-button
    * linkId = "057483ce-f265-46df-a1c5-7a18d492c1ba"
    * text = "Consent given for sharing of information with relevant healthcare providers"
    * type = #choice
    * repeats = false
    * answerValueSet = "https://aehrc.csiro.au/fhir/ValueSet/YesNoNA"  
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
      * linkId = "43517c44-5cd2-4d9a-9f18-d6bf8124f4ae"
      * text = "Who/details"
      * type = #text
      * enableWhen[+]
        * question = "057483ce-f265-46df-a1c5-7a18d492c1ba"
        * operator = #=
        * answerCoding = http://terminology.hl7.org/CodeSystem/v2-0136#Y 
      * repeats = true
  * item[+]
    * extension[sdc-questionnaire-initialExpression].valueExpression
      * language = #text/fhirpath
      * expression = "today()"
    * linkId = "84162f36-f4af-4509-b178-ef2a3849d0b6"
    * text = "Date"
    * type = #date
    * repeats = false
  * item[+]
    * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
    * linkId = "0f92eb2d-4629-4215-96f8-46722a2efa73"
    * text = "Doctor"
    * type = #string
    * repeats = false
  * item[+]
    * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
    * linkId = "8b94a129-3aab-4d13-bb6d-7a748f5c41e5"
    * text = "Nurse"
    * type = #string
    * repeats = false
  * item[+]
    * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
    * linkId = "2a517291-e2f1-4f66-ad1f-ae5b091d2f8a"
    * text = "Aboriginal and/or Torres Strait Islander Health Worker / Health Practitioner"
    * type = #string
    * repeats = false
  * item[+]
    * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#radio-button
    * extension[sdc-questionnaire-openLabel].valueString = "Other, please specify"
    * linkId = "5bbfb4a3-a667-4ef2-98c2-76e76da55c03"
    * text = "Location of health check"
    * type = #open-choice
    * repeats = false
    * answerOption[+].valueCoding = $SCT#257585005 "Clinic"
    * answerOption[+].valueCoding = $SCT#264362003 "Home"
    * answerOption[+].valueCoding = $SCT#257698009 "School"




