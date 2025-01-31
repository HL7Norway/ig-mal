### Tittel

Introduksjonstekst

### Mål

Målet med denne implementasjonsguiden er å gi en standardisert måte å representere og utveksle helsedata på ved hjelp av HL7 FHIR. Guiden beskriver hvordan ulike FHIR-profiler og ressurser kan brukes for å oppnå interoperabilitet mellom helsesystemer.

### Omfang

Denne implementasjonsguiden dekker følgende områder:
- Pasientadministrasjon
- Kliniske observasjoner
- Medisinsk historikk
- Behandlingsplaner
- Laboratorieresultater

### Brukstilfeller

#### Pasientregistrering
Denne guiden beskriver hvordan pasienter kan registreres i et helsesystem ved hjelp av FHIR `Patient`-ressursen. Eksempler inkluderer opprettelse, oppdatering og sletting av pasientdata.

#### Kliniske observasjoner
Guiden viser hvordan kliniske observasjoner som blodtrykk, puls og temperatur kan representeres ved hjelp av FHIR `Observation`-ressursen.

### Figur

Eksempel på en figur laget med PlantUML.

<img src="test.svg" width="40%" />

### Eksempel på FHIR-ressurs

Her er et eksempel på en FHIR `Patient`-ressurs som følger `mal-Patient`-profilen:

```json
{
  "resourceType": "Patient",
  "id": "example",
  "meta": {
    "profile": [
      "http://hl7.no/fhir/StructureDefinition/mal-Patient"
    ]
  },
  "identifier": [
    {
      "use": "usual",
      "system": "http://hospital.smarthealthit.org",
      "value": "12345"
    }
  ],
  "name": [
    {
      "use": "official",
      "family": "Doe",
      "given": [
        "John"
      ]
    }
  ],
  "gender": "male",
  "birthDate": "1974-12-25"
}
```
