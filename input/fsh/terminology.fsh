Alias: $SCT = http://snomed.info/sct
Alias: $LOINC = http://loinc.org

Alias: $v2-0532 = http://terminology.hl7.org/CodeSystem/v2-0532
Alias: $data-empty = http://terminology.hl7.org/CodeSystem/data-absent-reason

CodeSystem: QuestionnaireItemControlExtended
Id: QuestionnaireItemControlExtended
Title: "Questionnaire Item Control Extension"
Description: "The Questionnaire Item Control Extension code system defines concepts that extend the HL7 questionnaire item control concepts in http://hl7.org/fhir/questionnaire-item-control. They represent interface control/display mechanisms interface control/display mechanisms that might be used when rendering an item in a questionnaire."

* ^experimental = false
* ^caseSensitive = true
* #context-display "context-display" "An display item rendered adjacent (horizontally or vertically) to the text of the parent item."

ValueSet: YesNoNotAskedDeclined
Id: YesNoNotAskedDeclined
Title: "Yes/No/Not Asked/Asked But Declined"
Description: "Concepts for Yes, No, Not Asked and Asked But Declined"
* ^experimental = false
* ^expansion.identifier = "urn:uuid:8eda7c3c-cc35-49fa-ac6c-c0e4f0a4e203"
* ^expansion.timestamp = "2023-09-01T11:17:57+10:00"
* ^expansion.total = 4
* ^expansion.parameter[0].name = "version"
* ^expansion.parameter[=].valueUri = "http://terminology.hl7.org/CodeSystem/data-absent-reason|5.0.0-ballot"
* ^expansion.parameter[+].name = "used-codesystem"
* ^expansion.parameter[=].valueUri = "http://terminology.hl7.org/CodeSystem/data-absent-reason|5.0.0-ballot"
* ^expansion.parameter[+].name = "version"
* ^expansion.parameter[=].valueUri = "http://terminology.hl7.org/CodeSystem/v2-0532|2.1.0"
* ^expansion.parameter[+].name = "used-codesystem"
* ^expansion.parameter[=].valueUri = "http://terminology.hl7.org/CodeSystem/v2-0532|2.1.0"
* ^expansion.contains[0].system = "http://terminology.hl7.org/CodeSystem/v2-0532"
* ^expansion.contains[=].version = "2.1.0"
* ^expansion.contains[=].code = #Y
* ^expansion.contains[=].display = "Yes"
* ^expansion.contains[+].system = "http://terminology.hl7.org/CodeSystem/v2-0532"
* ^expansion.contains[=].version = "2.1.0"
* ^expansion.contains[=].code = #N
* ^expansion.contains[=].display = "No"
* ^expansion.contains[+].system = "http://terminology.hl7.org/CodeSystem/v2-0532"
* ^expansion.contains[=].version = "2.1.0"
* ^expansion.contains[=].code = #NASK
* ^expansion.contains[=].display = "Not Asked"
* ^expansion.contains[+].system = "http://terminology.hl7.org/CodeSystem/data-absent-reason"
* ^expansion.contains[=].version = "5.0.0-ballot"
* ^expansion.contains[=].code = #asked-declined
* ^expansion.contains[=].display = "Asked But Declined"
* $v2-0532#Y "Yes"
* $v2-0532#N "No"
* $v2-0532#NASK "Not Asked"
* $data-empty#asked-declined "Asked But Declined"

