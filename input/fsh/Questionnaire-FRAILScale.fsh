Alias: $questionnaire-item-control = http://hl7.org/fhir/questionnaire-item-control
Alias: $launchContext = http://hl7.org/fhir/uv/sdc/CodeSystem/launchContext

Instance: frail-scale
InstanceOf: Questionnaire
Usage: #definition
Title: "FRAIL Scale Assessment Tool"
Description: "A questionnaire to assess frailty using the FRAIL scale."

// launch context
* extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext"
* extension[=].extension[0].url = "name"
* extension[=].extension[=].valueCoding = $launchContext#patient
* extension[=].extension[+].url = "type"
* extension[=].extension[=].valueCode = #Patient
* extension[=].extension[+].url = "description"
* extension[=].extension[=].valueString = "The patient that is to be used to pre-populate the form"
* extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext"
* extension[=].extension[0].url = "name"
* extension[=].extension[=].valueCoding = $launchContext#user
* extension[=].extension[+].url = "type"
* extension[=].extension[=].valueCode = #Practitioner
* extension[=].extension[+].url = "description"
* extension[=].extension[=].valueString = "The practitioner user that is to be used to pre-populate the form"
* extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext"
* extension[=].extension[0].url = "name"
* extension[=].extension[=].valueCoding = $launchContext#encounter
* extension[=].extension[+].url = "type"
* extension[=].extension[=].valueCode = #Encounter
* extension[=].extension[+].url = "description"
* extension[=].extension[=].valueString = "The encounter that is to be used to pre-populate the form"

* url = "https://www.materresearch.org.au/frail-scale"
* name = "FRAILScaleAssessmentTool"
* title = "FRAIL Scale Assessment Tool"
* status = #draft
* experimental = false
* subjectType = #Patient
* date = "2025-09-30"
* publisher = "The University of Queensland and Mater Research Institute"
* contact[0].name = "The University of Queensland and Mater Research Institute"
* contact[0].telecom[0].system = #url
* contact[0].telecom[=].value = "https://medical-school.uq.edu.au/chsri"
* copyright = "Copyright © 2024 The University of Queensland and Mater Research Institute. This content is licensed under a Creative Commons Attribution 4.0 International License. See https://creativecommons.org/licenses/by/4.0/."

