
Alias: $LNC = http://loinc.org
Alias: $SCT = http://snomed.info/sct
Alias: $UCUM = http://unitsofmeasure.org
Alias: $obligation = http://hl7.org/fhir/StructureDefinition/obligation

Alias: $au-core-allergyintolerance = http://hl7.org.au/fhir/core/StructureDefinition/au-core-allergyintolerance
Alias: $au-core-condition = http://hl7.org.au/fhir/core/StructureDefinition/au-core-condition
Alias: $au-core-encounter = http://hl7.org.au/fhir/core/StructureDefinition/au-core-encounter
Alias: $au-core-immunization = http://hl7.org.au/fhir/core/StructureDefinition/au-core-immunization
Alias: $au-core-medication = http://hl7.org.au/fhir/core/StructureDefinition/au-core-medication
Alias: $au-core-medicationstatement = http://hl7.org.au/fhir/core/StructureDefinition/au-core-medicationstatement
Alias: $au-core-bloodpressure = http://hl7.org.au/fhir/core/StructureDefinition/au-core-bloodpressure
Alias: $au-core-bodyheight = http://hl7.org.au/fhir/core/StructureDefinition/au-core-bodyheight
Alias: $au-core-bodyweight = http://hl7.org.au/fhir/core/StructureDefinition/au-core-bodyweight
Alias: $au-core-diagnosticresult-path = http://hl7.org.au/fhir/core/StructureDefinition/au-core-diagnosticresult-path
Alias: $au-core-headcircum = http://hl7.org.au/fhir/core/StructureDefinition/au-core-headcircum
Alias: $au-core-heartrate = http://hl7.org.au/fhir/core/StructureDefinition/au-core-heartrate
Alias: $au-core-waistcircum = http://hl7.org.au/fhir/core/StructureDefinition/au-core-waistcircum
Alias: $au-core-smokingstatus = http://hl7.org.au/fhir/core/StructureDefinition/au-core-smokingstatus
Alias: $au-core-patient = http://hl7.org.au/fhir/core/StructureDefinition/au-core-patient
Alias: $au-core-practitioner = http://hl7.org.au/fhir/core/StructureDefinition/au-core-practitioner
Alias: $sdc-questionnaireresponse = http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaireresponse

Alias: $au-address = http://hl7.org.au/fhir/StructureDefinition/au-address
Alias: $au-pensionerconcessioncardnumber = http://hl7.org.au/fhir/StructureDefinition/au-pensionerconcessioncardnumber
Alias: $au-healthcarecardnumber = http://hl7.org.au/fhir/StructureDefinition/au-healthcarecardnumber

/* Old RuleSets to be reinstated following SUSHI bug fix
RuleSet: obligationApp(index, appCode)
* ^extension[$obligation][{index}].extension[code].valueCode = #"{appCode}"
* ^extension[$obligation][=].extension[actor].valueCanonical = "https://smartforms.csiro.au/ig/ActorDefinition/SHCApp"

RuleSet: obligation2App(index, appCode1, appCode2)
* ^extension[$obligation][{index}].extension[code][+].valueCode = #"{appCode1}"
* ^extension[$obligation][=].extension[code][+].valueCode = #"{appCode2}"
* ^extension[$obligation][=].extension[actor].valueCanonical = "https://smartforms.csiro.au/ig/ActorDefinition/SHCApp"

RuleSet: obligationServer(index, serverCode)
* ^extension[$obligation][{index}].extension[code].valueCode = #"{serverCode}"
* ^extension[$obligation][=].extension[actor].valueCanonical = "https://smartforms.csiro.au/ig/ActorDefinition/SHCHostFHIRServer"

RuleSet: obligation2Server(index, serverCode1, serverCode2)
* ^extension[$obligation][{index}].extension[code][+].valueCode = #"{serverCode1}"
* ^extension[$obligation][=].extension[code][+].valueCode = #"{serverCode2}"
* ^extension[$obligation][=].extension[actor].valueCanonical = "https://smartforms.csiro.au/ig/ActorDefinition/SHCHostFHIRServer"
*/

RuleSet: obligationApp(index, appCode)
* ^extension[{index}].url = $obligation
* ^extension[=].extension[+].url = "code"
* ^extension[=].extension[=].valueCode = #"{appCode}"
* ^extension[=].extension[+].url = "actor"
* ^extension[=].extension[=].valueCanonical = "https://smartforms.csiro.au/ig/ActorDefinition/SHCApp"

RuleSet: obligation2App(index, appCode1, appCode2)
* ^extension[{index}].url = $obligation
* ^extension[=].extension[+].url = "code"
* ^extension[=].extension[=].valueCode = #"{appCode1}"
* ^extension[=].extension[+].url = "code"
* ^extension[=].extension[=].valueCode = #"{appCode2}"
* ^extension[=].extension[+].url = "actor"
* ^extension[=].extension[=].valueCanonical = "https://smartforms.csiro.au/ig/ActorDefinition/SHCApp"

RuleSet: obligationServer(index, serverCode)
* ^extension[{index}].url = $obligation
* ^extension[=].extension[+].url = "code"
* ^extension[=].extension[=].valueCode = #"{serverCode}"
* ^extension[=].extension[+].url = "actor"
* ^extension[=].extension[=].valueCanonical = "https://smartforms.csiro.au/ig/ActorDefinition/SHCHostFHIRServer"

RuleSet: obligation2Server(index, serverCode1, serverCode2)
* ^extension[{index}].url = $obligation
* ^extension[=].extension[+].url = "code"
* ^extension[=].extension[=].valueCode = #"{serverCode1}"
* ^extension[=].extension[+].url = "code"
* ^extension[=].extension[=].valueCode = #"{serverCode2}"
* ^extension[=].extension[+].url = "actor"
* ^extension[=].extension[=].valueCanonical = "https://smartforms.csiro.au/ig/ActorDefinition/SHCHostFHIRServer"