ValueSet: YesNoNA
Id: YesNoNA
Title: "Yes/No/NA"
Description: "Concepts for Yes, No and Not applicable"
* ^experimental = false
* ^expansion.identifier = "urn:uuid:5baa5444-e553-4412-a08c-9ce93d3271e0"
* ^expansion.timestamp = "2023-09-01T11:16:50+10:00"
* ^expansion.total = 3
* ^expansion.parameter[0].name = "version"
* ^expansion.parameter[=].valueUri = "http://terminology.hl7.org/CodeSystem/v2-0532|2.1.0"
* ^expansion.parameter[+].name = "used-codesystem"
* ^expansion.parameter[=].valueUri = "http://terminology.hl7.org/CodeSystem/v2-0532|2.1.0"
* ^expansion.contains[0].system = "http://terminology.hl7.org/CodeSystem/v2-0532"
* ^expansion.contains[=].code = #Y
* ^expansion.contains[=].display = "Yes"
* ^expansion.contains[+].system = "http://terminology.hl7.org/CodeSystem/v2-0532"
* ^expansion.contains[=].code = #N
* ^expansion.contains[=].display = "No"
* ^expansion.contains[+].system = "http://terminology.hl7.org/CodeSystem/v2-0532"
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
* ^expansion.identifier = "urn:uuid:06bfacf3-ef16-4470-86a0-a2a22f49ff91"
* ^expansion.timestamp = "2023-09-01T11:15:01+10:00"
* ^expansion.total = 2
* ^expansion.parameter[0].name = "version"
* ^expansion.parameter[=].valueUri = "http://terminology.hl7.org/CodeSystem/v2-0532|2.1.0"
* ^expansion.parameter[+].name = "used-codesystem"
* ^expansion.parameter[=].valueUri = "http://terminology.hl7.org/CodeSystem/v2-0532|2.1.0"
* ^expansion.contains[0].system = "http://terminology.hl7.org/CodeSystem/v2-0532"
* ^expansion.contains[=].code = #Y
* ^expansion.contains[=].display = "Yes"
* ^expansion.contains[+].system = "http://terminology.hl7.org/CodeSystem/v2-0532"
* ^expansion.contains[=].code = #N
* ^expansion.contains[=].display = "No"
* $v2-0532#Y "Yes"
* $v2-0532#N "No"

Alias: $australian-indigenous-status-1 = https://healthterminologies.gov.au/fhir/CodeSystem/australian-indigenous-status-1

ValueSet: AboriginalTorresStraitIslander
Id: AboriginalTorresStraitIslander
Title: "Aboriginal and/or Torres Strait Islander"
Description: "The Aboriginal and/or Torres Strait Islander value set includes the Australian Indigenous statuses for Indigenous people."
* ^experimental = false
* ^expansion.identifier = "e2b013bd-1725-4299-a7a5-53635d42f1be"
* ^expansion.timestamp = "2022-10-20T11:38:45+10:00"
* ^expansion.total = 3
* ^expansion.offset = 0
* ^expansion.parameter[0].name = "version"
* ^expansion.parameter[=].valueUri = "https://healthterminologies.gov.au/fhir/CodeSystem/australian-indigenous-status-1|1.0.3"
* ^expansion.parameter[+].name = "count"
* ^expansion.parameter[=].valueInteger = 2147483647
* ^expansion.parameter[+].name = "offset"
* ^expansion.parameter[=].valueInteger = 0
* ^expansion.contains[0].system = "https://healthterminologies.gov.au/fhir/CodeSystem/australian-indigenous-status-1"
* ^expansion.contains[=].code = #1
* ^expansion.contains[=].display = "Aboriginal but not Torres Strait Islander origin"
* ^expansion.contains[+].system = "https://healthterminologies.gov.au/fhir/CodeSystem/australian-indigenous-status-1"
* ^expansion.contains[=].code = #2
* ^expansion.contains[=].display = "Torres Strait Islander but not Aboriginal origin"
* ^expansion.contains[+].system = "https://healthterminologies.gov.au/fhir/CodeSystem/australian-indigenous-status-1"
* ^expansion.contains[=].code = #3
* ^expansion.contains[=].display = "Both Aboriginal and Torres Strait Islander origin"
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
* ^expansion.identifier = "2809c2fa-28ec-4def-9b16-93a611d29da3"
* ^expansion.timestamp = "2022-10-20T11:42:30+10:00"
* ^expansion.total = 4
* ^expansion.offset = 0
* ^expansion.parameter[0].name = "version"
* ^expansion.parameter[=].valueUri = "http://terminology.hl7.org/CodeSystem/v3-RoleCode|2018-08-12"
* ^expansion.parameter[+].name = "version"
* ^expansion.parameter[=].valueUri = "http://terminology.hl7.org/CodeSystem/v3-NullFlavor|2018-08-12"
* ^expansion.parameter[+].name = "count"
* ^expansion.parameter[=].valueInteger = 2147483647
* ^expansion.parameter[+].name = "offset"
* ^expansion.parameter[=].valueInteger = 0
* ^expansion.contains[0].system = "http://terminology.hl7.org/CodeSystem/v3-RoleCode"
* ^expansion.contains[=].version = "2018-08-12"
* ^expansion.contains[=].code = #MTH
* ^expansion.contains[=].display = "mother"
* ^expansion.contains[+].system = "http://terminology.hl7.org/CodeSystem/v3-RoleCode"
* ^expansion.contains[=].version = "2018-08-12"
* ^expansion.contains[=].code = #FTH
* ^expansion.contains[=].display = "father"
* ^expansion.contains[+].system = "http://terminology.hl7.org/CodeSystem/v3-RoleCode"
* ^expansion.contains[=].version = "2018-08-12"
* ^expansion.contains[=].code = #GRPRN
* ^expansion.contains[=].display = "grandparent"
* ^expansion.contains[+].system = "http://terminology.hl7.org/CodeSystem/v3-NullFlavor"
* ^expansion.contains[=].version = "2018-08-12"
* ^expansion.contains[=].code = #NA
* ^expansion.contains[=].display = "not applicable"
* $v3-RoleCode#MTH
* $v3-RoleCode#FTH
* $v3-RoleCode#GRPRN
* $v3-NullFlavor#NA


