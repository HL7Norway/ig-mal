# Mal for implementasjonsguider (IG)

![Under utvikling!](https://img.shields.io/badge/Status-Under%20utvikling-orange)
[![mal-gh-pages](https://github.com/HL7Norway/ig-mal/actions/workflows/mal-gh-pages.yml/badge.svg)](https://github.com/HL7Norway/ig-mal/actions/workflows/mal-gh-pages.yml)
[![Validate FSH Files](https://github.com/HL7Norway/ig-mal/actions/workflows/validate-fsh.yml/badge.svg)](https://github.com/HL7Norway/ig-mal/actions/workflows/validate-fsh.yml)

Dette er en mal du kan kopiere og bruke som utgangspunkt for en HL7 FHIR implementasjonsguide. Den benytter seg av FHIR Shorthand (FSH) for å definere profiler og verktøy slik at all utvikling kan skje på GitHub.

## Hvordan komme i gang

![Use this template](documentation/use-this-template.png)

Se malens [dokumentasjon for bruk, konfigurering og automatisering](documentation/index.md), inkludert:
- [Instruksjoner for hvordan man kan bruke denne repoen som en mal for andre prosjekter.](https://github.com/HL7Norway/ig-mal/blob/main/documentation/bruke-repo-som-mal.md)
- [Bruk av Actions for å generere og publisere en FHIR Implementation Guide til GitHub Pages.](https://github.com/HL7Norway/ig-mal/blob/main/documentation/action-mal-gh-pages.md)
- [Bruk av Actions for å generere PlantUML-diagrammer.](https://github.com/HL7Norway/ig-mal/blob/main/documentation/action-plant-uml.md)
- [Bruk av Actions for å laste opp innhold til en FTP-server.](https://github.com/HL7Norway/ig-mal/blob/main/documentation/action-deploy-to-ftp.md)
- [Hvordan du kan automatisk validere FHIR Shorthand i din IG uten å publisere på nytt.](https://github.com/HL7Norway/ig-mal/blob/main/documentation/action-validate-fsh.md)

Følg beste praksis for implementasjonsguider. Utvalgte ressurser:

- [IG og dokumentasjon (HL7 Norge)](https://hl7norway.github.io/best-practice/docs/IG-og-dokumentasjon/)
- [Den gode implementasjonsguide (HL7 Norge](https://hl7norway.github.io/best-practice/docs/dgi/#den-gode-implementasjonsguide)


---


## Plan

Plan for pågående utviklingsprosjekt, ikke bare denne IG-malen

1. IGen skal være en mal som skal kunne være grunnlag for nye IGer.
2. Malen skal gjøre det enkelt å følge beste praksis for IGer i henhold til nasjonal og internasjonal beste praksis
   - Inkl FSH 
4. Verktøystøtte, fortrinnsvis alt online
   - Dokumentasjon av bruk for av verktøy: [documentation/index.md](documentation/index.md)
   - [FSH-validator](https://github.com/HL7Norway/ig-mal/actions/workflows/validate-fsh.yml)
5. Enkelt kunne publisere og distribuere IGen på en valgfri måte (egen www, Simplifier.net, etc) ved hjelp av pakker, herunder opprettholde versjoner/history
6. Teste, teste, teste!

Oppgaver som må på startes/planlegges/utføres i parallell:

1. Tilrettelegge no-basis for FHIR Shorthand (FSH)
2. Ny publiseringsløsning / enkel konseptutredning
3. Ny web-løsning for HL7 Norge (sammenheng med pkt 2.)

### Publisering

Det skal skilles på "private" og "offentlige" IGer, som skal publiseres og registreres på forskjellige steder avhengig av innhold.

#### Registre

- [Standarder (Helsedirektoratet)](https://www.ehelse.no/standardisering/standarder)
- [Implementation Guide Registry](https://www.fhir.org/guides/registry/)
- [HL7 Norge på Simplifier.net](https://simplifier.net/organization/hl7norway/) (også publisering)

[HL7 Norge sin GitbHub](https://github.com/HL7Norway) anses kun som *midlertidig* publisering av f.eks. arbeidsversjonger (builds). 

## Referanser og inspirasjon

- [Den gode implementasjonsguide](https://hl7norway.github.io/best-practice/docs/dgi/#den-gode-implementasjonsguide)
- [Metode for utvikling av områdeprofiler](https://hl7norway.github.io/best-practice/docs/no-domain-metode/)
- [FHIR IG Review](https://confluence.hl7.org/display/FHIR/FHIR+IG+Review)
- [IG Best Practices](https://build.fhir.org/ig/FHIR/ig-guidance/best-practice.html)
- [Da Vinci - Documentation Templates and Rules](http://hl7.org/fhir/us/davinci-dtr/2.1.0-preview/index.html)

### Verktøy

- https://github.com/FHIR/auto-ig-builder

### Note to self

- https://github.com/HL7/fhir-ig-publisher/releases

---
<a href="https://github.com/HL7Norway/"><img src="documentation/HL7-norway-logo.png" width="100px" /></a>

