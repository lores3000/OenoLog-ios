# Projekt-Setup

## Option 1: Mit xcodegen (empfohlen)

1. Installiere xcodegen:
   ```bash
   brew install xcodegen
   ```

2. Führe das Setup-Skript aus:
   ```bash
   ./setup.sh
   ```

3. Öffne das Projekt in Xcode:
   ```bash
   open VinLogistics.xcodeproj
   ```

## Option 2: Manuell in Xcode

1. Öffne Xcode
2. File > New > Project
3. Wähle "iOS" > "App"
4. Konfiguration:
   - Product Name: `VinLogistics`
   - Team: (dein Team)
   - Organization Identifier: `com.vinlogistics`
   - Interface: `SwiftUI`
   - Language: `Swift`
   - Storage: `SwiftData`
   - Include Tests: ✓
5. Speichere im aktuellen Verzeichnis (überschreibe nicht die bestehenden Dateien)
6. Kopiere die Dateien aus `VinLogistics/` in das neue Projekt
7. Organisiere die Dateien in die Ordner:
   - `Domain/`
   - `Infrastructure/`
   - `Presentation/`
   - `Resources/`

## Projektstruktur

Nach dem Setup sollte die Struktur so aussehen:

```
VinLogistics/
├── Domain/              # Geschäftslogik, Entities, Use Cases
├── Infrastructure/      # Datenzugriff, Repositories, SwiftData
├── Presentation/        # SwiftUI Views, ViewModels, Coordinators
├── Resources/           # Assets, Localization
├── VinLogisticsApp.swift
└── Info.plist
```

## Nächste Schritte

1. Öffne das Projekt in Xcode
2. Prüfe, ob alle Dateien korrekt eingebunden sind
3. Führe einen Build durch (⌘B)
4. Starte die Entwicklung gemäß [Instructions.md](./Instructions.md)

