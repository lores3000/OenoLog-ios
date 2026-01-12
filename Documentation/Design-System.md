# Design-System für VinLogistics

Diese Dokumentation definiert das Design-System mit Design-Tokens, wiederverwendbaren Komponenten und Style-Guide.

## Design-Philosophie

- **Modern iOS Design**: System-Standards, SF Symbols, native iOS-Komponenten
- **Liquid Glass UX/UI**: Aktuelle iOS Design-Trends mit glasigen, flüssigen Elementen
- **Klarheit vor Dekoration**: Funktionale, datenlastige Darstellung
- **Accessibility First**: WCAG AA-konform, VoiceOver-Support, Dynamic Type

## Design-Tokens

### Farben

#### System-Farben (iOS Dynamic Colors)

Die App verwendet primär iOS System-Farben für optimale Dark/Light Mode Unterstützung:

```swift
// Primär-Farben
.primary          // System Primary Color (adaptiv)
.secondary        // System Secondary Color (adaptiv)
.accentColor      // App-Akzentfarbe

// Hintergrund-Farben
.background       // System Background (adaptiv)
.secondaryBackground  // System Secondary Background (adaptiv)
.tertiaryBackground   // System Tertiary Background (adaptiv)

// Text-Farben
.foreground       // System Foreground (adaptiv)
.secondaryForeground  // System Secondary Foreground (adaptiv)
.tertiaryForeground   // System Tertiary Foreground (adaptiv)
```

#### Trinkreife-Farben

Spezielle Farben für Trinkreife-Visualisierung:

```swift
// Trinkreife-Status
.drinkabilityNotReady    // Grün: Noch nicht trinkreif
.drinkabilitySoon         // Orange: Bald trinkreif (1-2 Jahre)
.drinkabilityReady        // Rot: Jetzt trinkreif
.drinkabilityOverripe     // Grau: Überreif
```

**Farbwerte (Light Mode):**
- Not Ready: `Color(red: 0.2, green: 0.7, blue: 0.3)` (Grün)
- Soon: `Color(red: 1.0, green: 0.6, blue: 0.0)` (Orange)
- Ready: `Color(red: 0.9, green: 0.2, blue: 0.2)` (Rot)
- Overripe: `Color(red: 0.5, green: 0.5, blue: 0.5)` (Grau)

**Farbwerte (Dark Mode):**
- Angepasste Werte für bessere Sichtbarkeit im Dark Mode

#### Lagerort-Farben

```swift
.locationCellar      // Keller (Blau-Ton)
.locationApartment   // Wohnung (Grün-Ton)
```

### Typografie

#### Schriftarten

System-Schriftart SF Pro wird verwendet:

```swift
// Headlines
.font(.largeTitle)      // 34pt, Bold
.font(.title)           // 28pt, Bold
.font(.title2)          // 22pt, Bold
.font(.title3)          // 20pt, Semibold

// Body
.font(.body)            // 17pt, Regular
.font(.headline)         // 17pt, Semibold
.font(.subheadline)     // 15pt, Regular

// Captions
.font(.footnote)        // 13pt, Regular
.font(.caption)         // 12pt, Regular
.font(.caption2)        // 11pt, Regular
```

#### Schriftgewichte

- **Regular**: Standard-Text
- **Semibold**: Headlines, wichtige Informationen
- **Bold**: Titel, Hervorhebungen

#### Zeilenhöhen

- Standard: 1.2x Schriftgröße
- Kompakt: 1.1x Schriftgröße (für Listen)
- Locker: 1.4x Schriftgröße (für längere Texte)

### Spacing

#### Spacing-Scale

```swift
// Spacing-Tokens
.spacingXS    = 4pt   // Sehr kleine Abstände
.spacingS     = 8pt   // Kleine Abstände
.spacingM     = 16pt  // Standard-Abstände
.spacingL     = 24pt  // Große Abstände
.spacingXL    = 32pt  // Sehr große Abstände
.spacingXXL   = 48pt  // Extra große Abstände
```

#### Padding

```swift
// Container-Padding
.padding(.small)    = 8pt
.padding(.medium)  = 16pt
.padding(.large)   = 24pt
```

#### Margins

```swift
// Element-Margins
.margin(.small)    = 8pt
.margin(.medium)   = 16pt
.margin(.large)    = 24pt
```

