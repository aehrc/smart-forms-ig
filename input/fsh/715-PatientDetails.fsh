Alias: $LNC = http://loinc.org
Alias: $SCT = http://snomed.info/sct
Alias: $UCUM = http://unitsofmeasure.org

Instance: 715-PatientDetails
InstanceOf: Questionnaire
Usage: #definition
Title: "715 Patient Details"
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
* url = "http://www.health.gov.au/assessments/mbs/715/715-PatientDetails"
* status = #draft
* experimental = true
* subjectType[+] = #Patient
* date = "2022-05-24"
* jurisdiction.coding = urn:iso:std:iso:3166#AU

* item[+]
  * linkId = "5b224753-9365-44e3-823b-9c17e7394005"
  * text = "Patient Details"
  * type = #group
  * repeats = false
  * item[+]
    * extension[sdc-questionnaire-initialExpression].valueExpression
      * language = #text/fhirpath
      * expression = "%patient.name(first).where(use='usual').select(given.first() & ' ' & family)"
    * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
    * linkId = "17596726-34cf-4133-9960-7081e1d63558"
    * text = "Name"
    * type = #string
    * repeats = false
  * item[+]
    * extension[sdc-questionnaire-initialExpression].valueExpression
      * language = #text/fhirpath
      * expression = "%patient.birthDate"
    * linkId = "90ad8f16-16e4-4438-a7aa-b3189f510da2"
    * text = "Date of birth"
    * type = #date
    * repeats = false
  * item[+]
    * extension[sdc-questionnaire-initialExpression].valueExpression
      * language = #text/fhirpath
      * expression = "iif(today().toString().substring(4,4).toInteger > %patient.birthDate.toString().substring(4,4).toInteger, today().toString().substring(0,4).toInteger() - %patient.birthDate.toString().substring(0,4).toInteger(), today().toString().substring(0,4).toInteger() - %patient.birthDate.toString().substring(0,4).toInteger() - 1)"
    * linkId = "e2a16e4d-2765-4b61-b286-82cfc6356b30"
    * text = "Age"
    * type = #integer
    * repeats = false
  * item[+]
    * extension[sdc-questionnaire-initialExpression].valueExpression
      * language = #text/fhirpath
      * expression = "%patient.gender"
    * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#radio-button
    * linkId = "418e4a02-de77-48a0-a92a-fe8fcc52b1aa"
    * text = "Gender"
    * type = #choice
    * repeats = false
    * answerValueSet = "http://hl7.org/fhir/ValueSet/administrative-gender"
  * item[+]
    * extension[sdc-questionnaire-initialExpression].valueExpression
      * language = #text/fhirpath
      * expression = "%patient.extension('http://hl7.org.au/fhir/StructureDefinition/indigenous-status').value"
    * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#radio-button
    * linkId = "8acde9f8-7a91-4f0c-9216-38531ec984ef"
    * text = "Aboriginal and/or Torres Strait Islander status"
    * type = #choice
    * repeats = false
    * answerOption[+].valueCoding = https://healthterminologies.gov.au/fhir/CodeSystem/australian-indigenous-status-1#1  
    * answerOption[+].valueCoding = https://healthterminologies.gov.au/fhir/CodeSystem/australian-indigenous-status-1#2
    * answerOption[+].valueCoding = https://healthterminologies.gov.au/fhir/CodeSystem/australian-indigenous-status-1#3
  * item[+]
    * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#check-box
    * linkId = "c8852db9-efe9-4102-96db-cef3a8be0a5f"
    * text = "Parents/primary carer/s"
    * type = #choice
    * repeats = true    
    * answerOption[+].valueCoding = http://terminology.hl7.org/CodeSystem/v3-RoleCode#MTH
    * answerOption[+].valueCoding = http://terminology.hl7.org/CodeSystem/v3-RoleCode#FTH
    * answerOption[+].valueCoding = http://terminology.hl7.org/CodeSystem/v3-RoleCode#GRPRN
    * answerOption[+].valueCoding = http://terminology.hl7.org/CodeSystem/v3-NullFlavor#NA
  * item[+]
    * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
    * linkId = "7089c48e-4216-4089-a548-034cd585e4da"
    * text = "Other family"
    * type = #string
    * repeats = true    
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#prompt
      * linkId = "70c45932-99dc-42a3-9650-4683892a0892"
      * text = "details"
      * type = #display
      * repeats = true
  * item[+]
    * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
    * linkId = "42b1f5e0-bf4a-47d9-86a4-f2fe946ac01f"
    * text = "Other"
    * type = #string
    * repeats = true    
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#prompt
      * linkId = "dcbd3a54-9b68-4486-bf30-f6f1723bc39c"
      * text = "details"
      * type = #display
      * repeats = true
  * item[+]
    * linkId = "f1262ade-843c-4eba-a86d-51a9c97d134b"
    * text = "Home address"
    * type = #group
    * repeats = true
    * item[+]
      * extension[sdc-questionnaire-initialExpression].valueExpression
        * language = #text/fhirpath
        * expression = "%patient.address.extension('http://hl7.org.au/fhir/StructureDefinition/no-fixed-address').value"
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#check-box
      * linkId = "311d83bb-f22e-4f60-9b50-b6e38dd2059b"
      * definition = "http://hl7.org.au/fhir/StructureDefinition/au-address#Address.extension:noFixedAddress"
      * text = "No fixed address"
      * type = #boolean
      * repeats = false
    * item[+]
      * extension[sdc-questionnaire-initialExpression].valueExpression
        * language = #text/fhirpath
        * expression = "%patient.address.select(line.first() & ' ' & line.skip(1) & ' ' & line.skip(2)"
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
      * linkId = "2fee2d51-7828-4178-b8c1-35edd32ba338"
      * definition = "http://hl7.org.au/fhir/StructureDefinition/au-address#Address.line"
      * text = "Street address"
      * type = #string
      * enableWhen[+]
        * question = "311d83bb-f22e-4f60-9b50-b6e38dd2059b"
        * operator = #=
        * answerBoolean = false
      * repeats = true
    * item[+]
      * extension[sdc-questionnaire-initialExpression].valueExpression
        * language = #text/fhirpath
        * expression = "%patient.address.city"
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
      * linkId = "ddb65ed1-f4b2-4730-af2a-2f98bc73c76f"
      * definition = "http://hl7.org.au/fhir/StructureDefinition/au-address#Address.city"
      * text = "City"
      * type = #string
      * enableWhen[+]
        * question = "311d83bb-f22e-4f60-9b50-b6e38dd2059b"
        * operator = #=
        * answerBoolean = false
      * repeats = false
    * item[+]
      * extension[sdc-questionnaire-initialExpression].valueExpression
        * language = #text/fhirpath
        * expression = "%patient.address.state"
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#drop-down
      * linkId = "d9a1236c-8d6e-4f20-a12a-9d5de5a1d0f6"
      * definition = "http://hl7.org.au/fhir/StructureDefinition/au-address#Address.state"
      * text = "State"
      * type = #choice
      * enableWhen[+]
        * question = "311d83bb-f22e-4f60-9b50-b6e38dd2059b"
        * operator = #=
        * answerBoolean = false
      * repeats = false
      * answerValueSet = "https://healthterminologies.gov.au/fhir/ValueSet/australian-states-territories-2"
    * item[+]
      * extension[sdc-questionnaire-initialExpression].valueExpression
        * language = #text/fhirpath
        * expression = "%patient.address.postalCode"
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
      * extension[http://hl7.org/fhir/StructureDefinition/regex].valueString = "matches('^[0-9]{4}$')"
      * extension[http://hl7.org/fhir/StructureDefinition/entryFormat].valueString = "####"
      * linkId = "3f61a1ea-1c74-4f52-8519-432ce861a74f"
      * definition = "http://hl7.org.au/fhir/StructureDefinition/au-address#Address.postalCode"
      * text = "Postcode"
      * type = #string
      * enableWhen[+]
        * question = "311d83bb-f22e-4f60-9b50-b6e38dd2059b"
        * operator = #=
        * answerBoolean = false
      * repeats = false
  * item[+]
    * extension[sdc-questionnaire-initialExpression].valueExpression
      * language = #text/fhirpath
      * expression = "%patient.telecom.where(system = 'phone' and use = 'home').value"
    * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
    * linkId = "9541f0b0-f5ba-4fe7-a8e9-ad003cef897b"
    * text = "Home phone"
    * type = #string
    * repeats = true
  * item[+]
    * extension[sdc-questionnaire-initialExpression].valueExpression
      * language = #text/fhirpath
      * expression = "%patient.telecom.where(system = 'phone' and use = 'mobile').value"
    * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
    * linkId = "4037a02b-4a85-40e0-9be6-5b17df1aac56"
    * text = "Mobile phone"
    * type = #string
    * repeats = true
  * item[+]
    * linkId = "c22390d3-1be6-4fd1-b775-6443b7239a6b"
    * text = "Emergency contact"
    * type = #group
    * repeats = true
    * item[+]
      * extension[sdc-questionnaire-initialExpression].valueExpression
        * language = #text/fhirpath
        * expression = "%patient.contact.where(relationship.coding.code = 'C').name.where(use='usual').select(given.first() & ' ' & family)"
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
      * linkId = "d7f2dd75-20c8-480f-8c22-71d604ebee8d"
      * text = "Name"
      * type = #string
      * repeats = false
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
      * linkId = "27099697-d6d1-42c0-bb0a-5e9ff7372a96"
      * text = "Relationship to patient"
      * type = #string
      * repeats = true
    * item[+]
      * extension[sdc-questionnaire-initialExpression].valueExpression
        * language = #text/fhirpath
        * expression = "%patient.contact.where(relationship.coding.code = 'C').telecom.value"
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
      * linkId = "626e3723-6310-4b99-81c1-525676b027c8"
      * text = "Phone"
      * type = #string
      * repeats = true
  * item[+]
    * linkId = "df1475ea-bf7e-4bf0-a69f-7f9608c3ed3c"
    * text = "Medicare number"
    * type = #group
    * repeats = false
    * item[+]
      * extension[sdc-questionnaire-initialExpression].valueExpression
        * language = #text/fhirpath
        * expression = "%patient.identifier.where(type.coding.system='http://terminology.hl7.org/CodeSystem/v2-0203' and type.coding.code='MC').value.substring(0,10)"
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
      * extension[http://hl7.org/fhir/StructureDefinition/regex].valueString = "matches('^[0-9]{10}$')"
      * linkId = "eb2a59ed-9632-4df1-b5b1-1e85c3b4b7cf"
      * text = "Number"
      * type = #string
      * repeats = false
    * item[+]
      * extension[sdc-questionnaire-initialExpression].valueExpression
        * language = #text/fhirpath
        * expression = "%patient.identifier.where(type.coding.system='http://terminology.hl7.org/CodeSystem/v2-0203' and type.coding.code='MC').value.substring(10,1)"
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
      * extension[http://hl7.org/fhir/StructureDefinition/regex].valueString = "matches('^[0-9]{1}$')"
      * linkId = "d6253253-a124-494e-a1d8-7ce02c69ec11"
      * text = "Reference number"
      * type = #string
      * repeats = false
    * item[+]
      * extension[sdc-questionnaire-initialExpression].valueExpression
        * language = #text/fhirpath
        * expression = "%patient.identifier.where(type.coding.system='http://terminology.hl7.org/CodeSystem/v2-0203' and type.coding.code='MC').period.end.toString()"
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
      // Probably don't want this card format as not compatible with date datatype * extension[http://hl7.org/fhir/StructureDefinition/entryFormat].valueString = "MM/YY"
      * linkId = "c520e213-5313-42c3-860a-d30206620290"
      * text = "Expiry"
      * type = #string
      * repeats = false
  * item[+]
    * extension[sdc-questionnaire-initialExpression].valueExpression
      * language = #text/fhirpath
      * expression = "%patient.identifier.where(type.coding.system='http://terminology.hl7.org/CodeSystem/v2-0203' and type.coding.code='PEN').value"
    * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
    * linkId = "c1e4e967-c0aa-4280-b5d4-ab1f375ed9ac"
    * text = "Pensioner Card Number"
    * type = #string
    * repeats = false
    * maxLength = 10
  * item[+]
    * extension[sdc-questionnaire-initialExpression].valueExpression
      * language = #text/fhirpath
      * expression = "%patient.identifier.where(type.coding.system='http://terminology.hl7.org/CodeSystem/v2-0203' and type.coding.code='HC').value"
    * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
    * linkId = "a7e97574-3cea-4dfa-bef2-2665e7748364"
    * text = "Health Care Card Number"
    * type = #string
    * repeats = false
    * maxLength = 10
  * item[+]
    * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#radio-button
    * linkId = "83814495-3a81-43f4-88df-42186cce516a"
    * text = "Registered for Closing the Gap PBS Co-payment Measure (CTG)"
    * type = #choice
    * repeats = false
    * answerValueSet = "https://aehrc.csiro.au/fhir/ValueSet/YesNoNA"
  * item[+]
    * linkId = "2bfe50cb-7913-4f31-bce2-763c17ff8b1a"
    * text = "National Disability Insurance Scheme"
    * type = #group
    * repeats = false
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#radio-button
      * linkId = "924b4500-53ac-4c4e-831b-7ab5569ff981"
      * text = "Registered for NDIS"
      * type = #choice
      * repeats = false
      * answerValueSet = "https://aehrc.csiro.au/fhir/ValueSet/YesNoNA"
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
      * linkId = "7379a0fd-d95b-4ecb-a781-9f43d1394f10"
      * text = "NDIS Number"
      * type = #string
      * enableWhen[+]
        * question = "924b4500-53ac-4c4e-831b-7ab5569ff981"
        * operator = #=
        * answerCoding = http://terminology.hl7.org/CodeSystem/v2-0136#Y
      * repeats = false
  * item[+]
    * linkId = "9bc882bc-e989-4600-9587-8089fb757641"
    * text = "Children"
    * type = #group
    * repeats = false
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#radio-button
      * linkId = "e90b436b-2751-4e07-a40c-adfe951b6528"
      * text = "Do you have children?"
      * type = #choice
      * repeats = false
      * answerValueSet = "https://aehrc.csiro.au/fhir/ValueSet/YesNoNA"
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
      * linkId = "241f5fca-f61a-49bd-8972-52613c0e6d15"
      * text = "Number of children"
      * type = #integer
      * enableWhen[+]
        * question = "e90b436b-2751-4e07-a40c-adfe951b6528"
        * operator = #=
        * answerCoding = http://terminology.hl7.org/CodeSystem/v2-0136#Y
      * repeats = false
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
      * linkId = "74ce4c60-31d6-4e78-9056-579937379451"
      * text = "Number of children in your care"
      * type = #integer
      * enableWhen[+]
        * question = "e90b436b-2751-4e07-a40c-adfe951b6528"
        * operator = #=
        * answerCoding = http://terminology.hl7.org/CodeSystem/v2-0136#Y
      * repeats = false
  * item[+]
    * linkId = "2b5ae784-4341-4172-875d-1698cc8069f0"
    * text = "Carer"
    * type = #group
    * repeats = false    
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#radio-button
      * linkId = "a08271f1-194b-4fe9-91f9-4f3398858eb0"
      * text = "Are you responsible for caring for someone else?"
      * type = #choice
      * repeats = false
      * answerValueSet = "https://aehrc.csiro.au/fhir/ValueSet/YesNoNA"
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
      * linkId = "4c14b158-3ae4-4994-8446-76e02640702c"
      * text = "Details"
      * type = #string
      * enableWhen[+]
        * question = "a08271f1-194b-4fe9-91f9-4f3398858eb0"
        * operator = #=
        * answerCoding = http://terminology.hl7.org/CodeSystem/v2-0136#Y
      * repeats = false
  * item[+]
    * linkId = "3494631c-6b56-46dc-abf7-a17bfc1d025f"
    * text = "Providers"
    * type = #group
    * repeats = false
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#radio-button
      * linkId = "41210be5-d441-4c44-b9c2-8dd94a44cbb4"
      * text = "Are name and contact details of other key providers (eg case workers, support services) up to date?"
      * type = #choice
      * repeats = false
      * answerValueSet = "https://aehrc.csiro.au/fhir/ValueSet/YesNoNA"
    * item[+]
      * extension[questionnaire-itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#text-box
      * linkId = "6733d6ec-5b6b-4ee2-a21e-0e9474c2b22b"
      * text = "Details"
      * type = #text
      * repeats = false