Invariant: shc-heartrhythm-01
Description: "At least value or data absent reason shall be present"
* severity = #error
* expression = "dataAbsentReason.exists() or value.exists()"
* xpath = "exists(f:*[starts-with(local-name(.), 'value')]) or exists(f:dataAbsentReason)"

Invariant: shc-heartrhythm-02
Description: "Date shall be at least to day or, if not available, the Data Absent Reason extension shall be present"
* severity = #error
* expression = "(($this is dateTime implies $this.toString().length() >= 10) and extension('http://hl7.org/fhir/StructureDefinition/data-absent-reason').value.exists().not()) xor ($this is dateTime implies ($this.hasValue().not() and extension('http://hl7.org/fhir/StructureDefinition/data-absent-reason').value.exists()))"
* xpath = "((self::dateTime and string-length(.) >= 10 and not(extension[@url='http://hl7.org/fhir/StructureDefinition/data-absent-reason'])) xor (self::dateTime and not(.) and extension[@url='http://hl7.org/fhir/StructureDefinition/data-absent-reason']))"



Profile: SmartHealthChecksAllergyIntolerance
Parent: $au-core-allergyintolerance
Id: SHCAllergyIntolerance
Title: "Smart Health Checks AllergyIntolerance"
Description: "This profile sets the minimum expectations for an AllergyIntolerance resource to record, search and save allergy or intolerance information when used within Smart Health Checks."

* id MS
* id insert obligationServer (0, SHALL:populate)
* id insert obligationApp (1, SHALL:process)
* patient MS
* patient insert obligation2Server (2, SHALL:populate, SHALL:process)
* patient insert obligationApp (3, SHALL:populate)
* clinicalStatus MS 
* clinicalStatus insert obligation2Server (2, SHALL:populate, SHALL:process)
* clinicalStatus insert obligation2App (3, SHALL:populate-if-known, SHALL:process)
* verificationStatus MS
* verificationStatus insert obligationServer (2, SHALL:populate-if-known)
* verificationStatus insert obligationApp (3, SHALL:process)
* code MS
* code insert obligation2Server (2, SHALL:populate-if-known, SHALL:process)
* code insert obligation2App (3, SHALL:populate-if-known, SHALL:process)
* note ..1 MS
* note.text MS
* note.text insert obligation2Server (0, SHALL:populate-if-known, SHALL:process)
* note.text insert obligation2App (1, SHALL:populate-if-known, SHALL:process)
* reaction.manifestation MS
* reaction.manifestation insert obligation2Server (2, SHALL:populate-if-known, SHALL:process)
* reaction.manifestation insert obligation2App (3, SHALL:populate-if-known, SHALL:process)

Profile: SmartHealthChecksCondition
Parent: $au-core-condition
Id: SHCCondition
Title: "Smart Health Checks Condition"
Description: "This profile sets the minimum expectations for a Condition resource to record, search and save condition information when used within Smart Health Checks."

* id MS
* id insert obligationServer (0, SHALL:populate)
* id insert obligationApp (1, SHALL:process)
* clinicalStatus MS
* clinicalStatus insert obligation2Server (2, SHALL:populate-if-known, SHALL:process)
* clinicalStatus insert obligation2App (3, SHALL:populate, SHALL:process)
* verificationStatus MS
* verificationStatus insert obligationServer (2, SHALL:populate-if-known)
* verificationStatus insert obligationApp (3, SHALL:process)
* category MS
* category insert obligation2Server (2, SHALL:populate, SHALL:process)
* category insert obligationApp (3, SHALL:populate)
* code MS
* code insert obligation2Server (2, SHALL:populate-if-known, SHALL:process)
* code insert obligation2App (3, SHALL:populate-if-known, SHALL:process)
* subject MS
* subject insert obligation2Server (2, SHALL:populate, SHALL:process)
* subject insert obligationApp (3, SHALL:populate)
* onsetDateTime MS
* onsetDateTime insert obligation2Server (2, SHALL:populate-if-known, SHALL:process)
* onsetDateTime insert obligation2App (3, SHALL:populate-if-known, SHALL:process)
* abatementDateTime MS
* abatementDateTime insert obligation2Server (2, SHALL:populate-if-known, SHALL:process)
* abatementDateTime insert obligationApp (3, SHALL:process)
* note.text MS
* note.text insert obligationServer (0, SHALL:process)
* note.text insert obligationApp (1, SHALL:populate-if-known)

Profile: SmartHealthChecksImmunization
Parent: $au-core-immunization
Id: SHCImmunization
Title: "Smart Health Checks Immunization"
Description: "This profile sets the minimum expectations for an Immunization resource to record, search and save immunization information when used within Smart Health Checks."

* status MS
* status insert obligation2Server (2, SHALL:populate, SHALL:process)
* status insert obligationApp (3, SHALL:populate)
* vaccineCode MS
* vaccineCode insert obligation2Server (2, SHALL:populate-if-known, SHALL:process)
* vaccineCode insert obligation2App (3, SHALL:populate-if-known, SHALL:process)
* vaccineCode.coding[amtVaccineCode] MS
* vaccineCode.coding[amtVaccineCode] insert obligation2Server (2, SHALL:populate-if-known, SHALL:process)
* vaccineCode.coding[amtVaccineCode] insert obligation2App (3, SHALL:populate-if-known, SHALL:process)
* patient MS
* patient insert obligation2Server (2, SHALL:populate, SHALL:process)
* patient insert obligationApp (3, SHALL:populate)
* occurrenceDateTime MS
* occurrenceDateTime insert obligation2Server (2, SHALL:populate-if-known, SHALL:process)
* occurrenceDateTime insert obligation2App (3, SHALL:populate-if-known, SHALL:process)
* lotNumber MS
* lotNumber insert obligation2Server (0, SHALL:populate-if-known, SHALL:process)
* lotNumber insert obligation2App (1, SHALL:populate-if-known, SHALL:process)
* note.text MS
* note.text insert obligation2Server (0, SHALL:populate-if-known, SHALL:process)
* note.text insert obligation2App (1, SHALL:populate-if-known, SHALL:process)

