Alias: $SCT = http://snomed.info/sct
Alias: $LOINC = http://loinc.org

Alias: $v2-0532 = http://terminology.hl7.org/CodeSystem/v2-0532|2.0.0
Alias: $data-empty = http://terminology.hl7.org/CodeSystem/data-absent-reason|1.0.0

CodeSystem: QuestionnaireItemControlExtended
Id: QuestionnaireItemControlExtended
Title: "Questionnaire Item Control Extension"
Description: "The Questionnaire Item Control Extension code system defines concepts that extend the HL7 questionnaire item control concepts in http://hl7.org/fhir/questionnaire-item-control. They represent interface control/display mechanisms interface control/display mechanisms that might be used when rendering an item in a questionnaire."

* ^experimental = false
* ^caseSensitive = true
* #context-display "context-display" "Display item is rendered adjacent (horizontally or vertically) to the text of the parent item."

ValueSet: YesNoNotAskedDeclined
Id: YesNoNotAskedDeclined
Title: "Yes/No/Not Asked/Asked But Declined"
Description: "Concepts for Yes, No, Not Asked and Asked But Declined"
* ^experimental = false
* ^expansion.identifier = "urn:uuid:9c63f3f7-c471-451d-aad3-d84bca7a3c8c"
* ^expansion.timestamp = "2025-09-18T16:28:54+10:00"
* ^expansion.total = 4
* ^expansion.offset = 0
* ^expansion.parameter[0].name = "count"
* ^expansion.parameter[=].valueInteger = 1000
* ^expansion.parameter[+].name = "offset"
* ^expansion.parameter[=].valueInteger = 0
* ^expansion.parameter[+].name = "excludeNested"
* ^expansion.parameter[=].valueBoolean = false
* ^expansion.parameter[+].name = "used-codesystem"
* ^expansion.parameter[=].valueUri = "http://terminology.hl7.org/CodeSystem/v2-0532|2.0.0"
* ^expansion.parameter[+].name = "used-codesystem"
* ^expansion.parameter[=].valueUri = "http://terminology.hl7.org/CodeSystem/data-absent-reason|1.0.0"
* ^expansion.contains[0].system = "http://terminology.hl7.org/CodeSystem/v2-0532"
* ^expansion.contains[=].code = #Y
* ^expansion.contains[=].display = "Yes"
* ^expansion.contains[+].system = "http://terminology.hl7.org/CodeSystem/v2-0532"
* ^expansion.contains[=].code = #N
* ^expansion.contains[=].display = "No"
* ^expansion.contains[+].system = "http://terminology.hl7.org/CodeSystem/v2-0532"
* ^expansion.contains[=].code = #NASK
* ^expansion.contains[=].display = "Not Asked"
* ^expansion.contains[+].system = "http://terminology.hl7.org/CodeSystem/data-absent-reason"
* ^expansion.contains[=].code = #asked-declined
* ^expansion.contains[=].display = "Asked But Declined"
* $v2-0532#Y "Yes"
* $v2-0532#N "No"
* $v2-0532#NASK "Not Asked"
* $data-empty#asked-declined "Asked But Declined"

CodeSystem: HealthChecksExpandedYesNoIndicatorSupplement
Id: HealthChecksExpandedYesNoIndicatorSupplement
Title: "Health Checks Expanded Yes No Indicator Supplement"
Description: "The Health Checks Expanded Yes No Indicator Supplement defines consumer friendly terms for the HL7 expandedYes-NoIndicator code system for use in the health check Questionnaire."
* ^experimental = false
* ^content = #supplement
* ^supplements = $v2-0532
* #NA "N/A"

ValueSet: YesNoNA
Id: YesNoNA
Title: "Yes/No/NA"
Description: "Concepts for Yes, No and Not applicable"
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/valueset-supplement"
* ^extension[=].valueCanonical = "https://smartforms.csiro.au/ig/CodeSystem/HealthChecksExpandedYesNoIndicatorSupplement|0.3.0"
* ^experimental = false
* ^expansion.identifier = "urn:uuid:e9020f5b-3df2-4fcb-9f8f-9aa20ef6f181"
* ^expansion.timestamp = "2025-10-29T16:30:17+10:00"
* ^expansion.total = 3
* ^expansion.parameter[0].name = "used-supplement"
* ^expansion.parameter[=].valueUri = "https://smartforms.csiro.au/ig/CodeSystem/HealthChecksExpandedYesNoIndicatorSupplement|0.3.0"
* ^expansion.parameter[+].name = "used-codesystem"
* ^expansion.parameter[=].valueUri = "http://terminology.hl7.org/CodeSystem/v2-0532|2.0.0"
* ^expansion.parameter[+].name = "version"
* ^expansion.parameter[=].valueUri = "http://terminology.hl7.org/CodeSystem/v2-0532|2.0.0"
* ^expansion.parameter[+].name = "warning-draft"
* ^expansion.parameter[=].valueUri = "https://smartforms.csiro.au/ig/CodeSystem/HealthChecksExpandedYesNoIndicatorSupplement|0.3.0"
* ^expansion.parameter[+].name = "warning-draft"
* ^expansion.parameter[=].valueUri = "https://smartforms.csiro.au/ig/ValueSet/YesNoNA|0.3.0"
* ^expansion.contains[0].system = "http://terminology.hl7.org/CodeSystem/v2-0532"
* ^expansion.contains[=].version = "2.0.0"
* ^expansion.contains[=].code = #Y
* ^expansion.contains[=].display = "Yes"
* ^expansion.contains[+].system = "http://terminology.hl7.org/CodeSystem/v2-0532"
* ^expansion.contains[=].version = "2.0.0"
* ^expansion.contains[=].code = #N
* ^expansion.contains[=].display = "No"
* ^expansion.contains[+].system = "http://terminology.hl7.org/CodeSystem/v2-0532"
* ^expansion.contains[=].version = "2.0.0"
* ^expansion.contains[=].code = #NA
* ^expansion.contains[=].display = "N/A"
* $v2-0532#Y "Yes"
* $v2-0532#N "No"
* $v2-0532#NA "N/A"


ValueSet: YesNo
Id: YesNo
Title: "Yes/No"
Description: "Concepts for Yes and No"
* ^experimental = false
* ^expansion.identifier = "urn:uuid:5d9dbf1e-e156-4961-bb02-051dfc831832"
* ^expansion.timestamp = "2025-09-18T16:28:54+10:00"
* ^expansion.total = 2
* ^expansion.offset = 0
* ^expansion.parameter[0].name = "count"
* ^expansion.parameter[=].valueInteger = 1000
* ^expansion.parameter[+].name = "offset"
* ^expansion.parameter[=].valueInteger = 0
* ^expansion.parameter[+].name = "excludeNested"
* ^expansion.parameter[=].valueBoolean = false
* ^expansion.parameter[+].name = "used-codesystem"
* ^expansion.parameter[=].valueUri = "http://terminology.hl7.org/CodeSystem/v2-0532|2.0.0"
* ^expansion.contains[0].system = "http://terminology.hl7.org/CodeSystem/v2-0532"
* ^expansion.contains[=].code = #Y
* ^expansion.contains[=].display = "Yes"
* ^expansion.contains[+].system = "http://terminology.hl7.org/CodeSystem/v2-0532"
* ^expansion.contains[=].code = #N
* ^expansion.contains[=].display = "No"
* $v2-0532#Y "Yes"
* $v2-0532#N "No"

Alias: $australian-indigenous-status-1 = https://healthterminologies.gov.au/fhir/CodeSystem/australian-indigenous-status-1|1.0.5

CodeSystem: HealthChecksAustralianIndigenousStatusSupplement
Id: HealthChecksAustralianIndigenousStatusSupplement
Title: "Health Checks Australian Indigenous Status Supplement"
Description: "The Health Checks Australian Indigenous Status Supplement defines consumer friendly terms for the Australian Indigenous Status code system for use in the health check Questionnaire."
* ^experimental = false
* ^content = #supplement
* ^supplements = $australian-indigenous-status-1
* #1 "Aboriginal"
* #2 "Torres Strait Islander"
* #3 "Aboriginal and Torres Strait Islander"

