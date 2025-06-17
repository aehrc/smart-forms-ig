
Alias: $LNC = http://loinc.org
Alias: $SCT = http://snomed.info/sct
Alias: $UCUM = http://unitsofmeasure.org
Alias: $obligation = http://hl7.org/fhir/StructureDefinition/obligation

Alias: $au-core-patient = http://hl7.org.au/fhir/core/StructureDefinition/au-core-patient


RuleSet: obligation(producerCode, consumerCode)
* ^extension[$obligation][+].extension[code].valueCode = #"{producerCode}"
* ^extension[$obligation][=].extension[actor].valueCanonical = "https://smartforms.csiro.au/ig/ActorDefinition/SmartHealthCheckProducer"
* ^extension[$obligation][+].extension[code].valueCode = #"{consumerCode}"
* ^extension[$obligation][=].extension[actor].valueCanonical = "https://smartforms.csiro.au/ig//ActorDefinition/SmartHealthCheckConsumer"

RuleSet: obligationConsumer(consumerCode)
* ^extension[$obligation][+].extension[code].valueCode = #"{consumerCode}"
* ^extension[$obligation][=].extension[actor].valueCanonical = "https://smartforms.csiro.au/ig//ActorDefinition/SmartHealthCheckConsumer"

RuleSet: obligationProducer(producerCode)
* ^extension[$obligation][+].extension[code].valueCode = #"{producerCode}"
* ^extension[$obligation][=].extension[actor].valueCanonical = "https://smartforms.csiro.au/ig//ActorDefinition/SmartHealthCheckConsumer"


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
Id: SmartHealthCheckHeartRhythm
Title: "Smart Health Check Heart Rhythm"
Description: "This profile sets the minimum expectations for an Observation resource to record heart rhythm observations. It is used to represent heart rhythm data captured during a First Nations Health Check that can be used to record the observation in a clinical record."

* . ^short = "Heart Rhythm"
* . ^definition = "Measurement of a patient's heart rhytym at a point in time."
* . ^comment = "Heart rhythm observation using a LOINC code, a SNOMED CT code and a metric UCUM unit of measure."
* obeys shc-heartrhythm-01
* status MS
* category MS
* category ^slicing.discriminator[0].type = #value
* category ^slicing.discriminator[=].path = "coding.code"
* category ^slicing.discriminator[+].type = #value
* category ^slicing.discriminator[=].path = "coding.system"
* category ^slicing.ordered = false
* category ^slicing.rules = #open
* category contains vitalSignsCategory 1..1 MS
* category[vitalSignsCategory] = http://terminology.hl7.org/CodeSystem/observation-category#vital-signs (exactly) 
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
* code.coding[loincHeartRhythmCode].system 1..1
* code.coding[loincHeartRhythmCode].system = "http://loinc.org" (exactly)
* code.coding[loincHeartRhythmCode].code 1..1
* code.coding[loincHeartRhythmCode].code = #8884-9 (exactly)
* code.coding[snomedHeartRhythmCode].system 1..1
* code.coding[snomedHeartRhythmCode].system = "http://snomed.info/sct" (exactly)
* code.coding[snomedHeartRhythmCode].code 1..1
* code.coding[snomedHeartRhythmCode].code = #364074009 (exactly)
* subject 1.. MS
* subject only Reference($au-core-patient)
* effective[x] 1.. MS
* effective[x] only dateTime
* effective[x] obeys shc-heartrhythm-02
* effective[x] ^short = "Date, and optionally time, the observation was performed"
* effective[x] ^definition = "Date, and optionally time, the observation was performed."
* effective[x] ^condition = "shc-heartrhythm-02"
* value[x] only CodeableConcept
* value[x] MS
* value[x] from HeartRythym (extensible)
* value[x] ^condition = "shc-heartrhythm-01"
* dataAbsentReason MS
* dataAbsentReason ^condition = "shc-heartrhythm-01"

Extension: TemplateExtractExtensionExtended
Parent: http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract
Id: TemplateExtractExtensionExtended
Title: "Template Extract Extension Extended"
Description: "This extension is used to extend the Template Extract Extension to include additional information."

* extension contains type 0..1
* extension[type] ^short = "Patch resource type"
* extension[type] ^definition = "When templating a Parameters resource, this is the kind of resource to be patched. It is used to help populate the request url."
* extension[type].value[x] 1..
* extension[type].value[x] only code
* extension[type].value[x] from ResourceType (required)