Profile: SmartHealthChecksMedicationStatement
Parent: $au-core-medicationstatement
Id: SHCMedicationStatement
Title: "Smart Health Checks MedicationStatement"
Description: "This profile sets the minimum expectations for a MedicationStatement resource to record, search and save medication information when used within Smart Health Checks."

* id MS
* id insert obligationServer (0, SHALL:populate)
* id insert obligationApp (1, SHALL:process)
* status MS
* status insert obligation2Server (2, SHALL:populate, SHALL:process)
* status insert obligationApp (3, SHALL:populate)
* medication[x][medicationCodeableConcept] MS
* medication[x][medicationCodeableConcept] insert obligation2Server (0, SHALL:populate-if-known, SHALL:process) // NOTE: When migrating to AU Core v2.0.0, update the extension array index from (0) to (2) for medication[x][medicationCodeableConcept]
* medication[x][medicationCodeableConcept] insert obligation2App (1, SHALL:populate-if-known, SHALL:process) // When upgrading to AU Core v2.0.0, update the extension array index from (1) to (3) for medication[x][medicationCodeableConcept] to match the new element order.
* medication[x][medicationReference] MS
* medication[x][medicationReference] only Reference(SHCMedication)
* medication[x][medicationReference] insert obligationServer (2, SHALL:populate-if-known)
* medication[x][medicationReference] insert obligationApp (3, SHALL:process)
* subject MS
* subject insert obligation2Server (2, SHALL:populate, SHALL:process)
* subject insert obligationApp (3, SHALL:populate)
* dateAsserted MS
* dateAsserted insert obligationServer (2, SHALL:process)
* dateAsserted insert obligationApp (3, SHALL:populate)
* reasonCode MS
* reasonCode insert obligation2Server (2, SHALL:populate-if-known, SHALL:process)
* reasonCode insert obligation2App (3, SHALL:populate-if-known, SHALL:process)
* note ..1 MS
* note.text MS
* note.text insert obligation2Server (0, SHALL:populate-if-known, SHALL:process)
* note.text insert obligation2App (1, SHALL:populate-if-known, SHALL:process)
* dosage ..1 MS
* dosage.text MS
* dosage.text insert obligation2Server (0, SHALL:populate-if-known, SHALL:process)
* dosage.text insert obligation2App (1, SHALL:populate-if-known, SHALL:process)

Profile: SmartHealthChecksMedication
Parent: $au-core-medication
Id: SHCMedication
Title: "Smart Health Checks Medication"
Description: "This profile sets the minimum expectations for a Medication resource to search and retrieve medication information when used within Smart Health Checks."

* id MS
* id insert obligationServer (0, SHALL:populate)
* id insert obligationApp (1, SHALL:process)
* code MS
* code insert obligationServer (2, SHALL:populate-if-known)
* code insert obligationApp (3, SHALL:process)

Profile: SmartHealthChecksPathologyResult
Parent: $au-core-diagnosticresult-path
Id: SHCPathologyResult
Title: "Smart Health Checks Pathology Result"
Description: "This profile sets the minimum expectations for an Observation resource to search and retrieve pathology result information when used within Smart Health Checks."

* status MS
* status insert obligationServer (3, SHALL:populate)
* status insert obligationApp (4, SHALL:process)
* code.coding MS
* code.coding insert obligationServer (0, SHALL:populate)
* code.coding insert obligationApp (1, SHALL:process)
* subject MS
* subject insert obligationServer (2, SHALL:populate)
* effectiveDateTime MS
* effectiveDateTime insert obligationServer (2, SHALL:populate-if-known)
* effectiveDateTime insert obligationApp (3, SHALL:process)
* value[x] MS
* value[x] insert obligationServer (0, SHALL:populate-if-known)
* value[x] insert obligationApp (1, SHALL:process)


Profile: SmartHealthChecksPatient
Parent: $au-core-patient
Id: SHCPatient
Title: "Smart Health Checks Patient"
Description: "This profile sets the minimum expectations for a Patient resource to search and retrieve patient information when used within Smart Health Checks."

* extension[indigenousStatus] MS
* extension[indigenousStatus] insert obligationServer (2, SHALL:populate-if-known)
* extension[indigenousStatus] insert obligationApp (3, SHALL:process)
* extension[closingTheGapRegistration] MS
* extension[closingTheGapRegistration] insert obligationServer (0, SHALL:populate-if-known)
* extension[closingTheGapRegistration] insert obligationApp (1, SHALL:process)
* extension[genderIdentity] MS
* extension[genderIdentity] insert obligationServer (2, SHALL:populate-if-known)
* extension[genderIdentity] insert obligationApp (3, SHALL:process)
* extension[individualPronouns] MS
* extension[individualPronouns] insert obligationServer (2, SHALL:populate-if-known)
* extension[individualPronouns] insert obligationApp (3, SHALL:process)
* extension[recordedSexOrGender] MS
* extension[recordedSexOrGender] insert obligationServer (0, SHALL:populate-if-known)
* extension[recordedSexOrGender] insert obligationApp (1, SHALL:process)
* identifier contains 
    pensionerCard ..1 MS and
    healthCareCard ..1 MS