ValueSet: AboriginalTorresStraitIslander
Id: AboriginalTorresStraitIslander
Title: "Aboriginal and/or Torres Strait Islander"
Description: "The Aboriginal and/or Torres Strait Islander value set includes the Australian Indigenous statuses for Indigenous people."
* ^experimental = false
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/valueset-supplement"
* ^extension[=].valueCanonical = "https://smartforms.csiro.au/ig/CodeSystem/HealthChecksAustralianIndigenousStatusSupplement|0.3.0"
* ^expansion.identifier = "urn:uuid:99d3428a-7ac4-47ff-b2b7-e50ccf5e1b49"
* ^expansion.timestamp = "2025-10-29T16:34:14+10:00"
* ^expansion.total = 3
* ^expansion.parameter[0].name = "used-supplement"
* ^expansion.parameter[=].valueUri = "https://smartforms.csiro.au/ig/CodeSystem/HealthChecksAustralianIndigenousStatusSupplement|0.3.0"
* ^expansion.parameter[+].name = "used-codesystem"
* ^expansion.parameter[=].valueUri = "https://healthterminologies.gov.au/fhir/CodeSystem/australian-indigenous-status-1|1.0.5"
* ^expansion.parameter[+].name = "version"
* ^expansion.parameter[=].valueUri = "https://healthterminologies.gov.au/fhir/CodeSystem/australian-indigenous-status-1|1.0.5"
* ^expansion.parameter[+].name = "warning-draft"
* ^expansion.parameter[=].valueUri = "https://smartforms.csiro.au/ig/ValueSet/AboriginalTorresStraitIslander|0.3.0"
* ^expansion.parameter[+].name = "warning-draft"
* ^expansion.parameter[=].valueUri = "https://smartforms.csiro.au/ig/CodeSystem/HealthChecksAustralianIndigenousStatusSupplement|0.3.0"
* ^expansion.contains[0].system = "https://healthterminologies.gov.au/fhir/CodeSystem/australian-indigenous-status-1"
* ^expansion.contains[=].version = "1.0.5"
* ^expansion.contains[=].code = #1
* ^expansion.contains[=].display = "Aboriginal"
* ^expansion.contains[+].system = "https://healthterminologies.gov.au/fhir/CodeSystem/australian-indigenous-status-1"
* ^expansion.contains[=].version = "1.0.5"
* ^expansion.contains[=].code = #2
* ^expansion.contains[=].display = "Torres Strait Islander"
* ^expansion.contains[+].system = "https://healthterminologies.gov.au/fhir/CodeSystem/australian-indigenous-status-1"
* ^expansion.contains[=].version = "1.0.5"
* ^expansion.contains[=].code = #3
* ^expansion.contains[=].display = "Aboriginal and Torres Strait Islander"
* $australian-indigenous-status-1#1 "Aboriginal"
* $australian-indigenous-status-1#2 "Torres Strait Islander"
* $australian-indigenous-status-1#3 "Aboriginal and Torres Strait Islander"

Alias: $v3-RoleCode = http://terminology.hl7.org/CodeSystem/v3-RoleCode
Alias: $v3-NullFlavor = http://terminology.hl7.org/CodeSystem/v3-NullFlavor

ValueSet: PrimaryCarerParentGrandparent
Id: PrimaryCarerParentGrandparent
Title: "Primary Carer Of Parent Or Grandparent"
Description: "The Primary Carer Of Parent Or Grandparent value set includes values that can indicate whether a primary carer is one of the parents or a grandparent."
* ^experimental = false

* ^expansion.identifier = "urn:uuid:f8e7efc2-94d6-403e-9e40-3a3a4e9fffb4"
* ^expansion.timestamp = "2025-05-01T10:00:56+10:00"
* ^expansion.total = 4
* ^expansion.offset = 0
* ^expansion.parameter[0].name = "displayLanguage"
* ^expansion.parameter[=].valueCode = #en-US
* ^expansion.parameter[+].name = "count"
* ^expansion.parameter[=].valueInteger = 1000
* ^expansion.parameter[+].name = "offset"
* ^expansion.parameter[=].valueInteger = 0
* ^expansion.parameter[+].name = "excludeNested"
* ^expansion.parameter[=].valueBoolean = false
* ^expansion.parameter[+].name = "used-codesystem"
* ^expansion.parameter[=].valueUri = "http://terminology.hl7.org/CodeSystem/v3-RoleCode|3.0.0"
* ^expansion.parameter[+].name = "used-codesystem"
* ^expansion.parameter[=].valueUri = "http://terminology.hl7.org/CodeSystem/v3-NullFlavor|3.0.0"
* ^expansion.contains[0].system = "http://terminology.hl7.org/CodeSystem/v3-RoleCode"
* ^expansion.contains[=].code = #MTH
* ^expansion.contains[=].display = "mother"
* ^expansion.contains[+].system = "http://terminology.hl7.org/CodeSystem/v3-RoleCode"
* ^expansion.contains[=].code = #FTH
* ^expansion.contains[=].display = "father"
* ^expansion.contains[+].system = "http://terminology.hl7.org/CodeSystem/v3-RoleCode"
* ^expansion.contains[=].code = #GRPRN
* ^expansion.contains[=].display = "grandparent"
* ^expansion.contains[+].system = "http://terminology.hl7.org/CodeSystem/v3-NullFlavor"
* ^expansion.contains[=].code = #NA
* ^expansion.contains[=].display = "not applicable"
* $v3-RoleCode#MTH
* $v3-RoleCode#FTH
* $v3-RoleCode#GRPRN
* $v3-NullFlavor#NA

ValueSet: ClinicalCondition
Id: clinical-condition-1
Title: "Clinical Condition"
Description: "The Clinical Condition value set includes values that cover a broad range of clinical concepts to support the representation of conditions, including problems, diagnoses and disorders."

* ^meta.profile[0] = "http://hl7.org/fhir/StructureDefinition/shareablevalueset"
* ^meta.profile[+] = "https://healthterminologies.gov.au/fhir/StructureDefinition/composed-value-set-4"
* ^url = "https://healthterminologies.gov.au/fhir/ValueSet/clinical-condition-1"
* ^identifier.system = "urn:ietf:rfc:3986"
* ^identifier.value = "urn:oid:1.2.36.1.2001.1004.201.10035"
* ^version = "1.0.2"
* ^status = #active
* ^experimental = false
* ^date = "2020-05-31"
* ^publisher = "Australian Digital Health Agency"
* ^contact.telecom.system = #email
* ^contact.telecom.value = "help@digitalhealth.gov.au"
* ^copyright = "Copyright © 2018 Australian Digital Health Agency - All rights reserved. Except for the material identified below, this content is licensed under a Creative Commons Attribution 4.0 International License. See https://creativecommons.org/licenses/by/4.0/. \n\nThis resource includes SNOMED Clinical Terms™ (SNOMED CT®) which is used by permission of the International Health Terminology Standards Development Organisation (IHTSDO). All rights reserved. SNOMED CT®, was originally created by The College of American Pathologists. “SNOMED” and “SNOMED CT” are registered trademarks of the IHTSDO. \n\nThe rights to use and implement or implementation of SNOMED CT content are limited to the extent it is necessary to allow for the end use of this material.  No further rights are granted in respect of the International Release and no further use of any SNOMED CT content by any other party is permitted. \n\nAll copies of this resource must include this copyright statement and all information contained in this statement."
* include codes from system $SCT where concept in "32570581000036105"

Alias: $administrative-gender = http://hl7.org/fhir/administrative-gender

ValueSet: AdministrativeGender
Id: administrative-gender
Title: "AdministrativeGender"
Description: "The gender of a person used for administrative purposes."

* ^url = "http://hl7.org/fhir/ValueSet/administrative-gender"
* ^contact.telecom[0].system = #url
* ^contact.telecom[=].value = "http://hl7.org/fhir"
* ^contact.telecom[+].system = #email
* ^contact.telecom[=].value = "fhir@lists.hl7.org"
* ^copyright = "Copyright © 2011+ HL7. Licensed under Creative Commons \"No Rights Reserved\"."
* ^date = "2019-11-01T09:29:23+11:00"
* ^experimental = false
* ^extension[0].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
* ^extension[=].valueCode = #pa
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status"
* ^extension[=].valueCode = #normative
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-fmm"
* ^extension[=].valueInteger = 5
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-normative-version"
* ^extension[=].valueCode = #4.0.0
* ^identifier.system = "urn:ietf:rfc:3986"
* ^identifier.value = "urn:oid:2.16.840.1.113883.4.642.3.1"
* ^immutable = true
* ^meta.profile = "http://hl7.org/fhir/StructureDefinition/shareablevalueset"
* ^publisher = "HL7 (FHIR Project)"
* ^status = #active
* ^version = "4.0.1"