### Corner Radius

```swift
// Corner Radius-Tokens
.cornerRadiusSmall   = 8pt   // Buttons, kleine Karten
.cornerRadiusMedium  = 12pt  // Karten, Container
.cornerRadiusLarge   = 16pt  // Große Karten, Modals
```

### Shadows

```swift
// Shadow-Tokens (Light Mode)
.shadowSmall  = Shadow(color: .black.opacity(0.1), radius: 2, x: 0, y: 1)
.shadowMedium = Shadow(color: .black.opacity(0.15), radius: 4, x: 0, y: 2)
.shadowLarge  = Shadow(color: .black.opacity(0.2), radius: 8, x: 0, y: 4)
```

### Icons

#### SF Symbols

Die App verwendet primär SF Symbols für Icons:

```swift
// Primäre Icons
"wineglass.fill"           // App-Icon, Wein
"camera.fill"              // Scanner
"list.bullet"              // Liste, Inventur
"gearshape.fill"           // Einstellungen

// Lagerort-Icons
"house.fill"               // Wohnung
"building.2.fill"          // Keller

// Flaschen-Typ-Icons
"bottle.fill"              // Standard
"bottle.fill.badge.plus"   // Magnum
"bottle.fill.badge.checkmark"  // 3L

// Status-Icons
"checkmark.circle.fill"    // Vorhanden
"xmark.circle.fill"        // Fehlend
"clock.fill"               // Trinkreife
```

#### Icon-Größen

```swift
.imageScale(.small)    // 12pt
.imageScale(.medium)  // 16pt
.imageScale(.large)   // 20pt
```

## Wiederverwendbare Komponenten

### WineListItem

Kompakte Liste-Item-Komponente für Flaschen:

```swift
WineListItem(
    name: "Château Meyney",
    vintage: 2014,
    location: .cellar,
    drinkabilityRange: "2020-2026 (Ø 2023)",
    quantity: 6,
    bottleType: .standard,
    isDrinkableNow: true
)
```

**Eigenschaften:**
- Name + Jahrgang (Headline)
- Lagerort-Icon + Text
- Trinkreife-Anzeige mit Farbcodierung
- Anzahl + Flaschen-Typ
- Swipe-Actions (Umlagern, Getrunken)

### DrinkabilityBadge

Badge für Trinkreife-Anzeige:

```swift
DrinkabilityBadge(
    from: 2020,
    to: 2026,
    average: 2023,
    showAverage: true
)
```

**Eigenschaften:**
- Format: "2020-2026 (Ø 2023)" oder "2020-2026"
- Farbcodierung basierend auf Status
- Kompakt für Listen, erweitert für Details

### LocationBadge

Badge für Lagerort-Anzeige:

```swift
LocationBadge(location: .cellar)  // Keller
LocationBadge(location: .apartment)  // Wohnung
```

**Eigenschaften:**
- Icon + Text
- Farbcodierung (Keller: Blau, Wohnung: Grün)

### BottleTypeIcon

Icon für Flaschen-Typ:

```swift
BottleTypeIcon(type: .standard)   // Standard
BottleTypeIcon(type: .magnum)     // Magnum
BottleTypeIcon(type: .threeLiter) // 3L
BottleTypeIcon(type: .whiteWine)  // Weisswein
```

### ScannerView

Kamera-View mit OCR-Integration:

```swift
ScannerView(
    onScan: { result in
        // OCR-Ergebnis verarbeiten
    }
)
```

**Eigenschaften:**
- Vollbild-Kamera
- OCR-Erkennung
- Manuelle Fokus-Anpassung
- Fehlerbehandlung

### MinimalWineForm

Minimales Formular für schnelle Erfassung:

```swift
MinimalWineForm(
    onSave: { wine in
        // Flasche speichern
    }
)
```

**Eigenschaften:**
- Nur Pflichtfelder
- Schnelle Eingabe
- Validierung
- Ein-Klick-Speichern

### FilterSegmentedControl

Segmented Control für Filter:

```swift
FilterSegmentedControl(
    options: ["Trinkreif", "Keller", "Wohnung", "Subskriptionen"],
    selection: $selectedFilter
)
```

### SwipeActions

