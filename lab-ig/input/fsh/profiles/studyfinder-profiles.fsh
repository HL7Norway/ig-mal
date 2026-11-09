Profile: StudyFinderResearchStudy
Id: studyfinder-research-study
Parent: ResearchStudy
Title: "Forskningsstudie for studiefinning"
Description: "Forskningsstudie som kan vises for personer som leter etter studier de kan være aktuelle for."
* ^status = #draft
* ^publisher = "HL7 Norge"
* title 1..1 MS
* status MS
* sponsor only Reference(StudyFinderOrganization)
* sponsor MS
* site only Reference(StudyFinderOrganization)
* site MS
* enrollment only Reference(StudyFinderStudyPopulation)
* enrollment MS

Profile: StudyFinderStudyPopulation
Id: studyfinder-study-population
Parent: Group
Title: "Målgruppe for forskningsstudie"
Description: "Definisjon av målgruppen og strukturerte inklusjons- og eksklusjonskriterier for en forskningsstudie."
* ^status = #draft
* ^publisher = "HL7 Norge"
* type = #person
* actual = false
* characteristic 1..* MS
* characteristic.code MS
* characteristic.value[x] MS
* characteristic.exclude MS

Profile: StudyFinderOrganization
Id: studyfinder-organization
Parent: Organization
Title: "Organisasjon for forskningsstudie"
Description: "Sponsor, ansvarlig organisasjon eller organisasjon som er studiested."
* ^status = #draft
* ^publisher = "HL7 Norge"
* name 1..1 MS
* address MS
* telecom MS

Profile: StudyFinderLocation
Id: studyfinder-location
Parent: Location
Title: "Fysisk studiested"
Description: "Fysisk studiested med adresse og eventuell geografisk posisjon."
* ^status = #draft
* ^publisher = "HL7 Norge"
* status MS
* name MS
* address MS
* position MS
* managingOrganization only Reference(StudyFinderOrganization)
* managingOrganization MS

Profile: StudyFinderParticipant
Id: studyfinder-participant
Parent: Patient
Title: "Potensiell studiedeltaker"
Description: "Personopplysninger som kan brukes ved en foreløpig vurdering mot studiekriterier."
* ^status = #draft
* ^publisher = "HL7 Norge"
* birthDate MS
* gender MS
* address MS
* address.city MS
* address.postalCode MS

Profile: StudyFinderCondition
Id: studyfinder-condition
Parent: Condition
Title: "Helsetilstand for vurdering mot studiekriterier"
Description: "Helsetilstand som kan være relevant for inklusjons- eller eksklusjonskriterier."
* ^status = #draft
* ^publisher = "HL7 Norge"
* subject only Reference(StudyFinderParticipant)
* subject MS
* code MS
* clinicalStatus MS

Profile: StudyFinderObservation
Id: studyfinder-observation
Parent: Observation
Title: "Måling for vurdering mot studiekriterier"
Description: "Måling eller klinisk observasjon som kan være relevant for studiekriterier."
* ^status = #draft
* ^publisher = "HL7 Norge"
* status MS
* code MS
* subject only Reference(StudyFinderParticipant)
* subject MS
* effective[x] MS
* value[x] MS

Profile: StudyFinderMedicationStatement
Id: studyfinder-medication-statement
Parent: MedicationStatement
Title: "Legemiddelbruk for vurdering mot studiekriterier"
Description: "Legemiddelbruk som kan være relevant for inklusjons- eller eksklusjonskriterier."
* ^status = #draft
* ^publisher = "HL7 Norge"
* status MS
* medication[x] MS
* subject only Reference(StudyFinderParticipant)
* subject MS

Profile: StudyFinderQuestionnaire
Id: studyfinder-questionnaire
Parent: Questionnaire
Title: "Spørreskjema for studiesøk"
Description: "Spørreskjema for strukturert innhenting av nødvendige opplysninger fra en person som leter etter studier."
* ^status = #draft
* ^publisher = "HL7 Norge"
* status MS
* item 1..* MS

Profile: StudyFinderQuestionnaireResponse
Id: studyfinder-questionnaire-response
Parent: QuestionnaireResponse
Title: "Svar på spørreskjema for studiesøk"
Description: "Strukturerte opplysninger fra en person som leter etter studier."
* ^status = #draft
* ^publisher = "HL7 Norge"
* questionnaire MS
* status MS
* subject only Reference(StudyFinderParticipant)
* subject MS
* item 1..* MS