* ^expansion.identifier = "urn:uuid:31c9098a-778c-4de6-9c2b-4f1e2db26179"
* ^expansion.timestamp = "2025-05-01T10:00:55+10:00"
* ^expansion.total = 4
* ^expansion.offset = 0
* ^expansion.parameter[0].name = "displayLanguage"
* ^expansion.parameter[=].valueCode = #en-US
* ^expansion.parameter[+].name = "count"
* ^expansion.parameter[=].valueInteger = 1000
* ^expansion.parameter[+].name = "offset"
* ^expansion.parameter[=].valueInteger = 0
* ^expansion.parameter[+].name = "excludeNested"
* ^expansion.parameter[=].valueBoolean = false
* ^expansion.parameter[+].name = "used-codesystem"
* ^expansion.parameter[=].valueUri = "http://hl7.org/fhir/administrative-gender|4.0.1"
* ^expansion.contains[0].system = "http://hl7.org/fhir/administrative-gender"
* ^expansion.contains[=].code = #male
* ^expansion.contains[=].display = "Male"
* ^expansion.contains[+].system = "http://hl7.org/fhir/administrative-gender"
* ^expansion.contains[=].code = #female
* ^expansion.contains[=].display = "Female"
* ^expansion.contains[+].system = "http://hl7.org/fhir/administrative-gender"
* ^expansion.contains[=].code = #other
* ^expansion.contains[=].display = "Other"
* ^expansion.contains[+].system = "http://hl7.org/fhir/administrative-gender"
* ^expansion.contains[=].code = #unknown
* ^expansion.contains[=].display = "Unknown"
* include codes from system $administrative-gender

ValueSet: ConditionClinicalStatusCodes
Id: condition-clinical
Title: "Condition Clinical Status Codes"
Description: "Preferred value set for Condition Clinical Status."
* ^extension[0].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
* ^extension[=].valueCode = #pc
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status"
* ^extension[=].valueCode = #trial-use
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-fmm"
* ^extension[=].valueInteger = 3
* ^url = "http://hl7.org/fhir/ValueSet/condition-clinical"
* ^identifier.system = "urn:ietf:rfc:3986"
* ^identifier.value = "urn:oid:2.16.840.1.113883.4.642.3.164"
* ^version = "4.0.1"
* ^status = #draft
* ^experimental = false
* ^publisher = "FHIR Project team"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://hl7.org/fhir"
* ^copyright = "Copyright © 2011+ HL7. Licensed under Creative Commons \"No Rights Reserved\"."
* ^date = "2019-11-01T09:29:23+11:00"

* ^expansion.identifier = "urn:uuid:7b100d21-fde9-4fd8-bded-80f345db777d"
* ^expansion.timestamp = "2025-05-01T10:00:56+10:00"
* ^expansion.total = 7
* ^expansion.offset = 0
* ^expansion.parameter[0].name = "displayLanguage"
* ^expansion.parameter[=].valueCode = #en-US
* ^expansion.parameter[+].name = "count"
* ^expansion.parameter[=].valueInteger = 1000
* ^expansion.parameter[+].name = "offset"
* ^expansion.parameter[=].valueInteger = 0
* ^expansion.parameter[+].name = "excludeNested"
* ^expansion.parameter[=].valueBoolean = false
* ^expansion.parameter[+].name = "used-codesystem"
* ^expansion.parameter[=].valueUri = "http://terminology.hl7.org/CodeSystem/condition-clinical|3.0.0"
* ^expansion.contains[0].system = "http://terminology.hl7.org/CodeSystem/condition-clinical"
* ^expansion.contains[=].code = #active
* ^expansion.contains[=].display = "Active"
* ^expansion.contains[=].contains[0].system = "http://terminology.hl7.org/CodeSystem/condition-clinical"
* ^expansion.contains[=].contains[=].code = #recurrence
* ^expansion.contains[=].contains[=].display = "Recurrence"
* ^expansion.contains[=].contains[+].system = "http://terminology.hl7.org/CodeSystem/condition-clinical"
* ^expansion.contains[=].contains[=].code = #relapse
* ^expansion.contains[=].contains[=].display = "Relapse"
* ^expansion.contains[+].system = "http://terminology.hl7.org/CodeSystem/condition-clinical"
* ^expansion.contains[=].code = #inactive
* ^expansion.contains[=].display = "Inactive"
* ^expansion.contains[=].contains[0].system = "http://terminology.hl7.org/CodeSystem/condition-clinical"
* ^expansion.contains[=].contains[=].code = #remission
* ^expansion.contains[=].contains[=].display = "Remission"
* ^expansion.contains[=].contains[+].system = "http://terminology.hl7.org/CodeSystem/condition-clinical"
* ^expansion.contains[=].contains[=].code = #resolved
* ^expansion.contains[=].contains[=].display = "Resolved"
* ^expansion.contains[+].system = "http://terminology.hl7.org/CodeSystem/condition-clinical"
* ^expansion.contains[=].code = #unknown
* ^expansion.contains[=].display = "Unknown"
* include codes from system http://terminology.hl7.org/CodeSystem/condition-clinical

Alias: $australian-states-territories-1 = https://healthterminologies.gov.au/fhir/CodeSystem/australian-states-territories-1

ValueSet: AustralianStatesAndTerritories
Id: australian-states-territories-2
Title: "Australian States and Territories"
Description: "The Australian States and Territories value set includes values that represent the Australian states and territories."
* ^meta.profile[0] = "http://hl7.org/fhir/StructureDefinition/shareablevalueset"
* ^meta.profile[+] = "https://healthterminologies.gov.au/fhir/StructureDefinition/composed-value-set-4"
* ^url = "https://healthterminologies.gov.au/fhir/ValueSet/australian-states-territories-2"
* ^identifier.system = "urn:ietf:rfc:3986"
* ^identifier.value = "urn:oid:1.2.36.1.2001.1004.201.10026"
* ^version = "2.0.2"
* ^status = #active
* ^experimental = false
* ^date = "2020-05-31"
* ^publisher = "Australian Digital Health Agency"
* ^contact.telecom.system = #email
* ^contact.telecom.value = "help@digitalhealth.gov.au"
* ^copyright = "Copyright © 2018 Australian Digital Health Agency - All rights reserved. Except for the material identified below, this content is licensed under a Creative Commons Attribution 4.0 International License. See https://creativecommons.org/licenses/by/4.0/. \n\nThis resource includes material that is based on Australian Institute of Health and Welfare material. \n\nAll copies of this resource must include this copyright statement and all information contained in this statement."