* item[+].extension[+].url = "http://hl7.org/fhir/StructureDefinition/variable"
* item[=].extension[=].valueExpression.name = "FatigueScore"
* item[=].extension[=].valueExpression.language = #text/fhirpath
* item[=].extension[=].valueExpression.expression = "iif(%resource.repeat(item).where(linkId='fatigue-question').answer.value = 'All or most of the time', 1, 0)"
* item[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/variable"
* item[=].extension[=].valueExpression.name = "ResistanceScore"
* item[=].extension[=].valueExpression.language = #text/fhirpath
* item[=].extension[=].valueExpression.expression = "iif(%resource.repeat(item).where(linkId='resistance-question').answer.value = true, 1, 0)"
* item[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/variable"
* item[=].extension[=].valueExpression.name = "AmbulationScore"
* item[=].extension[=].valueExpression.language = #text/fhirpath
* item[=].extension[=].valueExpression.expression = "iif(%resource.repeat(item).where(linkId='ambulation-question').answer.value = true, 1, 0)"
* item[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/variable"
* item[=].extension[=].valueExpression.name = "IllnessCount"
* item[=].extension[=].valueExpression.language = #text/fhirpath
* item[=].extension[=].valueExpression.expression = "%resource.repeat(item).where(linkId='illness-question').answer.count()"
* item[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/variable"
* item[=].extension[=].valueExpression.name = "IllnessScore"
* item[=].extension[=].valueExpression.language = #text/fhirpath
* item[=].extension[=].valueExpression.expression = "iif(%IllnessCount > 4, 1, 0)"
* item[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/variable"
* item[=].extension[=].valueExpression.name = "LossOfWeightScore"
* item[=].extension[=].valueExpression.language = #text/fhirpath
* item[=].extension[=].valueExpression.expression = "iif(%resource.repeat(item).where(linkId='lossofweight-question').answer.value = true, 1, 0)"
* item[=].linkId = "frailscale"
* item[=].text = "FRAIL Scale Risk Assessment"
* item[=].type = #group

* item[=].item[+].linkId = "fatigue"
* item[=].item[=].text = "Fatigue"
* item[=].item[=].text.extension[http://hl7.org/fhir/StructureDefinition/rendering-xhtml].valueString = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><span style=\"font-size:1.8em; font-weight:bold\">F</span>atigue</div>"
* item[=].item[=].type = #group
* item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item[=].item[=].item[=].extension[=].valueCodeableConcept = $questionnaire-item-control#radio-button
* item[=].item[=].item[=].linkId = "fatigue-question"
* item[=].item[=].item[=].text = "How much of the time during the past 4 weeks did you feel tired?"
* item[=].item[=].item[=].type = #choice
* item[=].item[=].item[=].answerOption[0].valueString = "All or most of the time"
* item[=].item[=].item[=].answerOption[+].valueString = "Some, a little or none of the time"
* item[=].item[+].linkId = "resistance"
* item[=].item[=].text = "Resistance"
* item[=].item[=].text.extension[http://hl7.org/fhir/StructureDefinition/rendering-xhtml].valueString = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><span style=\"font-size:1.8em; font-weight:bold\">R</span>esistance</div>"
* item[=].item[=].type = #group
* item[=].item[=].item[+].linkId = "resistance-question"
* item[=].item[=].item[=].text = "In the last 4 weeks by yourself and not using aids, do you have any difficulty walking up 10 steps without resting?"
* item[=].item[=].item[=].type = #boolean

* item[=].item[+].linkId = "ambulation"
* item[=].item[=].text = "Ambulation"
* item[=].item[=].text.extension[http://hl7.org/fhir/StructureDefinition/rendering-xhtml].valueString = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><span style=\"font-size:1.8em; font-weight:bold\">A</span>mbulation</div>"
* item[=].item[=].type = #group
* item[=].item[=].item[+].linkId = "ambulation-question"
* item[=].item[=].item[=].text = "In the last 4 weeks by yourself and not using aids, do you have any difficulty walking 300 metres OR one block?"
* item[=].item[=].item[=].type = #boolean

* item[=].item[+].linkId = "illness"
* item[=].item[=].text = "Illness"
* item[=].item[=].text.extension[http://hl7.org/fhir/StructureDefinition/rendering-xhtml].valueString = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><span style=\"font-size:1.8em; font-weight:bold\">I</span>llness</div>"
* item[=].item[=].type = #group
* item[=].item[=].item[+].extension[+].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item[=].item[=].item[=].extension[=].valueCodeableConcept = $questionnaire-item-control#check-box
* item[=].item[=].item[=].linkId = "illness-question"
* item[=].item[=].item[=].text = "Did your Doctor ever tell you that you have?"
* item[=].item[=].item[=].type = #choice
* item[=].item[=].item[=].repeats = true
* item[=].item[=].item[=].answerOption[+].valueString = "Hypertension"
* item[=].item[=].item[=].answerOption[+].valueString = "Diabetes"
* item[=].item[=].item[=].answerOption[+].valueString = "Cancer (not a minor skin cancer)"
* item[=].item[=].item[=].answerOption[+].valueString = "Chronic lung disease"
* item[=].item[=].item[=].answerOption[+].valueString = "Heart attack"
* item[=].item[=].item[=].answerOption[+].valueString = "Congestive heart failure"
* item[=].item[=].item[=].answerOption[+].valueString = "Angina"
* item[=].item[=].item[=].answerOption[+].valueString = "Asthma"
* item[=].item[=].item[=].answerOption[+].valueString = "Arthritis"
* item[=].item[=].item[=].answerOption[+].valueString = "Kidney disease"

* item[=].item[+].linkId = "lossofweight"
* item[=].item[=].text = "Loss of weight"
* item[=].item[=].text.extension[http://hl7.org/fhir/StructureDefinition/rendering-xhtml].valueString = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><span style=\"font-size:1.8em; font-weight:bold\">L</span>oss of weight</div>"
* item[=].item[=].type = #group
* item[=].item[=].item[+].linkId = "lossofweight-question"
* item[=].item[=].item[=].text = "Have you lost more than 5kg or 5% of your body weight in the past year?"
* item[=].item[=].item[=].type = #boolean

* item[=].item[+].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression"
* item[=].item[=].extension[=].valueExpression.language = #text/fhirpath
* item[=].item[=].extension[=].valueExpression.expression = "iif(%FatigueScore.exists(), %FatigueScore, 0) + iif(%ResistanceScore.exists(), %ResistanceScore, 0) + iif(%AmbulationScore.exists(), %AmbulationScore, 0) + iif(%IllnessScore.exists(), %IllnessScore, 0) + iif(%LossOfWeightScore.exists(), %LossOfWeightScore, 0)"
* item[=].item[=].linkId = "totalscore"
* item[=].item[=].text = "TOTAL SCORE"
* item[=].item[=].text.extension[http://hl7.org/fhir/StructureDefinition/rendering-xhtml].valueString = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><span style=\"font-size:1.8em; font-weight:bold\"><em>TOTAL SCORE</em></span></div>"
* item[=].item[=].type = #integer

* item[+].linkId = "frailscale-management"
* item[=].text = "Frailty Management/Decision Support Tool"
* item[=].type = #group

* item[=].item[+].linkId = "frailscale-management-tool"
* item[=].item[=].type = #display
* item[=].item[=].text = "Consider screening for reversible causes of fatigue (sleep apnoea, depression, anaemia, hypotension, hypothyroidism, B12 deficiency); Use EPWORTH scale, K10 or Geriatric Depression Scale in Health Assessment."
* item[=].item[=].text.extension.url = "http://hl7.org/fhir/StructureDefinition/rendering-xhtml"
* item[=].item[=].text.extension.valueString = "<div xmlns=\"http://www.w3.org/1999/xhtml\">
<div>
        <table style=\"border-collapse: collapse; empty-cells: hide;\">
            <thead style=\"background-color: #f3f4f6; font-weight: 600; \">
                <tr>
                    <th style=\"padding: 14px; border: 1px solid #e5e7eb;\"></th>
                    <th style=\"padding: 14px; border: 1px solid #e5e7eb;\">Assessment Score</th>
                    <th style=\"padding: 14px; border: 1px solid #e5e7eb;\">Intervention</th>
                    <th style=\"padding: 14px; border: 1px solid #e5e7eb;\">Referral/follow up</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td style=\"padding: 14px; border: 1px solid #e5e7eb;\"></td>
                    <td style=\"padding: 14px; border: 1px solid #e5e7eb;\">FRAIL Scale Score:<br>
                        <ul>
                            <li>0 = Robust</li>
                        </ul>
                    </td>
                    <td style=\"padding: 14px; border: 1px solid #e5e7eb;\">
                        <ul>
                            <li>Encourage ongoing activity levels.</li>
                            <li>Provide physical activity and nutrition resources.</li>
                        </ul>
                    </td>
                    <td style=\"padding: 14px; border: 1px solid #e5e7eb;\">
                        <ul>
                            <li>Re-do FRAIL Scale in 12 months.</li>
                            <li>Community exercise with balance/resistance component.</li>
                        </ul>
                    </td>
                </tr>
                <tr>
                    <td style=\"padding: 14px; border: 1px solid #e5e7eb;\"></td>
                    <td style=\"padding: 14px; border: 1px solid #e5e7eb;\">FRAIL Scale Score:<br>
                        <ul>
                            <li>1-2 = Pre-frail</li>
                            <li>≥3 = Frail</li>
                        </ul>
                    </td>
                    <td colspan=\"2\" style=\"padding: 14px; border: 1px solid #e5e7eb; vertical-align: middle;\"><strong>FRAIL Score is
                            positive, address underlying causes as suggested below:</strong></td>
                <tr style=\"background-color: #f9fafb;\">
                    <td style=\"font-size: 1.6rem; font-weight: 600; padding: 14px; border: 1px solid #e5e7eb;\">F</td>
                    <td style=\"padding: 14px; border: 1px solid #e5e7eb;\">Feeling fatigued most or all of the time</td>
                    <td style=\"padding: 14px; border: 1px solid #e5e7eb;\">
                        <ul>
                            <li>Consider screening for reversible causes of fatigue (sleep apnoea, depression, anaemia,
                                hypotension, hypothyroidism, B12 deficiency).</li>
                            <li>Use EPWORTH scale, K10 or Geriatric Depression Scale in Health Assessment.</li>
                        </ul>
                    </td>
                    <td style=\"padding: 14px; border: 1px solid #e5e7eb;\">
                        <ul>
                            <li>Consider referral to Geriatrician/Specialist for complex care patients.</li>
                            <li>Consider referral to OT for functional and home review.</li>
                            <li>Consider referral to Psychologist using Mental Health Care Plan.</li>
                            <li>Consider referral to Aged Care organisation for loneliness support (isolation can be a
                                cause of fatigue).</li>
                        </ul>
                    </td>
                </tr>
                <tr>
                    <td style=\"font-size: 1.6rem; font-weight: 600; padding: 14px; border: 1px solid #e5e7eb;\">R</td>
                    <td style=\"padding: 14px; border: 1px solid #e5e7eb;\">Resistance against gravity - difficulty walking up 10 steps
                        without resting</td>
                    <td rowspan=\"2\" style=\"padding: 14px; border: 1px solid #e5e7eb;\">
                        <ul>
                            <li>Consider referring to an individualised progressive exercise program with resistance and
                                strength component.</li>
                        </ul>
                    </td>
                    <td rowspan=\"2\" style=\"padding: 14px; border: 1px solid #e5e7eb;\">
                        <ul>
                            <li>Physiotherapist or exercise physiologist for exercise prescription.</li>
                            <li>For diabetes - group session Medicare funded exercise physiologist.</li>
                            <li>Community exercise with balance/resistance component.</li>
                            <li>Telephone-based health coaching.</li>
                        </ul>
                    </td>
                </tr>
                <tr style=\"background-color: #f9fafb;\">
                    <td style=\"font-size: 1.6rem; font-weight: 600; padding: 14px; border: 1px solid #e5e7eb;\">A</td>
                    <td style=\"padding: 14px; border: 1px solid #e5e7eb;\">Ambulation - difficulty walking 300 metres unaided</td>
                </tr>
                <tr>
                    <td style=\"font-size: 1.6rem; font-weight: 600; padding: 14px; border: 1px solid #e5e7eb;\">I</td>
                    <td style=\"padding: 14px; border: 1px solid #e5e7eb;\">Having 5 or more illnesses</td>
                    <td style=\"padding: 14px; border: 1px solid #e5e7eb;\">
                        <ul>
                            <li>Review indication, side effects and use of medication (evidence for use of some
                                medicines change after 75).</li>
                            <li>Consider discussing with pharmacist.</li>
                            <li>Consider reducing/de-prescribing superfluous medication.</li>
                        </ul>
                    </td>
                    <td style=\"padding: 14px; border: 1px solid #e5e7eb;\">
                        <ul>
                            <li>Pharmacist for comprehensive medication review (HMR item 900).</li>
                            <li>OT for functional and home safety review.</li>
                            <li>Self-management support from aged care organisation volunteer.</li>
                        </ul>
                    </td>
                </tr>
                <tr style=\"background-color: #f9fafb;\">
                    <td style=\"font-size: 1.6rem; font-weight: 600; padding: 14px; border: 1px solid #e5e7eb;\">L</td>
                    <td style=\"padding: 14px; border: 1px solid #e5e7eb;\">Loss of >5% weight in 12 months</td>
                    <td style=\"padding: 14px; border: 1px solid #e5e7eb;\">
                        <ul>
                            <li>Consider screening for reversible causes of weight loss</li>
                            <li>Consider protein and caloric supplementation/food fortification (75mg protein per day
                                required - range of products available at pharmacy).</li>
                            <li>Advice and encourage healthy eating; provide nutrition resources.</li>
                        </ul>
                    </td>
                    <td style=\"padding: 14px; border: 1px solid #e5e7eb;\">
                        <ul>
                            <li>Weight and assess BMI - record in patient record</li>
                            <li>Dietitian for diet review and management</li>
                            <li>Meal Delivery Services</li>
                            <li>Speech Pathologist for swallowing review.</li>
                            <li>Dentist for dental review (pain/infection/ill-fitting dentures).</li>
                            <li>OT for functional and home cooking ability/review.</li>
                        </ul>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>"