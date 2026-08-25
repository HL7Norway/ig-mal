# Setup-checklist for nye brukere

Denne checklisten hjelper deg med å sette opp ig-mal for ditt eget prosjekt. Følg trinnene i rekkefølge for best resultat.

*NB: Hvis du bruker ig-mal med formål om å teste og lære, anbefales å bare beholde navnet ("mal") for å spare tid.* 

## 1. Opprett repo fra template

- [ ] Klikk "Use this template" på [HL7Norway/ig-mal](https://github.com/HL7Norway/ig-mal)
- [ ] Velg "Create a new repository"
- [ ] Gi repoet et beskrivende navn (f.eks. `min-ig`, `helsedir-lab-ig`)
- [ ] Velg synlighet (offentlig/privat)
- [ ] Klikk "Create repository from template"

## 2. Konfigurer grunnleggende innstillinger

### GitHub Actions
- [ ] Gå til "Settings" → "Actions" → "General"
- [ ] Velg "Allow all actions and reusable workflows"

Under "Workflow permissions":

- [ ] Velg "Read and write permissions" slik at publiseringsworkflowen kan skrive til `gh-pages`
- [ ] Kontroller at workflowene har tilgang til å skrive repository-innhold (`contents: write`)

Pull request-tillatelsen "Allow GitHub Actions to create and approve pull requests" er ikke nødvendig for workflowene i denne malen.

## 3. Gi nytt navn til IG-mappen (anbefalt)

- [ ] Gi nytt navn til `mal/`-mappen til noe beskrivende (f.eks. `lab-ig/`)
- [ ] Bruk det nye mappenavnet som `IG_SHORTNAME` i `.github/workflows/ig-gh-pages.yml` og `.github/workflows/validate-fsh.yml`
- [ ] Oppdater path-filtrene for `pull_request` og `push` i `.github/workflows/validate-fsh.yml` fra `mal/...` til det nye mappenavnet
- [ ] Oppdater `path` i `.github/workflows/plant-uml.yml` fra `mal/input/images` til det nye mappenavnet

## 4. Tilpass konfigurasjonsfiler

### Oppdater sushi-config.yaml
- [ ] Åpne `[ditt-mappenavn]/sushi-config.yaml`
- [ ] Endre `id: hl7.fhir.no.mal` til din unike ID
- [ ] Endre `canonical: http://hl7.no/fhir/ig/mal` til din URL
- [ ] Endre `name: Mal` til ditt IG-navn (uten mellomrom)
- [ ] Endre `title: "Mal"` til din IG-tittel
- [ ] Oppdater `description` fra "TODO" til faktisk beskrivelse
- [ ] Oppdater `publisher` navn og URL

### Oppdater ig.ini
- [ ] Åpne `[ditt-mappenavn]/ig.ini`
- [ ] Endre `ImplementationGuide-hl7.fhir.no.mal.json` til `ImplementationGuide-[din-id].json` (samme ID som i sushi-config.yaml)

`template` kan også endres etter eget ønske, men vi foreslår at du bruker HL7 Norge sin mal i første omgang for enkelhetens skyld.

### Oppdater GitHub Actions
- [ ] Åpne `.github/workflows/ig-gh-pages.yml`
- [ ] Endre `IG_SHORTNAME: mal` til ditt mappenavn
- [ ] Åpne `.github/workflows/validate-fsh.yml`
- [ ] Endre `IG_SHORTNAME: mal` til samme mappenavn
- [ ] Oppdater `mal/...`-stiene under `pull_request.paths` og `push.paths` i `validate-fsh.yml`
- [ ] Åpne `.github/workflows/plant-uml.yml` og oppdater `path: mal/input/images`

## 5. Tilpass FSH-innhold

### Profiler
- [ ] Åpne `[ditt-mappenavn]/input/fsh/profiles/mal-Patient.fsh`
- [ ] Endre profilnavn, ID og beskrivelse
- [ ] Oppdater `^publisher` til samme som i sushi-config.yaml
- [ ] Tilpass eksempelet til ditt bruksområde
- [ ] Gjør det samme for `mal-Observation-blodprove.fsh` eller slett/erstatt med egne profiler

### Aliaser
- [ ] Sjekk `[ditt-mappenavn]/input/fsh/aliases.fsh`
- [ ] Legg til aliaser du trenger for dine profiler
- [ ] Fjern kommenterte aliaser du ikke bruker

### Dokumentasjon
- [ ] Oppdater `[ditt-mappenavn]/input/pagecontent/index.md`
- [ ] Skriv om innhold til å beskrive din IG
- [ ] Legg til eller fjern seksjoner etter behov

## 6. Test oppsettet

### Valider FSH-filer
- [ ] Gå til "Actions" → "Validate FSH Files"
- [ ] Klikk "Run workflow"
- [ ] La begge valgene stå som standard (av)
- [ ] Klikk "Run workflow"
- [ ] Vent på at jobben blir grønn (ingen feil)

### Test med SUSHI-validering
- [ ] Kjør "Validate FSH Files" på nytt
- [ ] Denne gangen, aktiver "Run SUSHI validation"
- [ ] La "Fail workflow..." stå som av
- [ ] Sjekk resultatet - det kan ha advarsler, men ikke kritiske feil

## 7. Bygg og publiser IG

### Første bygg
- [ ] Gå til "Actions" → "Gen IG and publish GH pages"
- [ ] Klikk "Run workflow" → "Run workflow"
- [ ] Vent på at jobben blir ferdig (kan ta 5-10 minutter)

### Aktiver GitHub Pages
- [ ] Gå til "Settings" → "Pages"
- [ ] Velg "Deploy from a branch" → `gh-pages` → `/root`
- [ ] Klikk "Save"
- [ ] Vent noen minutter, så vil din IG være tilgjengelig på `https://[kontonavn].github.io/[repo-navn]/currentbuild`

Kontonavn er navnet på kontoen som repo'et er på, f.eks. "HL7Norway" eller din organisasjon/brukernavn. 

## 8. Siste kvalitetskontroll

- [ ] Besøk din publiserte IG-URL
- [ ] Sjekk at tittel og innhold er riktig
- [ ] Test at profiler vises korrekt under "Artifacts"
- [ ] Sjekk at eksempler validerer mot profilene
- [ ] Sørg for at ingen placeholder-tekst ("TODO", "Mal", etc.) er igjen

## 9. Dokumenter og del

- [ ] Oppdater repo-beskrivelsen på GitHub
- [ ] Legg til lenke til publisert IG i README
- [ ] Commit og push eventuelle siste endringer
- [ ] Del IG-en med relevante interessenter

## 🎉 Ferdig!

Gratulerer! Du har nå satt opp din egen FHIR Implementation Guide basert på ig-mal.

## 🔄 Vedlikehold

Fremover vil du typisk:
- Oppdatere FSH-profiler og eksempler
- Kjøre "Validate FSH Files" før større endringer
	- Kjøre "Gen IG and publish GH pages" når du vil publisere oppdateringer
- Overvåke GitHub Actions for eventuelle feil

## 🆘 Trenger du hjelp?

- Se [dokumentasjonen](README.md) for detaljerte instruksjoner
- Sjekk [HL7 Norge beste praksis](https://hl7norway.github.io/best-practice/)
- Opprett et issue i [ig-mal repo](https://github.com/HL7Norway/ig-mal/issues) hvis du finner problemer med malen
