#!/bin/bash
# Setup-Skript für OenoLog iOS-Projekt

set -e

echo "🚀 Erstelle Xcode-Projekt für OenoLog..."

# Prüfe ob xcodegen installiert ist
if command -v xcodegen &> /dev/null; then
    echo "✓ xcodegen gefunden, erstelle Projekt..."
    xcodegen generate
    echo "✓ Projekt erfolgreich erstellt!"
else
    echo "⚠️  xcodegen nicht gefunden."
    echo ""
    echo "Bitte installiere xcodegen:"
    echo "  brew install xcodegen"
    echo ""
    echo "Oder erstelle das Projekt manuell in Xcode:"
    echo "  1. Öffne Xcode"
    echo "  2. File > New > Project"
    echo "  3. Wähle 'iOS' > 'App'"
    echo "  4. Name: OenoLog"
    echo "  5. Interface: SwiftUI"
    echo "  6. Language: Swift"
    echo "  7. Storage: SwiftData"
    echo "  8. Speichere im aktuellen Verzeichnis"
    echo ""
    echo "Dann kopiere die Dateien aus OenoLog/ in das neue Projekt."
fi