ValueSet: MedicalHistory
Id: MedicalHistory
Title: "Medical History"
Description: "The Medical History value set includes values that may be used to represent medical history, operations and hospital admissions."
* ^experimental = false

* include codes from system $SCT where constraint = "^32570581000036105|Problem/Diagnosis reference set| OR ^32570141000036105|Procedure foundation reference set|"

ValueSet: MedicalHistoryShortListInfants
Id: MedicalHistoryShortListInfants
Title: "Medical History Short List for Infants"
Description: "The Medical History Short List for Infants value set includes values to represent conditions for use in a pick list for the MBS 715 Health Check for Infants."
* ^experimental = false
* ^expansion.identifier = "06bd5f41-3c10-4cdb-a304-b8127d72957f"
* ^expansion.timestamp = "2022-10-20T09:50:13+10:00"
* ^expansion.total = 13
* ^expansion.offset = 0
* ^expansion.parameter[0].name = "version"
* ^expansion.parameter[=].valueUri = "http://snomed.info/sct|http://snomed.info/sct/32506021000036107/version/20220930"
* ^expansion.parameter[+].name = "count"
* ^expansion.parameter[=].valueInteger = 2147483647
* ^expansion.parameter[+].name = "offset"
* ^expansion.parameter[=].valueInteger = 0
* ^expansion.contains[0].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #609496007
* ^expansion.contains[=].display = "Complication occurring during pregnancy"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #199745000
* ^expansion.contains[=].display = "Complication occurring during labour and delivery"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #80113008
* ^expansion.contains[=].display = "Complication of the puerperium"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #32485007
* ^expansion.contains[=].display = "Hospital admission"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #50417007
* ^expansion.contains[=].display = "Lower respiratory tract infection"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #49727002
* ^expansion.contains[=].display = "Cough"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #129127001
* ^expansion.contains[=].display = "Ear infection"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #38394007
* ^expansion.contains[=].display = "Chronic otitis media with perforation"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #78868004
* ^expansion.contains[=].display = "Chronic mucoid otitis media"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #247253001
* ^expansion.contains[=].display = "Ventilation tube in tympanic membrane"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #43381005
* ^expansion.contains[=].display = "Passive smoker"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #195528001
* ^expansion.contains[=].display = "Acute rheumatic fever"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #312591002
* ^expansion.contains[=].display = "Acute rheumatic heart disease"
* $SCT#609496007 // "Pregnancy complications"
* $SCT#199745000 // "Birth complications"
* $SCT#80113008 // "Problems after birth"  //Complication of the puerperium
* $SCT#32485007 // "Hospital admissions"  //valid medical history concept but maybe need to create a H/O Hospital admission concept if wanting a specific finding. No others are H/O
// following don't match form
* $SCT#50417007 // "Lower respiratory tract infection"
* $SCT#49727002 // "Cough"
* $SCT#129127001 // "Ear infection"
* $SCT#38394007 // "Chronic otitis media with perforation"
* $SCT#78868004 // "Chronic mucoid otitis media"
* $SCT#247253001 // "Ventilation tube in tympanic membrane"
* $SCT#43381005 // "Passive smoker"
* $SCT#195528001 // "Acute rheumatic fever"
* $SCT#312591002 // "Acute rheumatic heart disease"

