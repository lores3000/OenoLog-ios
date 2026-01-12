# OenoLog Tests

## Übersicht

Dieses Verzeichnis enthält Unit Tests für die Domain-Logik der OenoLog App.

## Test-Struktur

```
OenoLogTests/
  Domain/
    Entities/
      WineTests.swift          # Tests für Wine Entity
      LocationTests.swift      # Tests für Location Enum
      BottleTypeTests.swift    # Tests für BottleType Enum
      WineStatusTests.swift    # Tests für WineStatus Enum
```

## Tests ausführen

### In Xcode
- **Alle Tests**: ⌘U
- **Einzelne Test-Klasse**: Klick auf das Diamond-Symbol neben der Klasse
- **Einzelner Test**: Klick auf das Diamond-Symbol neben dem Test

### Via Command Line
```bash
# Alle Unit Tests
./scripts/run-tests.sh --skip-ui-tests

# Alle Tests (Unit + UI)
./scripts/run-tests.sh
```

## Test-Coverage

Ziel: > 80% Coverage für Domain-Logik

Aktuelle Coverage kann in Xcode angezeigt werden:
1. Product > Scheme > Edit Scheme
2. Test > Options > Code Coverage aktivieren
3. Tests ausführen
4. Report Navigator > Coverage anzeigen

## Pre-Commit Hook

Tests werden automatisch vor jedem Git-Commit ausgeführt. Der Commit wird abgebrochen wenn Unit Tests fehlschlagen.