* identifier[pensionerCard] only $au-pensionerconcessioncardnumber
* identifier[pensionerCard] insert obligationServer (0, SHALL:populate-if-known)
* identifier[pensionerCard] insert obligationApp (1, SHALL:process)
* identifier[healthCareCard] only $au-healthcarecardnumber
* identifier[healthCareCard] insert obligationServer (0, SHALL:populate-if-known)
* identifier[healthCareCard] insert obligationApp (1, SHALL:process)
* identifier[medicare] MS
* identifier[medicare] insert obligationServer (2, SHALL:populate-if-known)
* identifier[medicare] insert obligationApp (3, SHALL:process)
* name MS
* name insert obligationServer (2, SHALL:populate-if-known)
* name insert obligationApp (3, SHALL:process)
* name.use MS
* name.use insert obligationServer (2, SHALL:populate-if-known)
* name.use insert obligationApp (3, SHALL:process)
* name.text MS
* name.text insert obligationServer (2, SHALL:populate-if-known)
* name.text insert obligationApp (3, SHALL:process)
* name.family MS
* name.family insert obligationServer (2, SHALL:populate-if-known)
* name.family insert obligationApp (3, SHALL:process)
* name.given MS
* name.given insert obligationServer (2, SHALL:populate-if-known)
* name.given insert obligationApp (3, SHALL:process)
* name.prefix MS
* name.prefix insert obligationApp (0, SHALL:process)
* telecom MS
* telecom insert obligationServer (2, SHALL:populate-if-known)
* telecom insert obligationApp (3, SHALL:process)
* telecom.system MS
* telecom.system insert obligationServer (0, SHALL:populate-if-known)
* telecom.system insert obligationApp (1, SHALL:process)
* telecom.value MS
* telecom.value insert obligationServer (0, SHALL:populate-if-known)
* telecom.value insert obligationApp (1, SHALL:process)
* telecom.use MS
* telecom.use insert obligationServer (0, SHALL:populate-if-known)
* telecom.use insert obligationApp (1, SHALL:process)
* gender MS
* gender insert obligationServer (2, SHALL:populate-if-known)
* gender insert obligationApp (3, SHALL:process)
* birthDate MS
* birthDate insert obligationServer (2, SHALL:populate)
* birthDate insert obligationApp (3, SHALL:process)
* address MS
* address only $au-address
* address insert obligationServer (2, SHALL:populate)
* address insert obligationApp (3, SHALL:process)
* address.use MS
* address.use insert obligationServer (0, SHALL:populate-if-known)
* address.use insert obligationApp (1, SHALL:process)
* address.type MS
* address.type insert obligationServer (0, SHALL:populate-if-known)
* address.type insert obligationApp (1, SHALL:process)
* address.line MS
* address.line insert obligationServer (0, SHALL:populate-if-known)
* address.line insert obligationApp (1, SHALL:process)
* address.city MS
* address.city insert obligationServer (0, SHALL:populate-if-known)
* address.city insert obligationApp (1, SHALL:process)
* address.state MS
* address.state insert obligationServer (0, SHALL:populate-if-known)
* address.state insert obligationApp (1, SHALL:process)
* address.postalCode MS
* address.postalCode insert obligationServer (0, SHALL:populate-if-known)
* address.postalCode insert obligationApp (1, SHALL:process)
* contact MS
* contact insert obligationServer (0, SHALL:populate-if-known)
* contact insert obligationApp (1, SHALL:process)
* contact.relationship MS
* contact.relationship insert obligationServer (0, SHALL:populate-if-known)
* contact.relationship insert obligationApp (1, SHALL:process)
* contact.name MS
* contact.name insert obligationServer (0, SHALL:populate-if-known)
* contact.name insert obligationApp (1, SHALL:process)
* contact.name.family MS
* contact.name.family insert obligationServer (0, SHALL:populate-if-known)
* contact.name.family insert obligationApp (1, SHALL:process)
* contact.name.given MS
* contact.name.given insert obligationServer (0, SHALL:populate-if-known)
* contact.name.given insert obligationApp (1, SHALL:process)
* contact.name.prefix MS
* contact.name.prefix insert obligationApp (0, SHALL:process)
* contact.telecom MS
* contact.telecom insert obligationServer (0, SHALL:populate-if-known)
* contact.telecom insert obligationApp (1, SHALL:process)

Profile: SmartHealthChecksPractitioner
Parent: $au-core-practitioner
Id: SHCPractitioner
Title: "Smart Health Checks Practitioner"
Description: "This profile sets the minimum expectations for a Practitioner resource to search and retrieve practitioner information when used within Smart Health Checks."

* id MS
* id insert obligationServer (0, SHALL:populate)
* id insert obligationApp (1, SHALL:process)
* name MS
* name insert obligationServer (2, SHALL:populate-if-known)
* name insert obligationApp (3, SHALL:process)

Profile: SmartHealthChecksEncounter
Parent: $au-core-encounter
Id: SHCEncounter
Title: "Smart Health Checks Encounter"
Description: "This profile sets the minimum expectations for a Encounter resource to search and retrieve encounter information when used within Smart Health Checks."

* id MS
* id insert obligationServer (0, SHALL:populate)
* id insert obligationApp (1, SHALL:process)


Profile: SmartHealthChecksQuestionnaireResponse
Parent: $sdc-questionnaireresponse
Id: SHCQuestionnaireResponse
Title: "Smart Health Checks Questionnaire Response"
Description: "This profile sets the minimum expectations for a QuestionnaireResponse resource to record, search and save form information when used within Smart Health Checks."

