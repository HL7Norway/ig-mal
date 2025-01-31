### Tittel

Introduksjonstekst (husk at dette er en mal, og ALL tekst må endres - dette er kun et eksempel)

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

Her er et eksempel på en FHIR `Patient`-ressurs som følger `no-basis-Patient`-profilen:

```json
{
  "resourceType": "Patient",
  "id": "example",
  "meta": {
    "profile": [
      "http://hl7.no/fhir/StructureDefinition/no-basis-Patient"
    ]
  },
  "identifier": [
    {
      "use": "official",
      "system": "urn:oid:2.16.578.1.12.4.1.4.1",
      "value": "12345678901",
      "period": {
        "start": "2023-01-01"
      },
      "assigner": {
        "display": "Folkeregisteret"
      }
    }
  ],
  "name": [
    {
      "use": "official",
      "family": "Hansen",
      "given": [
        "Ola"
      ]
    }
  ],
  "gender": "male",
  "birthDate": "1980-01-01",
  "address": [
    {
      "use": "home",
      "line": [
        "Gateveien 1"
      ],
      "city": "Oslo",
      "postalCode": "0123",
      "country": "NO"
    }
  ]
}
```
