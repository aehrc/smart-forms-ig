
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

Profile: SmartHealthChecksAllergyIntolerance
Parent: $au-core-allergyintolerance
Id: SHCAllergyIntolerance
Title: "Smart Health Checks AllergyIntolerance"
Description: "This profile sets the minimum expectations for an AllergyIntolerance resource to record, search and save allergy or intolerance information when used within Smart Health Checks."

* id MS
* id insert obligationServer (0, SHALL:populate)
* id insert obligationApp (1, SHALL:process)
* patient MS
* patient insert obligation2Server (2, SHALL:populate, SHALL:persist)
* patient insert obligationApp (3, SHALL:populate)
* clinicalStatus MS 
* clinicalStatus insert obligation2Server (2, SHALL:populate, SHALL:persist)
* clinicalStatus insert obligation2App (3, SHALL:populate-if-known, SHALL:process)
* verificationStatus MS
* verificationStatus insert obligationServer (2, SHALL:populate-if-known)
* verificationStatus insert obligationApp (3, SHALL:process)
* code MS
* code insert obligation2Server (2, SHALL:populate-if-known, SHALL:persist)
* code insert obligation2App (3, SHALL:populate-if-known, SHALL:process)
* note ..1 MS
* note.text MS
* note.text insert obligation2Server (0, SHALL:populate-if-known, SHALL:persist)
* note.text insert obligation2App (1, SHALL:populate-if-known, SHALL:process)
* reaction.manifestation MS
* reaction.manifestation insert obligation2Server (2, SHALL:populate-if-known, SHALL:persist)
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
* clinicalStatus insert obligation2Server (2, SHALL:populate-if-known, SHALL:persist)
* clinicalStatus insert obligation2App (3, SHALL:populate, SHALL:process)
* verificationStatus MS
* verificationStatus insert obligationServer (2, SHALL:populate-if-known)
* verificationStatus insert obligationApp (3, SHALL:process)
* category MS
* category insert obligation2Server (2, SHALL:populate, SHALL:persist)
* category insert obligationApp (3, SHALL:populate)
* code MS
* code insert obligation2Server (2, SHALL:populate-if-known, SHALL:persist)
* code insert obligation2App (3, SHALL:populate-if-known, SHALL:process)
* subject MS
* subject insert obligation2Server (2, SHALL:populate, SHALL:persist)
* subject insert obligationApp (3, SHALL:populate)
* onsetDateTime MS
* onsetDateTime insert obligation2Server (2, SHALL:populate-if-known, SHALL:persist)
* onsetDateTime insert obligation2App (3, SHALL:populate-if-known, SHALL:process)
* abatementDateTime MS
* abatementDateTime insert obligation2Server (2, SHALL:populate-if-known, SHALL:persist)
* abatementDateTime insert obligationApp (3, SHALL:process)
* note.text MS
* note.text insert obligationServer (0, SHALL:persist)
* note.text insert obligationApp (1, SHALL:populate-if-known)

Profile: SmartHealthChecksImmunization
Parent: $au-core-immunization
Id: SHCImmunization
Title: "Smart Health Checks Immunization"
Description: "This profile sets the minimum expectations for an Immunization resource to record, search and save immunization information when used within Smart Health Checks."

* status MS
* status insert obligation2Server (2, SHALL:populate, SHALL:persist)
* status insert obligationApp (3, SHALL:populate)
* vaccineCode MS
* vaccineCode insert obligation2Server (2, SHALL:populate-if-known, SHALL:persist)
* vaccineCode insert obligation2App (3, SHALL:populate-if-known, SHALL:process)
* vaccineCode.coding[amtVaccineCode] MS
* vaccineCode.coding[amtVaccineCode] insert obligation2Server (2, SHALL:populate-if-known, SHALL:persist)
* vaccineCode.coding[amtVaccineCode] insert obligation2App (3, SHALL:populate-if-known, SHALL:process)
* patient MS
* patient insert obligation2Server (2, SHALL:populate, SHALL:persist)
* patient insert obligationApp (3, SHALL:populate)
* occurrenceDateTime MS
* occurrenceDateTime insert obligation2Server (2, SHALL:populate-if-known, SHALL:persist)
* occurrenceDateTime insert obligation2App (3, SHALL:populate-if-known, SHALL:process)
* lotNumber MS
* lotNumber insert obligation2Server (0, SHALL:populate-if-known, SHALL:persist)
* lotNumber insert obligation2App (1, SHALL:populate-if-known, SHALL:process)
* note.text MS
* note.text insert obligation2Server (0, SHALL:populate-if-known, SHALL:persist)
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
* status insert obligation2Server (2, SHALL:populate, SHALL:persist)
* status insert obligationApp (3, SHALL:populate)
* medication[x][medicationCodeableConcept] MS
* medication[x][medicationCodeableConcept] insert obligation2Server (0, SHALL:populate-if-known, SHALL:persist) // NOTE: When migrating to AU Core v2.0.0, update the extension array index from (0) to (2) for medication[x][medicationCodeableConcept]
* medication[x][medicationCodeableConcept] insert obligation2App (1, SHALL:populate-if-known, SHALL:process) // When upgrading to AU Core v2.0.0, update the extension array index from (1) to (3) for medication[x][medicationCodeableConcept] to match the new element order.
* medication[x][medicationReference] MS
* medication[x][medicationReference] only Reference(SHCMedication)
* medication[x][medicationReference] insert obligationServer (2, SHALL:populate-if-known)
* medication[x][medicationReference] insert obligationApp (3, SHALL:process)
* subject MS
* subject insert obligation2Server (2, SHALL:populate, SHALL:persist)
* subject insert obligationApp (3, SHALL:populate)
* dateAsserted MS
* dateAsserted insert obligationServer (2, SHALL:persist)
* dateAsserted insert obligationApp (3, SHALL:populate)
* reasonCode MS
* reasonCode insert obligation2Server (2, SHALL:populate-if-known, SHALL:persist)
* reasonCode insert obligation2App (3, SHALL:populate-if-known, SHALL:process)
* note ..1 MS
* note.text MS
* note.text insert obligation2Server (0, SHALL:populate-if-known, SHALL:persist)
* note.text insert obligation2App (1, SHALL:populate-if-known, SHALL:process)
* dosage ..1 MS
* dosage.text MS
* dosage.text insert obligation2Server (0, SHALL:populate-if-known, SHALL:persist)
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
* subject MS
* subject insert obligationServer (2, SHALL:populate)
* effectiveDateTime MS
* effectiveDateTime insert obligationServer (2, SHALL:populate-if-known)
* effectiveDateTime insert obligationApp (3, SHALL:process)
* valueQuantity MS
* valueQuantity insert obligationServer (0, SHALL:populate-if-known)
* valueQuantity insert obligationApp (1, SHALL:process)
* valueQuantity.value MS
* valueQuantity.value insert obligationServer (0, SHALL:populate-if-known)
* valueQuantity.value insert obligationApp (1, SHALL:process)
* valueQuantity.system MS
* valueQuantity.system insert obligationServer (0, SHALL:populate-if-known)
* valueQuantity.system insert obligationApp (1, SHALL:process)
* valueQuantity.code MS
* valueQuantity.code insert obligationServer (0, SHALL:populate-if-known)
* valueQuantity.code insert obligationApp (1, SHALL:process)


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
* address insert obligationServer (2, SHALL:populate-if-known)
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
* id insert obligation2App (1, SHALL:populate-if-known, SHALL:process)
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
* subject only Reference(Patient)
* encounter MS
* encounter insert obligation2Server (0, SHALL:populate-if-known, SHALL:persist)
* encounter insert obligation2App (1, SHALL:populate-if-known, SHALL:process)
* authored MS
* authored insert obligation2Server (0, SHALL:populate, SHALL:persist)
* authored insert obligation2App (1, SHALL:populate, SHALL:process)
* author 1.. MS
* author insert obligation2Server (0, SHALL:populate-if-known, SHALL:persist)
* author insert obligation2App (1, SHALL:populate, SHALL:process)
* author only Reference(Practitioner)
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
* status insert obligation2Server (1, SHALL:populate, SHALL:persist)
* status insert obligation2App (2, SHALL:populate, SHALL:process)
* category ^slicing.discriminator[0].type = #value
* category ^slicing.discriminator[=].path = "coding.code"
* category ^slicing.discriminator[+].type = #value
* category ^slicing.discriminator[=].path = "coding.system"
* category ^slicing.ordered = false
* category ^slicing.rules = #open
* category contains vitalSignsCategory 1..1 
* category[vitalSignsCategory].coding 1..*
* category[vitalSignsCategory].coding only Coding
* category[vitalSignsCategory].coding.system 1..1
* category[vitalSignsCategory].coding.system only uri
* category[vitalSignsCategory].coding.system = "http://terminology.hl7.org/CodeSystem/observation-category" (exactly)
* category[vitalSignsCategory].coding.code 1..1
* category[vitalSignsCategory].coding.code only code
* category[vitalSignsCategory].coding.code = #vital-signs (exactly)
/*
* category[vitalSignsCategory] = http://terminology.hl7.org/CodeSystem/observation-category#vital-signs (exactly) 
* category[vitalSignsCategory] insert obligationServer (0, SHALL:persist)
* category[vitalSignsCategory] insert obligationApp (1, SHALL:populate)
*/
* code
* code ^short = "Heart Rhythm"
* code ^definition = "Heart Rhythm."
* code.coding
* code.coding ^slicing.discriminator[0].type = #value
* code.coding ^slicing.discriminator[=].path = "code"
* code.coding ^slicing.discriminator[+].type = #value
* code.coding ^slicing.discriminator[=].path = "system"
* code.coding ^slicing.ordered = false
* code.coding ^slicing.rules = #open
* code.coding contains loincHeartRhythmCode 1..1 MS and snomedHeartRhythmCode 1..1 MS
* code.coding[loincHeartRhythmCode] insert obligationServer (0, SHALL:persist)
* code.coding[loincHeartRhythmCode] insert obligationApp (1, SHALL:populate)
* code.coding[loincHeartRhythmCode].system 1..1
* code.coding[loincHeartRhythmCode].system = "http://loinc.org" (exactly)
* code.coding[loincHeartRhythmCode].code 1..1
* code.coding[loincHeartRhythmCode].code = #8884-9 (exactly)
* code.coding[snomedHeartRhythmCode] insert obligation2Server (0, SHALL:populate, SHALL:persist)
* code.coding[snomedHeartRhythmCode] insert obligation2App (1, SHALL:populate, SHALL:process)
* code.coding[snomedHeartRhythmCode].system 1..1
* code.coding[snomedHeartRhythmCode].system = "http://snomed.info/sct" (exactly)
* code.coding[snomedHeartRhythmCode].code 1..1
* code.coding[snomedHeartRhythmCode].code = #364074009 (exactly)
* code.text MS
* code.text insert obligationApp (1, SHALL:populate)
* subject 1.. MS
* subject only Reference($au-core-patient)
* subject insert obligation2Server (0, SHALL:populate, SHALL:persist)
* subject insert obligationApp (1, SHALL:populate)
* effective[x] 1..
* effective[x] only dateTime
* effective[x] obeys shc-heartrhythm-02
* effective[x] ^short = "Date, and optionally time, the observation was performed"
* effective[x] ^definition = "Date, and optionally time, the observation was performed."
* effective[x] ^condition = "shc-heartrhythm-02"
* effectiveDateTime MS
* effectiveDateTime insert obligation2Server (0, SHALL:populate, SHALL:persist)
* effectiveDateTime insert obligation2App (1, SHALL:populate-if-known, SHALL:process)
* value[x] only CodeableConcept
* value[x] from HeartRhythm (extensible)
* value[x] ^condition = "shc-heartrhythm-01"
* valueCodeableConcept.coding MS
* valueCodeableConcept.coding insert obligation2Server (0, SHALL:populate-if-known, SHALL:persist)
* valueCodeableConcept.coding insert obligation2App (1, SHALL:populate, SHALL:process)
* dataAbsentReason ^condition = "shc-heartrhythm-01"