ValueSet: MedicalHistoryShortListPrimarySchool
Id: MedicalHistoryShortListPrimarySchool
Title: "Medical History Short List for Primary School Children"
Description: "The Medical History Short List for Primary School Children value set includes values to represent conditions for use in a pick list for the MBS 715 Health Check for Primary School Children."
* ^experimental = false
* ^expansion.identifier = "455f4b6f-5083-4f56-8995-5ec798e47cc4"
* ^expansion.timestamp = "2022-10-20T09:54:05+10:00"
* ^expansion.total = 11
* ^expansion.offset = 0
* ^expansion.parameter[0].name = "version"
* ^expansion.parameter[=].valueUri = "http://snomed.info/sct|http://snomed.info/sct/32506021000036107/version/20220930"
* ^expansion.parameter[+].name = "count"
* ^expansion.parameter[=].valueInteger = 2147483647
* ^expansion.parameter[+].name = "offset"
* ^expansion.parameter[=].valueInteger = 0
* ^expansion.contains[0].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #50417007
* ^expansion.contains[=].display = "Lower respiratory tract infection"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #49727002
* ^expansion.contains[=].display = "Cough"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #129127001
* ^expansion.contains[=].display = "Ear infection"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #38394007
* ^expansion.contains[=].display = "Chronic otitis media with perforation"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #78868004
* ^expansion.contains[=].display = "Chronic mucoid otitis media"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #247253001
* ^expansion.contains[=].display = "Ventilation tube in tympanic membrane"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #129823000
* ^expansion.contains[=].display = "Childhood growth AND/OR development alteration"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #195528001
* ^expansion.contains[=].display = "Acute rheumatic fever"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #312591002
* ^expansion.contains[=].display = "Acute rheumatic heart disease"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #43381005
* ^expansion.contains[=].display = "Passive smoker"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #32485007
* ^expansion.contains[=].display = "Hospital admission"
// following don't match form
* $SCT#50417007 // "Lower respiratory tract infection"
* $SCT#49727002 // "Cough"
* $SCT#129127001 // "Ear infection"
* $SCT#38394007 // "Chronic otitis media with perforation"
* $SCT#78868004 // "Chronic mucoid otitis media"
* $SCT#247253001 // "Ventilation tube in tympanic membrane"
* $SCT#129823000 // "Childhood growth AND/OR development alteration"
* $SCT#195528001 // "Acute rheumatic fever"
* $SCT#312591002 // "Acute rheumatic heart disease"
* $SCT#43381005 // "Passive smoker"
* $SCT#32485007 // "Hospital admissions"  //maybe need to create a H/O Hospital admission concept as it is a procedure? No others are H/O


ValueSet: MedicalHistoryShortListAdolescents
Id: MedicalHistoryShortListAdolescents
Title: "Medical History Short List for Adolescents"
Description: "The Medical History Short List for Adolescents value set includes values to represent conditions for use in a pick list for the MBS 715 Health Check for Adolescents."
* ^experimental = false
* ^expansion.identifier = "5b0bb9f4-1ca3-47e2-bb1d-91cad5454ce4"
* ^expansion.timestamp = "2022-10-20T09:45:56+10:00"
* ^expansion.total = 11
* ^expansion.offset = 0
* ^expansion.parameter[0].name = "version"
* ^expansion.parameter[=].valueUri = "http://snomed.info/sct|http://snomed.info/sct/32506021000036107/version/20220930"
* ^expansion.parameter[+].name = "count"
* ^expansion.parameter[=].valueInteger = 2147483647
* ^expansion.parameter[+].name = "offset"
* ^expansion.parameter[=].valueInteger = 0
* ^expansion.contains[0].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #129127001
* ^expansion.contains[=].display = "Ear infection"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #300228004
* ^expansion.contains[=].display = "Hearing problem"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #195967001
* ^expansion.contains[=].display = "Asthma"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #38341003
* ^expansion.contains[=].display = "Hypertension"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #84757009
* ^expansion.contains[=].display = "Epilepsy"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #25064002
* ^expansion.contains[=].display = "Headache"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #37796009
* ^expansion.contains[=].display = "Migraine"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #73211009
* ^expansion.contains[=].display = "Diabetes mellitus"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #23685000
* ^expansion.contains[=].display = "Rheumatic heart disease"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #90708001
* ^expansion.contains[=].display = "Kidney disease"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #413307004
* ^expansion.contains[=].display = "Mental health problem"
* $SCT#129127001 // "Ear infections" 
* $SCT#300228004 // "Hearing problems"
* $SCT#195967001 // "Asthma"
* $SCT#38341003 // "High blood pressure"
* $SCT#84757009 // "Epilepsy"
* $SCT#25064002 // "Headaches"
* $SCT#37796009 // "Migraines"
* $SCT#73211009 // "Diabetes mellitus"
* $SCT#23685000 // "Rheumatic heart disease"
* $SCT#90708001 // "Kidney disease"
* $SCT#413307004 // "Mental health"


