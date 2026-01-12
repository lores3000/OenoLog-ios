---
description: "Architektur-Standards für iOS-Entwicklung: MVVM-C, Clean Architecture, Dependency Injection"
globs:
  - "**/Domain/**"
  - "**/Infrastructure/**"
  - "**/Presentation/**"
alwaysApply: false
---

# Architektur-Standards

## Schichtentrennung

### Domain Layer
- Enthält nur Geschäftslogik, Entities und Use Cases
- Keine Abhängigkeiten zu Infrastructure oder Presentation
- Definiert Protokolle (Interfaces) für Repositories

### Infrastructure Layer
- Implementiert Repository-Protokolle aus Domain
- Verwaltet SwiftData Models und Persistenz
- Keine Abhängigkeiten zu Presentation

### Presentation Layer
- SwiftUI Views und ViewModels
- Coordinators für Navigation
- Abhängigkeiten nur über Protokolle zu Domain

## Dependency Injection
- Keine Singletons
- Alle Abhängigkeiten über Initialisierer injizieren
- Protokolle für alle externen Abhängigkeiten

## Beispiel-Struktur

```swift
// Domain/Entities/Wine.swift
protocol WineRepository {
    func save(_ wine: Wine) throws
}

// Infrastructure/Repositories/WineRepositoryImpl.swift
class WineRepositoryImpl: WineRepository {
    // Implementation
}

// Presentation/ViewModels/WineListViewModel.swift
class WineListViewModel {
    private let repository: WineRepository
    
    init(repository: WineRepository) {
        self.repository = repository
    }
}
```
