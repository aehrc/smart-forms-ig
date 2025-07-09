
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


Profile: SmartHealthCheckHeartRhythm
Parent: Observation
Id: SHCHeartRhythm
Title: "Smart Health Checks Heart Rhythm"
Description: "This profile sets the minimum expectations for an Observation resource to record heart rhythm observations. It is used to represent heart rhythm data captured during a First Nations Health Check that can be used to record the observation in a clinical record."

* . ^short = "Heart Rhythm"
* . ^definition = "Measurement of a patient's heart rhytym at a point in time."
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
* category[vitalSignsCategory] = http://terminology.hl7.org/CodeSystem/observation-category#vital-signs (exactly) 
* category[vitalSignsCategory] insert obligationServer (0, SHALL:process)
* category[vitalSignsCategory] insert obligationApp (1, SHALL:populate)
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
* subject insert obligation2Server (0, SHALL:populate-if-known, SHALL:process)
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
* value[x] from HeartRythym (extensible)
* value[x] ^condition = "shc-heartrhythm-01"
* valueCodeableConcept.coding MS
* valueCodeableConcept.coding insert obligation2Server (0, SHALL:populate-if-known, SHALL:process)
* valueCodeableConcept.coding insert obligation2App (1, SHALL:populate, SHALL:process)
* dataAbsentReason MS
* dataAbsentReason ^condition = "shc-heartrhythm-01"



Profile: SmartHealthCheckAllergyIntolerance
Parent: $au-core-allergyintolerance
Id: SHCAllergyIntolerance
Title: "Smart Health Checks AllergyIntolerance"
Description: "This profile sets the minimum expectations for an AllergyIntolerance resource to record, search and save allergy or intolerance information when used within Smart Health Checks."

* id MS
* id insert obligationServer (0, SHALL:populate)
* id insert obligationApp (1, SHALL:process)
* patient MS
* patient insert obligation2Server (2, SHALL:populate-if-known, SHALL:process)
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

Profile: SmartHealthCheckCondition
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
* category insert obligation2App (3, SHALL:populate, SHALL:process)
* code MS
* code insert obligation2Server (2, SHALL:populate-if-known, SHALL:process)
* code insert obligation2App (3, SHALL:populate-if-known, SHALL:process)
* subject MS
* subject insert obligation2Server (2, SHALL:populate-if-known, SHALL:process)
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

Profile: SmartHealthCheckMedicationStatement
Parent: $au-core-medicationstatement
Id: SHCMedicationStatement
Title: "Smart Health Checks MedicationStatement"
Description: "This profile sets the minimum expectations for a MedicationStatement resource to record, search and save medication information when used within Smart Health Checks."

* id MS
* id insert obligationServer (0, SHALL:populate)
* id insert obligationApp (1, SHALL:process)
* status MS
* status insert obligation2Server (2, SHALL:populate-if-known, SHALL:process)
* status insert obligationApp (3, SHALL:populate)
* medication[x][medicationCodeableConcept] MS
* medication[x][medicationCodeableConcept] insert obligation2Server (0, SHALL:populate-if-known, SHALL:process)
* medication[x][medicationCodeableConcept] insert obligation2App (1, SHALL:populate-if-known, SHALL:process)
* subject MS
* subject insert obligation2Server (2, SHALL:populate-if-known, SHALL:process)
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

Profile: SmartHealthCheckImmunization
Parent: $au-core-immunization
Id: SHCImmunization
Title: "Smart Health Checks Immunization"
Description: "This profile sets the minimum expectations for an Immunization resource to record, search and save immunization information when used within Smart Health Checks."

* status MS
* status insert obligation2Server (2, SHALL:populate, SHALL:process)
* status insert obligation2App (3, SHALL:populate, SHALL:process)
* vaccineCode MS
* vaccineCode insert obligation2Server (2, SHALL:populate-if-known, SHALL:process)
* vaccineCode insert obligation2App (3, SHALL:populate-if-known, SHALL:process)
* vaccineCode.coding[amtVaccineCode] MS
* vaccineCode.coding[amtVaccineCode] insert obligation2Server (2, SHALL:populate-if-known, SHALL:process)
* vaccineCode.coding[amtVaccineCode] insert obligation2App (3, SHALL:populate-if-known, SHALL:process)
* patient MS
* patient insert obligation2Server (2, SHALL:populate-if-known, SHALL:process)
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

Profile: SmartHealthCheckBloodPressure
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
* subject insert obligation2Server (2, SHALL:populate-if-known, SHALL:process)
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

Profile: SmartHealthCheckSmokingStatus
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
* subject insert obligation2Server (2, SHALL:populate-if-known, SHALL:process)
* subject insert obligationApp (3, SHALL:populate)
* effectiveDateTime MS
* effectiveDateTime insert obligation2Server (2, SHALL:populate-if-known, SHALL:process)
* effectiveDateTime insert obligation2App (3, SHALL:populate-if-known, SHALL:process)
* valueCodeableConcept.coding MS
* valueCodeableConcept.coding insert obligation2Server (0, SHALL:populate-if-known, SHALL:process)
* valueCodeableConcept.coding insert obligation2App (1, SHALL:populate, SHALL:process)

Profile: SmartHealthCheckBodyHeight
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
* subject insert obligation2Server (2, SHALL:populate-if-known, SHALL:process)
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

Profile: SmartHealthCheckBodyWeight
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
* subject insert obligation2Server (2, SHALL:populate-if-known, SHALL:process)
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

Profile: SmartHealthCheckHeadCircumference 
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
* subject insert obligation2Server (0, SHALL:populate-if-known, SHALL:process)
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

Profile: SmartHealthCheckWaistCircumference
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
* subject insert obligation2Server (2, SHALL:populate-if-known, SHALL:process)
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

Profile: SmartHealthCheckHeartRate
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
* subject insert obligation2Server (2, SHALL:populate-if-known, SHALL:process)
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

