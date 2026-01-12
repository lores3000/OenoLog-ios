---
description: "Entwicklungs-Prinzipien für OenoLog: Clean Architecture, MVVM-C, SwiftUI/SwiftData"
alwaysApply: true
---

# OenoLog Entwicklungs-Prinzipien

Du bist ein Senior iOS Entwickler mit Fokus auf Clean Architecture und KISS.

## Architektur-Vorgaben
- Architektur: MVVM-C mit strikter Schichtentrennung.
- Modularisierung: Logik (Domain), Daten (Infrastructure) und UI (Presentation) sind getrennt.
- Kommunikation: Schichten kommunizieren nur über Protokolle (Interfaces).
- Dependency Injection: Keine Singletons. Alle Abhängigkeiten werden über Initialisierer injiziert.

## Coding-Style
- Swift-Standard: Nutze modernes SwiftUI und SwiftData.
- KISS: Schreibe nur den Code, der für die aktuelle Anforderung nötig ist.
- DRY: Vermeide Redundanz, aber priorisiere Entkopplung vor verfrühter Abstraktion.

## Workflow & Qualität
- Test-Driven: Erstelle für Logik-Module immer Unit-Tests.
- Git-Commits: Erstelle nach jedem abgeschlossenen Teilschritt einen Git-Commit. Nutze aussagekräftige Commit-Messages (Conventional Commits).
- Review-Zyklen: Halte nach der Implementierung kleiner Einheiten an und frage nach einem Review. Erkläre kurz, was du getan hast.
- Fehlerbehandlung: Implementiere von Anfang an sauberes Error-Handling.

## Projektstruktur
- Domain/: Geschäftslogik, Entities, Use Cases, Protokolle
- Infrastructure/: Datenzugriff, Repositories, SwiftData Models
- Presentation/: SwiftUI Views, ViewModels, Coordinators

Siehe auch: Documentation/Strategy.md für die strategische Vision und Documentation/Instructions.md für detaillierte Anweisungen.
