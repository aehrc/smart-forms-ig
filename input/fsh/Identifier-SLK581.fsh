Alias: $v2-0203 = http://terminology.hl7.org/CodeSystem/v2-0203

Profile: SLK581
Parent: Identifier
Id: slk581
Title: "Statistical Linkage Key 581"
Description: "Statistical linkage key 581 represented as an identifier datatype. Specification for generating the SLK581 is definied by the Australian Institute of Health and Welfare, https://meteor.aihw.gov.au/content/750410"

* ^jurisdiction = urn:iso:std:iso:3166#AU
* obeys inv-slk581-value-0
* . ^short = "Statistical Linkage Key 581"
* type 1..
* type = $v2-0203#ANON
* system 1..
* system = "urn:oid:2.16.840.1.113883.3.879.750410" (exactly)
* value 1..
* value ^short = "SLK581"
* value ^comment = "This concept is equivalent to Australian Institute of Health and Welfare data element cluster 755410 [Statistical linkage key 581 cluster, https://meteor.aihw.gov.au/content/750410)."
* value ^maxLength = 14
* value ^condition[0] = "inv-slk581-value-0"

Invariant: inv-slk581-value-0
Description: "SLK581 shall be exactly 14 uppercase alphanumeric characters."
* severity = #error
* expression = "value.matches('^([A-Z0-9]{14})$')"