* ^expansion.identifier = "urn:uuid:148e9412-a321-4a6f-b911-7e7908be82af"
* ^expansion.timestamp = "2025-05-01T10:00:57+10:00"
* ^expansion.total = 9
* ^expansion.offset = 0
* ^expansion.parameter[0].name = "displayLanguage"
* ^expansion.parameter[=].valueCode = #en-US
* ^expansion.parameter[+].name = "count"
* ^expansion.parameter[=].valueInteger = 1000
* ^expansion.parameter[+].name = "offset"
* ^expansion.parameter[=].valueInteger = 0
* ^expansion.parameter[+].name = "excludeNested"
* ^expansion.parameter[=].valueBoolean = false
* ^expansion.parameter[+].name = "used-codesystem"
* ^expansion.parameter[=].valueUri = "https://healthterminologies.gov.au/fhir/CodeSystem/australian-states-territories-1|1.1.3"
* ^expansion.contains[0].system = "https://healthterminologies.gov.au/fhir/CodeSystem/australian-states-territories-1"
* ^expansion.contains[=].code = #ACT
* ^expansion.contains[=].display = "Australian Capital Territory"
* ^expansion.contains[+].system = "https://healthterminologies.gov.au/fhir/CodeSystem/australian-states-territories-1"
* ^expansion.contains[=].code = #NSW
* ^expansion.contains[=].display = "New South Wales"
* ^expansion.contains[+].system = "https://healthterminologies.gov.au/fhir/CodeSystem/australian-states-territories-1"
* ^expansion.contains[=].code = #NT
* ^expansion.contains[=].display = "Northern Territory"
* ^expansion.contains[+].system = "https://healthterminologies.gov.au/fhir/CodeSystem/australian-states-territories-1"
* ^expansion.contains[=].code = #OTHER
* ^expansion.contains[=].display = "Other territories"
* ^expansion.contains[+].system = "https://healthterminologies.gov.au/fhir/CodeSystem/australian-states-territories-1"
* ^expansion.contains[=].code = #QLD
* ^expansion.contains[=].display = "Queensland"
* ^expansion.contains[+].system = "https://healthterminologies.gov.au/fhir/CodeSystem/australian-states-territories-1"
* ^expansion.contains[=].code = #SA
* ^expansion.contains[=].display = "South Australia"
* ^expansion.contains[+].system = "https://healthterminologies.gov.au/fhir/CodeSystem/australian-states-territories-1"
* ^expansion.contains[=].code = #TAS
* ^expansion.contains[=].display = "Tasmania"
* ^expansion.contains[+].system = "https://healthterminologies.gov.au/fhir/CodeSystem/australian-states-territories-1"
* ^expansion.contains[=].code = #VIC
* ^expansion.contains[=].display = "Victoria"
* ^expansion.contains[+].system = "https://healthterminologies.gov.au/fhir/CodeSystem/australian-states-territories-1"
* ^expansion.contains[=].code = #WA
* ^expansion.contains[=].display = "Western Australia"
* $australian-states-territories-1#ACT
* $australian-states-territories-1#NSW
* $australian-states-territories-1#NT
* $australian-states-territories-1#OTHER
* $australian-states-territories-1#QLD
* $australian-states-territories-1#SA
* $australian-states-territories-1#TAS
* $australian-states-territories-1#VIC
* $australian-states-territories-1#WA


ValueSet: GenderIdentityResponse
Id: gender-identity-response-1
Title: "Gender Identity Response"
Description: "The Gender Identity Response value set includes values that may be used to represent a response for an individual's gender. A person's gender is a social and cultural identity, expression and experience."
* ^url = "https://healthterminologies.gov.au/fhir/ValueSet/gender-identity-response-1"
* ^identifier.system = "urn:ietf:rfc:3986"
* ^identifier.value = "urn:oid:1.2.36.1.2001.1004.201.10271"
* ^version = "1.1.0"
* ^status = #active
* ^experimental = false
* ^date = "2024-02-29"
* ^publisher = "Australian Digital Health Agency"
* ^contact.telecom.system = #email
* ^contact.telecom.value = "help@digitalhealth.gov.au"
* ^copyright = "Copyright © 2022 Australian Digital Health Agency - All rights reserved. Except for the material identified below, this content is licensed under a Creative Commons Attribution 4.0 International License. See https://creativecommons.org/licenses/by/4.0/.\n\n\"This resource includes SNOMED Clinical Terms™ (SNOMED CT®) which is used by permission of the International Health Terminology Standards Development Organisation (IHTSDO). All rights reserved. SNOMED CT®, was originally created by The College of American Pathologists. “SNOMED” and “SNOMED CT” are registered trademarks of the IHTSDO. \n\nThe rights to use and implement or implementation of SNOMED CT content are limited to the extent it is necessary to allow for the end use of this material.  No further rights are granted in respect of the International Release and no further use of any SNOMED CT content by any other party is permitted. \n\nThis resource includes material that is based on Australian Institute of Health and Welfare material. This resource includes material that is based on Australian Bureau of Statistics data. \n\nThis resource also includes all or a portion of material from the HL7 Terminology (THO). THO is copyright ©1989+ Health Level Seven International and is made available under the CC0 designation. For more licensing information see: https://terminology.hl7.org/license."
* ^expansion.identifier = "urn:uuid:5cd85856-1ce5-43f2-afff-063f748c2c7d"
* ^expansion.timestamp = "2025-10-28T16:39:25+10:00"
* ^expansion.offset = 0
* ^expansion.parameter[0].name = "displayLanguage"
* ^expansion.parameter[=].valueCode = #en
* ^expansion.parameter[+].name = "count"
* ^expansion.parameter[=].valueInteger = 1000
* ^expansion.parameter[+].name = "offset"
* ^expansion.parameter[=].valueInteger = 0
* ^expansion.parameter[+].name = "excludeNested"
* ^expansion.parameter[=].valueBoolean = false
* ^expansion.parameter[+].name = "system-version"
* ^expansion.parameter[=].valueUri = "http://snomed.info/sct|http://snomed.info/sct/32506021000036107"
* ^expansion.parameter[+].name = "used-codesystem"
* ^expansion.parameter[=].valueUri = "http://snomed.info/sct|http://snomed.info/sct/32506021000036107/version/20251031"
* ^expansion.parameter[+].name = "version"
* ^expansion.parameter[=].valueUri = "http://snomed.info/sct|http://snomed.info/sct/32506021000036107/version/20251031"
* ^expansion.parameter[+].name = "used-codesystem"
* ^expansion.parameter[=].valueUri = "http://terminology.hl7.org/CodeSystem/data-absent-reason|1.0.0"
* ^expansion.contains[0].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #446151000124109
* ^expansion.contains[=].display = "Identifies as male gender"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #446141000124107
* ^expansion.contains[=].display = "Identifies as female gender"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #33791000087105
* ^expansion.contains[=].display = "Identifies as nonbinary gender"
* ^expansion.contains[+].system = "http://terminology.hl7.org/CodeSystem/data-absent-reason"
* ^expansion.contains[=].code = #unknown
* ^expansion.contains[=].display = "Unknown"
* ^expansion.contains[+].system = "http://terminology.hl7.org/CodeSystem/data-absent-reason"
* ^expansion.contains[=].code = #asked-declined
* ^expansion.contains[=].display = "Asked But Declined"
* ^expansion.contains[+].system = "http://terminology.hl7.org/CodeSystem/data-absent-reason"
* ^expansion.contains[=].code = #not-asked
* ^expansion.contains[=].display = "Not Asked"
* $SCT#446151000124109
* $SCT#446141000124107
* $SCT#33791000087105
* DataAbsentReason#unknown
* DataAbsentReason#asked-declined
* DataAbsentReason#not-asked

ValueSet: AustralianPronouns
Id: australian-pronouns-1
Title: "Australian Pronouns"
Description: "The Australian Pronouns value set includes values that indicate the pronouns to be used when communicating with or about an individual."
* ^url = "https://healthterminologies.gov.au/fhir/ValueSet/australian-pronouns-1"
* ^identifier.system = "urn:ietf:rfc:3986"
* ^identifier.value = "urn:oid:1.2.36.1.2001.1004.201.10284"
* ^version = "1.0.0"
* ^status = #active
* ^experimental = false
* ^date = "2024-02-29"
* ^publisher = "Australian Digital Health Agency"
* ^contact.telecom.system = #email
* ^contact.telecom.value = "help@digitalhealth.gov.au"
* ^copyright = "Copyright © 2024 Australian Digital Health Agency - All rights reserved. Except for the material identified below, this content is licensed under a Creative Commons Attribution 4.0 International License. See https://creativecommons.org/licenses/by/4.0/. \n\nThis material contains content from LOINC (http://loinc.org). LOINC is copyright 1995-2024, Regenstrief Institute, Inc. and the Logical Observation Identifiers Names and Codes (LOINC) Committee and is available at no cost under the license at http://loinc.org/license. LOINC® is a registered United States trademark of Regenstrief Institute, Inc.\n\nThis material contains information which is protected by copyright. You may download, display, print and reproduce any material for your personal, non-commercial use or use within your organisation subject to the following terms and conditions: \n\nThis resource also includes all or a portion of material from the HL7 Terminology (THO). THO is copyright ©1989+ Health Level Seven International and is made available under the CC0 designation. For more licensing information see: https://terminology.hl7.org/license."

