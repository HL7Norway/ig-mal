Her er et eksempel på en GitHub Action workflow som laster innholdet fra en gitt branch (for eksempel `gh-pages`) til en FTP-server for publisering til en web-server:

```yaml
name: Deploy to FTP

on:
  push:
    branches:
      - gh-pages
  workflow_dispatch:

jobs:
  ftp-deploy:
    runs-on: ubuntu-latest

    steps:
    - name: Checkout repository
      uses: actions/checkout@v4
      with:
        fetch-depth: 1

    - name: Install lftp
      run: sudo apt-get install lftp

    - name: Deploy to FTP server
      env:
        FTP_SERVER: ${{ secrets.FTP_SERVER }}
        FTP_USERNAME: ${{ secrets.FTP_USERNAME }}
        FTP_PASSWORD: ${{ secrets.FTP_PASSWORD }}
      run: |
        lftp -f "
        open $FTP_SERVER
        user $FTP_USERNAME $FTP_PASSWORD
        mirror -R ./ /path/to/remote/directory
        bye
        "
```

Forklaring av hvert trinn:

- **name: Deploy to FTP**: Setter navnet på workflowen.
- **on: push**: Workflowen utløses ved push til `gh-pages`-branchen eller manuelt ved bruk av "Run workflow"-knappen.
- **jobs: ftp-deploy**: Definerer en jobb kalt `ftp-deploy` som kjører på `ubuntu-latest`.
- **steps**: Definerer trinnene i jobben.
  - **Checkout repository**: Sjekker ut repoen.
  - **Install lftp**: Installerer `lftp` for å håndtere FTP-opplastinger.
  - **Deploy to FTP server**: Bruker `lftp`-kommandoen for å laste opp innholdet til FTP-serveren.

Sørg for å legge til `FTP_SERVER`, `FTP_USERNAME`, og `FTP_PASSWORD` som hemmeligheter i ditt GitHub-repo under `Settings` > `Secrets and variables` > `Actions`.