* id 1.. MS
* id insert obligation2Server (0, SHALL:populate, SHALL:persist)
* id insert obligation2App (1, SHALL:populate, SHALL:process)
* text MS
* text insert obligation2Server (0, SHALL:populate-if-known, SHALL:persist)
* text insert obligation2App (1, SHALL:populate, SHALL:process)
* questionnaire MS
* questionnaire insert obligation2Server (0, SHALL:populate-if-known, SHALL:persist)
* questionnaire insert obligation2App (1, SHALL:populate, SHALL:process)
* questionnaire.extension[questionnaireDisplay] MS
* questionnaire.extension[questionnaireDisplay] insert obligation2Server (0, SHALL:populate-if-known, SHALL:persist)
* questionnaire.extension[questionnaireDisplay] insert obligation2App (1, SHALL:populate, SHALL:process)
* status MS
* status insert obligation2Server (0, SHALL:populate, SHALL:persist)
* status insert obligation2App (1, SHALL:populate, SHALL:process)
* subject 1.. MS
* subject insert obligation2Server (0, SHALL:populate, SHALL:persist)
* subject insert obligation2App (1, SHALL:populate, SHALL:process)
* encounter MS
* encounter insert obligation2Server (0, SHALL:populate-if-known, SHALL:persist)
* encounter insert obligation2App (1, SHALL:populate-if-known, SHALL:process)
* authored MS
* authored insert obligation2Server (0, SHALL:populate, SHALL:persist)
* authored insert obligation2App (1, SHALL:populate, SHALL:process)
* author 1.. MS
* author insert obligation2Server (0, SHALL:populate, SHALL:persist)
* author insert obligation2App (1, SHALL:populate, SHALL:process)
* item MS
* item insert obligation2Server (0, SHALL:populate-if-known, SHALL:persist)
* item insert obligation2App (1, SHALL:populate-if-known, SHALL:process)
* item.linkId MS
* item.linkId insert obligation2Server (0, SHALL:populate-if-known, SHALL:persist)
* item.linkId insert obligation2App (1, SHALL:populate-if-known, SHALL:process)
* item.text MS
* item.text insert obligation2Server (0, SHALL:populate-if-known, SHALL:persist)
* item.text insert obligation2App (1, SHALL:populate-if-known, SHALL:process)
* item.answer MS
* item.answer insert obligation2Server (0, SHALL:populate-if-known, SHALL:persist)
* item.answer insert obligation2App (1, SHALL:populate-if-known, SHALL:process)
* item.answer.value[x] MS
* item.answer.value[x] insert obligation2Server (0, SHALL:populate-if-known, SHALL:persist)
* item.answer.value[x] insert obligation2App (1, SHALL:populate-if-known, SHALL:process)
* item.item MS
* item.item insert obligation2Server (0, SHALL:populate-if-known, SHALL:persist)
* item.item insert obligation2App (1, SHALL:populate-if-known, SHALL:process)


Profile: SmartHealthChecksHeartRhythm
Parent: Observation
Id: SHCHeartRhythm
Title: "Smart Health Checks Heart Rhythm"
Description: "This profile sets the minimum expectations for an Observation resource to record heart rhythm observations. It is used to represent heart rhythm data captured during a First Nations Health Check that can be used to record the observation in a clinical record."

* . ^short = "Heart Rhythm"
* . ^definition = "Measurement of a patient's heart rhythm at a point in time."
* . ^comment = "Heart rhythm observation using a LOINC code, a SNOMED CT code and a metric UCUM unit of measure."
* obeys shc-heartrhythm-01
* status MS
* status insert obligation2Server (1, SHALL:populate, SHALL:process)
* status insert obligation2App (2, SHALL:populate, SHALL:process)
* category MS
* category ^slicing.discriminator[0].type = #value
* category ^slicing.discriminator[=].path = "coding.code"
* category ^slicing.discriminator[+].type = #value
* category ^slicing.discriminator[=].path = "coding.system"
* category ^slicing.ordered = false
* category ^slicing.rules = #open
* category contains vitalSignsCategory 1..1 MS
* category[vitalSignsCategory].coding 1..* MS
* category[vitalSignsCategory].coding only Coding
* category[vitalSignsCategory].coding.system 1..1 MS
* category[vitalSignsCategory].coding.system only uri
* category[vitalSignsCategory].coding.system = "http://terminology.hl7.org/CodeSystem/observation-category" (exactly)
* category[vitalSignsCategory].coding.code 1..1 MS
* category[vitalSignsCategory].coding.code only code
* category[vitalSignsCategory].coding.code = #vital-signs (exactly)
/*
* category[vitalSignsCategory] = http://terminology.hl7.org/CodeSystem/observation-category#vital-signs (exactly) 
* category[vitalSignsCategory] insert obligationServer (0, SHALL:process)
* category[vitalSignsCategory] insert obligationApp (1, SHALL:populate)
*/
* code MS
* code ^short = "Heart Rhythm"
* code ^definition = "Heart Rhythm."
* code.coding MS
* code.coding ^slicing.discriminator[0].type = #value
* code.coding ^slicing.discriminator[=].path = "code"
* code.coding ^slicing.discriminator[+].type = #value
* code.coding ^slicing.discriminator[=].path = "system"
* code.coding ^slicing.ordered = false
* code.coding ^slicing.rules = #open
* code.coding contains loincHeartRhythmCode 1..1 MS and snomedHeartRhythmCode 1..1 MS
* code.coding[loincHeartRhythmCode] insert obligationServer (0, SHALL:process)
* code.coding[loincHeartRhythmCode] insert obligationApp (1, SHALL:populate)
* code.coding[loincHeartRhythmCode].system 1..1
* code.coding[loincHeartRhythmCode].system = "http://loinc.org" (exactly)
* code.coding[loincHeartRhythmCode].code 1..1
* code.coding[loincHeartRhythmCode].code = #8884-9 (exactly)
* code.coding[snomedHeartRhythmCode] insert obligation2Server (0, SHALL:populate, SHALL:process)
* code.coding[snomedHeartRhythmCode] insert obligation2App (1, SHALL:populate, SHALL:process)
* code.coding[snomedHeartRhythmCode].system 1..1
* code.coding[snomedHeartRhythmCode].system = "http://snomed.info/sct" (exactly)
* code.coding[snomedHeartRhythmCode].code 1..1
* code.coding[snomedHeartRhythmCode].code = #364074009 (exactly)
* code.text MS
* code.text insert obligationApp (1, SHALL:populate)
* subject 1.. MS
* subject only Reference($au-core-patient)
* subject insert obligation2Server (0, SHALL:populate, SHALL:process)
* subject insert obligationApp (1, SHALL:populate)
* effective[x] 1.. MS
* effective[x] only dateTime
* effective[x] obeys shc-heartrhythm-02
* effective[x] ^short = "Date, and optionally time, the observation was performed"
* effective[x] ^definition = "Date, and optionally time, the observation was performed."
* effective[x] ^condition = "shc-heartrhythm-02"
* effectiveDateTime MS
* effectiveDateTime insert obligation2Server (0, SHALL:populate-if-known, SHALL:process)
* effectiveDateTime insert obligation2App (1, SHALL:populate-if-known, SHALL:process)
* value[x] only CodeableConcept
* value[x] MS
* value[x] from HeartRhythm (extensible)
* value[x] ^condition = "shc-heartrhythm-01"
* valueCodeableConcept.coding MS
* valueCodeableConcept.coding insert obligation2Server (0, SHALL:populate-if-known, SHALL:process)
* valueCodeableConcept.coding insert obligation2App (1, SHALL:populate, SHALL:process)
* dataAbsentReason MS
* dataAbsentReason ^condition = "shc-heartrhythm-01"