Profile: SmartHealthChecksBloodPressure
Parent: $au-core-bloodpressure
Id: SHCBloodPressure
Title: "Smart Health Checks Blood Pressure"
Description: "This profile sets the minimum expectations for a Blood Pressure resource to record, search and save blood pressure information when used within Smart Health Checks."

* status MS
* status insert obligation2Server (3, SHALL:populate, SHALL:persist)
* status insert obligation2App (4, SHALL:populate, SHALL:process)
* category[VSCat] MS
* category[VSCat] insert obligationServer (2, SHALL:persist)
* category[VSCat] insert obligationApp (3, SHALL:populate)
* code.coding[BPCode] MS
* code.coding[BPCode] insert obligation2Server (0, SHALL:populate, SHALL:persist)
* code.coding[BPCode] insert obligation2App (1, SHALL:populate, SHALL:process)
* code.coding[snomedBPCode] MS
* code.coding[snomedBPCode] insert obligationServer (0, SHALL:persist)
* code.coding[snomedBPCode] insert obligationApp (1, SHALL:populate)
* code.text MS
* code.text insert obligationApp (1, SHALL:populate)
* subject MS
* subject insert obligation2Server (2, SHALL:populate, SHALL:persist)
* subject insert obligationApp (3, SHALL:populate)
* effectiveDateTime MS
* effectiveDateTime insert obligation2Server (2, SHALL:populate, SHALL:persist)
* effectiveDateTime insert obligation2App (3, SHALL:populate-if-known, SHALL:process)
* component[SystolicBP] MS
* component[SystolicBP] insert obligation2Server (2, SHALL:populate-if-known, SHALL:persist)
* component[SystolicBP] insert obligation2App (3, SHALL:populate, SHALL:process)
* component[SystolicBP].code MS
* component[SystolicBP].code insert obligation2Server (2, SHALL:populate-if-known, SHALL:persist)
* component[SystolicBP].code insert obligation2App (3, SHALL:populate, SHALL:process)
* component[SystolicBP].valueQuantity MS
* component[SystolicBP].valueQuantity insert obligation2Server (2, SHALL:populate-if-known, SHALL:persist)
* component[SystolicBP].valueQuantity insert obligation2App (3, SHALL:populate, SHALL:process)
* component[SystolicBP].valueQuantity.value MS
* component[SystolicBP].valueQuantity.value insert obligation2Server (2, SHALL:populate-if-known, SHALL:persist)
* component[SystolicBP].valueQuantity.value insert obligation2App (3, SHALL:populate, SHALL:process)
* component[SystolicBP].valueQuantity.unit MS
* component[SystolicBP].valueQuantity.unit insert obligation2Server (3, SHALL:populate-if-known, SHALL:persist)
* component[SystolicBP].valueQuantity.unit insert obligationApp (4, SHALL:populate)
* component[SystolicBP].valueQuantity.system MS
* component[SystolicBP].valueQuantity.system insert obligation2Server (2, SHALL:populate-if-known, SHALL:persist)
* component[SystolicBP].valueQuantity.system insert obligation2App (3, SHALL:populate, SHALL:process)
* component[SystolicBP].valueQuantity.code MS
* component[SystolicBP].valueQuantity.code insert obligation2Server (2, SHALL:populate-if-known, SHALL:persist)
* component[SystolicBP].valueQuantity.code insert obligation2App (3, SHALL:populate, SHALL:process)
* component[DiastolicBP].valueQuantity MS
* component[DiastolicBP].valueQuantity insert obligation2Server (2, SHALL:populate-if-known, SHALL:persist)
* component[DiastolicBP].valueQuantity insert obligation2App (3, SHALL:populate, SHALL:process)
* component[DiastolicBP].valueQuantity.value MS
* component[DiastolicBP].valueQuantity.value insert obligation2Server (2, SHALL:populate-if-known, SHALL:persist)
* component[DiastolicBP].valueQuantity.value insert obligation2App (3, SHALL:populate, SHALL:process)
* component[DiastolicBP].valueQuantity.unit MS
* component[DiastolicBP].valueQuantity.unit insert obligation2Server (3, SHALL:populate-if-known, SHALL:persist)
* component[DiastolicBP].valueQuantity.unit insert obligationApp (4, SHALL:populate)
* component[DiastolicBP].valueQuantity.system MS
* component[DiastolicBP].valueQuantity.system insert obligation2Server (2, SHALL:populate-if-known, SHALL:persist)
* component[DiastolicBP].valueQuantity.system insert obligation2App (3, SHALL:populate, SHALL:process)
* component[DiastolicBP].valueQuantity.code MS
* component[DiastolicBP].valueQuantity.code insert obligation2Server (2, SHALL:populate-if-known, SHALL:persist)
* component[DiastolicBP].valueQuantity.code insert obligation2App (3, SHALL:populate, SHALL:process)


Profile: SmartHealthChecksSmokingStatus
Parent: $au-core-smokingstatus
Id: SHCSmokingStatus
Title: "Smart Health Checks Smoking Status"
Description: "This profile sets the minimum expectations for a Smoking Status resource to record, search and save smoking status information when used within Smart Health Checks."

* status MS
* status insert obligation2Server (3, SHALL:populate, SHALL:persist)
* status insert obligation2App (4, SHALL:populate, SHALL:process)
* category[socialHistory] MS
* category[socialHistory] insert obligationServer (0, SHALL:persist)
* category[socialHistory] insert obligationApp (1, SHALL:populate)
* code.coding MS
* code.coding insert obligationServer (0, SHALL:persist)
* code.coding insert obligationApp (1, SHALL:populate)
* code.coding[loincSmokingStatus] MS
* code.coding[loincSmokingStatus] insert obligation2Server (0, SHALL:populate, SHALL:persist)
* code.coding[loincSmokingStatus] insert obligation2App (1, SHALL:populate, SHALL:process)
* code.text MS
* code.text insert obligationApp (1, SHALL:populate)
* subject MS
* subject insert obligation2Server (2, SHALL:populate, SHALL:persist)
* subject insert obligationApp (3, SHALL:populate)
* effectiveDateTime MS
* effectiveDateTime insert obligation2Server (2, SHALL:populate, SHALL:persist)
* effectiveDateTime insert obligation2App (3, SHALL:populate-if-known, SHALL:process)
* valueCodeableConcept.coding MS
* valueCodeableConcept.coding insert obligation2Server (0, SHALL:populate-if-known, SHALL:persist)
* valueCodeableConcept.coding insert obligation2App (1, SHALL:populate, SHALL:process)

Profile: SmartHealthChecksBodyHeight
Parent: $au-core-bodyheight
Id: SHCBodyHeight
Title: "Smart Health Checks Body Height"
Description: "This profile sets the minimum expectations for a Body Height resource to record, search and save body height information when used within Smart Health Checks."

