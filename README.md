# 🌍 Tourism App - Flutter Application

A comprehensive Flutter mobile application for tourism management with trip planning, destination exploration, and location-based services.

## 📱 Features

### Authentication
- User registration and login
- JWT token-based authentication
- Secure session management

### Home
- Welcome dashboard
- Popular destinations showcase
- Upcoming trips overview
- Quick navigation to features

### Explore
- Browse all tourist destinations
- Search destinations by name or city
- Location-based nearby destinations (LBS)
- Interactive map view (Google Maps integration)
- Real-time distance calculation

### Trip Planner
- Create and manage trips
- Add multiple itineraries per trip
- Set activity times and reminders
- View trip status (upcoming/ongoing/past)
- Filter trips by status
- Delete trips with confirmation

### Profile
- View user information
- Account settings
- Logout functionality

### Additional Features
- Currency converter
- Activity tracking (accelerometer sensor)
- Local notifications for trip reminders
- Offline data persistence
- Pull-to-refresh functionality

## 🏗️ Architecture

The app follows **MVC (Model-View-Controller)** pattern with **GetX** state management:

```
lib/
├── main.dart                 # App entry point
├── controllers/              # Business logic & state management
├── models/                   # Data models
├── pages/                    # UI screens
├── services/                 # API & external services
├── storage/                  # Local data persistence
├── routes/                   # Navigation configuration
├── widgets/                  # Reusable UI components
└── utils/                    # Helpers & constants
```

## 🛠️ Tech Stack

- **Framework:** Flutter 3.x
- **State Management:** GetX
- **HTTP Client:** Dio
- **Local Storage:** GetStorage
- **Location Services:** Geolocator, Geocoding
- **Maps:** Google Maps Flutter
- **Notifications:** Flutter Local Notifications
- **Image Caching:** Cached Network Image
- **Date Formatting:** Intl

## 📋 Prerequisites

- Flutter SDK (3.0.0 or higher)
- Dart SDK (3.0.0 or higher)
- Android Studio / VS Code with Flutter extensions
- Android SDK (for Android development)
- Xcode (for iOS development, macOS only)
- Backend API server running (see API_DOCUMENTATION.md)

## 🚀 Getting Started

### 1. Clone the repository

```bash
git clone <repository-url>
cd tourism_app
```

### 2. Install dependencies

```bash
flutter pub get
```

### 3. Configure API endpoint

Edit `lib/utils/constants.dart` and set your backend API URL:

```dart
static const String baseUrl = 'http://your-api-server:3000/api';
```

For Android emulator use: `http://10.0.2.2:3000/api`
For iOS simulator use: `http://localhost:3000/api`

### 4. Configure Google Maps (Optional)

#### Android
Edit `android/app/src/main/AndroidManifest.xml`:

```xml
<meta-data
    android:name="com.google.android.geo.API_KEY"
    android:value="YOUR_GOOGLE_MAPS_API_KEY"/>
```

#### iOS
Edit `ios/Runner/AppDelegate.swift`:

```swift
GMSServices.provideAPIKey("YOUR_GOOGLE_MAPS_API_KEY")
```

### 5. Run the app

```bash
flutter run
```

## 📱 Platform Setup

### Android Permissions

The following permissions are included in `AndroidManifest.xml`:

- `ACCESS_FINE_LOCATION` - For GPS location
- `ACCESS_COARSE_LOCATION` - For network location
- `INTERNET` - For API calls
- `ACCESS_NETWORK_STATE` - Check connectivity

### iOS Permissions

Add to `Info.plist`:

```xml
<key>NSLocationWhenInUseUsageDescription</key>
<string>We need your location to show nearby destinations</string>
<key>NSLocationAlwaysUsageDescription</key>
<string>We need your location to provide better services</string>
```

## 🔧 Configuration

### Base URL Configuration

Update `lib/utils/constants.dart`:

```dart
class AppConstants {
  static const String baseUrl = 'http://your-server:3000/api';
  // ... other constants
}
```