Profile: SmartHealthChecksBloodPressure
Parent: $au-core-bloodpressure
Id: SHCBloodPressure
Title: "Smart Health Checks Blood Pressure"
Description: "This profile sets the minimum expectations for a Blood Pressure resource to record, search and save blood pressure information when used within Smart Health Checks."

* status MS
* status insert obligation2Server (3, SHALL:populate, SHALL:process)
* status insert obligation2App (4, SHALL:populate, SHALL:process)
* category[VSCat] MS
* category[VSCat] insert obligationServer (2, SHALL:process)
* category[VSCat] insert obligationApp (3, SHALL:populate)
* code.coding[BPCode] MS
* code.coding[BPCode] insert obligation2Server (0, SHALL:populate, SHALL:process)
* code.coding[BPCode] insert obligation2App (1, SHALL:populate, SHALL:process)
* code.coding[snomedBPCode] MS
* code.coding[snomedBPCode] insert obligationServer (0, SHALL:process)
* code.coding[snomedBPCode] insert obligationApp (1, SHALL:populate)
* code.text MS
* code.text insert obligationApp (1, SHALL:populate)
* subject MS
* subject insert obligation2Server (2, SHALL:populate, SHALL:process)
* subject insert obligationApp (3, SHALL:populate)
* effectiveDateTime MS
* effectiveDateTime insert obligation2Server (2, SHALL:populate-if-known, SHALL:process)
* effectiveDateTime insert obligation2App (3, SHALL:populate-if-known, SHALL:process)
* component[SystolicBP] MS
* component[SystolicBP] insert obligation2Server (2, SHALL:populate-if-known, SHALL:process)
* component[SystolicBP] insert obligation2App (3, SHALL:populate, SHALL:process)
* component[DiastolicBP] MS
* component[DiastolicBP] insert obligation2Server (2, SHALL:populate-if-known, SHALL:process)
* component[DiastolicBP] insert obligation2App (3, SHALL:populate-if-known, SHALL:process)

Profile: SmartHealthChecksSmokingStatus
Parent: $au-core-smokingstatus
Id: SHCSmokingStatus
Title: "Smart Health Checks Smoking Status"
Description: "This profile sets the minimum expectations for a Smoking Status resource to record, search and save smoking status information when used within Smart Health Checks."

* status MS
* status insert obligation2Server (3, SHALL:populate, SHALL:process)
* status insert obligation2App (4, SHALL:populate, SHALL:process)
* category[socialHistory] MS
* category[socialHistory] insert obligationServer (0, SHALL:process)
* category[socialHistory] insert obligationApp (1, SHALL:populate)
* code.coding MS
* code.coding insert obligationServer (0, SHALL:process)
* code.coding insert obligationApp (1, SHALL:populate)
* code.coding[loincSmokingStatus] MS
* code.coding[loincSmokingStatus] insert obligation2Server (0, SHALL:populate, SHALL:process)
* code.coding[loincSmokingStatus] insert obligation2App (1, SHALL:populate, SHALL:process)
* code.text MS
* code.text insert obligationApp (1, SHALL:populate)
* subject MS
* subject insert obligation2Server (2, SHALL:populate, SHALL:process)
* subject insert obligationApp (3, SHALL:populate)
* effectiveDateTime MS
* effectiveDateTime insert obligation2Server (2, SHALL:populate-if-known, SHALL:process)
* effectiveDateTime insert obligation2App (3, SHALL:populate-if-known, SHALL:process)
* valueCodeableConcept.coding MS
* valueCodeableConcept.coding insert obligation2Server (0, SHALL:populate-if-known, SHALL:process)
* valueCodeableConcept.coding insert obligation2App (1, SHALL:populate, SHALL:process)

Profile: SmartHealthChecksBodyHeight
Parent: $au-core-bodyheight
Id: SHCBodyHeight
Title: "Smart Health Checks Body Height"
Description: "This profile sets the minimum expectations for a Body Height resource to record, search and save body height information when used within Smart Health Checks."