* status MS
* status insert obligation2Server (3, SHALL:populate, SHALL:persist)
* status insert obligation2App (4, SHALL:populate, SHALL:process)
* category[VSCat] MS
* category[VSCat] insert obligationServer (2, SHALL:persist)
* category[VSCat] insert obligationApp (3, SHALL:populate)
* code.coding[BodyHeightCode] MS
* code.coding[BodyHeightCode] insert obligation2Server (0, SHALL:populate, SHALL:persist)
* code.coding[BodyHeightCode] insert obligation2App (1, SHALL:populate, SHALL:process)
* code.coding[snomedBodyHeightCode] MS
* code.coding[snomedBodyHeightCode] insert obligationServer (0, SHALL:persist)
* code.coding[snomedBodyHeightCode] insert obligationApp (1, SHALL:populate)
* code.text MS
* code.text insert obligationApp (1, SHALL:populate)
* subject MS
* subject insert obligation2Server (2, SHALL:populate, SHALL:persist)
* subject insert obligationApp (3, SHALL:populate)
* effectiveDateTime MS
* effectiveDateTime insert obligation2Server (2, SHALL:populate, SHALL:persist)
* effectiveDateTime insert obligation2App (3, SHALL:populate-if-known, SHALL:process)
* valueQuantity MS
* valueQuantity insert obligation2Server (2, SHALL:populate-if-known, SHALL:persist)
* valueQuantity insert obligation2App (3, SHALL:populate, SHALL:process)
* valueQuantity.value MS
* valueQuantity.value insert obligation2Server (2, SHALL:populate-if-known, SHALL:persist)
* valueQuantity.value insert obligation2App (3, SHALL:populate, SHALL:process)
* valueQuantity.unit MS
* valueQuantity.unit insert obligation2Server (2, SHALL:populate-if-known, SHALL:persist)
* valueQuantity.unit insert obligationApp (3, SHALL:populate)
* valueQuantity.system MS
* valueQuantity.system insert obligation2Server (2, SHALL:populate-if-known, SHALL:persist)
* valueQuantity.system insert obligation2App (3, SHALL:populate, SHALL:process)
* valueQuantity.code MS
* valueQuantity.code insert obligation2Server (2, SHALL:populate-if-known, SHALL:persist)
* valueQuantity.code insert obligation2App (3, SHALL:populate, SHALL:process)

Profile: SmartHealthChecksBodyWeight
Parent: $au-core-bodyweight 
Id: SHCBodyWeight
Title: "Smart Health Checks Body Weight"
Description: "This profile sets the minimum expectations for a Body Weight resource to record, search and save body weight information when used within Smart Health Checks."

* status MS
* status insert obligation2Server (3, SHALL:populate, SHALL:persist)
* status insert obligation2App (4, SHALL:populate, SHALL:process)
* category[VSCat] MS
* category[VSCat] insert obligationServer (2, SHALL:persist)
* category[VSCat] insert obligationApp (3, SHALL:populate)
* code.coding[BodyWeightCode] MS
* code.coding[BodyWeightCode] insert obligation2Server (0, SHALL:populate, SHALL:persist)
* code.coding[BodyWeightCode] insert obligation2App (1, SHALL:populate, SHALL:process)
* code.coding[snomedBodyWeightCode] MS
* code.coding[snomedBodyWeightCode] insert obligationServer (0, SHALL:persist)
* code.coding[snomedBodyWeightCode] insert obligationApp (1, SHALL:populate)
* code.text MS
* code.text insert obligationApp (1, SHALL:populate)
* subject MS
* subject insert obligation2Server (2, SHALL:populate, SHALL:persist)
* subject insert obligationApp (3, SHALL:populate)
* effectiveDateTime MS
* effectiveDateTime insert obligation2Server (2, SHALL:populate, SHALL:persist)
* effectiveDateTime insert obligation2App (3, SHALL:populate-if-known, SHALL:process)
* valueQuantity MS
* valueQuantity insert obligation2Server (2, SHALL:populate-if-known, SHALL:persist)
* valueQuantity insert obligation2App (3, SHALL:populate, SHALL:process)
* valueQuantity.value MS
* valueQuantity.value insert obligation2Server (2, SHALL:populate-if-known, SHALL:persist)
* valueQuantity.value insert obligation2App (3, SHALL:populate, SHALL:process)
* valueQuantity.unit MS
* valueQuantity.unit insert obligation2Server (2, SHALL:populate-if-known, SHALL:persist)
* valueQuantity.unit insert obligationApp (3, SHALL:populate)
* valueQuantity.system MS
* valueQuantity.system insert obligation2Server (2, SHALL:populate-if-known, SHALL:persist)
* valueQuantity.system insert obligation2App (3, SHALL:populate, SHALL:process)
* valueQuantity.code MS
* valueQuantity.code insert obligation2Server (2, SHALL:populate-if-known, SHALL:persist)
* valueQuantity.code insert obligation2App (3, SHALL:populate, SHALL:process)

Profile: SmartHealthChecksHeadCircumference 
Parent: $au-core-headcircum
Id: SHCHeadCircumference
Title: "Smart Health Checks Head Circumference"
Description: "This profile sets the minimum expectations for a Head Circumference resource to record, search and save head circumference information when used within Smart Health Checks."

* status MS
* status insert obligation2Server (1, SHALL:populate, SHALL:persist)
* status insert obligation2App (2, SHALL:populate, SHALL:process)
* category[VSCat] MS
* category[VSCat] insert obligationServer (0, SHALL:persist)
* category[VSCat] insert obligationApp (1, SHALL:populate)
* code.coding[HeadCircumCode] MS
* code.coding[HeadCircumCode] insert obligation2Server (0, SHALL:populate, SHALL:persist)
* code.coding[HeadCircumCode] insert obligation2App (1, SHALL:populate, SHALL:process)
* code.coding[snomedHeadCircumCode] MS
* code.coding[snomedHeadCircumCode] insert obligationServer (0, SHALL:persist)
* code.coding[snomedHeadCircumCode] insert obligationApp (1, SHALL:populate)
* code.text MS
* code.text insert obligationApp (1, SHALL:populate)
* subject MS
* subject insert obligation2Server (0, SHALL:populate, SHALL:persist)
* subject insert obligationApp (1, SHALL:populate)
* effectiveDateTime MS
* effectiveDateTime insert obligation2Server (0, SHALL:populate, SHALL:persist)
* effectiveDateTime insert obligation2App (1, SHALL:populate-if-known, SHALL:process)
* valueQuantity MS
* valueQuantity insert obligation2Server (0, SHALL:populate-if-known, SHALL:persist)
* valueQuantity insert obligation2App (1, SHALL:populate, SHALL:process)
* valueQuantity.value MS
* valueQuantity.value insert obligation2Server (0, SHALL:populate-if-known, SHALL:persist)
* valueQuantity.value insert obligation2App (1, SHALL:populate, SHALL:process)
* valueQuantity.unit MS
* valueQuantity.unit insert obligation2Server (1, SHALL:populate-if-known, SHALL:process)
* valueQuantity.unit insert obligationApp (2, SHALL:populate)
* valueQuantity.system MS
* valueQuantity.system insert obligation2Server (0, SHALL:populate-if-known, SHALL:persist)
* valueQuantity.system insert obligation2App (1, SHALL:populate, SHALL:process)
* valueQuantity.code MS
* valueQuantity.code insert obligation2Server (0, SHALL:populate-if-known, SHALL:persist)
* valueQuantity.code insert obligation2App (1, SHALL:populate, SHALL:process)

Profile: SmartHealthChecksWaistCircumference
Parent: $au-core-waistcircum
Id: SHCWaistCircumference
Title: "Smart Health Checks Waist Circumference"
Description: "This profile sets the minimum expectations for a Waist Circumference resource to record, search and save waist circumference information when used within Smart Health Checks."

* status MS
* status insert obligation2Server (3, SHALL:populate, SHALL:persist)
* status insert obligation2App (4, SHALL:populate, SHALL:process)
* category[VSCat] MS
* category[VSCat] insert obligationServer (2, SHALL:persist)
* category[VSCat] insert obligationApp (3, SHALL:populate)
* code.coding[loincWaistCircumCode] MS
* code.coding[loincWaistCircumCode] insert obligation2Server (0, SHALL:populate, SHALL:persist)
* code.coding[loincWaistCircumCode] insert obligation2App (1, SHALL:populate, SHALL:process)
* code.coding[snomedWaistCircumCode] MS
* code.coding[snomedWaistCircumCode] insert obligationServer (0, SHALL:persist)
* code.coding[snomedWaistCircumCode] insert obligationApp (1, SHALL:populate)
* code.text MS
* code.text insert obligationApp (1, SHALL:populate)
* subject MS
* subject insert obligation2Server (2, SHALL:populate, SHALL:persist)
* subject insert obligationApp (3, SHALL:populate)
* effectiveDateTime MS
* effectiveDateTime insert obligation2Server (2, SHALL:populate, SHALL:persist)
* effectiveDateTime insert obligation2App (3, SHALL:populate-if-known, SHALL:process)
* valueQuantity MS
* valueQuantity insert obligation2Server (2, SHALL:populate-if-known, SHALL:persist)
* valueQuantity insert obligation2App (3, SHALL:populate, SHALL:process)
* valueQuantity.value MS
* valueQuantity.value insert obligation2Server (0, SHALL:populate-if-known, SHALL:persist)
* valueQuantity.value insert obligation2App (1, SHALL:populate, SHALL:process)
* valueQuantity.unit MS
* valueQuantity.unit insert obligation2Server (1, SHALL:populate-if-known, SHALL:persist)
* valueQuantity.unit insert obligationApp (2, SHALL:populate)
* valueQuantity.system MS
* valueQuantity.system insert obligation2Server (0, SHALL:populate-if-known, SHALL:persist)
* valueQuantity.system insert obligation2App (1, SHALL:populate, SHALL:process)
* valueQuantity.code MS
* valueQuantity.code insert obligation2Server (0, SHALL:populate-if-known, SHALL:persist)
* valueQuantity.code insert obligation2App (1, SHALL:populate, SHALL:process)

Profile: SmartHealthChecksHeartRate
Parent: $au-core-heartrate
Id: SHCHeartRate
Title: "Smart Health Checks Heart Rate"
Description: "This profile sets the minimum expectations for a Heart Rate resource to record, search and save heart rate information when used within Smart Health Checks."