### App Colors

Customize colors in `lib/utils/constants.dart`:

```dart
class AppColors {
  static const primaryColor = Color(0xFF2196F3);
  static const accentColor = Color(0xFFFF5722);
  // ... other colors
}
```

## 📚 API Integration

The app integrates with the Tourism Backend API. Key endpoints:

- `POST /auth/register` - User registration
- `POST /auth/login` - User login
- `GET /auth/profile` - Get user profile
- `GET /destinations` - Get all destinations
- `GET /destinations/nearby` - Get nearby destinations
- `POST /trips` - Create trip
- `GET /trips` - Get user trips
- `POST /itineraries` - Add itinerary
- `GET /currencies` - Get currencies
- `GET /currencies/convert` - Convert currency
- `POST /activities` - Record activity

See `API_DOCUMENTATION.md` for complete API reference.

## 🗂️ Project Structure

### Controllers
- `auth_controller.dart` - Authentication logic
- `home_controller.dart` - Home page data
- `explore_controller.dart` - Destination exploration
- `planner_controller.dart` - Trip management
- `profile_controller.dart` - Profile management
- `location_controller.dart` - Location services
- `notification_controller.dart` - Notification handling
- `currency_controller.dart` - Currency operations

### Services
- `api_service.dart` - HTTP client wrapper
- `auth_service.dart` - Authentication API
- `location_service.dart` - GPS & geocoding
- `currency_service.dart` - Currency API
- `notification_service.dart` - Local notifications
- `time_service.dart` - Date/time utilities

### Models
- `user_model.dart` - User data
- `destination_model.dart` - Destination data
- `trip_model.dart` - Trip data
- `itinerary_model.dart` - Itinerary data
- `currency_model.dart` - Currency data

## 🧪 Testing

### Run all tests

```bash
flutter test
```

### Run with coverage

```bash
flutter test --coverage
```

## 📦 Build

### Android APK

```bash
flutter build apk --release
```

Output: `build/app/outputs/flutter-apk/app-release.apk`

### Android App Bundle

```bash
flutter build appbundle --release
```

Output: `build/app/outputs/bundle/release/app-release.aab`

### iOS

```bash
flutter build ios --release
```

## 🐛 Troubleshooting

### Common Issues

1. **API Connection Error**
   - Check if backend server is running
   - Verify API base URL in constants
   - Check network connectivity

2. **Location Permission Denied**
   - Ensure location permissions are granted
   - Check permission declarations in manifests

3. **Build Errors**
   - Run `flutter clean`
   - Run `flutter pub get`
   - Restart IDE

4. **Google Maps Not Showing**
   - Verify API key is correct
   - Enable Maps SDK in Google Cloud Console
   - Check API key restrictions

## 📝 Environment Variables

Create `.env` file for sensitive configuration:

```
API_BASE_URL=http://localhost:3000/api
GOOGLE_MAPS_API_KEY=your_api_key_here
```

## 🔐 Security Notes

- Never commit API keys to version control
- Use environment variables for sensitive data
- Implement certificate pinning for production
- Enable ProGuard/R8 for Android release builds
- Use secure storage for tokens

## 📄 License

This project is licensed under the MIT License.

## 👥 Contributors

- Your Name

## 🤝 Contributing

1. Fork the repository
2. Create feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to branch (`git push origin feature/AmazingFeature`)
5. Open Pull Request

## 📞 Support

For support, email support@yourapp.com or open an issue.

## 🔄 Version History

- **1.0.0** - Initial release
  - Authentication system
  - Destination exploration
  - Trip planning
  - Location-based services
  - Currency converter

## 🎯 Roadmap

- [ ] Offline mode improvements
- [ ] Social sharing features
- [ ] Reviews and ratings
- [ ] Photo upload
- [ ] Trip recommendations
- [ ] Multi-language support
- [ ] Dark mode theme
- [ ] Integration with travel APIs

---

**Made with ❤️ using Flutter**