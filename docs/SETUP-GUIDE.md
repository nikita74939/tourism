# 🚀 Tourism App - Complete Setup Guide

## Prerequisites Check

Before starting, ensure you have:

- ✅ Flutter SDK 3.0+ installed
- ✅ Android Studio or VS Code
- ✅ Git installed
- ✅ Backend API server running (see API_DOCUMENTATION.md)

## Step-by-Step Installation

### 1. Verify Flutter Installation

```bash
flutter doctor -v
```

Fix any issues reported before proceeding.

### 2. Clone or Extract Project

```bash
# If cloning from git
git clone <repository-url>
cd tourism_app

# OR if extracted from zip
cd tourism_app
```

### 3. Install Dependencies

```bash
flutter pub get
```

Wait for all packages to download (this may take a few minutes).

### 4. Configure API Base URL

**Option A: Development (Local Backend)**

Edit `lib/utils/constants.dart`:

```dart
// For Android Emulator
static const String baseUrl = 'http://10.0.2.2:3000/api';

// For iOS Simulator
static const String baseUrl = 'http://localhost:3000/api';

// For Real Device (use your computer's IP)
static const String baseUrl = 'http://192.168.1.xxx:3000/api';
```

**Option B: Production Server**

```dart
static const String baseUrl = 'https://your-api-server.com/api';
```

### 5. Setup Backend Server

Make sure your backend API is running:

```bash
# In your backend project directory
npm install
npm start

# Server should start on http://localhost:3000
```

Test API is working:
```bash
curl http://localhost:3000/api/destinations
```

### 6. Configure Permissions

#### Android

No additional configuration needed. Permissions are already in the manifest.

#### iOS

Ensure `ios/Runner/Info.plist` has location permissions (already included):

```xml
<key>NSLocationWhenInUseUsageDescription</key>
<string>We need your location to show nearby destinations</string>
```

### 7. Google Maps Setup (Optional but Recommended)

#### Get API Key