* status MS
* status insert obligation2Server (3, SHALL:populate, SHALL:persist)
* status insert obligation2App (4, SHALL:populate, SHALL:process)
* category[VSCat] MS
* category[VSCat] insert obligationServer (2, SHALL:persist)
* category[VSCat] insert obligationApp (3, SHALL:populate)
* code.coding[HeartRateCode] MS
* code.coding[HeartRateCode] insert obligation2Server (0, SHALL:populate, SHALL:persist)
* code.coding[HeartRateCode] insert obligation2App (1, SHALL:populate, SHALL:process)
* code.coding[snomedHeartRateCode] MS
* code.coding[snomedHeartRateCode] insert obligationServer (0, SHALL:persist)
* code.coding[snomedHeartRateCode] insert obligationApp (1, SHALL:populate)
* code.text MS
* code.text insert obligationApp (1, SHALL:populate)
* subject MS
* subject insert obligation2Server (2, SHALL:populate, SHALL:persist)
* subject insert obligationApp (3, SHALL:populate)
* effectiveDateTime MS
* effectiveDateTime insert obligation2Server (2, SHALL:populate, SHALL:persist)
* effectiveDateTime insert obligation2App (3, SHALL:populate-if-known, SHALL:process)
* valueQuantity MS
* valueQuantity insert obligation2Server (2, SHALL:populate-if-known, SHALL:persist)
* valueQuantity insert obligation2App (3, SHALL:populate, SHALL:process)
* valueQuantity.value MS
* valueQuantity.value insert obligation2Server (2, SHALL:populate-if-known, SHALL:persist)
* valueQuantity.value insert obligation2App (3, SHALL:populate, SHALL:process)
* valueQuantity.unit MS
* valueQuantity.unit insert obligation2Server (2, SHALL:populate-if-known, SHALL:persist)
* valueQuantity.unit insert obligationApp (3, SHALL:populate)
* valueQuantity.system MS
* valueQuantity.system insert obligation2Server (2, SHALL:populate-if-known, SHALL:persist)
* valueQuantity.system insert obligation2App (3, SHALL:populate, SHALL:process)
* valueQuantity.code MS
* valueQuantity.code insert obligation2Server (2, SHALL:populate-if-known, SHALL:persist)
* valueQuantity.code insert obligation2App (3, SHALL:populate, SHALL:process)
/*
Profile: SmartHealthChecksConditionPatch
Parent: Parameters
Id: SHCConditionPatch
Title: "Smart Health Checks Condition Patch"
Description: "This profile sets the expectations for a Parameters resource when used to patch Condition resources within Smart Health Checks."

* parameter 1..
* parameter ^slicing.discriminator.type = #value
* parameter ^slicing.discriminator.path = "part"
* parameter ^slicing.ordered = false
* parameter ^slicing.rules = #open
* parameter contains
    clinicalStatus 0..1 and
    abatementDate 0..1
* parameter[clinicalStatus] MS
* parameter[clinicalStatus] insert obligationServer (0, SHALL:process)
* parameter[clinicalStatus] insert obligationApp (1, SHALL:populate)
* parameter[clinicalStatus].name ^short = "Parameters for clinicalStatus patching"
* parameter[clinicalStatus].name 1.. MS
* parameter[clinicalStatus].name insert obligationServer (0, SHALL:process)
* parameter[clinicalStatus].name insert obligationApp (1, SHALL:populate)
* parameter[clinicalStatus].name = "operation" (exactly)
* parameter[clinicalStatus].part ^slicing.discriminator.type = #value
* parameter[clinicalStatus].part ^slicing.discriminator.path = "name"
* parameter[clinicalStatus].part ^slicing.ordered = false
* parameter[clinicalStatus].part ^slicing.rules = #open
* parameter[clinicalStatus].part contains
    type 1..1 and
    path 1..1 and
    value 1..1 and
    pathLabel 0..1
* parameter[clinicalStatus].part[type] MS
* parameter[clinicalStatus].part[type] insert obligationServer (0, SHALL:process)
* parameter[clinicalStatus].part[type] insert obligationApp (1, SHALL:populate)
* parameter[clinicalStatus].part[type] ^short = "Patch operation to perform"
* parameter[clinicalStatus].part[type].name 1..1 MS
* parameter[clinicalStatus].part[type].name insert obligationServer (0, SHALL:process)
* parameter[clinicalStatus].part[type].name insert obligationApp (1, SHALL:populate)
* parameter[clinicalStatus].part[type].name = "type" (exactly)
* parameter[clinicalStatus].part[type].value[x] 1..1 MS
* parameter[clinicalStatus].part[type].value[x] insert obligationServer (0, SHALL:process)
* parameter[clinicalStatus].part[type].value[x] insert obligationApp (1, SHALL:populate)
* parameter[clinicalStatus].part[type].value[x] only code
* parameter[clinicalStatus].part[type].value[x] = #replace (exactly)
* parameter[clinicalStatus].part[path] MS
* parameter[clinicalStatus].part[path] insert obligationServer (0, SHALL:process)
* parameter[clinicalStatus].part[path] insert obligationApp (1, SHALL:populate)
* parameter[clinicalStatus].part[path] ^short = "Where to perform the operation"
* parameter[clinicalStatus].part[path].name 1..1 MS
* parameter[clinicalStatus].part[path].name insert obligationServer (0, SHALL:process)
* parameter[clinicalStatus].part[path].name insert obligationApp (1, SHALL:populate)
* parameter[clinicalStatus].part[path].name = "path" (exactly)
* parameter[clinicalStatus].part[path].value[x] 1..1 MS
* parameter[clinicalStatus].part[path].value[x] insert obligationServer (0, SHALL:process)
* parameter[clinicalStatus].part[path].value[x] insert obligationApp (1, SHALL:populate)
* parameter[clinicalStatus].part[path].value[x] only string
* parameter[clinicalStatus].part[path].value[x] = "Condition.clinicalStatus" (exactly)
* parameter[clinicalStatus].part[value] MS
* parameter[clinicalStatus].part[value] insert obligationServer (0, SHALL:process)
* parameter[clinicalStatus].part[value] insert obligationApp (1, SHALL:populate)
* parameter[clinicalStatus].part[value] ^short = "Replacement value"
* parameter[clinicalStatus].part[value].name 1..1 MS
* parameter[clinicalStatus].part[value].name insert obligationServer (0, SHALL:process)
* parameter[clinicalStatus].part[value].name insert obligationApp (1, SHALL:populate)
* parameter[clinicalStatus].part[value].name = "value" (exactly)
* parameter[clinicalStatus].part[value].value[x] 1..1 MS
* parameter[clinicalStatus].part[value].value[x] insert obligationServer (0, SHALL:process)
* parameter[clinicalStatus].part[value].value[x] insert obligationApp (1, SHALL:populate-if-known)
* parameter[clinicalStatus].part[value].value[x] only CodeableConcept
* parameter[clinicalStatus].part[value].value[x] from http://hl7.org/fhir/ValueSet/condition-clinical (required)
* parameter[clinicalStatus].part[value].value[x].coding 1..1 MS
* parameter[clinicalStatus].part[value].value[x].coding insert obligationServer (0, SHALL:process)
* parameter[clinicalStatus].part[value].value[x].coding insert obligationApp (1, SHALL:populate-if-known)
* parameter[clinicalStatus].part[pathLabel] MS
* parameter[clinicalStatus].part[pathLabel] insert obligationApp (0, SHALL:populate)
* parameter[clinicalStatus].part[pathLabel] ^short = "Human readable representation of the path. Typically this is the relevant item text from the Questionnaire."
* parameter[clinicalStatus].part[pathLabel].name 1..1 MS
* parameter[clinicalStatus].part[pathLabel].name insert obligationApp (0, SHALL:populate)
* parameter[clinicalStatus].part[pathLabel].name = "pathLabel" (exactly)
* parameter[clinicalStatus].part[pathLabel].value[x] 1..1 MS
* parameter[clinicalStatus].part[pathLabel].value[x] insert obligationApp (0, SHALL:populate)
* parameter[clinicalStatus].part[pathLabel].value[x] only string
* parameter[clinicalStatus].part[pathLabel].value[x] = "Clinical status" (exactly)
* parameter[abatementDate] MS
* parameter[abatementDate] insert obligationServer (0, SHALL:process)
* parameter[abatementDate] insert obligationApp (1, SHALL:populate)
* parameter[abatementDate].name ^short = "Parameters for abatement patching"
* parameter[abatementDate].name 1.. MS
* parameter[abatementDate].name insert obligationServer (0, SHALL:process)
* parameter[abatementDate].name insert obligationApp (1, SHALL:populate)
* parameter[abatementDate].name = "operation" (exactly)
* parameter[abatementDate].part ^slicing.discriminator.type = #value
* parameter[abatementDate].part ^slicing.discriminator.path = "name"
* parameter[abatementDate].part ^slicing.ordered = false
* parameter[abatementDate].part ^slicing.rules = #open
* parameter[abatementDate].part contains
    type 1..1 and
    path 1..1 and
    value 1..1 and
    pathLabel 0..1
* parameter[abatementDate].part[type] MS
* parameter[abatementDate].part[type] insert obligationServer (0, SHALL:process)
* parameter[abatementDate].part[type] insert obligationApp (1, SHALL:populate)
* parameter[abatementDate].part[type] ^short = "Patch operation to perform"
* parameter[abatementDate].part[type].name 1..1 MS
* parameter[abatementDate].part[type].name insert obligationServer (0, SHALL:process)
* parameter[abatementDate].part[type].name insert obligationApp (1, SHALL:populate)
* parameter[abatementDate].part[type].name = "type" (exactly)
* parameter[abatementDate].part[type].value[x] 1..1 MS
* parameter[abatementDate].part[type].value[x] insert obligationServer (0, SHALL:process)
* parameter[abatementDate].part[type].value[x] insert obligationApp (1, SHALL:populate)
* parameter[abatementDate].part[type].value[x] only code
* parameter[abatementDate].part[type].value[x] = #replace (exactly)
* parameter[abatementDate].part[path] MS
* parameter[abatementDate].part[path] insert obligationServer (0, SHALL:process)
* parameter[abatementDate].part[path] insert obligationApp (1, SHALL:populate)
* parameter[abatementDate].part[path] ^short = "Where to perform the operation"
* parameter[abatementDate].part[path].name 1..1 MS
* parameter[abatementDate].part[path].name insert obligationServer (0, SHALL:process)
* parameter[abatementDate].part[path].name insert obligationApp (1, SHALL:populate)
* parameter[abatementDate].part[path].name = "path" (exactly)
* parameter[abatementDate].part[path].value[x] 1..1 MS
* parameter[abatementDate].part[path].value[x] insert obligationServer (0, SHALL:process)
* parameter[abatementDate].part[path].value[x] insert obligationApp (1, SHALL:populate)
* parameter[abatementDate].part[path].value[x] only string
* parameter[abatementDate].part[path].value[x] = "Condition.abatement" (exactly)
* parameter[abatementDate].part[value] MS
* parameter[abatementDate].part[value] insert obligationServer (0, SHALL:process)
* parameter[abatementDate].part[value] insert obligationApp (1, SHALL:populate)
* parameter[abatementDate].part[value] ^short = "Replacement value"
* parameter[abatementDate].part[value].name 1..1 MS
* parameter[abatementDate].part[value].name insert obligationServer (0, SHALL:process)
* parameter[abatementDate].part[value].name insert obligationApp (1, SHALL:populate)
* parameter[abatementDate].part[value].name = "value" (exactly)
* parameter[abatementDate].part[value].value[x] 1..1 MS
* parameter[abatementDate].part[value].value[x] insert obligationServer (0, SHALL:process)
* parameter[abatementDate].part[value].value[x] insert obligationApp (1, SHALL:populate-if-known)
* parameter[abatementDate].part[value].value[x] only dateTime
* parameter[abatementDate].part[pathLabel] MS
* parameter[abatementDate].part[pathLabel] insert obligationApp (0, SHALL:populate)
* parameter[abatementDate].part[pathLabel] ^short = "Human readable representation of the path. Typically this is the relevant item text from the Questionnaire."
* parameter[abatementDate].part[pathLabel].name 1..1 MS
* parameter[abatementDate].part[pathLabel].name insert obligationApp (0, SHALL:populate)
* parameter[abatementDate].part[pathLabel].name = "pathLabel" (exactly)
* parameter[abatementDate].part[pathLabel].value[x] 1..1 MS
* parameter[abatementDate].part[pathLabel].value[x] insert obligationApp (0, SHALL:populate)
* parameter[abatementDate].part[pathLabel].value[x] only string
* parameter[abatementDate].part[pathLabel].value[x] = "Abatement date" (exactly)

Profile: SmartHealthChecksAllergyIntolerancePatch
Parent: Parameters
Id: SHCAllergyIntolerancePatch
Title: "Smart Health Checks AllergyIntolerance Patch"
Description: "This profile sets the expectations for a Parameters resource when used to patch AllergyIntolerance resources within Smart Health Checks."

* parameter 1..
* parameter ^slicing.discriminator.type = #pattern
* parameter ^slicing.discriminator.path = "$this"
* parameter ^slicing.ordered = false
* parameter ^slicing.rules = #open
* parameter contains
    clinicalStatus 0..1 and
    comment 0..1
* parameter[clinicalStatus] MS
* parameter[clinicalStatus] insert obligationServer (0, SHALL:process)
* parameter[clinicalStatus] insert obligationApp (1, SHALL:populate)
* parameter[clinicalStatus].name ^short = "Parameters for clinicalStatus patching"
* parameter[clinicalStatus].name 1.. MS
* parameter[clinicalStatus].name insert obligationServer (0, SHALL:process)
* parameter[clinicalStatus].name insert obligationApp (1, SHALL:populate)
* parameter[clinicalStatus].name = "operation" //(exactly)
* parameter[clinicalStatus].part ^slicing.discriminator.type = #value
* parameter[clinicalStatus].part ^slicing.discriminator.path = "name"
* parameter[clinicalStatus].part ^slicing.ordered = false
* parameter[clinicalStatus].part ^slicing.rules = #open
* parameter[clinicalStatus].part contains
    type 1..1 and
    path 1..1 and
    value 1..1 and
    pathLabel 0..1
* parameter[clinicalStatus].part[type] MS
* parameter[clinicalStatus].part[type] insert obligationServer (0, SHALL:process)
* parameter[clinicalStatus].part[type] insert obligationApp (1, SHALL:populate)
* parameter[clinicalStatus].part[type] ^short = "Patch operation to perform"
* parameter[clinicalStatus].part[type].name 1..1 MS
* parameter[clinicalStatus].part[type].name insert obligationServer (0, SHALL:process)
* parameter[clinicalStatus].part[type].name insert obligationApp (1, SHALL:populate)
* parameter[clinicalStatus].part[type].name = "type" //(exactly)
* parameter[clinicalStatus].part[type].value[x] 1..1 MS
* parameter[clinicalStatus].part[type].value[x] insert obligationServer (0, SHALL:process)
* parameter[clinicalStatus].part[type].value[x] insert obligationApp (1, SHALL:populate)
* parameter[clinicalStatus].part[type].value[x] only code
* parameter[clinicalStatus].part[type].valueCode = #replace //(exactly)
* parameter[clinicalStatus].part[path] MS
* parameter[clinicalStatus].part[path] insert obligationServer (0, SHALL:process)
* parameter[clinicalStatus].part[path] insert obligationApp (1, SHALL:populate)
* parameter[clinicalStatus].part[path] ^short = "Where to perform the operation"
* parameter[clinicalStatus].part[path].name 1..1 MS
* parameter[clinicalStatus].part[path].name insert obligationServer (0, SHALL:process)
* parameter[clinicalStatus].part[path].name insert obligationApp (1, SHALL:populate)
* parameter[clinicalStatus].part[path].name = "path" //(exactly)
* parameter[clinicalStatus].part[path].value[x] 1..1 MS
* parameter[clinicalStatus].part[path].value[x] insert obligationServer (0, SHALL:process)
* parameter[clinicalStatus].part[path].value[x] insert obligationApp (1, SHALL:populate)
* parameter[clinicalStatus].part[path].value[x] only string
* parameter[clinicalStatus].part[path].valueString = "AllergyIntolerance.clinicalStatus" //(exactly)
* parameter[clinicalStatus].part[value] MS
* parameter[clinicalStatus].part[value] insert obligationServer (0, SHALL:process)
* parameter[clinicalStatus].part[value] insert obligationApp (1, SHALL:populate)
* parameter[clinicalStatus].part[value] ^short = "Replacement value"
* parameter[clinicalStatus].part[value].name 1..1 MS
* parameter[clinicalStatus].part[value].name insert obligationServer (0, SHALL:process)
* parameter[clinicalStatus].part[value].name insert obligationApp (1, SHALL:populate)
* parameter[clinicalStatus].part[value].name = "value" //(exactly)
* parameter[clinicalStatus].part[value].value[x] 1..1 MS
* parameter[clinicalStatus].part[value].value[x] insert obligationServer (0, SHALL:process)
* parameter[clinicalStatus].part[value].value[x] insert obligationApp (1, SHALL:populate-if-known)
* parameter[clinicalStatus].part[value].value[x] only CodeableConcept
* parameter[clinicalStatus].part[value].valueCodeableConcept from AllergyIntoleranceClinicalStatusMinimal (required)
* parameter[clinicalStatus].part[value].valueCodeableConcept.coding 1..1 MS
* parameter[clinicalStatus].part[value].valueCodeableConcept.coding insert obligationServer (0, SHALL:process)
* parameter[clinicalStatus].part[value].valueCodeableConcept.coding insert obligationApp (1, SHALL:populate-if-known)
* parameter[clinicalStatus].part[pathLabel] MS
* parameter[clinicalStatus].part[pathLabel] insert obligationApp (0, SHALL:populate)
* parameter[clinicalStatus].part[pathLabel] ^short = "Human readable representation of the path. Typically this is the relevant item text from the Questionnaire."
* parameter[clinicalStatus].part[pathLabel].name 1..1 MS
* parameter[clinicalStatus].part[pathLabel].name insert obligationApp (0, SHALL:populate)
* parameter[clinicalStatus].part[pathLabel].name = "pathLabel" //(exactly)
* parameter[clinicalStatus].part[pathLabel].value[x] 1..1 MS
* parameter[clinicalStatus].part[pathLabel].value[x] insert obligationApp (0, SHALL:populate)
* parameter[clinicalStatus].part[pathLabel].value[x] only string
* parameter[clinicalStatus].part[pathLabel].valueString = "Clinical status" //(exactly)
* parameter[comment] MS
* parameter[comment] insert obligationServer (0, SHALL:process)
* parameter[comment] insert obligationApp (1, SHALL:populate)


* parameter[comment].name ^short = "Parameters for note.text patching"
* parameter[comment].name 1.. MS
* parameter[comment].name insert obligationServer (0, SHALL:process)
* parameter[comment].name insert obligationApp (1, SHALL:populate)
* parameter[comment].name = "operation" //(exactly)
* parameter[comment].part ^slicing.discriminator.type = #value
* parameter[comment].part ^slicing.discriminator.path = "name"
* parameter[comment].part ^slicing.ordered = false
* parameter[comment].part ^slicing.rules = #open
* parameter[comment].part contains
    type 1..1 and
    path 1..1 and
    value 1..1 and
    pathLabel 0..1
* parameter[comment].part[type] MS
* parameter[comment].part[type] insert obligationServer (0, SHALL:process)
* parameter[comment].part[type] insert obligationApp (1, SHALL:populate)
* parameter[comment].part[type] ^short = "Patch operation to perform"
* parameter[comment].part[type].name 1..1 MS
* parameter[comment].part[type].name insert obligationServer (0, SHALL:process)
* parameter[comment].part[type].name insert obligationApp (1, SHALL:populate)
* parameter[comment].part[type].name = "type" //(exactly)
* parameter[comment].part[type].value[x] 1..1 MS
* parameter[comment].part[type].value[x] insert obligationServer (0, SHALL:process)
* parameter[comment].part[type].value[x] insert obligationApp (1, SHALL:populate)
* parameter[comment].part[type].value[x] only code
* parameter[comment].part[type].value[x] = #replace //(exactly)
* parameter[comment].part[path] MS
* parameter[comment].part[path] insert obligationServer (0, SHALL:process)
* parameter[comment].part[path] insert obligationApp (1, SHALL:populate)
* parameter[comment].part[path] ^short = "Where to perform the operation"
* parameter[comment].part[path].name 1..1 MS
* parameter[comment].part[path].name insert obligationServer (0, SHALL:process)
* parameter[comment].part[path].name insert obligationApp (1, SHALL:populate)
* parameter[comment].part[path].name = "path" //(exactly)
* parameter[comment].part[path].value[x] 1..1 MS
* parameter[comment].part[path].value[x] insert obligationServer (0, SHALL:process)
* parameter[comment].part[path].value[x] insert obligationApp (1, SHALL:populate)
* parameter[comment].part[path].value[x] only string
* parameter[comment].part[path].value[x] = "AllergyIntolerance.note[0].text" //(exactly)
* parameter[comment].part[value] MS
* parameter[comment].part[value] insert obligationServer (0, SHALL:process)
* parameter[comment].part[value] insert obligationApp (1, SHALL:populate)
* parameter[comment].part[value] ^short = "Replacement value"
* parameter[comment].part[value].name 1..1 MS
* parameter[comment].part[value].name insert obligationServer (0, SHALL:process)
* parameter[comment].part[value].name insert obligationApp (1, SHALL:populate)
* parameter[comment].part[value].name = "value" //(exactly)
* parameter[comment].part[value].value[x] 1..1 MS
* parameter[comment].part[value].value[x] insert obligationServer (0, SHALL:process)
* parameter[comment].part[value].value[x] insert obligationApp (1, SHALL:populate-if-known)
* parameter[comment].part[value].value[x] only markdown
* parameter[comment].part[pathLabel] MS
* parameter[comment].part[pathLabel] insert obligationApp (0, SHALL:populate)
* parameter[comment].part[pathLabel] ^short = "Human readable representation of the path. Typically this is the relevant item text from the Questionnaire."
* parameter[comment].part[pathLabel].name 1..1 MS
* parameter[comment].part[pathLabel].name insert obligationApp (0, SHALL:populate)
* parameter[comment].part[pathLabel].name = "pathLabel" //(exactly)
* parameter[comment].part[pathLabel].value[x] 1..1 MS
* parameter[comment].part[pathLabel].value[x] insert obligationApp (0, SHALL:populate)
* parameter[comment].part[pathLabel].value[x] only string
* parameter[comment].part[pathLabel].value[x] = "Comment" //(exactly)


Profile: SmartHealthChecksMedicationStatementPatch
Parent: Parameters
Id: SHCMedicationStatementPatch
Title: "Smart Health Checks MedicationStatement Patch"
Description: "This profile sets the expectations for a Parameters resource when used to patch MedicationStatement resources within Smart Health Checks."

* parameter 1..
* parameter ^slicing.discriminator.type = #value
* parameter ^slicing.discriminator.path = "part"
* parameter ^slicing.ordered = false
* parameter ^slicing.rules = #open
* parameter contains
    status 0..1 and
    comment 0..1 and
    dosage 0..1
* parameter[status] MS
* parameter[status] insert obligationServer (0, SHALL:process)
* parameter[status] insert obligationApp (1, SHALL:populate)
* parameter[status].name ^short = "Parameters for status patching"
* parameter[status].name 1.. MS
* parameter[status].name insert obligationServer (0, SHALL:process)
* parameter[status].name insert obligationApp (1, SHALL:populate)
* parameter[status].name = "operation" (exactly)
* parameter[status].part ^slicing.discriminator.type = #value
* parameter[status].part ^slicing.discriminator.path = "name"
* parameter[status].part ^slicing.ordered = false
* parameter[status].part ^slicing.rules = #open
* parameter[status].part contains
    type 1..1 and
    path 1..1 and
    value 1..1 and
    pathLabel 0..1
* parameter[status].part[type] MS
* parameter[status].part[type] insert obligationServer (0, SHALL:process)
* parameter[status].part[type] insert obligationApp (1, SHALL:populate)
* parameter[status].part[type] ^short = "Patch operation to perform"
* parameter[status].part[type].name 1..1 MS
* parameter[status].part[type].name insert obligationServer (0, SHALL:process)
* parameter[status].part[type].name insert obligationApp (1, SHALL:populate)
* parameter[status].part[type].name = "type" (exactly)
* parameter[status].part[type].value[x] 1..1 MS
* parameter[status].part[type].value[x] insert obligationServer (0, SHALL:process)
* parameter[status].part[type].value[x] insert obligationApp (1, SHALL:populate)
* parameter[status].part[type].value[x] only code
* parameter[status].part[type].value[x] = #replace (exactly)
* parameter[status].part[path] MS
* parameter[status].part[path] insert obligationServer (0, SHALL:process)
* parameter[status].part[path] insert obligationApp (1, SHALL:populate)
* parameter[status].part[path] ^short = "Where to perform the operation"
* parameter[status].part[path].name 1..1 MS
* parameter[status].part[path].name insert obligationServer (0, SHALL:process)
* parameter[status].part[path].name insert obligationApp (1, SHALL:populate)
* parameter[status].part[path].name = "path" (exactly)
* parameter[status].part[path].value[x] 1..1 MS
* parameter[status].part[path].value[x] insert obligationServer (0, SHALL:process)
* parameter[status].part[path].value[x] insert obligationApp (1, SHALL:populate)
* parameter[status].part[path].value[x] only string
* parameter[status].part[path].value[x] = "MedicationStatement.status" (exactly)
* parameter[status].part[value] MS
* parameter[status].part[value] insert obligationServer (0, SHALL:process)
* parameter[status].part[value] insert obligationApp (1, SHALL:populate)
* parameter[status].part[value] ^short = "Replacement value"
* parameter[status].part[value].name 1..1 MS
* parameter[status].part[value].name insert obligationServer (0, SHALL:process)
* parameter[status].part[value].name insert obligationApp (1, SHALL:populate)
* parameter[status].part[value].name = "value" (exactly)
* parameter[status].part[value].value[x] 1..1 MS
* parameter[status].part[value].value[x] insert obligationServer (0, SHALL:process)
* parameter[status].part[value].value[x] insert obligationApp (1, SHALL:populate-if-known)
* parameter[status].part[value].value[x] only CodeableConcept
* parameter[status].part[value].value[x] from MedicationStatementStatusLimited (required)
* parameter[status].part[value].value[x].coding 1..1 MS
* parameter[status].part[value].value[x].coding insert obligationServer (0, SHALL:process)
* parameter[status].part[value].value[x].coding insert obligationApp (1, SHALL:populate-if-known)
* parameter[status].part[pathLabel] MS
* parameter[status].part[pathLabel] insert obligationApp (0, SHALL:populate)
* parameter[status].part[pathLabel] ^short = "Human readable representation of the path. Typically this is the relevant item text from the Questionnaire."
* parameter[status].part[pathLabel].name 1..1 MS
* parameter[status].part[pathLabel].name insert obligationApp (0, SHALL:populate)
* parameter[status].part[pathLabel].name = "pathLabel" (exactly)
* parameter[status].part[pathLabel].value[x] 1..1 MS
* parameter[status].part[pathLabel].value[x] insert obligationApp (0, SHALL:populate)
* parameter[status].part[pathLabel].value[x] only string
* parameter[status].part[pathLabel].value[x] = "Status" (exactly)
* parameter[comment] MS
* parameter[comment] insert obligationServer (0, SHALL:process)
* parameter[comment] insert obligationApp (1, SHALL:populate)
* parameter[comment].name ^short = "Parameters for note.text patching"
* parameter[comment].name 1.. MS
* parameter[comment].name insert obligationServer (0, SHALL:process)
* parameter[comment].name insert obligationApp (1, SHALL:populate)
* parameter[comment].name = "operation" (exactly)
* parameter[comment].part ^slicing.discriminator.type = #value
* parameter[comment].part ^slicing.discriminator.path = "name"
* parameter[comment].part ^slicing.ordered = false
* parameter[comment].part ^slicing.rules = #open
* parameter[comment].part contains
    type 1..1 and
    path 1..1 and
    value 1..1 and
    pathLabel 0..1
* parameter[comment].part[type] MS
* parameter[comment].part[type] insert obligationServer (0, SHALL:process)
* parameter[comment].part[type] insert obligationApp (1, SHALL:populate)
* parameter[comment].part[type] ^short = "Patch operation to perform"
* parameter[comment].part[type].name 1..1 MS
* parameter[comment].part[type].name insert obligationServer (0, SHALL:process)
* parameter[comment].part[type].name insert obligationApp (1, SHALL:populate)
* parameter[comment].part[type].name = "type" (exactly)
* parameter[comment].part[type].value[x] 1..1 MS
* parameter[comment].part[type].value[x] insert obligationServer (0, SHALL:process)
* parameter[comment].part[type].value[x] insert obligationApp (1, SHALL:populate)
* parameter[comment].part[type].value[x] only code
* parameter[comment].part[type].value[x] = #replace (exactly)
* parameter[comment].part[path] MS
* parameter[comment].part[path] insert obligationServer (0, SHALL:process)
* parameter[comment].part[path] insert obligationApp (1, SHALL:populate)
* parameter[comment].part[path] ^short = "Where to perform the operation"
* parameter[comment].part[path].name 1..1 MS
* parameter[comment].part[path].name insert obligationServer (0, SHALL:process)
* parameter[comment].part[path].name insert obligationApp (1, SHALL:populate)
* parameter[comment].part[path].name = "path" (exactly)
* parameter[comment].part[path].value[x] 1..1 MS
* parameter[comment].part[path].value[x] insert obligationServer (0, SHALL:process)
* parameter[comment].part[path].value[x] insert obligationApp (1, SHALL:populate)
* parameter[comment].part[path].value[x] only string
* parameter[comment].part[path].value[x] = "MedicationStatement.note[0].text" (exactly)
* parameter[comment].part[value] MS
* parameter[comment].part[value] insert obligationServer (0, SHALL:process)
* parameter[comment].part[value] insert obligationApp (1, SHALL:populate)
* parameter[comment].part[value] ^short = "Replacement value"
* parameter[comment].part[value].name 1..1 MS
* parameter[comment].part[value].name insert obligationServer (0, SHALL:process)
* parameter[comment].part[value].name insert obligationApp (1, SHALL:populate)
* parameter[comment].part[value].name = "value" (exactly)
* parameter[comment].part[value].value[x] 1..1 MS
* parameter[comment].part[value].value[x] insert obligationServer (0, SHALL:process)
* parameter[comment].part[value].value[x] insert obligationApp (1, SHALL:populate-if-known)
* parameter[comment].part[value].value[x] only markdown
* parameter[comment].part[pathLabel] MS
* parameter[comment].part[pathLabel] insert obligationApp (0, SHALL:populate)
* parameter[comment].part[pathLabel] ^short = "Human readable representation of the path. Typically this is the relevant item text from the Questionnaire."
* parameter[comment].part[pathLabel].name 1..1 MS
* parameter[comment].part[pathLabel].name insert obligationApp (0, SHALL:populate)
* parameter[comment].part[pathLabel].name = "pathLabel" (exactly)
* parameter[comment].part[pathLabel].value[x] 1..1 MS
* parameter[comment].part[pathLabel].value[x] insert obligationApp (0, SHALL:populate)
* parameter[comment].part[pathLabel].value[x] only string
* parameter[comment].part[pathLabel].value[x] = "Comment" (exactly)
* parameter[dosage] MS
* parameter[dosage] insert obligationServer (0, SHALL:process)
* parameter[dosage] insert obligationApp (1, SHALL:populate)
* parameter[dosage].name ^short = "Parameters for dosage.text patching"
* parameter[dosage].name 1.. MS
* parameter[dosage].name insert obligationServer (0, SHALL:process)
* parameter[dosage].name insert obligationApp (1, SHALL:populate)
* parameter[dosage].name = "operation" (exactly)
* parameter[dosage].part ^slicing.discriminator.type = #value
* parameter[dosage].part ^slicing.discriminator.path = "name"
* parameter[dosage].part ^slicing.ordered = false
* parameter[dosage].part ^slicing.rules = #open
* parameter[dosage].part contains
    type 1..1 and
    path 1..1 and
    value 1..1 and
    pathLabel 0..1
* parameter[dosage].part[type] MS
* parameter[dosage].part[type] insert obligationServer (0, SHALL:process)
* parameter[dosage].part[type] insert obligationApp (1, SHALL:populate)
* parameter[dosage].part[type] ^short = "Patch operation to perform"
* parameter[dosage].part[type].name 1..1 MS
* parameter[dosage].part[type].name insert obligationServer (0, SHALL:process)
* parameter[dosage].part[type].name insert obligationApp (1, SHALL:populate)
* parameter[dosage].part[type].name = "type" (exactly)
* parameter[dosage].part[type].value[x] 1..1 MS
* parameter[dosage].part[type].value[x] insert obligationServer (0, SHALL:process)
* parameter[dosage].part[type].value[x] insert obligationApp (1, SHALL:populate)
* parameter[dosage].part[type].value[x] only code
* parameter[dosage].part[type].value[x] = #replace (exactly)
* parameter[dosage].part[path] MS
* parameter[dosage].part[path] insert obligationServer (0, SHALL:process)
* parameter[dosage].part[path] insert obligationApp (1, SHALL:populate)
* parameter[dosage].part[path] ^short = "Where to perform the operation"
* parameter[dosage].part[path].name 1..1 MS
* parameter[dosage].part[path].name insert obligationServer (0, SHALL:process)
* parameter[dosage].part[path].name insert obligationApp (1, SHALL:populate)
* parameter[dosage].part[path].name = "path" (exactly)
* parameter[dosage].part[path].value[x] 1..1 MS
* parameter[dosage].part[path].value[x] insert obligationServer (0, SHALL:process)
* parameter[dosage].part[path].value[x] insert obligationApp (1, SHALL:populate)
* parameter[dosage].part[path].value[x] only string
* parameter[dosage].part[path].value[x] = "MedicationStatement.dosage[0].text" (exactly)
* parameter[dosage].part[value] MS
* parameter[dosage].part[value] insert obligationServer (0, SHALL:process)
* parameter[dosage].part[value] insert obligationApp (1, SHALL:populate)
* parameter[dosage].part[value] ^short = "Replacement value"
* parameter[dosage].part[value].name 1..1 MS
* parameter[dosage].part[value].name insert obligationServer (0, SHALL:process)
* parameter[dosage].part[value].name insert obligationApp (1, SHALL:populate)
* parameter[dosage].part[value].name = "value" (exactly)
* parameter[dosage].part[value].value[x] 1..1 MS
* parameter[dosage].part[value].value[x] insert obligationServer (0, SHALL:process)
* parameter[dosage].part[value].value[x] insert obligationApp (1, SHALL:populate-if-known)
* parameter[dosage].part[value].value[x] only string
* parameter[dosage].part[pathLabel] MS
* parameter[dosage].part[pathLabel] insert obligationApp (0, SHALL:populate)
* parameter[dosage].part[pathLabel] ^short = "Human readable representation of the path. Typically this is the relevant item text from the Questionnaire."
* parameter[dosage].part[pathLabel].name 1..1 MS
* parameter[dosage].part[pathLabel].name insert obligationApp (0, SHALL:populate)
* parameter[dosage].part[pathLabel].name = "pathLabel" (exactly)
* parameter[dosage].part[pathLabel].value[x] 1..1 MS
* parameter[dosage].part[pathLabel].value[x] insert obligationApp (0, SHALL:populate)
* parameter[dosage].part[pathLabel].value[x] only string
* parameter[dosage].part[pathLabel].value[x] = "Dosage" (exactly)
*/


