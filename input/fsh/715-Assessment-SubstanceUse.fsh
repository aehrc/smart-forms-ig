Alias: $LNC = http://loinc.org
Alias: $SCT = http://snomed.info/sct
Alias: $UCUM = http://unitsofmeasure.org

Instance: 715AssessmentSubstanceUse
InstanceOf: Questionnaire
Usage: #definition
Title: "715 Assessment Substance Use"
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
* url = "http://www.health.gov.au/assessments/mbs/715/715AssessmentSubstanceUse"
* name = "715AssessmentSubstanceUse"
* title = "715 Assessment Substance Use"
* status = #draft
* experimental = true
* subjectType[+] = #Patient
* date = "2022-05-24"
* jurisdiction.coding = urn:iso:std:iso:3166#AU

// some linkIds maintained from full assessment questionnaire
* item[+]
  * extension[questionnaire-itemControl].valueCodeableConcept = https://aehrc.csiro.au/fhir/CodeSystem/QuestionnaireItemControlExtended#tab
  * linkId = "14a9fb5f-5b0e-4862-b143-08a11cd3ebf0"
  * text = "Substance use, including tobacco"
  * type = #group
  * repeats = false
  * enableWhen[+]
    * question = "e2a16e4d-2765-4b61-b286-82cfc6356b30" // age item which has initial population from variable
    * operator = #exists
    * answerBoolean = true
  * enableWhen[+]
    * question = "e2a16e4d-2765-4b61-b286-82cfc6356b30" // age item which has initial population from variable
    * operator = #>=
    * answerInteger = 12
  * item[+]
    * linkId = "515eda6e-973a-4b10-910a-0d4bf4f2efff"
    * text = "Smoking"
    * type = #group
    * repeats = false  
    * item[+]
      * extension[sdc-questionnaire-initialExpression].valueExpression
        * language = #text/fhirpath
        * expression = "%PrePopQuery.entry[1].resource.entry.resource.valueCodeableConcept.coding"
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#radio-button
      * linkId = "b639a3a8-f476-4cc8-b5c7-f5d2abb23511"
      * text = "Smoking status"
      * type = #choice
      * repeats = false
      // better as a standard answerValueSet when missing concepts are available
      * answerOption[+].valueCoding = http://snomed.info/sct#266919005 "Never smoked"
      * answerOption[+].valueCoding = http://snomed.info/sct#77176002 "Smoker"
      * answerOption[+].valueCoding = http://snomed.info/sct#8517006 "Ex-Smoker"
      * answerOption[+].valueCoding = http://snomed.info/sct#16090371000119103 "Environmental exposure to tobacco smoke (home, car, etc)"
      * answerOption[+].valueString = "Wants to quit"
      * answerOption[+].valueString = "Other tobacco use"
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#radio-button
      * linkId = "96dc7c22-d003-459c-8a56-f6cd182fc077"
      * text = "Quit status"
      * type = #choice
      * repeats = false
      * enableWhen[+]
        * question = "b639a3a8-f476-4cc8-b5c7-f5d2abb23511"
        * operator = #=
        * answerCoding = http://snomed.info/sct#8517006
      * answerOption[+].valueCoding = http://snomed.info/sct#48031000119106 "Quit >=12 months"
      * answerOption[+].valueCoding = http://snomed.info/sct#735128000 "Quit <12 months"
      
    * item[+]
      * linkId = "9e86387d-1be4-4c26-9047-9dd6b03e1ee0"
      * text = "How many?"
      * type = #string
      * repeats = false
      * enableWhen[+]
        * question = "b639a3a8-f476-4cc8-b5c7-f5d2abb23511"
        * operator = #=
        * answerCoding = http://snomed.info/sct#77176002
      * enableWhen[+]
        * question = "b639a3a8-f476-4cc8-b5c7-f5d2abb23511"
        * operator = #=
        * answerCoding = http://snomed.info/sct#8517006
      * enableWhen[+]
        * question = "b639a3a8-f476-4cc8-b5c7-f5d2abb23511"
        * operator = #=
        * answerString = "Wants to quit"
      * enableBehavior = #any
    * item[+]
      * linkId = "32e71641-f660-4ca2-af99-dff8917f07be"
      * text = "How long as a smoker?"
      * type = #string
      * enableWhen[+]
        * question = "b639a3a8-f476-4cc8-b5c7-f5d2abb23511"
        * operator = #=
        * answerCoding = http://snomed.info/sct#77176002
      * enableWhen[+]
        * question = "b639a3a8-f476-4cc8-b5c7-f5d2abb23511"
        * operator = #=
        * answerCoding = http://snomed.info/sct#8517006
      * enableWhen[+]
        * question = "b639a3a8-f476-4cc8-b5c7-f5d2abb23511"
        * operator = #=
        * answerString = "Wants to quit"
      * enableBehavior = #any
  * item[+]
    * linkId = "34feaee8-8088-43ee-991d-9729990b5550"
    * text = "Alcohol and other substance use"
    * type = #group
    * repeats = false
    * item[+]
      * extension[http://hl7.org/fhir/StructureDefinition/rendering-xhtml].valueString = "<div xmlns=\"http://www.w3.org/1999/xhtml\">
        <div>Quantity and frequency of:</div>
        <ul>
          <li>alcohol</li>
          <li>caffeine (coffee, soft drinks, iced coffee)</li>
          <li>cannabis/yarndi/gunja</li>
          <li>other substance use: IVDU, methamphetamine, opiates, solvents, other</li>
        </ul>
	      </div>"
      * extension[sdc-questionnaire-shortText].valueString = "Quantity and frequency of substance use" 
      * linkId = "ea73d52c-f831-46be-a45d-2c42250a5210"
      * text = "Quantity and frequency of: alcohol; caffeine (coffee, soft drinks, iced coffee); cannabis/yarndi/gunja; other substance use: IVDU, methamphetamine, opiates, solvents, other"
      * type = #text
      * repeats = false
      * item[+]
        * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#prompt
        * linkId = "232cf24c-db60-4601-869d-525fb6e05988"
        * text = "details"
        * type = #display
  * item[+]
    * linkId = "f8e1cc1f-f1a1-4eb3-8255-77d600f52831"
    * text = "Health priorities, actions and follow-up"
    * type = #text
    * repeats = false     

