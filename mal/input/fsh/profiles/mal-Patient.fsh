Profile:     MalPatient
Id:          mal-patient
Parent:      NoBasisPatient
Title:       "Pasient"
Description: "Informasjon om pasienten, basert på no-basis."
* ^status = #draft
* ^date = "2025-01-22"
* ^publisher = "Organisasjonen min"

* identifier MS
* name.family MS

// Eksempler
Instance: Pasient-1
InstanceOf: MalPasient
Description: "Eksempel på pasient med etternavn og fødselsnummer"
* identifier[FNR].system = "urn:oid:2.16.578.1.12.4.1.4.1"
* identifier[FNR].value = "13031353453"
* name.family = "Lin"
* name.given = "Rita"