* ^expansion.identifier = "urn:uuid:1bc98e8c-511f-4014-a4d9-a48a8db0923d"
* ^expansion.timestamp = "2025-05-01T10:00:56+10:00"
* ^expansion.total = 7
* ^expansion.offset = 0
* ^expansion.parameter[0].name = "displayLanguage"
* ^expansion.parameter[=].valueCode = #en-US
* ^expansion.parameter[+].name = "count"
* ^expansion.parameter[=].valueInteger = 1000
* ^expansion.parameter[+].name = "offset"
* ^expansion.parameter[=].valueInteger = 0
* ^expansion.parameter[+].name = "excludeNested"
* ^expansion.parameter[=].valueBoolean = false
* ^expansion.parameter[+].name = "used-codesystem"
* ^expansion.parameter[=].valueUri = "http://loinc.org|2.80"
* ^expansion.parameter[+].name = "version"
* ^expansion.parameter[=].valueUri = "http://loinc.org|2.80"
* ^expansion.parameter[+].name = "used-codesystem"
* ^expansion.parameter[=].valueUri = "http://terminology.hl7.org/CodeSystem/data-absent-reason|1.0.0"
* ^expansion.contains[0].system = "http://loinc.org"
* ^expansion.contains[=].code = #LA29518-0
* ^expansion.contains[=].display = "he/him/his/his/himself"
* ^expansion.contains[+].system = "http://loinc.org"
* ^expansion.contains[=].code = #LA29519-8
* ^expansion.contains[=].display = "she/her/her/hers/herself"
* ^expansion.contains[+].system = "http://loinc.org"
* ^expansion.contains[=].code = #LA29520-6
* ^expansion.contains[=].display = "they/them/their/theirs/themselves"
* ^expansion.contains[+].system = "http://terminology.hl7.org/CodeSystem/data-absent-reason"
* ^expansion.contains[=].code = #unknown
* ^expansion.contains[=].display = "Unknown"
* ^expansion.contains[+].system = "http://terminology.hl7.org/CodeSystem/data-absent-reason"
* ^expansion.contains[=].code = #asked-declined
* ^expansion.contains[=].display = "Asked But Declined"
* ^expansion.contains[+].system = "http://terminology.hl7.org/CodeSystem/data-absent-reason"
* ^expansion.contains[=].code = #not-asked
* ^expansion.contains[=].display = "Not Asked"
* ^expansion.contains[+].system = "http://terminology.hl7.org/CodeSystem/data-absent-reason"
* ^expansion.contains[=].code = #asked-unknown
* ^expansion.contains[=].display = "Asked But Unknown"
* $LOINC#LA29518-0 "he/him/his/his/himself"
* $LOINC#LA29519-8 "she/her/her/hers/herself"
* $LOINC#LA29520-6 "they/them/their/theirs/themselves"
* DataAbsentReason#unknown
* DataAbsentReason#asked-declined
* DataAbsentReason#not-asked
* DataAbsentReason#asked-unknown

ValueSet: BiologicalSex
Id: biological-sex-1
Title: "Biological Sex"
Description: "The Biological Sex value set includes values that represent the biological sex of an individual."
* ^meta.profile[0] = "http://hl7.org/fhir/StructureDefinition/shareablevalueset"
* ^meta.profile[+] = "https://healthterminologies.gov.au/fhir/StructureDefinition/composed-value-set-4"
* ^url = "https://healthterminologies.gov.au/fhir/ValueSet/biological-sex-1"
* ^identifier.system = "urn:ietf:rfc:3986"
* ^identifier.value = "urn:oid:1.2.36.1.2001.1004.201.10198"
* ^version = "1.1.0"
* ^status = #active
* ^experimental = false
* ^date = "2024-11-30"
* ^publisher = "Australian Digital Health Agency"
* ^contact.telecom.system = #email
* ^contact.telecom.value = "help@digitalhealth.gov.au"
* ^copyright = "Copyright © 2020 Australian Digital Health Agency - All rights reserved. Except for the material identified below, this content is licensed under a Creative Commons Attribution 4.0 International License. See https://creativecommons.org/licenses/by/4.0/. \n\nThis resource includes SNOMED Clinical Terms™ (SNOMED CT®) which is used by permission of the International Health Terminology Standards Development Organisation (IHTSDO). All rights reserved. SNOMED CT®, was originally created by The College of American Pathologists. “SNOMED” and “SNOMED CT” are registered trademarks of the IHTSDO. \n\nThe rights to use and implement or implementation of SNOMED CT content are limited to the extent it is necessary to allow for the end use of this material.  No further rights are granted in respect of the International Release and no further use of any SNOMED CT content by any other party is permitted. \n\nAll copies of this resource must include this copyright statement and all information contained in this statement."
* ^expansion.identifier = "urn:uuid:3491de0c-49f2-4913-8909-a63c92d14c9d"
* ^expansion.timestamp = "2025-10-28T16:39:14+10:00"
* ^expansion.offset = 0
* ^expansion.parameter[0].name = "displayLanguage"
* ^expansion.parameter[=].valueCode = #en
* ^expansion.parameter[+].name = "count"
* ^expansion.parameter[=].valueInteger = 1000
* ^expansion.parameter[+].name = "offset"
* ^expansion.parameter[=].valueInteger = 0
* ^expansion.parameter[+].name = "excludeNested"
* ^expansion.parameter[=].valueBoolean = false
* ^expansion.parameter[+].name = "system-version"
* ^expansion.parameter[=].valueUri = "http://snomed.info/sct|http://snomed.info/sct/32506021000036107"
* ^expansion.parameter[+].name = "used-codesystem"
* ^expansion.parameter[=].valueUri = "http://snomed.info/sct|http://snomed.info/sct/32506021000036107/version/20251031"
* ^expansion.parameter[+].name = "version"
* ^expansion.parameter[=].valueUri = "http://snomed.info/sct|http://snomed.info/sct/32506021000036107/version/20251031"
* ^expansion.parameter[+].name = "used-codesystem"
* ^expansion.parameter[=].valueUri = "http://terminology.hl7.org/CodeSystem/data-absent-reason|1.0.0"
* ^expansion.contains[0].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #248152002
* ^expansion.contains[=].display = "Female"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #32570681000036106
* ^expansion.contains[=].display = "Indeterminate sex"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #32570691000036108
* ^expansion.contains[=].display = "Intersex"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #248153007
* ^expansion.contains[=].display = "Male"
* ^expansion.contains[+].system = "http://terminology.hl7.org/CodeSystem/data-absent-reason"
* ^expansion.contains[=].code = #asked-unknown
* ^expansion.contains[=].display = "Asked But Unknown"
* ^expansion.contains[+].system = "http://terminology.hl7.org/CodeSystem/data-absent-reason"
* ^expansion.contains[=].code = #unknown
* ^expansion.contains[=].display = "Unknown"
* ^expansion.contains[+].system = "http://terminology.hl7.org/CodeSystem/data-absent-reason"
* ^expansion.contains[=].code = #asked-declined
* ^expansion.contains[=].display = "Asked But Declined"
* ^expansion.contains[+].system = "http://terminology.hl7.org/CodeSystem/data-absent-reason"
* ^expansion.contains[=].code = #not-asked
* ^expansion.contains[=].display = "Not Asked"
* include codes from system $SCT where constraint = "^ 32570631000036107|Sex reference set|"
* DataAbsentReason#asked-unknown
* DataAbsentReason#unknown
* DataAbsentReason#asked-declined
* DataAbsentReason#not-asked


CodeSystem: HealthChecksSCTSupplement
Id: HealthChecksSCTSupplement
Title: "SNOMED CT Supplement for Aboriginal and Torres Strait Islander Health Check"
Description: "The SNOMED CT Supplement for Aboriginal and Torres Strait Islander Health Check code system supplement defines consumer friendly terms for use in the health check Questionnaire."
* ^experimental = false
* ^content = #supplement
* ^supplements = "http://snomed.info/sct|http://snomed.info/sct/32506021000036107/version/20251031"
* #736595007 "Declined"
* #171154002 "Not required"
* #171155001 "Up to date"
* #48031000119106 "Quit >12 months"
* #735128000 "Quit <12 months"
* #266919005 "Never smoked"
* #77176002 "Current smoker"
* #8517006 "Ex-smoker"
* #16090371000119103 "Exposure to second hand tobacco smoke"
* #394872000 "Wants to quit"
* #713914004 "Other tobacco use"