Invariant: shc-patch-01
Description: "When the part parameter named 'path' has a value of 'AllergyIntolerance.clinicalStatus', the part parameter named 'value' SHALL have a value from the 'Allergy Intolerance Clinical Status Minimal' value set."
* severity = #error
* expression = "parameter.part.where(name='path').value = 'AllergyIntolerance.clinicalStatus' implies parameter.part.where(name='value').value.memberOf('https://smartforms.csiro.au/ig/ValueSet/AllergyIntoleranceClinicalStatusMinimal')"

Invariant: shc-patch-02
Description: "When the part parameter named 'path' has a value of 'Condition.clinicalStatus', the part parameter named 'value' SHALL have a value from the Condition Clinical Status Codes' value set."
* severity = #error
* expression = "parameter.part.where(name='path').value = 'Condition.clinicalStatus' implies parameter.part.where(name='value').value.memberOf('http://hl7.org/fhir/ValueSet/condition-clinical')"

Invariant: shc-patch-03
Description: "When the part parameter named 'path' has a value of 'AllergyIntolerance.clinicalStatus', the part parameter named 'value' SHALL have a value from the 'Allergy Intolerance Clinical Status Minimal' value set."
* severity = #error
* expression = "parameter.part.where(name='path').value = 'MedicationStatement.status' implies parameter.part.where(name='value').value.memberOf('https://smartforms.csiro.au/ig/ValueSet/MedicationStatementStatusLimited')"