ValueSet: MedicalHistoryShortListAdultsAndOlderPeople
Id: MedicalHistoryShortListAdultsAndOlderPeople
Title: "Medical History Short List for Adults and Older People"
Description: "The Medical History Short List for Adults and Older People value set includes values to represent conditions for use in a pick list for the MBS 715 Health Check for Adults and Older People."
* ^experimental = false
* ^expansion.identifier = "1998291e-ed8a-49f2-ac11-9e6056efd7f3"
* ^expansion.timestamp = "2022-10-20T09:48:19+10:00"
* ^expansion.total = 13
* ^expansion.offset = 0
* ^expansion.parameter[0].name = "version"
* ^expansion.parameter[=].valueUri = "http://snomed.info/sct|http://snomed.info/sct/32506021000036107/version/20220930"
* ^expansion.parameter[+].name = "count"
* ^expansion.parameter[=].valueInteger = 2147483647
* ^expansion.parameter[+].name = "offset"
* ^expansion.parameter[=].valueInteger = 0
* ^expansion.contains[0].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #44054006
* ^expansion.contains[=].display = "Type 2 diabetes mellitus"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #38341003
* ^expansion.contains[=].display = "Hypertension"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #22298006
* ^expansion.contains[=].display = "Myocardial infarction"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #230690007
* ^expansion.contains[=].display = "Stroke"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #90708001
* ^expansion.contains[=].display = "Kidney disease"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #15188001
* ^expansion.contains[=].display = "Hearing loss"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #84757009
* ^expansion.contains[=].display = "Epilepsy"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #195967001
* ^expansion.contains[=].display = "Asthma"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #13645005
* ^expansion.contains[=].display = "COPD"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #23685000
* ^expansion.contains[=].display = "Rheumatic heart disease"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #66071002
* ^expansion.contains[=].display = "Hepatitis B"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #82271004
* ^expansion.contains[=].display = "Head injury"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #413307004
* ^expansion.contains[=].display = "Mental health problem"
* $SCT#44054006 // "Diabetes mellitus"
* $SCT#38341003 // "Hypertension"
* $SCT#22298006 // "Myocardial infarction" 
* $SCT#230690007 // "Stroke"
* $SCT#90708001 // "Kidney disease"
* $SCT#15188001 // "Hearing impairment"
* $SCT#84757009 // "Epilepsy"
* $SCT#195967001 // "Asthma"
* $SCT#13645005 // "COPD"
* $SCT#23685000 // "Rheumatic heart disease"
* $SCT#66071002 // "HBV"
* $SCT#82271004 // "Significant head trauma" // the concept id is "Head inujury", which is more broad in meaning
* $SCT#413307004 // "Mental health"


