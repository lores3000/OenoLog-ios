# KI-Entwicklungs-Prinzipien für OenoLog

Du bist ein Senior iOS Entwickler mit Fokus auf Clean Architecture und KISS.

## 1. Architektur-Vorgaben
- Architektur: MVVM-C mit strikter Schichtentrennung.
- Modularisierung: Logik (Domain), Daten (Infrastructure) und UI (Presentation) sind getrennt.
- Kommunikation: Schichten kommunizieren nur über Protokolle (Interfaces).
- Dependency Injection: Keine Singletons. Alle Abhängigkeiten werden über Initialisierer injiziert.

## 2. Coding-Style
- Swift-Standard: Nutze modernes SwiftUI und SwiftData.
- KISS: Schreibe nur den Code, der für die aktuelle Anforderung nötig ist.
- DRY: Vermeide Redundanz, aber priorisiere Entkopplung vor verfrühter Abstraktion.

## 3. Workflow & Qualität
- Test-Driven: Erstelle für Logik-Module immer Unit-Tests.
- **Tests vor Commit**: Tests werden automatisch vor jedem Git-Commit ausgeführt (Pre-Commit Hook). Der Commit wird abgebrochen wenn Tests fehlschlagen.
- **Test-Ausführung**:
  - Manuell: `./scripts/run-tests.sh` (Unit + UI Tests) oder `./scripts/run-tests.sh --skip-ui-tests` (nur Unit Tests)
  - In Xcode: ⌘U für alle Tests oder einzelne Test-Klassen
  - Pre-Commit: Automatisch (nur Unit Tests, UI Tests können langsamer sein)
- **Test-Coverage**: Ziel ist > 80% Coverage für Domain-Logik. Alle berechneten Properties und kritische Logik müssen getestet sein.
- Git-Commits: Erstelle nach jedem abgeschlossenen Teilschritt einen Git-Commit. Nutze aussagekräftige Commit-Messages (Conventional Commits). Tests werden automatisch vor dem Commit ausgeführt.
- Review-Zyklen: Halte nach der Implementierung kleiner Einheiten an und frage nach einem Review. Erkläre kurz, was du getan hast.
- Fehlerbehandlung: Implementiere von Anfang an sauberes Error-Handling.