Profile: SmartHealthChecksPatch
Parent: Parameters
Id: SHCPatch
Title: "Smart Health Checks Patch"
Description: "This profile sets the expectations for a Parameters resource when used to patch resources within Smart Health Checks."

* . ^short = "Parameters for patching elements supported in Smart Health Checks"
* obeys shc-patch-01
* obeys shc-patch-02
* obeys shc-patch-03
* parameter 1..
* parameter MS
* parameter insert obligationServer (0, SHALL:process)
* parameter insert obligationApp (1, SHALL:populate)
* parameter.name ^short = "Parameters for element patching"
* parameter.name 1.. MS
* parameter.name insert obligationServer (0, SHALL:process)
* parameter.name insert obligationApp (1, SHALL:populate)
* parameter.name = "operation" (exactly)
* parameter.part ^slicing.discriminator.type = #value
* parameter.part ^slicing.discriminator.path = "name"
* parameter.part ^slicing.ordered = false
* parameter.part ^slicing.rules = #open
* parameter.part contains
    type 1..1 and
    path 1..1 and
    value 1..1 and
    pathLabel 0..1
* parameter.part[type] MS
* parameter.part[type] insert obligationServer (0, SHALL:process)
* parameter.part[type] insert obligationApp (1, SHALL:populate)
* parameter.part[type] ^short = "Patch operation to perform"
* parameter.part[type].name MS
* parameter.part[type].name insert obligationServer (0, SHALL:process)
* parameter.part[type].name insert obligationApp (1, SHALL:populate)
* parameter.part[type].name = "type" (exactly)
* parameter.part[type].value[x] 1.. MS
* parameter.part[type].value[x] insert obligationServer (0, SHALL:process)
* parameter.part[type].value[x] insert obligationApp (1, SHALL:populate)
* parameter.part[type].value[x] only code
* parameter.part[type].value[x] = #replace (exactly)
* parameter.part[path] MS
* parameter.part[path] insert obligationServer (0, SHALL:process)
* parameter.part[path] insert obligationApp (1, SHALL:populate)
* parameter.part[path] ^short = "Where to perform the operation"
* parameter.part[path].name MS
* parameter.part[path].name insert obligationServer (0, SHALL:process)
* parameter.part[path].name insert obligationApp (1, SHALL:populate)
* parameter.part[path].name = "path" (exactly)
* parameter.part[path].value[x] 1.. MS
* parameter.part[path].value[x] insert obligationServer (0, SHALL:process)
* parameter.part[path].value[x] insert obligationApp (1, SHALL:populate)
* parameter.part[path].value[x] only string
* parameter.part[path].valueString from SHCPatchPath (required)
* parameter.part[value] MS
* parameter.part[value] insert obligationServer (0, SHALL:process)
* parameter.part[value] insert obligationApp (1, SHALL:populate)
* parameter.part[value] ^short = "Replacement value"
* parameter.part[value].name MS
* parameter.part[value].name insert obligationServer (0, SHALL:process)
* parameter.part[value].name insert obligationApp (1, SHALL:populate)
* parameter.part[value].name = "value" (exactly)
* parameter.part[value].value[x] 1..
* parameter.part[value].value[x] only code or CodeableConcept or dateTime or string or markdown
* parameter.part[value].value[x] ^condition[+] = "shc-patch-01"
* parameter.part[value].value[x] ^condition[+] = "shc-patch-02"
* parameter.part[value].value[x] ^condition[+] = "shc-patch-03"
* parameter.part[value].value[x] ^slicing.discriminator.type = #type
* parameter.part[value].value[x] ^slicing.discriminator.path = "$this"
* parameter.part[value].value[x] ^slicing.ordered = false
* parameter.part[value].value[x] ^slicing.rules = #open
* parameter.part[value].value[x] contains
    code 0..1 and
    CodeableConcept 0..1 and
    dateTime 0..1 and
    string 0..1 and
    markdown 0..1