ValueSet: CervicalScreeningStatus
Id: CervicalScreeningStatus-1
Title: "Cervical Screening Status"
Description: "The Cervical Screening Status value set includes values that can be used to represent the status of an individual's participation in a cervical screening program."
* ^experimental = false
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/valueset-supplement"
* ^extension[=].valueCanonical = "https://smartforms.csiro.au/ig/CodeSystem/HealthChecksSCTSupplement|0.3.0"
* $SCT|http://snomed.info/sct/32506021000036107/version/20251031#736595007 "Declined"
* $SCT|http://snomed.info/sct/32506021000036107/version/20251031#410527000 "Offered" // a better concept is required
* $SCT|http://snomed.info/sct/32506021000036107/version/20251031#171154002 "Not required"
* $SCT|http://snomed.info/sct/32506021000036107/version/20251031#171155001 "Up to date"
* ^expansion.identifier = "urn:uuid:66e5ae5e-d111-45a0-b6b1-e433ec6edbe7"
* ^expansion.timestamp = "2025-10-29T09:42:14+10:00"
* ^expansion.parameter[0].name = "used-codesystem"
* ^expansion.parameter[=].valueUri = "http://snomed.info/sct|http://snomed.info/sct/32506021000036107/version/20251031"
* ^expansion.parameter[+].name = "version"
* ^expansion.parameter[=].valueUri = "http://snomed.info/sct|http://snomed.info/sct/32506021000036107/version/20251031"
* ^expansion.parameter[+].name = "used-supplement"
* ^expansion.parameter[=].valueUri = "https://smartforms.csiro.au/ig/CodeSystem/HealthChecksSCTSupplement|0.3.0"
* ^expansion.parameter[+].name = "warning-draft"
* ^expansion.parameter[=].valueUri = "https://smartforms.csiro.au/ig/CodeSystem/HealthChecksSCTSupplement|0.3.0"
* ^expansion.parameter[+].name = "warning-draft"
* ^expansion.parameter[=].valueUri = "https://smartforms.csiro.au/ig/ValueSet/CervicalScreeningStatus-1|0.3.0"
* ^expansion.contains[0].system = "http://snomed.info/sct"
* ^expansion.contains[=].version = "http://snomed.info/sct/32506021000036107/version/20251031"
* ^expansion.contains[=].code = #736595007
* ^expansion.contains[=].display = "Declined"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].version = "http://snomed.info/sct/32506021000036107/version/20251031"
* ^expansion.contains[=].code = #410527000
* ^expansion.contains[=].display = "Offered"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].version = "http://snomed.info/sct/32506021000036107/version/20251031"
* ^expansion.contains[=].code = #171154002
* ^expansion.contains[=].display = "Not required"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].version = "http://snomed.info/sct/32506021000036107/version/20251031"
* ^expansion.contains[=].code = #171155001
* ^expansion.contains[=].display = "Up to date"

ValueSet: SmokingQuitStatus
Id: SmokingQuitStatus-1
Title: "Smoking Quit Status"
Description: "The Smoking Quit Status value set includes values that can indicate how long ago an individual quit smoking."
* ^experimental = false
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/valueset-supplement"
* ^extension[=].valueCanonical = "https://smartforms.csiro.au/ig/CodeSystem/HealthChecksSCTSupplement|0.3.0"
* ^expansion.identifier = "urn:uuid:ee67ad1e-7faa-4fe8-ab3e-1995de4fcd26"
* ^expansion.timestamp = "2025-10-29T09:44:35+10:00"
* ^expansion.parameter[0].name = "used-codesystem"
* ^expansion.parameter[=].valueUri = "http://snomed.info/sct|http://snomed.info/sct/32506021000036107/version/20251031"
* ^expansion.parameter[+].name = "version"
* ^expansion.parameter[=].valueUri = "http://snomed.info/sct|http://snomed.info/sct/32506021000036107/version/20251031"
* ^expansion.parameter[+].name = "used-supplement"
* ^expansion.parameter[=].valueUri = "https://smartforms.csiro.au/ig/CodeSystem/HealthChecksSCTSupplement|0.3.0"
* ^expansion.parameter[+].name = "warning-draft"
* ^expansion.parameter[=].valueUri = "https://smartforms.csiro.au/ig/CodeSystem/HealthChecksSCTSupplement|0.3.0"
* ^expansion.parameter[+].name = "warning-draft"
* ^expansion.parameter[=].valueUri = "https://smartforms.csiro.au/ig/ValueSet/SmokingQuitStatus-1|0.3.0"
* ^expansion.contains[0].system = "http://snomed.info/sct"
* ^expansion.contains[=].version = "http://snomed.info/sct/32506021000036107/version/20251031"
* ^expansion.contains[=].code = #48031000119106
* ^expansion.contains[=].display = "Quit >12 months"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].version = "http://snomed.info/sct/32506021000036107/version/20251031"
* ^expansion.contains[=].code = #735128000
* ^expansion.contains[=].display = "Quit <12 months"
* $SCT|http://snomed.info/sct/32506021000036107/version/20251031#48031000119106 "Quit >12 months"
* $SCT|http://snomed.info/sct/32506021000036107/version/20251031#735128000 "Quit <12 months"


ValueSet: TobaccoUseStatus
Id: TobaccoUseStatus-1
Title: "Tobacco Use Status"
Description: "The Tobacco Use Status value set includes values that may be used to represent an individual's current tobacco use and exposure status."
* ^experimental = false
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/valueset-supplement"
* ^extension[=].valueCanonical = "https://smartforms.csiro.au/ig/CodeSystem/HealthChecksSCTSupplement|0.3.0"
* ^expansion.identifier = "urn:uuid:a7d04dc0-077c-4744-8e21-da8ce4cba135"
* ^expansion.timestamp = "2025-10-29T09:46:14+10:00"
* ^expansion.parameter[0].name = "used-codesystem"
* ^expansion.parameter[=].valueUri = "http://snomed.info/sct|http://snomed.info/sct/32506021000036107/version/20251031"
* ^expansion.parameter[+].name = "version"
* ^expansion.parameter[=].valueUri = "http://snomed.info/sct|http://snomed.info/sct/32506021000036107/version/20251031"
* ^expansion.parameter[+].name = "used-supplement"
* ^expansion.parameter[=].valueUri = "https://smartforms.csiro.au/ig/CodeSystem/HealthChecksSCTSupplement|0.3.0"
* ^expansion.parameter[+].name = "warning-draft"
* ^expansion.parameter[=].valueUri = "https://smartforms.csiro.au/ig/CodeSystem/HealthChecksSCTSupplement|0.3.0"
* ^expansion.parameter[+].name = "warning-draft"
* ^expansion.parameter[=].valueUri = "https://smartforms.csiro.au/ig/ValueSet/TobaccoUseStatus-1|0.3.0"
* ^expansion.contains[0].system = "http://snomed.info/sct"
* ^expansion.contains[=].version = "http://snomed.info/sct/32506021000036107/version/20251031"
* ^expansion.contains[=].code = #266919005
* ^expansion.contains[=].display = "Never smoked"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].version = "http://snomed.info/sct/32506021000036107/version/20251031"
* ^expansion.contains[=].code = #77176002
* ^expansion.contains[=].display = "Current smoker"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].version = "http://snomed.info/sct/32506021000036107/version/20251031"
* ^expansion.contains[=].code = #8517006
* ^expansion.contains[=].display = "Ex-smoker"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].version = "http://snomed.info/sct/32506021000036107/version/20251031"
* ^expansion.contains[=].code = #16090371000119103
* ^expansion.contains[=].display = "Exposure to second hand tobacco smoke"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].version = "http://snomed.info/sct/32506021000036107/version/20251031"
* ^expansion.contains[=].code = #394872000
* ^expansion.contains[=].display = "Wants to quit"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].version = "http://snomed.info/sct/32506021000036107/version/20251031"
* ^expansion.contains[=].code = #713914004
* ^expansion.contains[=].display = "Other tobacco use"
* $SCT|http://snomed.info/sct/32506021000036107/version/20251031#266919005 "Never smoked"
* $SCT|http://snomed.info/sct/32506021000036107/version/20251031#77176002 "Current smoker"
* $SCT|http://snomed.info/sct/32506021000036107/version/20251031#8517006 "Ex-smoker"
* $SCT|http://snomed.info/sct/32506021000036107/version/20251031#16090371000119103 "Exposure to second hand tobacco smoke"
* $SCT|http://snomed.info/sct/32506021000036107/version/20251031#394872000 "Wants to quit"
* $SCT|http://snomed.info/sct/32506021000036107/version/20251031#713914004 "Other tobacco use"

