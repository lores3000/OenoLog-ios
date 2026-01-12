# UX & Design Dokumentation für OenoLog

## Übersicht

Diese Dokumentation beschreibt das UX & Design-Konzept für OenoLog, eine iOS-App zur professionellen Verwaltung von Weinkellern mit Fokus auf Logistik, Trinkreife und Offline-Fähigkeit.

## Design-Philosophie

### Kern-Prinzipien

1. **Logistik vor Social**: Die App konzentriert sich auf die Verwaltung der eigenen Sammlung, nicht auf soziale Interaktionen
2. **Speed-to-Action**: Kritische Aktionen (Scan, Umlagern, Ausbuchen) müssen in unter 5 Sekunden durchführbar sein
3. **Offline-First**: Alle Kernfunktionen funktionieren ohne Internetverbindung
4. **KISS (Keep It Simple, Stupid)**: Minimale Komplexität, maximale Klarheit
5. **Premium-Werkzeug**: Professionelle, vertrauenswürdige Darstellung für wertvolle Sammlungen

### Visueller Stil

- **Modern iOS Design**: System-Standards, SF Symbols, native iOS-Komponenten, aktuelle Liquid glass UX/UI Konzepte
- **Klarheit vor Dekoration**: Funktionale, datenlastige Darstellung
- **Trinkreife-Hervorhebung**: Visuelle Signale (Farbcodierung, Icons) für trinkreife Weine
- **System-Farben**: iOS Dynamic Colors für Dark/Light Mode
- **System-Schriftarten**: SF Pro für optimale Lesbarkeit

## Informationsarchitektur

### Tab-Bar Navigation (4 Hauptbereiche)

Die App verwendet eine Tab-Bar Navigation mit vier primären Bereichen:

1. **Übersicht** - Filterbare Ansichten der Sammlung
2. **Scanner** - OCR-basierte Flaschen-Erfassung
3. **Inventur** - Soll/Ist-Abgleich
4. **Einstellungen** - Konfiguration, Sync, Datenexport/Import

### Primäre User Flows

#### Trinkreife prüfen
```
Übersicht → Filter "Trinkreif" → Liste anzeigen → Flasche auswählen → Details
```

#### Flasche hinzufügen
```
Scanner → OCR (Vorschlag) → Manuelle Eingabe → Minimal-Formular → Lagerort wählen → Speichern
```

#### Flasche ausbuchen
```
Übersicht → Flasche wählen → "Getrunken" → Bestätigen
```

#### Flasche umlagern
```
Übersicht → Flasche wählen → Swipe-Action "Umlagern" → Lagerort ändern → Bestätigen
```

#### Sammlung durchsuchen
```
Übersicht → Filter/Suche → Ergebnisse anzeigen → Flasche auswählen
```

## Screen-Struktur

### 1. Übersicht-Tab

#### Filterbare Ansichten

Die Übersicht bietet vier Hauptfilter über einen Segmented Control oder Tabs:

- **"Trinkreif"**: Weine die jetzt/getrunken werden sollten
  - Filter: `drinkabilityFrom ≤ aktuelles Jahr`
  - Sortierung: Nach mittlerer Trinkreife (aufsteigend)
  - Visuelle Hervorhebung: Orange/Rot-Akzentfarbe

- **"Keller"**: Alle Flaschen im Keller
  - Filter: `location == cellar && status == inStock`
  - Sortierung: Nach Name, dann Jahrgang

- **"Wohnung"**: Alle Flaschen in der Wohnung
  - Filter: `location == apartment && status == inStock`
  - Sortierung: Nach Name, dann Jahrgang

- **"Subskriptionen"**: Erwartete Lieferungen
  - Filter: `status == subscriptionPending`
  - Anzeige: Erwartetes Lieferjahr, Anzahl Flaschen

#### Flasche-Liste

Jede Flasche in der Liste zeigt:

**Primäre Informationen (immer sichtbar):**
- Weingut + Jahrgang (z.B. "Château Meyney 2014")
- Lagerort-Icon (Keller/Wohnung)
- Trinkreife-Anzeige: "2020-2026 (Ø 2023)" oder kompakt "2020-2026"
- Anzahl: "12x" oder "1x Magnum"

**Sekundäre Informationen (optional, bei Bedarf erweiterbar):**
- Flaschen-Typ-Icon (Standard/Magnum/3L) wenn abweichend
- Visuelle Hervorhebung trinkreifer Weine (Farbcodierung)

**Interaktionen:**
- Tap: Öffnet Detail-Ansicht
- Swipe-Left: Schnellaktionen-Menü
  - "Umlagern" (Keller ↔ Wohnung)
  - "Getrunken" (Ausbuchen)
  - "Bearbeiten"

#### Detail-Ansicht

Vollständige Informationen zu einer Flasche:

**Pflichtfelder:**
- Name (Weingut)
- Jahrgang
- Anzahl
- Lagerort
- Status

**Optionale Felder:**
- Flaschen-Typ
- Land, Region
- Gekauft bei
- Listenpreis, Kaufpreis
- Trinkreife (von-bis)
- Bemerkung
- Degustation
- Trauben

**Aktionen:**
- Bearbeiten
- Umlagern
- Ausbuchen
- Löschen

### 2. Scanner-Tab

#### Kamera-View

- Vollbild-Kamera mit OCR-Erkennung
- Automatische Erkennung von Weingut und Jahrgang
- Manuelle Fokus-Anpassung möglich

#### OCR-Ergebnis-Anzeige