* parameter.part[value].value[x][code] MS
* parameter.part[value].value[x][code] insert obligationServer (0, SHALL:process)
* parameter.part[value].value[x][code] insert obligationApp (1, SHALL:populate-if-known)
* parameter.part[value].value[x][code] only code
* parameter.part[value].value[x][code] from MedicationStatementStatusLimited (required)
* parameter.part[value].value[x][CodeableConcept] MS
* parameter.part[value].value[x][CodeableConcept] insert obligationServer (0, SHALL:process)
* parameter.part[value].value[x][CodeableConcept] insert obligationApp (1, SHALL:populate-if-known)
* parameter.part[value].value[x][CodeableConcept] only CodeableConcept
* parameter.part[value].value[x][CodeableConcept].coding 1..1
* parameter.part[value].value[x][CodeableConcept].coding ^slicing.discriminator.type = #value
* parameter.part[value].value[x][CodeableConcept].coding ^slicing.discriminator.path = "$this"
* parameter.part[value].value[x][CodeableConcept].coding ^slicing.ordered = false
* parameter.part[value].value[x][CodeableConcept].coding ^slicing.rules = #open
* parameter.part[value].value[x][CodeableConcept].coding contains
    AllergyIntoleranceClinicalStatusCodes 0..1 and
    ConditionClinicalStatusCodes 0..1