ValueSet: ConditionClinicalStatusCodes
Id: condition-clinical
Title: "Condition Clinical Status Codes"
Description: "Preferred value set for Condition Clinical Status."
* ^meta.profile = "http://hl7.org/fhir/StructureDefinition/shareablevalueset"
* ^extension[0].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
* ^extension[=].valueCode = #pc
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status"
* ^extension[=].valueCode = #trial-use
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-fmm"
* ^extension[=].valueInteger = 3
* ^url = "http://hl7.org/fhir/ValueSet/condition-clinical"
* ^identifier.system = "urn:ietf:rfc:3986"
* ^identifier.value = "urn:oid:2.16.840.1.113883.4.642.3.164"
* ^version = "4.3.0"
* ^status = #draft
* ^experimental = false
* ^publisher = "FHIR Project team"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://hl7.org/fhir"
* ^expansion.identifier = "5d4bed14-061a-42c4-853d-e6a624c4f483"
* ^expansion.timestamp = "2022-10-20T09:32:48+10:00"
* ^expansion.total = 6
* ^expansion.offset = 0
* ^expansion.parameter[0].name = "version"
* ^expansion.parameter[=].valueUri = "http://terminology.hl7.org/CodeSystem/condition-clinical|4.0.1"
* ^expansion.parameter[+].name = "count"
* ^expansion.parameter[=].valueInteger = 2147483647
* ^expansion.parameter[+].name = "offset"
* ^expansion.parameter[=].valueInteger = 0
* ^expansion.contains[0].system = "http://terminology.hl7.org/CodeSystem/condition-clinical"
* ^expansion.contains[=].code = #active
* ^expansion.contains[=].display = "Active"
* ^expansion.contains[+].system = "http://terminology.hl7.org/CodeSystem/condition-clinical"
* ^expansion.contains[=].code = #inactive
* ^expansion.contains[=].display = "Inactive"
* ^expansion.contains[+].system = "http://terminology.hl7.org/CodeSystem/condition-clinical"
* ^expansion.contains[=].code = #recurrence
* ^expansion.contains[=].display = "Recurrence"
* ^expansion.contains[+].system = "http://terminology.hl7.org/CodeSystem/condition-clinical"
* ^expansion.contains[=].code = #relapse
* ^expansion.contains[=].display = "Relapse"
* ^expansion.contains[+].system = "http://terminology.hl7.org/CodeSystem/condition-clinical"
* ^expansion.contains[=].code = #remission
* ^expansion.contains[=].display = "Remission"
* ^expansion.contains[+].system = "http://terminology.hl7.org/CodeSystem/condition-clinical"
* ^expansion.contains[=].code = #resolved
* ^expansion.contains[=].display = "Resolved"
* include codes from system ConditionClinicalStatusCodes


Alias: $australian-states-territories-1 = https://healthterminologies.gov.au/fhir/CodeSystem/australian-states-territories-1

ValueSet: AustralianStatesAndTerritories
Id: australian-states-territories-2
Title: "Australian States and Territories"
Description: "The Australian States and Territories value set includes values that represent the Australian states and territories."
* ^meta.profile[0] = "http://hl7.org/fhir/StructureDefinition/shareablevalueset"
* ^meta.profile[+] = "https://healthterminologies.gov.au/fhir/StructureDefinition/composed-value-set-4"
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
* ^expansion.identifier = "e9439195-c1d8-4069-a349-98c1d552a351"
* ^expansion.timestamp = "2023-06-20T04:20:58+00:00"
* ^expansion.total = 9
* ^expansion.offset = 0
* ^expansion.parameter[0].name = "version"
* ^expansion.parameter[=].valueUri = "https://healthterminologies.gov.au/fhir/CodeSystem/australian-states-territories-1|1.1.3"
* ^expansion.parameter[+].name = "count"
* ^expansion.parameter[=].valueInteger = 2147483647
* ^expansion.parameter[+].name = "offset"
* ^expansion.parameter[=].valueInteger = 0
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