1. Go to [Google Cloud Console](https://console.cloud.google.com/)
2. Create new project or select existing
3. Enable "Maps SDK for Android" and "Maps SDK for iOS"
4. Create API key in Credentials
5. Restrict key to your app (recommended)

#### Configure Android

Edit `android/app/src/main/AndroidManifest.xml`:

Add before `</application>`:

```xml
<meta-data
    android:name="com.google.android.geo.API_KEY"
    android:value="YOUR_API_KEY_HERE"/>
```

#### Configure iOS

1. Open `ios/Runner/AppDelegate.swift`
2. Add import at top:

```swift
import GoogleMaps
```

3. Add in `application` function:

```swift
GMSServices.provideAPIKey("YOUR_API_KEY_HERE")
```

### 8. Run the App

#### Android

```bash
# List available devices
flutter devices

# Run on specific device
flutter run -d <device-id>

# Or simply
flutter run
```

#### iOS (macOS only)

```bash
# Open iOS folder and install pods
cd ios
pod install
cd ..

# Run app
flutter run
```

### 9. Build Release Version

#### Android APK

```bash
flutter build apk --release
```

APK location: `build/app/outputs/flutter-apk/app-release.apk`

#### Android App Bundle (for Play Store)

```bash
flutter build appbundle --release
```

Bundle location: `build/app/outputs/bundle/release/app-release.aab`

## Testing the App

### 1. Test Account

Use these credentials for testing (make sure they exist in your database):

```
Email: demo@tourism.com
Password: password123
```

Or register a new account in the app.

### 2. Test Features Checklist

- [ ] Register new user
- [ ] Login with credentials
- [ ] View home page with destinations
- [ ] Search destinations in Explore
- [ ] View nearby destinations (grant location permission)
- [ ] Create a new trip in Planner
- [ ] Add itinerary to trip
- [ ] View trip details
- [ ] Delete trip
- [ ] Check profile
- [ ] Logout

### 3. Test API Connectivity

If having connection issues:

1. Check backend server is running
2. Verify API URL in constants.dart
3. Test API endpoint in browser:
   ```
   http://10.0.2.2:3000/api/destinations
   ```
4. Check Android emulator can reach your local server

## Common Issues & Solutions

### Issue 1: "Unable to connect to server"

**Solutions:**
- Ensure backend is running on port 3000
- For Android emulator, use `10.0.2.2` instead of `localhost`
- For real device, use computer's IP address
- Check firewall isn't blocking port 3000
- Test API with curl or Postman first

### Issue 2: "Permission denied" for location

**Solutions:**
- Grant location permission when prompted
- Check Settings > Apps > Tourism App > Permissions
- For iOS: Settings > Privacy > Location Services

### Issue 3: "Google Maps not showing"

**Solutions:**
- Verify API key is correctly added
- Enable Maps SDK in Google Cloud Console
- Check API key has no restrictions blocking your app
- Rebuild app after adding API key

### Issue 4: "Dependencies error"

**Solutions:**
```bash
flutter clean
flutter pub get
```

If still failing:
```bash
flutter pub cache repair
flutter pub get
```

### Issue 5: "Gradle build failed" (Android)

**Solutions:**
```bash
cd android
./gradlew clean
cd ..
flutter clean
flutter run
```

### Issue 6: "Pod install failed" (iOS)

**Solutions:**
```bash
cd ios
pod deintegrate
pod install
cd ..
flutter run
```

## Device-Specific Setup

### Testing on Physical Android Device

1. Enable Developer Options:
   - Settings > About Phone
   - Tap "Build Number" 7 times

2. Enable USB Debugging:
   - Settings > Developer Options
   - Enable "USB Debugging"

3. Connect device via USB

4. Run: `flutter devices` to verify

5. Run: `flutter run`

### Testing on Physical iOS Device (macOS only)

1. Open Xcode: `open ios/Runner.xcworkspace`

2. Select your device from device menu

3. Trust your Apple Developer account

4. Run from Xcode or `flutter run`

## Environment Variables (Advanced)

Create `.env` file in project root:

```env
API_BASE_URL=http://10.0.2.2:3000/api
API_TIMEOUT=30
GOOGLE_MAPS_API_KEY=your_key_here
```

Then load using `flutter_dotenv` package.

## Database Setup

Ensure your backend database has:

1. Tables created (use `database-schema.sql`)
2. Sample destinations inserted
3. Currency rates updated

Test query:
```sql
SELECT * FROM destinations LIMIT 5;
```

## Performance Tips

### Development Mode
- Use debug build for development
- Hot reload with `r` in terminal
- Hot restart with `R` in terminal

### Production Mode
- Always use release builds for testing performance
- Enable ProGuard/R8 (already configured)
- Test on real devices, not just emulators

## Next Steps

After successful setup:

1. **Customize Branding**
   - Update app name in `pubspec.yaml`
   - Change app icon
   - Customize colors in `constants.dart`

2. **Add Features**
   - Implement map functionality
   - Add image upload
   - Enable social sharing

3. **Testing**
   - Write unit tests
   - Perform integration testing
   - Test on multiple devices

4. **Deployment**
   - Prepare store listings
   - Create screenshots
   - Submit to app stores

## Support

If you encounter issues not covered here:

1. Check Flutter documentation: https://flutter.dev/docs
2. Check GetX documentation: https://pub.dev/packages/get
3. Review API documentation
4. Check GitHub issues
5. Contact support team

## Useful Commands

```bash
# Check Flutter version
flutter --version

# Analyze code
flutter analyze

# Format code
flutter format lib/

# Run tests
flutter test

# Clean build
flutter clean

# Get dependencies
flutter pub get

# Upgrade dependencies
flutter pub upgrade

# Build release APK
flutter build apk --release

# Build release bundle
flutter build appbundle --release

# Run on specific device
flutter run -d <device-id>

# Check connected devices
flutter devices

# View logs
flutter logs
```

## Project Structure Reference

```
tourism_app/
├── lib/
│   ├── main.dart                    # App entry point
│   ├── controllers/                 # State management
│   ├── models/                      # Data models
│   ├── pages/                       # UI screens
│   │   ├── auth/                    # Login & Register
│   │   ├── home/                    # Home & Navigation
│   │   ├── explore/                 # Explore & Map
│   │   ├── planner/                 # Trip Planning
│   │   ├── profile/                 # User Profile
│   │   └── splash/                  # Splash Screen
│   ├── services/                    # API & Services
│   ├── storage/                     # Local Storage
│   ├── routes/                      # Navigation Config
│   ├── widgets/                     # Reusable Widgets
│   └── utils/                       # Helpers & Constants
├── assets/                          # Images & Icons
├── android/                         # Android specific
├── ios/                             # iOS specific
├── test/                            # Unit tests
└── pubspec.yaml                     # Dependencies

```

---

**Happy Coding! 🚀**

For more help, refer to:
- README.md - Project overview
- API_DOCUMENTATION.md - API reference
- database-schema.sql - Database structure