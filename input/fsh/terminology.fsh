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

ValueSet: MedicalHistoryShortListAdults
Id: MedicalHistoryShortListAdults
Title: "Medical History Short List for Adults"
Description: "The Medical History Short List for Adults value set includes values to represent conditions for use in a pick list for the MBS 715 Health Check for Adults."

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