ValueSet: AustralianMedicinesTerminologyVaccine
Id: amt-vaccine-1
Title: "Australian Medicines Terminology Vaccine"
Description: "The Australian Medicines Terminology (AMT) Vaccine value set includes AMT product concepts that may be used to record a vaccine product."
* ^meta.profile[0] = "http://hl7.org/fhir/StructureDefinition/shareablevalueset"
* ^meta.profile[+] = "https://healthterminologies.gov.au/fhir/StructureDefinition/composed-value-set-4"
* ^url = "https://healthterminologies.gov.au/fhir/ValueSet/amt-vaccine-1"
* ^identifier.system = "urn:ietf:rfc:3986"
* ^identifier.value = "urn:oid:1.2.36.1.2001.1004.201.10042"
* ^version = "1.0.2"
* ^status = #active
* ^experimental = false
* ^date = "2020-05-31"
* ^publisher = "Australian Digital Health Agency"
* ^contact.telecom.system = #email
* ^contact.telecom.value = "help@digitalhealth.gov.au"
* ^copyright = "Copyright © 2018 Australian Digital Health Agency - All rights reserved. Except for the material identified below, this content is licensed under a Creative Commons Attribution 4.0 International License. See https://creativecommons.org/licenses/by/4.0/. \n\n This resource includes SNOMED Clinical Terms™ (SNOMED CT®) which is used by permission of the International Health Terminology Standards Development Organisation (IHTSDO). All rights reserved. SNOMED CT®, was originally created by The College of American Pathologists. “SNOMED” and “SNOMED CT” are registered trademarks of the IHTSDO. \n\nThe rights to use and implement or implementation of SNOMED CT content are limited to the extent it is necessary to allow for the end use of this material.  No further rights are granted in respect of the International Release and no further use of any SNOMED CT content by any other party is permitted. \n\nAll copies of this resource must include this copyright statement and all information contained in this statement."
* include codes from system $SCT where concept in "1156291000168106"

ValueSet: SmartHealthChecksMedicineProducts
Id: smart-health-checks-medicine-products
Title: "Smart Health Checks Medicine Products"
Description: "The Smart Health Checks Medicine Products value set includes Australian Medicines Terminology (AMT) product concepts that may be used for the identification of a medicine with form, ingredient and unit of measure details."

* ^experimental = false
* include codes from system http://snomed.info/sct|http://snomed.info/sct/32506021000036107 where constraint = "^ 929360081000036101|Medicinal product pack reference set| OR ^ 929360071000036103|Medicinal product unit of use reference set| OR ^ 929360041000036105|Trade product pack reference set| OR ^ 929360031000036100|Trade product unit of use reference set| OR ^ 929360051000036108|Containered trade product pack reference set|"

Alias: $v3-ObservationValue = http://terminology.hl7.org/CodeSystem/v3-ObservationValue

ValueSet: MedicationReasonTaken
Id: medication-reason-taken-1
Title: "Medication Reason Taken"
Description: "The Medication Reason Taken value set includes values that identify a reason why a medication has been or is being taken."
* ^meta.profile[0] = "http://hl7.org/fhir/StructureDefinition/shareablevalueset"
* ^meta.profile[+] = "https://healthterminologies.gov.au/fhir/StructureDefinition/composed-value-set-4"
* ^url = "https://healthterminologies.gov.au/fhir/ValueSet/medication-reason-taken-1"
* ^identifier.system = "urn:ietf:rfc:3986"
* ^identifier.value = "urn:oid:1.2.36.1.2001.1004.201.10048"
* ^version = "1.1.0"
* ^status = #active
* ^experimental = false
* ^date = "2020-07-31"
* ^publisher = "Australian Digital Health Agency"
* ^contact.telecom.system = #email
* ^contact.telecom.value = "help@digitalhealth.gov.au"
* ^copyright = "Copyright © 2020 Australian Digital Health Agency - All rights reserved. Except for the material identified below, this content is licensed under a Creative Commons Attribution 4.0 International License. See https://creativecommons.org/licenses/by/4.0/. \n\nThis resource includes SNOMED Clinical Terms™ (SNOMED CT®) which is used by permission of the International Health Terminology Standards Development Organisation (IHTSDO). All rights reserved. SNOMED CT®, was originally created by The College of American Pathologists. “SNOMED” and “SNOMED CT” are registered trademarks of the IHTSDO. \n\nThe rights to use and implement or implementation of SNOMED CT content are limited to the extent it is necessary to allow for the end use of this material.  No further rights are granted in respect of the International Release and no further use of any SNOMED CT content by any other party is permitted.\n\nAll copies of this resource must include this copyright statement and all information contained in this statement."
* include codes from system $SCT
    where constraint = "^32570581000036105|Problem/Diagnosis reference set| OR ^1184831000168105|Drug prophylaxis reference set| OR <<399097000|Administration of anaesthesia| OR 169443000|Preventive procedure|"

ValueSet: HeartRhythm
Id: heart-rhythm-1
Title: "Heart Rhythm"
Description: "The Heart Rhythm value set includes values that may be used to represent the heart rhythm of an individual."
* ^experimental = false
* ^expansion.identifier = "urn:uuid:7743ad1f-02f2-4977-b7a4-ea993b57023b"
* ^expansion.timestamp = "2025-10-28T16:39:30+10:00"
* ^expansion.offset = 0
* ^expansion.parameter[0].name = "displayLanguage"
* ^expansion.parameter[=].valueCode = #en
* ^expansion.parameter[+].name = "count"
* ^expansion.parameter[=].valueInteger = 1000
* ^expansion.parameter[+].name = "offset"
* ^expansion.parameter[=].valueInteger = 0
* ^expansion.parameter[+].name = "excludeNested"
* ^expansion.parameter[=].valueBoolean = false
* ^expansion.parameter[+].name = "system-version"
* ^expansion.parameter[=].valueUri = "http://snomed.info/sct|http://snomed.info/sct/32506021000036107"
* ^expansion.parameter[+].name = "used-codesystem"
* ^expansion.parameter[=].valueUri = "http://snomed.info/sct|http://snomed.info/sct/32506021000036107/version/20251031"
* ^expansion.parameter[+].name = "version"
* ^expansion.parameter[=].valueUri = "http://snomed.info/sct|http://snomed.info/sct/32506021000036107/version/20251031"
* ^expansion.contains[0].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #933506231000036108
* ^expansion.contains[=].display = "Regular heart rhythm"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #361137007
* ^expansion.contains[=].display = "Irregular heart rhythm"
* $SCT#933506231000036108 "Regular heart rhythm"
* $SCT#361137007 "Irregular heart rhythm"

ValueSet: AllergyIntoleranceClinicalStatusMinimal
Id: AllergyIntoleranceClinicalStatusMinimal
Title: "Allergy Intolerance Clinical Status Minimal"
Description: "This value set includes the minimal set of codes to represent the clinical status of an allergy intolerance (i.e., active and inactive)."
* ^experimental = false
* ^expansion.identifier = "urn:uuid:40f0c59e-9fa5-4322-bc1d-5fde644a076c"
* ^expansion.timestamp = "2025-08-25T15:52:50+10:00"
* ^expansion.total = 2
* ^expansion.offset = 0
* ^expansion.parameter[0].name = "count"
* ^expansion.parameter[=].valueInteger = 1000
* ^expansion.parameter[+].name = "offset"
* ^expansion.parameter[=].valueInteger = 0
* ^expansion.parameter[+].name = "excludeNested"
* ^expansion.parameter[=].valueBoolean = false
* ^expansion.parameter[+].name = "used-codesystem"
* ^expansion.parameter[=].valueUri = "http://terminology.hl7.org/CodeSystem/allergyintolerance-clinical|1.0.0"
* ^expansion.contains[0].system = "http://terminology.hl7.org/CodeSystem/allergyintolerance-clinical"
* ^expansion.contains[=].code = #active
* ^expansion.contains[=].display = "Active"
* ^expansion.contains[+].system = "http://terminology.hl7.org/CodeSystem/allergyintolerance-clinical"
* ^expansion.contains[=].code = #inactive
* ^expansion.contains[=].display = "Inactive"
* http://terminology.hl7.org/CodeSystem/allergyintolerance-clinical#active
* http://terminology.hl7.org/CodeSystem/allergyintolerance-clinical#inactive

