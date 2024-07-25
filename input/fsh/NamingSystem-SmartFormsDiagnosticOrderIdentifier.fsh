Alias: $v2IdType = http://terminology.hl7.org/CodeSystem/v2-0203
Alias: $SCT = http://snomed.info/sct
Alias: $UCUM = http://unitsofmeasure.org

Instance: SmartFormsDiagnosticOrderIdentifier
InstanceOf: NamingSystem
Usage: #definition
Title: "Smart Forms Diagnostic Order Identifier"
Description: "Smart Forms Diagnostic Order Identifier."

* name = "SmartFormsDiagnosticOrderIdentifier"
* status = #draft
* kind = #identifier
* date = "2024-07-11"
* type = $v2IdType#PLAC
* jurisdiction.coding = urn:iso:std:iso:3166#AU
* uniqueId[+].type = #uri
* uniqueId[=].value = "https://smartforms.csiro.au/id/DiagnosticOrder"