* status MS
* status insert obligation2Server (3, SHALL:populate, SHALL:process)
* status insert obligation2App (4, SHALL:populate, SHALL:process)
* category[VSCat] MS
* category[VSCat] insert obligationServer (2, SHALL:process)
* category[VSCat] insert obligationApp (3, SHALL:populate)
* code.coding[BodyHeightCode] MS
* code.coding[BodyHeightCode] insert obligation2Server (0, SHALL:populate, SHALL:process)
* code.coding[BodyHeightCode] insert obligation2App (1, SHALL:populate, SHALL:process)
* code.coding[snomedBodyHeightCode] MS
* code.coding[snomedBodyHeightCode] insert obligationServer (0, SHALL:process)
* code.coding[snomedBodyHeightCode] insert obligationApp (1, SHALL:populate)
* code.text MS
* code.text insert obligationApp (1, SHALL:populate)
* subject MS
* subject insert obligation2Server (2, SHALL:populate, SHALL:process)
* subject insert obligationApp (3, SHALL:populate)
* effectiveDateTime MS
* effectiveDateTime insert obligation2Server (2, SHALL:populate-if-known, SHALL:process)
* effectiveDateTime insert obligation2App (3, SHALL:populate-if-known, SHALL:process)
* valueQuantity.value MS
* valueQuantity.value insert obligation2Server (2, SHALL:populate-if-known, SHALL:process)
* valueQuantity.value insert obligation2App (3, SHALL:populate, SHALL:process)
* valueQuantity.unit MS
* valueQuantity.unit insert obligation2Server (2, SHALL:populate-if-known, SHALL:process)
* valueQuantity.unit insert obligation2App (3, SHALL:populate, SHALL:process)
* valueQuantity.system MS
* valueQuantity.system insert obligation2Server (2, SHALL:populate-if-known, SHALL:process)
* valueQuantity.system insert obligation2App (3, SHALL:populate, SHALL:process)
* valueQuantity.code MS
* valueQuantity.code insert obligation2Server (2, SHALL:populate-if-known, SHALL:process)
* valueQuantity.code insert obligation2App (3, SHALL:populate, SHALL:process)

Profile: SmartHealthChecksBodyWeight
Parent: $au-core-bodyweight 
Id: SHCBodyWeight
Title: "Smart Health Checks Body Weight"
Description: "This profile sets the minimum expectations for a Body Weight resource to record, search and save body weight information when used within Smart Health Checks."

* status MS
* status insert obligation2Server (3, SHALL:populate, SHALL:process)
* status insert obligation2App (4, SHALL:populate, SHALL:process)
* category[VSCat] MS
* category[VSCat] insert obligationServer (2, SHALL:process)
* category[VSCat] insert obligationApp (3, SHALL:populate)
* code.coding[BodyWeightCode] MS
* code.coding[BodyWeightCode] insert obligation2Server (0, SHALL:populate, SHALL:process)
* code.coding[BodyWeightCode] insert obligation2App (1, SHALL:populate, SHALL:process)
* code.coding[snomedBodyWeightCode] MS
* code.coding[snomedBodyWeightCode] insert obligationServer (0, SHALL:process)
* code.coding[snomedBodyWeightCode] insert obligationApp (1, SHALL:populate)
* code.text MS
* code.text insert obligationApp (1, SHALL:populate)
* subject MS
* subject insert obligation2Server (2, SHALL:populate, SHALL:process)
* subject insert obligationApp (3, SHALL:populate)
* effectiveDateTime MS
* effectiveDateTime insert obligation2Server (2, SHALL:populate-if-known, SHALL:process)
* effectiveDateTime insert obligation2App (3, SHALL:populate-if-known, SHALL:process)
* valueQuantity.value MS
* valueQuantity.value insert obligation2Server (2, SHALL:populate-if-known, SHALL:process)
* valueQuantity.value insert obligation2App (3, SHALL:populate, SHALL:process)
* valueQuantity.unit MS
* valueQuantity.unit insert obligation2Server (2, SHALL:populate-if-known, SHALL:process)
* valueQuantity.unit insert obligation2App (3, SHALL:populate, SHALL:process)
* valueQuantity.system MS
* valueQuantity.system insert obligation2Server (2, SHALL:populate-if-known, SHALL:process)
* valueQuantity.system insert obligation2App (3, SHALL:populate, SHALL:process)
* valueQuantity.code MS
* valueQuantity.code insert obligation2Server (2, SHALL:populate-if-known, SHALL:process)
* valueQuantity.code insert obligation2App (3, SHALL:populate, SHALL:process)

Profile: SmartHealthChecksHeadCircumference 
Parent: $au-core-headcircum
Id: SHCHeadCircumference
Title: "Smart Health Checks Head Circumference"
Description: "This profile sets the minimum expectations for a Head Circumference resource to record, search and save head circumference information when used within Smart Health Checks."

* status MS
* status insert obligation2Server (1, SHALL:populate, SHALL:process)
* status insert obligation2App (2, SHALL:populate, SHALL:process)
* category[VSCat] MS
* category[VSCat] insert obligationServer (0, SHALL:process)
* category[VSCat] insert obligationApp (1, SHALL:populate)
* code.coding[HeadCircumCode] MS
* code.coding[HeadCircumCode] insert obligation2Server (0, SHALL:populate, SHALL:process)
* code.coding[HeadCircumCode] insert obligation2App (1, SHALL:populate, SHALL:process)
* code.coding[snomedHeadCircumCode] MS
* code.coding[snomedHeadCircumCode] insert obligationServer (0, SHALL:process)
* code.coding[snomedHeadCircumCode] insert obligationApp (1, SHALL:populate)
* code.text MS
* code.text insert obligationApp (1, SHALL:populate)
* subject MS
* subject insert obligation2Server (0, SHALL:populate, SHALL:process)
* subject insert obligationApp (1, SHALL:populate)
* effectiveDateTime MS
* effectiveDateTime insert obligation2Server (0, SHALL:populate-if-known, SHALL:process)
* effectiveDateTime insert obligation2App (1, SHALL:populate-if-known, SHALL:process)
* valueQuantity.value MS
* valueQuantity.value insert obligation2Server (0, SHALL:populate-if-known, SHALL:process)
* valueQuantity.value insert obligation2App (1, SHALL:populate, SHALL:process)
* valueQuantity.unit MS
* valueQuantity.unit insert obligation2Server (1, SHALL:populate-if-known, SHALL:process)
* valueQuantity.unit insert obligation2App (2, SHALL:populate, SHALL:process)
* valueQuantity.system MS
* valueQuantity.system insert obligation2Server (0, SHALL:populate-if-known, SHALL:process)
* valueQuantity.system insert obligation2App (1, SHALL:populate, SHALL:process)
* valueQuantity.code MS
* valueQuantity.code insert obligation2Server (0, SHALL:populate-if-known, SHALL:process)
* valueQuantity.code insert obligation2App (1, SHALL:populate, SHALL:process)

