# ig-mal-gh-pages.yml

Denne filen er en GitHub Actions workflow som brukes til å generere og publisere en FHIR Implementation Guide (IG) til GitHub Pages. Her er en detaljert forklaring av hvert trinn i workflowen.

## Workflow Navn

```yaml
name: ig-mal-gh-pages
```

Dette setter navnet på workflowen til `ig-mal-gh-pages`.

## Aktivering av Workflow

```yaml
on:
  workflow_dispatch:
```

Denne delen spesifiserer at workflowen kan utløses manuelt ved å bruke "Run workflow"-knappen i GitHub Actions-grensesnittet.

## Miljøvariabler

```yaml
env:
  IG: mal
```

Setter miljøvariabelen `IG` til `mal`, som brukes senere i workflowen.

## Jobber

Workflowen består av en jobb kalt `publish`.

```yaml
jobs:
  publish:
    runs-on: ubuntu-latest
```

Denne jobben kjører på `ubuntu-latest`-miljøet.

### Trinn 1: Sjekk ut koden

```yaml
steps:
  - uses: actions/checkout@v4
```

Dette trinnet sjekker ut repoen slik at workflowen kan få tilgang til koden.

### Trinn 2: Cache FHIR Pakker

```yaml
  - name: 🗂️ Cache FHIR Packages
    uses: actions/cache@v4
    with:
      path: |
        ~/.fhir/packages
      key: fhir-packages
```

Dette trinnet cacher FHIR-pakker for å redusere nedlastingstiden ved fremtidige kjørsler.

### Trinn 3: Cache IG Publisher input-cache

```yaml
  - name: 🗂️ Cache IG Publisher input-cache
    uses: actions/cache@v4
    with:
      path: |
        ${{ env.IG }}/input-cache
      key: ig-publisher-input-cache
```

Dette trinnet cacher IG Publisher input-cache for å forbedre ytelsen.

### Trinn 4: Installer NPM og no-basis-pakken

```yaml
  - name: NPM install no-basis
    run: npm --registry https://packages.simplifier.net install hl7.fhir.no.basis@2.2.0
```

Dette trinnet installerer `hl7.fhir.no.basis`-pakken ved hjelp av NPM.

**NB! Fungerer ikke etter hensikt, se issue #9**

### Trinn 5: Last ned IG Publisher

```yaml
  - name: 📥 Download IG Publisher
    run: wget -q https://github.com/HL7/fhir-ig-publisher/releases/latest/download/publisher.jar
```

Dette trinnet laster ned den nyeste versjonen av IG Publisher.

### Trinn 6: Kjør IG Publisher

```yaml
  - name: 🏃‍♂️ Run IG Publisher
    uses: docker://hl7fhir/ig-publisher-base:latest
    with:
      args: java -jar publisher.jar publisher -ig ${{ env.IG }}/ig.ini
```

Dette trinnet bygger HTML-siden for IG ved å bruke IG Publisher.

### Trinn 7: Publiser til GitHub Pages

```yaml
  - name: 🚀 Deploy to GitHub-Pages
    uses: peaceiris/actions-gh-pages@v3
    with:
      github_token: ${{ secrets.GITHUB_TOKEN }}
      publish_dir: ${{ env.IG }}/output
      destination_dir: currentbuild
      exclude_assets: '**.zip,**.tgz,**.pack'
      commit_message: '${{ env.IG }}: ${{ github.event.head_commit.message }}'
```

Dette trinnet publiserer HTML-siden til en egen branch for å hoste den ved hjelp av GitHub Pages. Det vil overskrive den nåværende publiserte HTML-siden.

Ved å følge denne workflowen, kan du automatisk generere og publisere din FHIR Implementation Guide til GitHub Pages.
