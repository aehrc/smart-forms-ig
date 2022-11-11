Alias: $LNC = http://loinc.org
Alias: $SCT = http://snomed.info/sct
Alias: $UCUM = http://unitsofmeasure.org

Instance: 715FinalisingHealthCheck
InstanceOf: Questionnaire
Usage: #definition
Title: "715 Finalising the Health Check"
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
* url = "http://www.health.gov.au/assessments/mbs/715/715FinalisingHealthCheck"
* name = "715FinalisingHealthCheck"
* title = "715 Finalising the Health Check"
* status = #draft
* experimental = true
* subjectType[+] = #Patient
* date = "2022-05-24"
* jurisdiction.coding = urn:iso:std:iso:3166#AU


* item[+]
  * extension[questionnaire-itemControl].valueCodeableConcept = https://aehrc.csiro.au/fhir/CodeSystem/QuestionnaireItemControlExtended#tab
  * linkId = "7c158125-129f-4fce-9557-32dd372c92c7"
  * text = "Finalising the health check"
  * type = #group
  * repeats = false
  * item[+]
    * linkId = "ea87929f-5d49-4492-b384-696ebeb5b51b"
    * text = "Patient priorities and goals: What does the patient say are the important things that have come out of this health check?"
    * type = #text
  * item[+]
  // still missing template details
    * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#check-box
    * extension[sdc-questionnaire-openLabel].valueString = "Other"
    * linkId = "583ffc2e-9d70-4245-b30c-5183e75e05b3"
    * text = "Brief intervention: advice and information provided during health check"
    * type = #open-choice
    * repeats = false
    // Look to replace with answerValueSet
    * answerOption[+].valueString = "Healthy eating"
    * answerOption[+].valueString = "Screen use"
    * answerOption[+].valueString = "Physical activity and exercise"
    * answerOption[+].valueString = "Mental health and wellbeing"
    * answerOption[+].valueString = "Safety/risky behaviours"
    * answerOption[+].valueString = "Smoking cessation"
    * answerOption[+].valueString = "Substance use/harm minimisation"
    * answerOption[+].valueString = "Safe sex/contraception"
    * answerOption[+].valueString = "Oral and dental health"
  * item[+]
    * linkId = "afbadad6-bef9-4fad-b5f4-111f666ccf11"
    * text = "Care provided as part of the health check (eg immunisations, medication review, investigations requested)"
    * type = #text
  * item[+]
    * linkId = "4b3015f6-5b0a-4dfa-9791-994e4059f921"
    * text = "Identified needs and plan (including new diagnoses)"
    * type = #text
  * item[+]
    * linkId = "5760a1f9-d725-4b9e-b74d-50800615a689"
    * text = "Follow-up"
    * type = #group
    // include these display sub-items using xhtml rendering
    * item[+]
      * linkId = "b4110a63-8547-4aa2-84c6-c1f64f0d24da"
      * text = "Consider what follow-up appointments can be made at the time of the health check."
      * type = #display
      * repeats = false
    * item[+]
      * linkId = "c47cfd7e-0f15-4dd9-bd53-bb62851b677c"
      * text = "Reminder: MBS Items 10987 and 81300-81360 are available to support follow up of health checks."
      * type = #display
      * repeats = false
    * item[+]
      * linkId = "1be25c55-2a2d-4b94-b826-bd17d9e35e92"
      * text = "Referrals and appointments"
      * type = #group
      * repeats = true
      * item[+]
        * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#drop-down
        * extension[sdc-questionnaire-openLabel].valueString = "Other"
        * linkId = "4044d0b4-94b2-4a89-b826-a14614298511"
        * text = "Who"
        * type = #open-choice
        * repeats = false
        // Look to replace with answerValueSet
        * answerOption[+].valueString = "GP follow-up"
        * answerOption[+].valueString = "GP review of results of investigations"
        * answerOption[+].valueString = "Aboriginal and/or Torres Strait Islander Health Worker follow-up"
        * answerOption[+].valueString = "Aboriginal and/or Torres Strait Islander Health Practitioner follow-up"
        * answerOption[+].valueString = "Practice nurse follow-up"
        * answerOption[+].valueString = "Dentist"
        * answerOption[+].valueString = "Medication review"
        * answerOption[+].valueString = "Smoking cessation"
        * answerOption[+].valueString = "Audiology"
        * answerOption[+].valueString = "Dietician"
        * answerOption[+].valueString = "Physiotherapist or exercise program"
        * answerOption[+].valueString = "Parenting programs/support services"
        * answerOption[+].valueString = "Social and emotional wellbeing/mental health"
      * item[+]
        * linkId = "0ef84b09-ca34-44c2-96d1-fcbbea0bae66"
        * text = "When"
        * type = #date
        * enableWhen[+]
          * question = "4044d0b4-94b2-4a89-b826-a14614298511"
          * operator = #exists
          * answerBoolean = true
        * repeats = false
  * item[+]
    * linkId = "a400fe69-c99f-47ed-bee1-083c3e4be467"
    * text = "Recalls entered (eg clinical review, investigations, influenza vaccination, asthma plan/cycle of care, diabetes cycle of care, care plan review, cervical screening, investigations)"
    * type = #group
    * repeats = true
    * item[+]
      * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-hidden].valueBoolean = true
      * extension[sdc-questionnaire-initialExpression].valueExpression
        * language = #text/fhirpath
        * expression = "%patient.id" //is an id a valid reference?
      * linkId = "40e3933d-77bb-40f3-8609-0c38ebb4421e"
      * definition = "http://aehrc.com/fhir/StructureDefinition/AUPrimaryCareFollowUp#CarePlan.subject.reference"
      * text = "recall-subject"
      * type = #string
    * item[+]
      * linkId = "fece6a3c-f8f1-4592-a166-5ea5a3c60c8e"
      * definition = "http://aehrc.com/fhir/StructureDefinition/AUPrimaryCareFollowUp#CarePlan.title"
      * text = "Recall"
      * type = #text
  * item[+]
    * linkId = "7202e1d0-c5eb-4613-9c03-414610054784"
    * text = "Patient actions"
    * type = #text
  * item[+]
    * extension[sdc-questionnaire-shortText].valueString = "Patient copy of health check"
    * linkId = "8176151f-6d86-45eb-91b1-12458d75a181"
    * text = "Patient has been offered a copy of this health check including details of follow-up and future appointments"
    * type = #choice
    * repeats = false
    // Look to replace with answerValueSet
    * answerOption[+].valueString = "Yes, copy taken"
    * answerOption[+].valueString = "Yes, but declined"
    * answerOption[+].valueString = "Not offered. Plan to follow up and offer at a later date"
