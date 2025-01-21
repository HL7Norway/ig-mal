# Hvordan bruke denne repoen som en mal

Denne guiden vil hjelpe deg med å bruke denne repoen som en mal for å lage din egen FHIR Implementation Guide (IG) ved å bruke GitHubs "Use this template" funksjon.

## Trinn 1: Bruk repoen som en mal

1. Gå til [HL7Norway/ig-mal](https://github.com/HL7Norway/ig-mal) repoen på GitHub.
2. Klikk på den grønne "Use this template"-knappen øverst til høyre.
3. Velg "Create a new repository" fra rullegardinmenyen.

## Trinn 2: Opprett en ny repository

1. Skriv inn et nytt repo-navn for din IG, for eksempel `my-ig`.
2. Legg til en beskrivelse hvis ønskelig.
3. Velg om repoen skal være offentlig eller privat.
4. Klikk på den grønne "Create repository from template"-knappen.

## Trinn 3: Klon repoen

Klon den nye repoen til din lokale maskin:
```sh
git clone https://github.com/<din-brukernavn>/my-ig.git
```

## Trinn 4: Installer nødvendige verktøy

Sørg for at du har Java installert på din maskin, da IG Publisher krever Java 8 eller høyere. Du trenger også å laste ned IG Publisher JAR-filen.

## Trinn 5: Konfigurer Implementation Guide

Åpne `ig.ini`-filen og oppdater banen til Implementation Guide JSON-filen:
```ini
[IG]
ig = fsh-generated/resources/ImplementationGuide-din-ig.json
template = https://github.com/HL7Norway/ig-template
```

## Trinn 6: Rediger FSH-filer

Rediger FSH-filene i `input/fsh/profiles` for å definere dine egne profiler og utvidelser. For eksempel, åpne `mal-Patient.fsh` og tilpass den etter dine behov.

## Trinn 7: Valider eksempler

Legg til dine egne eksempler i `input/examples` og sørg for at de valideres mot dine FSH-profiler.

## Trinn 8: Kjør IG Publisher

Naviger til din repo-mappe og kjør IG Publisher for å generere Implementation Guide:
```sh
java -jar igpublisher.jar -ig ig.ini
```

## Trinn 9: Sjekk utdata

Etter at IG Publisher har kjørt, vil du finne utdata i `output`-mappen. Åpne `index.html` i en nettleser for å se din genererte Implementation Guide.

## Trinn 10: Publiser

Når du er fornøyd med din Implementation Guide, kan du publisere den til en webserver eller GitHub Pages.

## Eksempel på sushi-config.yaml

Her er et eksempel på en `sushi-config.yaml`-fil:
```yaml
id: din.fhir.ig
canonical: http://example.org/fhir/ig
name: DinIG
title: "Din Implementation Guide"
description: En detaljert beskrivelse av din Implementation Guide.
status: draft
version: 0.1.0
fhirVersion: 4.0.1
copyrightYear: 2025+
releaseLabel: ci-build
jurisdiction: urn:iso:std:iso:3166#NO "Norway"
publisher:
  name: Din Organisasjon
  url: https://www.example.org
menu:
  Home: index.html
  Artifacts: artifacts.html
  TOC: toc.html
```

Følg disse trinnene for å komme i gang med å bruke denne repoen som en mal for din egen FHIR Implementation Guide.
```