* parameter.part[value].value[x][CodeableConcept].coding[AllergyIntoleranceClinicalStatusCodes] MS
* parameter.part[value].value[x][CodeableConcept].coding[AllergyIntoleranceClinicalStatusCodes] insert obligationServer (0, SHALL:process)
* parameter.part[value].value[x][CodeableConcept].coding[AllergyIntoleranceClinicalStatusCodes] insert obligationApp (1, SHALL:populate-if-known)
* parameter.part[value].value[x][CodeableConcept].coding[AllergyIntoleranceClinicalStatusCodes] from AllergyIntoleranceClinicalStatusMinimal (required)
* parameter.part[value].value[x][CodeableConcept].coding[ConditionClinicalStatusCodes] MS
* parameter.part[value].value[x][CodeableConcept].coding[ConditionClinicalStatusCodes] insert obligationServer (0, SHALL:process)
* parameter.part[value].value[x][CodeableConcept].coding[ConditionClinicalStatusCodes] insert obligationApp (1, SHALL:populate-if-known)
* parameter.part[value].value[x][CodeableConcept].coding[ConditionClinicalStatusCodes] from http://hl7.org/fhir/ValueSet/condition-clinical (required)
* parameter.part[value].value[x][dateTime] MS
* parameter.part[value].value[x][dateTime] insert obligationServer (0, SHALL:process)
* parameter.part[value].value[x][dateTime] insert obligationApp (1, SHALL:populate-if-known)
* parameter.part[value].value[x][dateTime] only dateTime
* parameter.part[value].value[x][string] MS
* parameter.part[value].value[x][string] insert obligationServer (0, SHALL:process)
* parameter.part[value].value[x][string] insert obligationApp (1, SHALL:populate-if-known)
* parameter.part[value].value[x][string] only string
* parameter.part[value].value[x][markdown] MS
* parameter.part[value].value[x][markdown] insert obligationServer (0, SHALL:process)
* parameter.part[value].value[x][markdown] insert obligationApp (1, SHALL:populate-if-known)
* parameter.part[value].value[x][markdown] only markdown
* parameter.part[pathLabel] MS
* parameter.part[pathLabel] insert obligationApp (0, SHALL:populate)
* parameter.part[pathLabel] ^short = "Human readable representation of the path. Typically this is the relevant item text from the Questionnaire."
* parameter.part[pathLabel].name MS
* parameter.part[pathLabel].name insert obligationApp (0, SHALL:populate)
* parameter.part[pathLabel].name = "pathLabel" (exactly)
* parameter.part[pathLabel].value[x] 1.. MS
* parameter.part[pathLabel].value[x] insert obligationApp (0, SHALL:populate)
* parameter.part[pathLabel].value[x] only string

Profile: SmartHealthChecksExtractBundle
Parent: Bundle
Id: SHCExtractBundle
Title: "Smart Health Checks Extract Bundle"
Description: "This profile sets the expectations for a Bundle resource when used to represent a transaction bundle of resources extracted by the SHC App following the completion of a Smart Health Checks Questionnaire. This bundle is used to write patient information to the SHC Host FHIR server."

* type MS
* type insert obligationServer (0, SHALL:process)
* type insert obligationApp (1, SHALL:populate)
* type = #transaction (exactly)
* timestamp 1.. MS
* timestamp insert obligationApp (0, SHALL:populate)
* entry 1..
* entry ^slicing.discriminator.type = #value
* entry ^slicing.discriminator.path = "request.method"
* entry ^slicing.ordered = false
* entry ^slicing.rules = #closed
* entry contains
    post 0..* and
    patch 0..*
* entry[post] MS
* entry[post] insert obligationServer (0, SHALL:process)
* entry[post] insert obligationApp (1, SHALL:populate)
* entry[post] ^short = "Entries for creating new resources"
* entry[post].fullUrl 1.. MS
* entry[post].fullUrl insert obligationServer (0, SHALL:process)
* entry[post].fullUrl insert obligationApp (1, SHALL:populate)
* entry[post].resource 1.. MS
* entry[post].resource insert obligationServer (0, SHALL:process)
* entry[post].resource insert obligationApp (1, SHALL:populate)
* entry[post].resource only 
    SHCAllergyIntolerance or
    SHCCondition or
    SHCImmunization or
    SHCMedicationStatement or
    SHCBloodPressure or
    SHCBodyHeight or
    SHCBodyWeight or
    SHCHeartRate or
    SHCHeartRhythm or
    SHCSmokingStatus or
    SHCWaistCircumference or
    SHCHeadCircumference 
* entry[post].request 1.. MS
* entry[post].request insert obligationServer (0, SHALL:process)
* entry[post].request insert obligationApp (1, SHALL:populate)
* entry[post].request.method MS
* entry[post].request.method insert obligationServer (0, SHALL:process)
* entry[post].request.method insert obligationApp (1, SHALL:populate)
* entry[post].request.method = #POST (exactly)
* entry[post].request.url MS
* entry[post].request.url insert obligationServer (0, SHALL:process)
* entry[post].request.url insert obligationApp (1, SHALL:populate)
* entry[patch] MS
* entry[patch] insert obligationServer (0, SHALL:process)
* entry[patch] insert obligationApp (1, SHALL:populate)
* entry[patch] ^short = "Entries for patching existing resources"
* entry[patch].fullUrl 1.. MS
* entry[patch].fullUrl insert obligationServer (0, SHALL:process)
* entry[patch].fullUrl insert obligationApp (1, SHALL:populate)
* entry[patch].resource 1.. MS
* entry[patch].resource insert obligationServer (0, SHALL:process)
* entry[patch].resource insert obligationApp (1, SHALL:populate)
* entry[patch].resource only SHCPatch
* entry[patch].request 1.. MS
* entry[patch].request insert obligationServer (0, SHALL:process)
* entry[patch].request insert obligationApp (1, SHALL:populate)
* entry[patch].request.method MS
* entry[patch].request.method insert obligationServer (0, SHALL:process)
* entry[patch].request.method insert obligationApp (1, SHALL:populate)
* entry[patch].request.method = #PATCH (exactly)
* entry[patch].request.url MS
* entry[patch].request.url insert obligationServer (0, SHALL:process)
* entry[patch].request.url insert obligationApp (1, SHALL:populate)