Profile: SmartHealthChecksWaistCircumference
Parent: $au-core-waistcircum
Id: SHCWaistCircumference
Title: "Smart Health Checks Waist Circumference"
Description: "This profile sets the minimum expectations for a Waist Circumference resource to record, search and save waist circumference information when used within Smart Health Checks."

* status MS
* status insert obligation2Server (3, SHALL:populate, SHALL:process)
* status insert obligation2App (4, SHALL:populate, SHALL:process)
* category[VSCat] MS
* category[VSCat] insert obligationServer (2, SHALL:process)
* category[VSCat] insert obligationApp (3, SHALL:populate)
* code.coding[loincWaistCircumCode] MS
* code.coding[loincWaistCircumCode] insert obligation2Server (0, SHALL:populate, SHALL:process)
* code.coding[loincWaistCircumCode] insert obligation2App (1, SHALL:populate, SHALL:process)
* code.coding[snomedWaistCircumCode] MS
* code.coding[snomedWaistCircumCode] insert obligationServer (0, SHALL:process)
* code.coding[snomedWaistCircumCode] insert obligationApp (1, SHALL:populate)
* code.text MS
* code.text insert obligationApp (1, SHALL:populate)
* subject MS
* subject insert obligation2Server (2, SHALL:populate, SHALL:process)
* subject insert obligationApp (3, SHALL:populate)
* effectiveDateTime MS
* effectiveDateTime insert obligation2Server (2, SHALL:populate-if-known, SHALL:process)
* effectiveDateTime insert obligation2App (3, SHALL:populate-if-known, SHALL:process)
* valueQuantity.value MS
* valueQuantity.value insert obligation2Server (0, SHALL:populate-if-known, SHALL:process)
* valueQuantity.value insert obligation2App (1, SHALL:populate, SHALL:process)
* valueQuantity.unit MS
* valueQuantity.unit insert obligation2Server (1, SHALL:populate-if-known, SHALL:process)
* valueQuantity.unit insert obligation2App (2, SHALL:populate, SHALL:process)
* valueQuantity.system MS
* valueQuantity.system insert obligation2Server (0, SHALL:populate-if-known, SHALL:process)
* valueQuantity.system insert obligation2App (1, SHALL:populate, SHALL:process)
* valueQuantity.code MS
* valueQuantity.code insert obligation2Server (0, SHALL:populate-if-known, SHALL:process)
* valueQuantity.code insert obligation2App (1, SHALL:populate, SHALL:process)

Profile: SmartHealthChecksHeartRate
Parent: $au-core-heartrate
Id: SHCHeartRate
Title: "Smart Health Checks Heart Rate"
Description: "This profile sets the minimum expectations for a Heart Rate resource to record, search and save heart rate information when used within Smart Health Checks."

* status MS
* status insert obligation2Server (3, SHALL:populate, SHALL:process)
* status insert obligation2App (4, SHALL:populate, SHALL:process)
* category[VSCat] MS
* category[VSCat] insert obligationServer (2, SHALL:process)
* category[VSCat] insert obligationApp (3, SHALL:populate)
* code.coding[HeartRateCode] MS
* code.coding[HeartRateCode] insert obligation2Server (0, SHALL:populate, SHALL:process)
* code.coding[HeartRateCode] insert obligation2App (1, SHALL:populate, SHALL:process)
* code.coding[snomedHeartRateCode] MS
* code.coding[snomedHeartRateCode] insert obligationServer (0, SHALL:process)
* code.coding[snomedHeartRateCode] insert obligationApp (1, SHALL:populate)
* code.text MS
* code.text insert obligationApp (1, SHALL:populate)
* subject MS
* subject insert obligation2Server (2, SHALL:populate, SHALL:process)
* subject insert obligationApp (3, SHALL:populate)
* effectiveDateTime MS
* effectiveDateTime insert obligation2Server (2, SHALL:populate-if-known, SHALL:process)
* effectiveDateTime insert obligation2App (3, SHALL:populate-if-known, SHALL:process)
* valueQuantity.value MS
* valueQuantity.value insert obligation2Server (2, SHALL:populate-if-known, SHALL:process)
* valueQuantity.value insert obligation2App (3, SHALL:populate, SHALL:process)
* valueQuantity.unit MS
* valueQuantity.unit insert obligation2Server (2, SHALL:populate-if-known, SHALL:process)
* valueQuantity.unit insert obligation2App (3, SHALL:populate, SHALL:process)
* valueQuantity.system MS
* valueQuantity.system insert obligation2Server (2, SHALL:populate-if-known, SHALL:process)
* valueQuantity.system insert obligation2App (3, SHALL:populate, SHALL:process)
* valueQuantity.code MS
* valueQuantity.code insert obligation2Server (2, SHALL:populate-if-known, SHALL:process)
* valueQuantity.code insert obligation2App (3, SHALL:populate, SHALL:process)