ValueSet: PersonalPronouns
Id: pronouns
Title: "Personal Pronouns"
Description: "Codes that indicate the pronouns to be used when communicating with or about an individual."
* ^meta.profile = "http://hl7.org/fhir/StructureDefinition/shareablevalueset"
* ^extension[0].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
* ^extension[=].valueCode = #pa
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status"
* ^extension[=].valueCode = #trial-use
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-fmm"
* ^extension[=].valueInteger = 2
* ^url = "http://terminology.hl7.org/ValueSet/pronouns"
* ^identifier.system = "urn:ietf:rfc:3986"
* ^identifier.value = "urn:oid:2.16.840.1.113883.4.642.3.3290"
* ^version = "4.1.1"
* ^status = #draft
* ^experimental = false
* ^date = "2023-03-26T09:00:24+11:00"
* ^publisher = "HL7 Australia"
* ^contact[0].name = "HL7 Australia Patient Administration Working Group"
* ^contact[=].telecom.system = #url
* ^contact[=].telecom.value = "http://confluence.hl7australia.com/display/PA"
* ^contact[=].telecom.use = #work
* ^contact[+].name = "HL7 Australia Orders and Observations Working Group"
* ^contact[=].telecom.system = #url
* ^contact[=].telecom.value = "https://confluence.hl7australia.com/display/OO"
* ^contact[=].telecom.use = #work
* ^contact[+].name = "HL7 Australia Medications Working Group"
* ^contact[=].telecom.system = #url
* ^contact[=].telecom.value = "https://confluence.hl7australia.com/display/MED"
* ^contact[=].telecom.use = #work
* ^jurisdiction = urn:iso:std:iso:3166#AU
* ^copyright = "This material contains content from LOINC (http://loinc.org). LOINC is copyright © 1995-2020, Regenstrief Institute, Inc. and the Logical Observation Identifiers Names and Codes (LOINC) Committee and is available at no cost under the license at http://loinc.org/license. LOINC® is a registered United States trademark of Regenstrief Institute, Inc.\n\nThis value set is an R4 (4.0.1) conversion of the canonical value set published in the R5 [FHIR Extensions Pack](http://hl7.org/fhir/extensions/ValueSet-pronouns.html)."
* ^expansion.identifier = "urn:uuid:cc2618eb-542e-48a4-b2af-c55fd0548906"
* ^expansion.timestamp = "2023-08-29T10:16:17+10:00"
* ^expansion.total = 3
* ^expansion.parameter[0].name = "version"
* ^expansion.parameter[=].valueUri = "http://loinc.org|2.75"
* ^expansion.parameter[+].name = "used-codesystem"
* ^expansion.parameter[=].valueUri = "http://loinc.org|2.75"
* ^expansion.contains[0].system = "http://loinc.org"
* ^expansion.contains[=].code = #LA29518-0
* ^expansion.contains[=].display = "he/him/his/his/himself"
* ^expansion.contains[+].system = "http://loinc.org"
* ^expansion.contains[=].code = #LA29519-8
* ^expansion.contains[=].display = "she/her/her/hers/herself"
* ^expansion.contains[+].system = "http://loinc.org"
* ^expansion.contains[=].code = #LA29520-6
* ^expansion.contains[=].display = "they/them/their/theirs/themselves"
* $LOINC#LA29518-0 "he/him/his/his/himself"
* $LOINC#LA29519-8 "she/her/her/hers/herself"
* $LOINC#LA29520-6 "they/them/their/theirs/themselves"

ValueSet: GenderIdentityResponse
Id: gender-identity-response-1
Title: "Gender Identity Response"
Description: "The Gender Identity Response value set includes values that may be used to represent a response for an individual’s gender. A person's gender is a social and cultural identity, expression and experience."
* ^meta.profile[0] = "http://hl7.org/fhir/StructureDefinition/shareablevalueset"
* ^meta.profile[+] = "https://healthterminologies.gov.au/fhir/StructureDefinition/composed-value-set-4"
* ^url = "https://healthterminologies.gov.au/fhir/ValueSet/gender-identity-response-1"
* ^identifier.system = "urn:ietf:rfc:3986"
* ^identifier.value = "urn:oid:1.2.36.1.2001.1004.201.10271"
* ^version = "1.0.0"
* ^status = #active
* ^experimental = false
* ^date = "2022-09-30"
* ^publisher = "Australian Digital Health Agency"
* ^contact.telecom.system = #email
* ^contact.telecom.value = "help@digitalhealth.gov.au"
* ^copyright = "Copyright © 2022 Australian Digital Health Agency - All rights reserved. Except for the material identified below, this content is licensed under a Creative Commons Attribution 4.0 International License. See https://creativecommons.org/licenses/by/4.0/.n\n\"This resource includes SNOMED Clinical Terms™ (SNOMED CT®) which is used by permission of the International Health Terminology Standards Development Organisation (IHTSDO). All rights reserved. SNOMED CT®, was originally created by The College of American Pathologists. “SNOMED” and “SNOMED CT” are registered trademarks of the IHTSDO. \n\nThe rights to use and implement or implementation of SNOMED CT content are limited to the extent it is necessary to allow for the end use of this material.  No further rights are granted in respect of the International Release and no further use of any SNOMED CT content by any other party is permitted. \n\nThis resource includes material that is based on Australian Institute of Health and Welfare material. This resource includes material that is based on Australian Bureau of Statistics data."
* ^expansion.identifier = "urn:uuid:85c2e561-69ac-41f6-8e9e-07b3072ef48f"
* ^expansion.timestamp = "2023-08-30T10:18:47+10:00"
* ^expansion.total = 5
* ^expansion.parameter[0].name = "version"
* ^expansion.parameter[=].valueUri = "http://terminology.hl7.org/CodeSystem/data-absent-reason|5.0.0-ballot"
* ^expansion.parameter[+].name = "used-codesystem"
* ^expansion.parameter[=].valueUri = "http://terminology.hl7.org/CodeSystem/data-absent-reason|5.0.0-ballot"
* ^expansion.parameter[+].name = "version"
* ^expansion.parameter[=].valueUri = "http://snomed.info/sct|http://snomed.info/sct/32506021000036107/version/20230831"
* ^expansion.parameter[+].name = "used-codesystem"
* ^expansion.parameter[=].valueUri = "http://snomed.info/sct|http://snomed.info/sct/32506021000036107/version/20230831"
* ^expansion.contains[0].system = "http://snomed.info/sct"
* ^expansion.contains[=].version = "http://snomed.info/sct/32506021000036107/version/20230831"
* ^expansion.contains[=].code = #446151000124109
* ^expansion.contains[=].display = "Identifies as male gender"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].version = "http://snomed.info/sct/32506021000036107/version/20230831"
* ^expansion.contains[=].code = #446141000124107
* ^expansion.contains[=].display = "Identifies as female gender"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].version = "http://snomed.info/sct/32506021000036107/version/20230831"
* ^expansion.contains[=].code = #33791000087105
* ^expansion.contains[=].display = "Identifies as nonbinary gender"
* ^expansion.contains[+].system = "http://terminology.hl7.org/CodeSystem/data-absent-reason"
* ^expansion.contains[=].version = "5.0.0-ballot"
* ^expansion.contains[=].code = #unknown
* ^expansion.contains[=].display = "Unknown"
* ^expansion.contains[+].system = "http://terminology.hl7.org/CodeSystem/data-absent-reason"
* ^expansion.contains[=].version = "5.0.0-ballot"
* ^expansion.contains[=].code = #asked-declined
* ^expansion.contains[=].display = "Asked But Declined"
* $SCT#446151000124109
* $SCT#446141000124107
* $SCT#33791000087105
* DataAbsentReason#unknown
* DataAbsentReason#asked-declined

