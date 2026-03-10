# Generere IG og publisere på GitHub Pages

Denne workflow-filen er konfigurert for å automatisk bygge og publisere en FHIR implementasjonsguide (IG) ved bruk av GitHub Actions. Nedenfor følger en detaljert forklaring av scriptet og hvordan det kan tilpasses.

## Forklaring av Workflow

### Workflow-navn og -trigger

```yaml
name: ig-gh-pages

on:
  workflow_dispatch:
```

Workflow navnet er `ig-gh-pages` og er satt opp til å trigges manuelt via GitHub brukergrensesnittet.

### Miljøvariabler

```yaml
env:
  IG: mal
```

Setter miljøvariabelen `IG` til `mal`, som representerer navnet på implementasjonsguiden.

### Jobb: Publish

```yaml
jobs:
  publish:
    runs-on: ubuntu-latest
    container: hl7fhir/ig-publisher-base:latest 
```

Kjører jobben `publish` på en Ubuntu-latest runner, og bruker en Docker-container for HL7 FHIR IG Publisher.

#### Steg

- **Checkout**

  ```yaml
  - uses: actions/checkout@v3
  ```

  Sjekker ut repository koden.

- **Installer FHIR Pakker og Kjør IG Publisher**

  ```yaml
  - name: Install hl7.fhir.no.basis-2.2.2-snapshots in local cache and run IG Publisher
    run: |
      # Kommandoer for å installere nødvendige pakker og kjøre IG Publisher
  ```

  Installerer nødvendige FHIR pakker og kjører IG Publisher for å generere implementasjonsguiden.

- **Deploy til GitHub Pages**

  ```yaml
  - name: 🚀 Deploy to GitHub-Pages
    uses: peaceiris/actions-gh-pages@v3
    with:
      github_token: ${{ secrets.GITHUB_TOKEN }}
      publish_dir: ${{ env.IG }}/output
      destination_dir: currentbuild
      commit_message: '${{ env.IG }}: ${{ github.event.head_commit.message }}'
  ```

  Publiserer den genererte HTML-siden til en separat gren for å hoste den med GitHub Pages.

## Tilpasning for eget bruk

For å tilpasse dette scriptet til eget bruk, kan du gjøre følgende endringer:

1. **Oppdater Miljøvariabler**
   Endre verdien av `IG` miljøvariabelen til navnet på din egen implementasjonsguide.

2. **Oppdater URL-er for Pakker**
   Hvis du bruker andre FHIR pakker, oppdater URL-ene og versjonene i kommandoene for `npm` og `curl`, eksempelvis riktig versjon av no-basis.

## Nyttige Ressurser

- [GitHub Actions Documentation](https://docs.github.com/en/actions)
- [FHIR IG Publisher Documentation](https://confluence.hl7.org/display/FHIR/IG+Publisher+Documentation)
- [Best Practices for Using GitHub Actions](https://docs.github.com/en/actions/learn-github-actions/best-practices-for-using-github-actions)

For å se hele scriptet i sin helhet, besøk [ig-gh-pages.yml](https://github.com/HL7Norway/ig-mal/blob/main/.github/workflows/ig-gh-pages.yml).