Nach dem Scan:
- OCR-Vorschlag wird angezeigt (Weingut, Jahrgang)
- Nutzer kann Vorschlag bestätigen oder korrigieren
- Falls OCR fehlschlägt: Direkter Übergang zu manueller Eingabe

#### Minimal-Formular (Speed-to-Action)

Für schnelle Erfassung nur Pflichtfelder:

1. **Name (Weingut)** - Textfeld, Pflicht
2. **Jahrgang** - Zahleneingabe, Pflicht
3. **Anzahl** - Stepper, Standard: 1
4. **Flaschen-Typ** - Picker, Standard: "Standard", Optionen:
   - Standard
   - Magnum
   - 3L Flasche
   - Weisswein
5. **Lagerort** - Segmented Control, Standard: "Keller"
   - Keller ("Ja")
   - Wohnung ("Oben")

**Speichern-Button**: Ein-Klick, Details später bearbeitbar

#### Erweiterte Bearbeitung

Nach dem Speichern kann der Nutzer:
- Optionale Felder hinzufügen (Land, Region, Preise, Trinkreife, etc.)
- Details in der Detail-Ansicht bearbeiten

### 3. Inventur-Tab

#### Modus-Auswahl

Zwei Inventur-Modi stehen zur Verfügung:

**Liste-Modus:**
- Soll-Liste mit Checkboxen
- Durchgehen der erwarteten Flaschen
- Fehlende markieren
- Abweichungen werden automatisch erkannt

**Batch-Modus:**
- Mehrere Flaschen scannen
- Gesamtübersicht mit Abweichungen
- Soll/Ist-Vergleich
- Fehlende/Überzählige werden hervorgehoben

#### Inventur-Ergebnis

Nach Abschluss:
- Übersicht der Abweichungen
- Fehlende Flaschen
- Überzählige Flaschen
- Möglichkeit zur Korrektur

### 4. Einstellungen-Tab

#### Konfiguration

- **Trinkreife-Zeitfenster**: Konfigurierbare Warnungen
- **Sync-Einstellungen**: Cloud-Sync (optional)
- **Datenexport/Import**: CSV-Format
- **CSV-Import**: Migration bestehender Daten

#### Datenverwaltung

- Export als CSV (kompatibel mit bestehender Liste)
- Import von CSV-Dateien
- Backup/Restore-Funktionalität

## Interaktions-Patterns

### Swipe-Actions

Schnelle Aktionen per Swipe-Left auf Flaschen in der Liste:
- **Umlagern**: Wechsel zwischen Keller und Wohnung
- **Getrunken**: Markieren als getrunken
- **Bearbeiten**: Öffnet Detail-Ansicht im Bearbeitungsmodus

### Pull-to-Refresh

In allen Listen-Ansichten:
- Pull-to-Refresh aktualisiert die Daten
- Bei Offline: Lokale Daten werden aktualisiert
- Bei Online: Sync mit Cloud (falls aktiviert)

### Search & Filter

- Suchfeld in der Übersicht
- Filter nach verschiedenen Kriterien:
  - Lagerort
  - Trinkreife
  - Jahrgang
  - Land/Region
  - Flaschen-Typ

### Navigation

- Tab-Bar für primäre Bereiche
- Navigation Stack für Detail-Ansichten
- Modal-Präsentation für Scanner und Formulare

## Trinkreife-Visualisierung

### Farbcodierung

- **Grün**: Noch nicht trinkreif (Trinkreife ab > aktuelles Jahr)
- **Orange**: Bald trinkreif (Trinkreife ab in 1-2 Jahren)
- **Rot**: Jetzt trinkreif (Trinkreife ab ≤ aktuelles Jahr)
- **Grau**: Überreif (Trinkreife bis < aktuelles Jahr)

### Icons & Badges

- Trinkreife-Badge mit Jahrgangsbereich
- Icon für Flaschen-Typ (Standard/Magnum/3L)
- Status-Icons (Keller/Wohnung/Getrunken)

## Offline-First Verhalten

### Lokale Persistenz

- Alle Daten werden lokal in SwiftData gespeichert
- Keine Abhängigkeit von Internetverbindung
- Sofortige Verfügbarkeit aller Funktionen

### Hintergrund-Sync

- Wenn Online: Automatischer Sync im Hintergrund
- Konfliktlösung: Lokale Daten haben Priorität
- Manueller Sync-Trigger in Einstellungen

## Accessibility

### VoiceOver Support

- Alle UI-Elemente sind VoiceOver-kompatibel
- Sinnvolle Labels für Screenreader
- Navigation per VoiceOver-Gesten

### Dynamic Type

- Unterstützung für alle System-Schriftgrößen
- Layout passt sich an größere Schriftgrößen an

### Farbkontrast

- WCAG AA-konform
- Hoher Kontrast für bessere Lesbarkeit

## Performance-Anforderungen

### Speed-to-Action

- Scanner → Speichern: < 5 Sekunden
- Umlagern: < 2 Sekunden
- Ausbuchen: < 2 Sekunden
- Liste laden: < 1 Sekunde

### Datenvolumen

- Unterstützung für 100-1000 Flaschen
- Smooth Scrolling auch bei großen Listen
- Lazy Loading für bessere Performance

## Design-Tokens

Siehe [Design-System.md](./Design-System.md) für detaillierte Design-Tokens.

## User Flows

Siehe [User-Flows.md](./User-Flows.md) für detaillierte Flow-Diagramme.
