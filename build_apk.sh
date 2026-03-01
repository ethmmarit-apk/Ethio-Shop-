#!/bin/bash

# EthioShop APK Build Script
# This script automates the process of building the release APK

set -e  # Exit on error

echo "=========================================="
echo "EthioShop APK Build Script"
echo "=========================================="
echo ""

# Check if Flutter is installed
if ! command -v flutter &> /dev/null; then
    echo "❌ Error: Flutter is not installed or not in PATH"
    echo "Please install Flutter from https://flutter.dev/docs/get-started/install"
    exit 1
fi

echo "✅ Flutter found: $(flutter --version | head -n 1)"
echo ""

# Check if Android SDK is configured
if [ -z "$ANDROID_HOME" ]; then
    echo "⚠️  Warning: ANDROID_HOME environment variable is not set"
    echo "Attempting to use default Android SDK location..."
fi

# Navigate to project directory
cd "$(dirname "$0")"
echo "📁 Project directory: $(pwd)"
echo ""

# Step 1: Get Flutter dependencies
echo "📦 Step 1: Getting Flutter dependencies..."
flutter pub get
echo "✅ Dependencies installed"
echo ""

# Step 2: Clean previous builds
echo "🧹 Step 2: Cleaning previous builds..."
flutter clean
echo "✅ Clean completed"
echo ""

# Step 3: Get dependencies again after clean
echo "📦 Step 3: Getting dependencies after clean..."
flutter pub get
echo "✅ Dependencies installed"
echo ""

# Step 4: Build release APK
echo "🔨 Step 4: Building release APK..."
echo "This may take several minutes..."
echo ""

flutter build apk --release

if [ $? -eq 0 ]; then
    echo ""
    echo "=========================================="
    echo "✅ Build Successful!"
    echo "=========================================="
    echo ""
    echo "APK Location:"
    echo "  build/app/outputs/flutter-apk/app-release.apk"
    echo ""
    echo "APK Size:"
    ls -lh build/app/outputs/flutter-apk/app-release.apk | awk '{print "  " $5}'
    echo ""
    echo "To install on device:"
    echo "  adb install build/app/outputs/flutter-apk/app-release.apk"
    echo ""
    echo "To install on connected device/emulator:"
    echo "  flutter install"
    echo ""
else
    echo ""
    echo "=========================================="
    echo "❌ Build Failed!"
    echo "=========================================="
    echo ""
    echo "Please check the error messages above."
    echo "Common issues:"
    echo "  - Android SDK not found (set ANDROID_HOME)"
    echo "  - Java not installed (install JDK 11+)"
    echo "  - Gradle build errors (try flutter clean)"
    echo ""
    exit 1
fi