Alias: $SCT = http://snomed.info/sct

ValueSet: YesNoNA
Id: YesNoNA
Title: "Yes No NA"
Description: "Concepts for Yes, No and Not applicable"

* http://terminology.hl7.org/CodeSystem/v2-0136#Y "Yes"
* http://terminology.hl7.org/CodeSystem/v2-0136#N "No"
* http://terminology.hl7.org/CodeSystem/v3-NullFlavor#NA "not applicable"

ValueSet: YesNo
Id: YesNo
Title: "Yes No"
Description: "Concepts for Yes and No"

* http://terminology.hl7.org/CodeSystem/v2-0136#Y "Yes"
* http://terminology.hl7.org/CodeSystem/v2-0136#N "No"

ValueSet: MedicalHistory
Id: MedicalHistory
Title: "Medical History"
Description: "The Medical History value set includes values that may be used to represent medical history, operations and hospital admissions."

* include codes from system $SCT where constraint = "^32570581000036105|Problem/Diagnosis reference set| OR ^32570141000036105|Procedure foundation reference set|"

ValueSet: MedicalHistoryShortListInfants
Id: MedicalHistoryShortListInfants
Title: "Medical History Short List for Infants"
Description: "The Medical History Short List for Infants value set includes values to represent conditions for use in a pick list for the MBS 715 Health Check for Infants."

* $SCT#609496007 "Pregnancy complications"
* $SCT#199745000 "Birth complications"
* $SCT#80113008 "Problems after birth"  //Complication of the puerperium
* $SCT#32485007 "Hospital admissions"  //maybe need to create a H/O Hospital admission concept as it is a procedure? No others are H/O
// following don't match form
* $SCT#50417007 "Lower respiratory tract infection"
* $SCT#49727002 "Cough"
* $SCT#129127001 "Ear infection"
* $SCT#38394007 "Chronic otitis media with perforation"
* $SCT#78868004 "Chronic mucoid otitis media"
* $SCT#247253001 "Ventilation tube in tympanic membrane"
* $SCT#43381005 "Passive smoker"
* $SCT#195528001 "Acute rheumatic fever"
* $SCT#312591002 "Acute rheumatic heart disease"

ValueSet: MedicalHistoryShortListPrimarySchool
Id: MedicalHistoryShortListPrimarySchool
Title: "Medical History Short List for Primary School Children"
Description: "The Medical History Short List for Primary School Children value set includes values to represent conditions for use in a pick list for the MBS 715 Health Check for Primary School Children."

// following don't match form
* $SCT#50417007 "Lower respiratory tract infection"
* $SCT#49727002 "Cough"
* $SCT#129127001 "Ear infection"
* $SCT#38394007 "Chronic otitis media with perforation"
* $SCT#78868004 "Chronic mucoid otitis media"
* $SCT#247253001 "Ventilation tube in tympanic membrane"
* $SCT#129823000 "Childhood growth AND/OR development alteration"
* $SCT#195528001 "Acute rheumatic fever"
* $SCT#312591002 "Acute rheumatic heart disease"
* $SCT#43381005 "Passive smoker"
* $SCT#32485007 "Hospital admissions"  //maybe need to create a H/O Hospital admission concept as it is a procedure? No others are H/O



ValueSet: MedicalHistoryShortListAdolescents
Id: MedicalHistoryShortListAdolescents
Title: "Medical History Short List for Adolescents"
Description: "The Medical History Short List for Adolescents value set includes values to represent conditions for use in a pick list for the MBS 715 Health Check for Adolescents."

* $SCT#129127001 "Ear infections" 
* $SCT#300228004 "Hearing problems"
* $SCT#195967001 "Asthma"
* $SCT#38341003 "High blood pressure"
* $SCT#84757009 "Epilepsy"
* $SCT#25064002 "Headaches"
* $SCT#37796009 "Migraines"
* $SCT#73211009 "Diabetes mellitus"
* $SCT#23685000 "Rheumatic heart disease"
* $SCT#90708001 "Kidney disease"
* $SCT#413307004 "Mental health"

ValueSet: MedicalHistoryShortListAdultsAndOlderPeople
Id: MedicalHistoryShortListAdults
Title: "Medical History Short List for Adults and Older People"
Description: "The Medical History Short List for Adults and Older People value set includes values to represent conditions for use in a pick list for the MBS 715 Health Check for Adults and Older People."

* $SCT#73211009 "Diabetes mellitus"
* $SCT#38341003 "Hypertension"
* $SCT#22298006 "Myocardial infarction" 
* $SCT#230690007 "Stroke"
* $SCT#90708001 "Kidney disease"
* $SCT#15188001 "Hearing impairment"
* $SCT#84757009 "Epilepsy"
* $SCT#195967001 "Asthma"
* $SCT#13645005 "COPD"
* $SCT#23685000 "Rheumatic heart disease"
* $SCT#66071002 "HBV"
* $SCT#82271004 "Significant head trauma" // the concept id is "Head inujury", which is more broad in meaning
* $SCT#413307004 "Mental health"

CodeSystem: QuestionnaireItemControlExtended
Id: QuestionnaireItemControlExtended
Title: "Questionnaire Item Control Extension"
Description: "The Questionnaire Item Control Extension code system defines concepts that extend the HL7 questionnaire item control concepts in http://hl7.org/fhir/questionnaire-item-control. They represent interface control/display mechanisms interface control/display mechanisms that might be used when rendering an item in a questionnaire."

* #tab "Tab" "Questions within the group should be displayed in a separate display container."
