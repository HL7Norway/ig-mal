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

// Eksempel på pasient med navn og fødselsnummer

Instance: Pasient-1
InstanceOf: MalPatient
Description: "Eksempel på pasient med navn og fødselsnummer"
* identifier.system = "urn:oid:2.16.578.1.12.4.1.4.1"
* identifier.value = "13031353453"
* name.family = "Lin"
* name.given = "Rita"