ValueSet: BiologicalSex
Id: biological-sex-1
Title: "Biological Sex"
Description: "The Biological Sex value set includes values that represent the biological sex of an individual."
* ^meta.profile[0] = "http://hl7.org/fhir/StructureDefinition/shareablevalueset"
* ^meta.profile[+] = "https://healthterminologies.gov.au/fhir/StructureDefinition/composed-value-set-4"
* ^url = "https://healthterminologies.gov.au/fhir/ValueSet/biological-sex-1"
* ^identifier.system = "urn:ietf:rfc:3986"
* ^identifier.value = "urn:oid:1.2.36.1.2001.1004.201.10198"
* ^version = "1.0.0"
* ^status = #active
* ^experimental = false
* ^date = "2020-12-31"
* ^publisher = "Australian Digital Health Agency"
* ^contact.telecom.system = #email
* ^contact.telecom.value = "help@digitalhealth.gov.au"
* ^copyright = "Copyright © 2020 Australian Digital Health Agency - All rights reserved. Except for the material identified below, this content is licensed under a Creative Commons Attribution 4.0 International License. See https://creativecommons.org/licenses/by/4.0/. \n\nThis resource includes SNOMED Clinical Terms™ (SNOMED CT®) which is used by permission of the International Health Terminology Standards Development Organisation (IHTSDO). All rights reserved. SNOMED CT®, was originally created by The College of American Pathologists. “SNOMED” and “SNOMED CT” are registered trademarks of the IHTSDO. \n\nThe rights to use and implement or implementation of SNOMED CT content are limited to the extent it is necessary to allow for the end use of this material.  No further rights are granted in respect of the International Release and no further use of any SNOMED CT content by any other party is permitted. \n\nAll copies of this resource must include this copyright statement and all information contained in this statement."
* ^expansion.identifier = "urn:uuid:e9cff1c2-8743-48cb-9bde-8f4af914544b"
* ^expansion.timestamp = "2023-08-30T10:41:59+10:00"
* ^expansion.total = 4
* ^expansion.parameter[0].name = "version"
* ^expansion.parameter[=].valueUri = "http://snomed.info/sct|http://snomed.info/sct/32506021000036107/version/20230831"
* ^expansion.parameter[+].name = "used-codesystem"
* ^expansion.parameter[=].valueUri = "http://snomed.info/sct|http://snomed.info/sct/32506021000036107/version/20230831"
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
* include codes from system $SCT
    where constraint = "^ 32570631000036107|Sex reference set|"
