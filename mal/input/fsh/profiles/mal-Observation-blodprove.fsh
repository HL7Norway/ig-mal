Profile:     MalObservationBlood
Id:          mal-observation-blodprove
Parent:      Observation
Title:       "Blodprøve"
Description: "Profil for vanlige blodprøver"
* ^status = #draft
* ^date = "2025-01-31"
* ^publisher = "Organisasjonen min"

* subject only Reference(Patient) 1..1 // Pasienten som blodprøven er tatt av
* effectiveDateTime MS // Dato og tid for blodprøve
* code MS // Kode for blodprøve 
* valueQuantity MS // Resultat av blodprøve

// Eksempel på en blodprøve
Instance: Blodprøve-1
InstanceOf: MalObservationBlood
Description: "Eksempel på en blodprøve"
* subject = Reference(Patient/Pasient-1)
* effectiveDateTime = "2025-01-22"
* code = "Kode for blodprøve"
* valueQuantity = 5.0