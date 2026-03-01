# EthioShop - Flutter E-commerce App with Firebase Integration

## Project Overview
EthioShop is a premium E-commerce Flutter application with complete Firebase integration for Android.

## Project Configuration

### App Details
- **Project Name**: EthioShop
- **Package Name**: com.ethio.shop
- **Firebase Project ID**: ethioshop-18181
- **App ID**: 1:1009602861548:android:1694ae6baa0ef10ce608c9

### Firebase Configuration
✅ Google Services JSON configured
✅ Firebase Analytics integrated
✅ Firebase BOM (Bill of Materials) included
✅ SHA-1 and SHA-256 certificate fingerprints configured

### App Icons
✅ All launcher icons configured from res.zip
✅ Play Store icon included
✅ Multiple density support (hdpi, mdpi, xhdpi, xxhdpi, xxxhdpi)

## Prerequisites for Building APK

### Required Software
1. **Flutter SDK** (3.2.0 or higher)
   - Download from: https://flutter.dev/docs/get-started/install
   - Add Flutter to your PATH

2. **Android Studio** or **Android SDK Command-line Tools**
   - Download from: https://developer.android.com/studio
   - Install Android SDK (API level 33 or higher)
   - Install Android SDK Build-Tools (33.0.0 or higher)
   - Install Android SDK Platform-Tools

3. **Java Development Kit (JDK)**
   - JDK 11 or higher required
   - Download from: https://www.oracle.com/java/technologies/downloads/

### Environment Variables
Set the following environment variables:
```bash
export ANDROID_HOME=/path/to/your/android/sdk
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:/path/to/flutter/bin
```

## Build Instructions

### Step 1: Navigate to Project Directory
```bash
cd /path/to/EthioShop
```

### Step 2: Get Flutter Dependencies
```bash
flutter pub get
```

### Step 3: Verify Flutter Setup
```bash
flutter doctor
```
Ensure all required components are installed and configured.

### Step 4: Clean Previous Builds (Optional)
```bash
flutter clean
```

### Step 5: Build Release APK
```bash
flutter build apk --release
```

### Step 6: Locate the APK
After successful build, the APK will be located at:
```
build/app/outputs/flutter-apk/app-release.apk
```

## Alternative Build Methods

### Build Debug APK
```bash
flutter build apk --debug
```

### Build APK for Specific Architecture
```bash
flutter build apk --release --split-per-abi
```
This will create separate APKs for:
- app-armeabi-v7a-release.apk (32-bit ARM)
- app-arm64-v8a-release.apk (64-bit ARM)
- app-x86_64-release.apk (x86_64)

## Troubleshooting

### Issue: "Android SDK not found"
**Solution**: Set ANDROID_HOME environment variable pointing to your Android SDK directory.

### Issue: "Gradle build failed"
**Solution**: 
1. Clean the project: `flutter clean`
2. Delete `.gradle` folder in android directory
3. Run `flutter pub get` again
4. Try building again

### Issue: "License not accepted"
**Solution**: Accept Android SDK licenses:
```bash
flutter doctor --android-licenses
```

### Issue: "Out of memory during build"
**Solution**: Increase Gradle memory by creating `android/gradle.properties`:
```properties
org.gradle.jvmargs=-Xmx4G
```

## Project Structure

```
EthioShop/
├── android/
│   ├── app/
│   │   ├── build.gradle          # App-level build configuration
│   │   ├── google-services.json  # Firebase configuration
│   │   └── src/
│   │       └── main/
│   │           ├── AndroidManifest.xml
│   │           ├── kotlin/com/ethio/shop/
│   │           │   └── MainActivity.kt
│   │           └── res/          # App icons and resources
│   ├── build.gradle              # Project-level build configuration
│   ├── gradle.properties
│   └── settings.gradle
├── lib/                          # Flutter source code
├── assets/                       # App assets
├── pubspec.yaml                  # Flutter dependencies
└── README.md                     # This file
```

## Firebase Integration Details

### Configured Firebase Services
- **Firebase Analytics**: For user behavior tracking
- **Firebase Authentication**: Ready to implement
- **Firebase Cloud Firestore**: Ready to implement
- **Firebase Storage**: Ready to implement

### Adding More Firebase Services
To add more Firebase services, update `android/app/build.gradle`:

```gradle
dependencies {
    implementation platform('com.google.firebase:firebase-bom:32.7.0')
    implementation 'com.google.firebase:firebase-analytics'
    // Add more Firebase services here
    implementation 'com.google.firebase:firebase-auth'
    implementation 'com.google.firebase:firebase-firestore'
}
```

## Testing the APK

### Install on Android Device
```bash
adb install build/app/outputs/flutter-apk/app-release.apk
```

### Install on Emulator
```bash
flutter install
```

## Support

For issues related to:
- **Flutter**: Visit https://flutter.dev/docs/resources/faq
- **Firebase**: Visit https://firebase.google.com/docs
- **Android Development**: Visit https://developer.android.com/docs

## License

This project uses the following licenses:
- Flutter SDK: BSD 3-Clause License
- Firebase: Firebase Terms of Service

## Version Information

- Flutter SDK: 3.2.0+
- Dart: 3.2.0+
- Android Gradle Plugin: 7.3.0
- Gradle: 7.5.1
- Kotlin: 1.7.10
- Target SDK: 33
- Min SDK: 21

---

**Note**: This project is fully configured and ready to build. Follow the build instructions above to generate your release APK.