Instance: PrePopQuery
InstanceOf: Bundle
Usage: #inline
* type = #batch
// FamilyMemberHistorys for patient id
* entry[0].fullUrl = "urn:uuid:38a25157-b8e4-42e4-9525-7954fed52553"
* entry[=].request.method = #GET
* entry[=].request.url = "FamilyMemberHistory?patient={{%patient.id}}"
// Tobacco smoking status Observation latest
* entry[1].fullUrl = "urn:uuid:38a25157-b8e4-42e4-9525-7954fed52554"
* entry[=].request.method = #GET
* entry[=].request.url = "Observation?code=72166-2&_count=1&_sort=-date&patient={{%patient.id}}"
// Body height Observation latest
* entry[2].fullUrl = "urn:uuid:38a25157-b8e4-42e4-9525-7954fed52555"
* entry[=].request.method = #GET
* entry[=].request.url = "Observation?code=8302-2&_count=1&_sort=-date&patient={{%patient.id}}"
// Waist Circumference at umbilicus by Tape measure Observation latest
* entry[3].fullUrl = "urn:uuid:38a25157-b8e4-42e4-9525-7954fed52556"
* entry[=].request.method = #GET
* entry[=].request.url = "Observation?code=8280-0&_count=1&_sort=-date&patient={{%patient.id}}"
// Body weight Observation latest
* entry[4].fullUrl = "urn:uuid:38a25157-b8e4-42e4-9525-7954fed52557"
* entry[=].request.method = #GET
* entry[=].request.url = "Observation?code=29463-7&_count=1&_sort=-date&patient={{%patient.id}}"
// Heart rate Observation latest
* entry[5].fullUrl = "urn:uuid:38a25157-b8e4-42e4-9525-7954fed52558"
* entry[=].request.method = #GET
* entry[=].request.url = "Observation?code=8867-4&_count=1&_sort=-date&patient={{%patient.id}}"
// Body mass index (BMI) [Ratio] Observation latest
* entry[6].fullUrl = "urn:uuid:38a25157-b8e4-42e4-9525-7954fed52559"
* entry[=].request.method = #GET
* entry[=].request.url = "Observation?code=39156-5&_count=1&_sort=-date&patient={{%patient.id}}"
// Blood pressure panel with all children optional Observation latest
* entry[7].fullUrl = "urn:uuid:38a25157-b8e4-42e4-9525-7954fed52560"
* entry[=].request.method = #GET
* entry[=].request.url = "Observation?code=85354-9&_count=1&_sort=-date&patient={{%patient.id}}"
// *SAME AS ENTRY 1* Tobacco smoking status Observation latest
* entry[8].fullUrl = "urn:uuid:38a25157-b8e4-42e4-9525-7954fed52561"
* entry[=].request.method = #GET
* entry[=].request.url = "Observation?code=72166-2&_count=1&_sort=-date&patient={{%patient.id}}"
// Date ceased smoking Observation latest
* entry[9].fullUrl = "urn:uuid:38a25157-b8e4-42e4-9525-7954fed52562"
* entry[=].request.method = #GET
* entry[=].request.url = "Observation?code=160625004&_count=1&_sort=-date&patient={{%patient.id}}"
// smoking-date-started Observation latest
* entry[10].fullUrl = "urn:uuid:38a25157-b8e4-42e4-9525-7954fed52563"
* entry[=].request.method = #GET
* entry[=].request.url = "Observation?code=smoking-date-started&_count=1&_sort=-date&patient={{%patient.id}}"
// Tobacco use and exposure Observation latest
* entry[11].fullUrl = "urn:uuid:38a25157-b8e4-42e4-9525-7954fed52564"
* entry[=].request.method = #GET
* entry[=].request.url = "Observation?code=229819007&_count=1&_sort=-date&patient={{%patient.id}}"
// **INACTIVE association 897148007** Alcohol intake Observation latest
* entry[12].fullUrl = "urn:uuid:38a25157-b8e4-42e4-9525-7954fed52565"
* entry[=].request.method = #GET
* entry[=].request.url = "Observation?code=160573003&_count=1&_sort=-date&patient={{%patient.id}}"
// Pattern of drinking Observation latest
* entry[13].fullUrl = "urn:uuid:38a25157-b8e4-42e4-9525-7954fed52566"
* entry[=].request.method = #GET
* entry[=].request.url = "Observation?code=228308009&_count=1&_sort=-date&patient={{%patient.id}}"
// Date ceased drinking alcohol Observation latest
* entry[14].fullUrl = "urn:uuid:38a25157-b8e4-42e4-9525-7954fed52567"
* entry[=].request.method = #GET
* entry[=].request.url = "Observation?code=1373041000168105&_count=1&_sort=-date&patient={{%patient.id}}"
// *SAME AS ENTRY 12* **INACTIVE association 897148007** Alcohol intake Observation latest
* entry[15].fullUrl = "urn:uuid:38a25157-b8e4-42e4-9525-7954fed52568"
* entry[=].request.method = #GET
* entry[=].request.url = "Observation?code=160573003&_count=1&_sort=-date&patient={{%patient.id}}"
// Body mass index Observation latest
* entry[16].fullUrl = "urn:uuid:38a25157-b8e4-42e4-9525-7954fed52569"
* entry[=].request.method = #GET
* entry[=].request.url = "Observation?code=60621009&_count=1&_sort=-date&patient={{%patient.id}}"
// absolute-cvd-risk Observation latest
* entry[17].fullUrl = "urn:uuid:38a25157-b8e4-42e4-9525-7954fed52570"
* entry[=].request.method = #GET
* entry[=].request.url = "Observation?code=absolute-cvd-risk&_count=1&_sort=-date&patient={{%patient.id}}"
// Immunizations for patient id
* entry[18].fullUrl = "urn:uuid:38a25157-b8e4-42e4-9525-7954fed52571"
* entry[=].request.method = #GET
* entry[=].request.url = "Immunization?patient={{%patient.id}}"
// MedicationStatements for patient id
* entry[19].fullUrl = "urn:uuid:38a25157-b8e4-42e4-9525-7954fed52572"
* entry[=].request.method = #GET
* entry[=].request.url = "MedicationStatement?patient={{%patient.id}}"
// AllergyIntolerances for patient id
* entry[20].fullUrl = "urn:uuid:38a25157-b8e4-42e4-9525-7954fed52573"
* entry[=].request.method = #GET
* entry[=].request.url = "AllergyIntolerance?patient={{%patient.id}}"
// Conditions for patient id
* entry[21].fullUrl = "urn:uuid:38a25157-b8e4-42e4-9525-7954fed52575"
* entry[=].request.method = #GET
* entry[=].request.url = "Condition?patient={{%patient.id}}"
// DiagnosticReports for patient id
* entry[22].fullUrl = "urn:uuid:38a25157-b8e4-42e4-9525-7954fed52574"
* entry[=].request.method = #GET
* entry[=].request.url = "DiagnosticReport?patient={{%patient.id}}"
// Cholesterol [Moles/volume] in Serum or Plasma Observation latest
* entry[23].fullUrl = "urn:uuid:38a25157-b8e4-42e4-9525-7954fed52576"
* entry[=].request.method = #GET
* entry[=].request.url = "Observation?code=14647-2&_count=1&_sort=-date&patient={{%patient.id}}"
// Cholesterol in HDL [Moles/volume] in Serum or Plasma Observation latest
* entry[24].fullUrl = "urn:uuid:38a25157-b8e4-42e4-9525-7954fed52577"
* entry[=].request.method = #GET
* entry[=].request.url = "Observation?code=14646-4&_count=1&_sort=-date&patient={{%patient.id}}"
// Head Occipital-frontal circumference
* entry[25].fullUrl = "urn:uuid:12f24514-437e-40d8-b5c3-bfe8ecb4995d"
* entry[=].request.method = #GET
* entry[=].request.url = "Observation?code=9843-4&_count=1&_sort=-date&patient={{%patient.id}}"