ValueSet: MedicationStatementStatusLimited
Id: MedicationStatementStatusLimited
Title: "Medication Statement Status Limited"
Description: "This value set includes the minimal set of codes to represent the status of a medication statement (i.e., active, completed, stopped and on-hold)."
* ^experimental = false
* ^expansion.identifier = "urn:uuid:59fe5ac1-65bf-4606-8c2a-0a55fba1d064"
* ^expansion.timestamp = "2025-08-25T15:53:32+10:00"
* ^expansion.total = 4
* ^expansion.offset = 0
* ^expansion.parameter[0].name = "count"
* ^expansion.parameter[=].valueInteger = 1000
* ^expansion.parameter[+].name = "offset"
* ^expansion.parameter[=].valueInteger = 0
* ^expansion.parameter[+].name = "excludeNested"
* ^expansion.parameter[=].valueBoolean = false
* ^expansion.parameter[+].name = "used-codesystem"
* ^expansion.parameter[=].valueUri = "http://hl7.org/fhir/CodeSystem/medication-statement-status|4.0.1"
* ^expansion.contains[0].system = "http://hl7.org/fhir/CodeSystem/medication-statement-status"
* ^expansion.contains[=].code = #active
* ^expansion.contains[=].display = "Active"
* ^expansion.contains[+].system = "http://hl7.org/fhir/CodeSystem/medication-statement-status"
* ^expansion.contains[=].code = #completed
* ^expansion.contains[=].display = "Completed"
* ^expansion.contains[+].system = "http://hl7.org/fhir/CodeSystem/medication-statement-status"
* ^expansion.contains[=].code = #stopped
* ^expansion.contains[=].display = "Stopped"
* ^expansion.contains[+].system = "http://hl7.org/fhir/CodeSystem/medication-statement-status"
* ^expansion.contains[=].code = #on-hold
* ^expansion.contains[=].display = "On Hold"
* http://hl7.org/fhir/CodeSystem/medication-statement-status#active
* http://hl7.org/fhir/CodeSystem/medication-statement-status#completed
* http://hl7.org/fhir/CodeSystem/medication-statement-status#stopped
* http://hl7.org/fhir/CodeSystem/medication-statement-status#on-hold

CodeSystem: SHCPatchElementPathCodes
Id: SHCPatchElementPathCodes
Title: "Smart Health Checks Patch Element Path Codes"
Description: "The Smart Health Checks Patch Element Path Codes code system defines concepts that identify element paths where the patch operation is to be performed for Smart Health Checks."

* ^experimental = false
* ^caseSensitive = true
* #AllergyIntolerance "AllergyIntolerance"
* #AllergyIntolerance.note[0] "AllergyIntolerance.note[0]"
* #Condition "Condition"
* #MedicationStatement "MedicationStatement"
* #MedicationStatement.note[0] "MedicationStatement.note[0]"
* #MedicationStatement.dosage[0] "MedicationStatement.dosage[0]"

CodeSystem: SHCPatchElementNameCodes
Id: SHCPatchElementNameCodes
Title: "Smart Health Checks Patch Element Name Codes"
Description: "The Smart Health Checks Patch Element Name Codes code system defines concepts that identify element names that are the target of a patch operation for Smart Health Checks."

* ^experimental = false
* ^caseSensitive = true
* #clinicalStatus "clinicalStatus"
* #text "text"
* #note "note"
* #abatement "abatement"
* #status "status"
* #dosage "dosage"

ValueSet: SHCPatchPath
Id: SHCPatchPath
Title: "Smart Health Checks Patch Path"
Description: "The Smart Health Checks Patch Path value set includes values that can be used to identify the element paths that are the target of a patch operation for Smart Health Checks."
* ^experimental = false
* include codes from system SHCPatchElementPathCodes

ValueSet: SHCPatchAllergyIntoleranceElementPath
Id: SHCPatchAllergyIntoleranceElementPath
Title: "Smart Health Checks Patch AllergyIntolerance Element Path"
Description: "The Smart Health Checks Patch AllergyIntolerance Element Path value set includes values that can be used to identify the element paths in the AllergyIntolerance resource where the patch operation is to be performed for Smart Health Checks."
* ^experimental = false
* SHCPatchElementPathCodes#AllergyIntolerance
* SHCPatchElementPathCodes#AllergyIntolerance.note[0]

ValueSet: SHCPatchAllergyIntoleranceElementName
Id: SHCPatchAllergyIntoleranceElementName
Title: "Smart Health Checks Patch AllergyIntolerance Element Name"
Description: "The Smart Health Checks Patch AllergyIntolerance Element Name value set includes values that can be used to identify the element names in the AllergyIntolerance resource that are the target of a patch operation for Smart Health Checks."
* ^experimental = false
* SHCPatchElementNameCodes#clinicalStatus
* SHCPatchElementNameCodes#text
* SHCPatchElementNameCodes#note

ValueSet: SHCPatchConditionElementPath
Id: SHCPatchConditionElementPath
Title: "Smart Health Checks Patch Condition Element Path"
Description: "The Smart Health Checks Patch Condition Element Path value set includes values that can be used to identify the element paths in the Condition resource where the patch operation is to be performed for Smart Health Checks."
* ^experimental = false
* SHCPatchElementPathCodes#Condition

ValueSet: SHCPatchConditionElementName
Id: SHCPatchConditionElementName
Title: "Smart Health Checks Patch Condition Element Name"
Description: "The Smart Health Checks Patch Condition Element Name value set includes values that can be used to identify the element names in the Condition resource that are the target of a patch operation for Smart Health Checks."
* ^experimental = false
* SHCPatchElementNameCodes#clinicalStatus
* SHCPatchElementNameCodes#abatement

ValueSet: SHCPatchMedicationStatementElementPath
Id: SHCPatchMedicationStatementElementPath
Title: "Smart Health Checks Patch MedicationStatement Element Path"
Description: "The Smart Health Checks Patch MedicationStatement Element Path value set includes values that can be used to identify the element paths in the MedicationStatement resource where the patch operation is to be performed for Smart Health Checks."
* ^experimental = false
* SHCPatchElementPathCodes#MedicationStatement
* SHCPatchElementPathCodes#MedicationStatement.dosage[0]
* SHCPatchElementPathCodes#MedicationStatement.note[0]


ValueSet: SHCPatchMedicationStatementElementName
Id: SHCPatchMedicationStatementElementName
Title: "Smart Health Checks Patch MedicationStatement Element Name"
Description: "The Smart Health Checks Patch MedicationStatement Element Name value set includes values that can be used to identify the element names in the MedicationStatement resource that are the target of a patch operation for Smart Health Checks."
* ^experimental = false
* SHCPatchElementNameCodes#status
* SHCPatchElementNameCodes#text
* SHCPatchElementNameCodes#dosage
* SHCPatchElementNameCodes#note

CodeSystem: QuestionnaireRepopulationBehaviorCodes
Id: QuestionnaireRepopulationBehaviorCodes
Title: "Questionnaire Repopulation Behavior Codes"
Description: "The Questionnaire Repopulation Behavior Codes code system defines concepts that describe the repopulation behaviour that can be applied to the initial expression of a Questionnaire item."

* ^experimental = false
* ^caseSensitive = true
* #manual "Manual" "The item can be repopulated manually by the user. The initial expression will be evaluated and the item populated with the result."

ValueSet: QuestionnaireRepopulationBehavior
Id: QuestionnaireRepopulationBehavior
Title: "Questionnaire Repopulation Behavior"
Description: "The Questionnaire Repopulation Behavior value set includes values that can indicate how a Questionnaire item's initial expression can be re-evaluated and the item repopulated."
* ^experimental = false
* include codes from system QuestionnaireRepopulationBehaviorCodes