Swipe-Actions für Liste-Items:

```swift
SwipeActions(edge: .trailing) {
    Button("Umlagern") { /* ... */ }
    Button("Getrunken") { /* ... */ }
    Button("Bearbeiten") { /* ... */ }
}
```

## Layout-Patterns

### Card-Layout

Karten für Detail-Ansichten:

```swift
Card {
    // Inhalt
}
.padding(.medium)
.background(.secondaryBackground)
.cornerRadius(.medium)
.shadow(.small)
```

### List-Layout

Listen für Übersichten:

```swift
List {
    ForEach(wines) { wine in
        WineListItem(wine: wine)
    }
}
.listStyle(.insetGrouped)
```

### Form-Layout

Formulare für Eingaben:

```swift
Form {
    Section("Pflichtfelder") {
        // Pflichtfelder
    }
    Section("Optionale Felder") {
        // Optionale Felder
    }
}
```

## Animationen

### Transitions

```swift
// Standard-Transitions
.transition(.opacity)
.transition(.slide)
.transition(.scale)

// Custom-Transitions
.transition(.asymmetric(
    insertion: .move(edge: .trailing),
    removal: .move(edge: .leading)
))
```

### Haptic Feedback

```swift
// Haptic Feedback für Aktionen
let impactFeedback = UIImpactFeedbackGenerator(style: .medium)
impactFeedback.impactOccurred()

// Für Erfolg
let notificationFeedback = UINotificationFeedbackGenerator()
notificationFeedback.notificationOccurred(.success)
```

## Dark Mode

Alle Komponenten unterstützen automatisch Dark Mode durch:
- System-Farben (Dynamic Colors)
- Adaptive Icons
- Angepasste Schatten (reduziert im Dark Mode)

## Accessibility

### VoiceOver Labels

```swift
.accessibilityLabel("Château Meyney, Jahrgang 2014, 6 Flaschen im Keller")
.accessibilityHint("Doppeltippen zum Öffnen")
```

### Dynamic Type

Alle Text-Komponenten unterstützen Dynamic Type:

```swift
.font(.body)
.dynamicTypeSize(...dynamicTypeSize)
```

### Farbkontrast

- Mindestens 4.5:1 Kontrast für Text
- WCAG AA-konform
- Farbblind-freundlich (nicht nur Farbe für Information)

## Responsive Design

### iPhone Größen

- **iPhone SE / Mini**: Kompakte Darstellung
- **iPhone Standard**: Standard-Layout
- **iPhone Plus / Pro Max**: Erweiterte Darstellung

### Orientierung

- Primär: Portrait
- Unterstützung: Landscape (optional)

## Performance-Guidelines

### Lazy Loading

- Listen verwenden `LazyVStack` oder `List` mit Lazy Loading
- Bilder werden lazy geladen

### Caching

- OCR-Ergebnisse werden gecacht
- Bilder werden gecacht

### Optimierung

- Minimale Re-Renders
- Effiziente State-Management
- Smooth Scrolling auch bei großen Listen

## Implementierungs-Hinweise

### SwiftUI Best Practices

```swift
// View-Modifier für wiederverwendbare Styles
extension View {
    func wineCardStyle() -> some View {
        self
            .padding(.medium)
            .background(.secondaryBackground)
            .cornerRadius(.medium)
            .shadow(.small)
    }
}
```

### Design-Token-Implementierung

```swift
// Design-Tokens als Extension
extension CGFloat {
    static let spacingXS: CGFloat = 4
    static let spacingS: CGFloat = 8
    static let spacingM: CGFloat = 16
    static let spacingL: CGFloat = 24
    static let spacingXL: CGFloat = 32
    static let spacingXXL: CGFloat = 48
}
```

### Komponenten-Struktur

```
Presentation/
  Components/
    WineListItem.swift
    DrinkabilityBadge.swift
    LocationBadge.swift
    BottleTypeIcon.swift
    ScannerView.swift
    MinimalWineForm.swift
    FilterSegmentedControl.swift
```

## Nächste Schritte

1. Implementierung der Design-Tokens in Swift
2. Erstellung der wiederverwendbaren Komponenten
3. Integration in die Screens
4. Testing auf verschiedenen Geräten und Dark Mode
5. Accessibility-Testing mit VoiceOver
