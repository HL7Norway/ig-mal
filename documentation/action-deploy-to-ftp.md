# Publisere til egen server med FTP/SFTP

Denne GitHub Actions workflow laster opp innholdet fra `gh-pages`-branchen til din egen web-server via FTP, SFTP eller rsync+SSH. Workflowen støtter flere autentiseringsmetoder og gir fleksible konfigurasjonsalternativer.

## ✨ Funksjoner

- **Flere protokoller:** FTP, FTPS, SFTP og rsync over SSH
- **Fleksibel autentisering:** Passord eller SSH-nøkler
- **Sikker konfiguration:** Alle sensitive data lagres som GitHub Secrets
- **Dry-run modus:** Test deployment uten å faktisk overføre filer
- **Automatisk aktivering:** Kjører automatisk ved publisering av IG
- **Manuell kontroll:** Kan kjøres manuelt med egne innstillinger

## Aktivering av workflow

**Automatisk:**

- Kjører ved push til `gh-pages`-branchen (etter IG-generering)

**Manuell:**

- Gå til "Actions" → "Deploy to FTP/SFTP Server" → "Run workflow"
- Velg deployment-metode, målkatalog og dry-run alternativer

## 🔧 Oppsett av GitHub Secrets

Før du kan bruke workflowen, må du konfigurere nødvendige secrets i GitHub:

### Obligatoriske secrets

- `FTP_SERVER`: Server-adresse (f.eks. `ftp.example.com` eller `192.168.1.100`)
- `FTP_USERNAME`: Brukernavnet for innlogging

### Autentisering (velg én metode)

**Metode 1: Passord (FTP/FTPS/SFTP)**
- `FTP_PASSWORD`: Passordet for brukeren

**Metode 2: SSH-nøkkel (SFTP/rsync-ssh)**
- `SSH_PRIVATE_KEY`: Privat SSH-nøkkel (hele innholdet av `~/.ssh/id_rsa`)

### Valgfrie secrets for tilpasning

- `FTP_REMOTE_DIR`: Målkatalog på serveren (standard: `/public_html`)
- `FTP_PORT`: FTP-port (standard: `21`)
- `SFTP_PORT`: SFTP/SSH-port (standard: `22`)
- `FTP_USE_SSL`: Bruk SSL/TLS for FTP (standard: `false`)

### Slik legger du til secrets

1. Gå til repoet på GitHub → "Settings" → "Secrets and variables" → "Actions"
2. Klikk "New repository secret"
3. Legg inn navn og verdi
4. Gjenta for alle nødvendige secrets

## 🚀 Deployment-metoder

### 1. FTP/FTPS (standard)

**Best for:** Tradisjonelle web-hosting tjenester

**Eksempel secrets:**
```
FTP_SERVER: ftp.mittdomene.no
FTP_USERNAME: mittbrukernavn
FTP_PASSWORD: mittpassord
FTP_REMOTE_DIR: /public_html/ig
FTP_USE_SSL: true
```

### 2. SFTP

**Best for:** Sikre servere med SSH-tilgang

**Eksempel secrets:**
```
FTP_SERVER: server.example.com
FTP_USERNAME: mittbrukernavn
SSH_PRIVATE_KEY: -----BEGIN OPENSSH PRIVATE KEY-----
...nøkkelinnhold...
-----END OPENSSH PRIVATE KEY-----
FTP_REMOTE_DIR: /var/www/html/ig
```

### 3. rsync over SSH

**Best for:** Linux-servere med full SSH-tilgang og rsync installert

**Fordeler:** Raskeste synkronisering, smart filoverføring

## 🧪 Testing med dry-run

Før du deployer "for ekte", test først:

1. Gå til "Actions" → "Deploy to FTP/SFTP Server"
2. Klikk "Run workflow"
3. Aktiver "Dry run" 
4. Velg deployment-metode
5. Kjør workflowen

Dette viser hva som ville blitt overført uten å faktisk gjøre det.

## 🔒 Sikkerhetstips

### SSH-nøkler (anbefalt for SFTP/rsync)

1. **Generer dedikert nøkkel:**
   ```bash
   ssh-keygen -t rsa -b 4096 -f ~/.ssh/github_deploy -C "github-deploy"
   ```

2. **Legg til offentlig nøkkel på serveren:**
   ```bash
   cat ~/.ssh/github_deploy.pub >> ~/.ssh/authorized_keys
   ```

3. **Bruk privat nøkkel som `SSH_PRIVATE_KEY` secret**

### Begrens tilgang

- Opprett egen bruker for deployment på serveren
- Gi kun nødvendige rettigheter (skriv til web-katalogen)
- Bruk SSH-nøkkel med passphrase (GitHub håndterer dette)

## 🛠️ Feilsøking

### Vanlige problemer

**Connection refused:**
- Sjekk server-adresse og port
- Kontroller at FTP/SSH-tjenesten kjører

**Permission denied:**
- Verifiser brukernavn og passord/nøkkel
- Sjekk at brukeren har skrivetilgang til målkatalogen

**SSL/TLS feil:**
- Sett `FTP_USE_SSL: false` for usikre servere
- Eller konfigurer serveren med gyldig SSL-sertifikat

### Debug-tips

1. Aktiver dry-run for å se kommandoene som kjøres
2. Sjekk workflow-loggene for detaljerte feilmeldinger
3. Test FTP/SSH-tilkoblingen manuelt fra din lokale maskin

## 📋 Eksempel på komplett oppsett

### For FTP med SSL
```
FTP_SERVER: ftp.mittdomene.no
FTP_USERNAME: web_admin
FTP_PASSWORD: SikkerPassord123!
FTP_REMOTE_DIR: /public_html/implementasjonsguide
FTP_USE_SSL: true
```

### For SFTP
```
FTP_SERVER: server.eksempel.no
FTP_USERNAME: deploy_user
SSH_PRIVATE_KEY: [Full SSH private key]
FTP_REMOTE_DIR: /var/www/html/ig
SFTP_PORT: 2222
```

Med dette oppsettet vil din Implementation Guide automatisk publiseres til din egen server hver gang GitHub Pages oppdateres!
