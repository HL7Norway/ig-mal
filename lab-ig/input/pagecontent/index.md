# Forskningsstudier for deltakere

Denne implementasjonsguiden beskriver hvordan informasjon om forskningsstudier og potensielle deltakere kan representeres med HL7 FHIR R4. Målet er å gjøre det enklere for en person å finne studier som kan passe ut fra opplysninger som alder, bosted, helsetilstand og legemiddelbruk.

Guiden er rettet mot systemer som publiserer eller formidler studier, og tjenester som lar personer utforske aktuelle studier. Den standardiserer utveksling av data; den definerer ikke en bestemt portal eller en komplett rekrutteringsprosess.

## Omfang

Første versjon av guiden beskriver:

- hvordan en forskningsstudie og studiested kan beskrives
- hvordan målgrupper og strukturerte inklusjons- og eksklusjonskriterier kan uttrykkes
- hvilke personopplysninger en tjeneste kan bruke for en foreløpig vurdering av kriteriene
- hvordan relevante studier kan presenteres, inkludert studiested og eventuell kompensasjon når slik informasjon er tilgjengelig

Guiden avgjør ikke om en person er endelig kvalifisert til å delta. Det er studieansvarlig som vurderer dette. Informasjon om kompensasjon er ikke et obligatorisk FHIR R4-felt i denne modellen og må avtales og beskrives særskilt før den standardiseres.

## FHIR-ressurser

| Ressurs | Bruk i denne guiden |
| --- | --- |
| `ResearchStudy` | Beskriver studiens tittel, status, formål, sponsor, periode og tilknyttede steder. |
| `Organization` | Beskriver en organisasjon som er studiested, sponsor eller ansvarlig aktør. |
| `Location` | Kan beskrive et konkret fysisk studiested med adresse og geografisk informasjon. |
| `Group` | Beskriver målgruppen for studien. I FHIR R4 kan strukturerte kriterier uttrykkes med gruppens `characteristic`-elementer, blant annet alder og helsetilstand. |
| `Patient` | Kan representere personen når det er nødvendig å utveksle personopplysninger i FHIR. En søketjeneste bør ikke opprette eller lagre en varig pasientressurs uten et reelt behov og gyldig grunnlag. |
| `Condition`, `Observation` og `MedicationStatement` | Kan uttrykke henholdsvis helsetilstander, relevante målinger og legemiddelbruk når disse opplysningene trengs for vurderingen. |
| `Questionnaire` og `QuestionnaireResponse` | Kan brukes til å innhente opplysninger fra personen på en strukturert måte. |

I FHIR R4 peker `ResearchStudy.site` på en `Organization`. Et fysisk sted kan beskrives med en `Location` og knyttes til organisasjonen. `ResearchStudy.location` er en kodebar beskrivelse, ikke en referanse til en `Location`-ressurs.

### Ressursrelasjoner

Figuren viser hvordan studieopplysninger og målgruppe kan kobles til studiestedet, og hvordan opplysninger fra en person kan innhentes for en foreløpig vurdering.

![FHIR-ressurser for forskningsstudie, målgruppe, studiested og deltakeropplysninger](test.svg)

## Foreløpig vurdering av kriterier

En søketjeneste kan sammenligne strukturerte studiekriterier med opplysninger personen selv har gitt. Resultatet bør vise hvilke kriterier som ser ut til å være oppfylt, ikke oppfylt eller uavklart fordi det mangler informasjon. Uavklart skal ikke tolkes som kvalifisert.

En samlet prosentvis «match» er ikke definert av FHIR og må ikke presenteres som sannsynligheten for at studieansvarlig godkjenner deltakelse. Tjenesten bør vise at vurderingen er foreløpig og la personen se hvilke opplysninger og kriterier den bygger på.

## Brukstilfeller

### Publisere en studie

En studieansvarlig registrerer en rekrutterende studie med beskrivelse, målgruppe, strukturerte kriterier, sponsor og ett eller flere studiesteder.

### Finne studier som kan passe

En person oppgir nødvendige opplysninger, for eksempel alder, bosted, helsetilstander og legemiddelbruk. Tjenesten viser studier med en forståelig vurdering av hvert kriterium. Avstand beregnes av tjenesten ut fra personens valgte geografiske område og studiestedets adresse eller koordinater; avstandsberegning er ikke definert av FHIR.

### Friske frivillige

En studie kan angi at den søker friske frivillige. Tjenesten må skille dette fra manglende helseopplysninger: fravær av registrerte tilstander er ikke i seg selv dokumentasjon på at personen er frisk.

## Personvern

Helseopplysninger er sensitive personopplysninger. Tjenester som bruker denne guiden bør begrense innsamling og lagring til det som er nødvendig, forklare formålet tydelig og ikke sende personens opplysninger til studier eller studieansvarlige uten et eget grunnlag og nødvendig informasjon til personen.
