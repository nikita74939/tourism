# 📁 Tourism App - Project Structure Documentation

## Overview

This document provides a comprehensive guide to the Tourism App's file structure and organization.

## Directory Structure

```
tourism_app/
├── lib/                          # Main application code
│   ├── main.dart                 # Application entry point
│   │
│   ├── controllers/              # Business logic & state management (GetX)
│   │   ├── auth_controller.dart           # Authentication logic
│   │   ├── home_controller.dart           # Home page data management
│   │   ├── explore_controller.dart        # Destination exploration logic
│   │   ├── planner_controller.dart        # Trip planning management
│   │   ├── profile_controller.dart        # Profile management
│   │   ├── location_controller.dart       # Location services handler
│   │   ├── notification_controller.dart   # Notification management
│   │   └── currency_controller.dart       # Currency operations
│   │
│   ├── models/                   # Data models
│   │   ├── user_model.dart                # User data structure
│   │   ├── destination_model.dart         # Destination data structure
│   │   ├── trip_model.dart                # Trip data structure
│   │   ├── itinerary_model.dart           # Itinerary & notification models
│   │   └── currency_model.dart            # Currency & activity models
│   │
│   ├── pages/                    # UI Screens
│   │   ├── auth/                          # Authentication screens
│   │   │   ├── login_page.dart            # Login screen
│   │   │   └── register_page.dart         # Registration screen
│   │   │
│   │   ├── home/                          # Home screens
│   │   │   ├── home_page.dart             # Main home screen
│   │   │   └── main_navigation_page.dart  # Bottom navigation wrapper
│   │   │
│   │   ├── explore/                       # Exploration screens
│   │   │   ├── explore_page.dart          # Destination list & search
│   │   │   └── map_page.dart              # Map view (Google Maps)
│   │   │
│   │   ├── planner/                       # Trip planning screens
│   │   │   ├── planner_page.dart          # Trip list & management
│   │   │   └── add_itinerary_page.dart    # Add activity to trip
│   │   │
│   │   ├── profile/                       # Profile screens
│   │   │   └── profile_page.dart          # User profile & settings
│   │   │
│   │   └── splash/                        # Splash screen
│   │       └── splash_page.dart           # App launch screen
│   │
│   ├── services/                 # External service integrations
│   │   ├── api_service.dart               # HTTP client (Dio wrapper)
│   │   ├── auth_service.dart              # Authentication API calls
│   │   ├── location_service.dart          # GPS & geocoding services
│   │   ├── currency_service.dart          # Currency API calls
│   │   ├── time_service.dart              # Date/time utilities
│   │   └── notification_service.dart      # Local notifications handler
│   │
│   ├── storage/                  # Local data persistence
│   │   └── local_storage.dart             # GetStorage wrapper for local data
│   │
│   ├── routes/                   # Navigation configuration
│   │   ├── app_routes.dart                # Route name constants
│   │   └── app_pages.dart                 # Route definitions (GetX)
│   │
│   ├── widgets/                  # Reusable UI components
│   │   ├── custom_button.dart             # Custom button widget
│   │   ├── custom_textfield.dart          # Custom text field widget
│   │   ├── loading_widget.dart            # Loading indicator
│   │   └── empty_state_widget.dart        # Empty state display
│   │
│   └── utils/                    # Utilities & helpers
│       ├── constants.dart                 # App constants (colors, strings, etc.)
│       ├── validators.dart                # Form validation functions
│       └── helpers.dart                   # Helper functions
│
├── assets/                       # Static resources
│   ├── images/                            # Image assets
│   ├── icons/                             # Icon assets
│   └── fonts/                             # Custom fonts (Poppins)
│
├── android/                      # Android specific configuration
│   └── app/
│       └── src/
│           └── main/
│               └── AndroidManifest.xml    # Android permissions & config
│
├── ios/                          # iOS specific configuration
│   └── Runner/
│       ├── Info.plist                     # iOS permissions & config
│       └── AppDelegate.swift              # iOS app delegate
│
├── test/                         # Unit and widget tests
│
├── pubspec.yaml                  # Flutter dependencies
├── analysis_options.yaml         # Dart analyzer configuration
├── .gitignore                    # Git ignore rules
├── README.md                     # Project documentation
├── SETUP_GUIDE.md                # Installation guide
└── PROJECT_STRUCTURE.md          # This file
```

## File Descriptions

### Core Application Files

#### `main.dart`
- Application entry point
- Initializes services (Storage, API, Notifications)
- Configures app theme and routing
- Determines initial route based on login status

### Controllers Layer

Controllers manage state and business logic using GetX:

#### `auth_controller.dart`
- Handles user authentication
- Manages login/logout state
- Stores user session data
- JWT token management

#### `home_controller.dart`
- Fetches popular destinations
- Loads upcoming trips
- Manages home page data

#### `explore_controller.dart`
- Handles destination search
- Manages nearby destinations (LBS)
- Location-based filtering

#### `planner_controller.dart`
- CRUD operations for trips
- Manages itineraries
- Trip filtering (upcoming/ongoing/past)

#### `profile_controller.dart`
- User profile management
- Settings handler
- Logout functionality

#### `location_controller.dart`
- GPS location access
- Address geocoding
- Permission handling

#### `notification_controller.dart`
- Schedule local notifications
- Reminder management

#### `currency_controller.dart`
- Currency list management
- Currency conversion

### Models Layer

Data models represent API responses:

#### `user_model.dart`
- User entity structure
- Authentication response model

#### `destination_model.dart`
- Destination entity
- Includes location coordinates
- Helper getters for UI

#### `trip_model.dart`
- Trip entity with destination
- Includes itineraries
- Status calculation (upcoming/ongoing/past)

#### `itinerary_model.dart`
- Activity/itinerary entity
- Notification model

#### `currency_model.dart`
- Currency entity
- Conversion response model
- Activity tracking model

### Pages Layer

UI screens organized by feature:

#### Auth Pages
- **login_page.dart**: User login form
- **register_page.dart**: User registration form

#### Home Pages
- **main_navigation_page.dart**: Bottom tab navigation
- **home_page.dart**: Dashboard with featured content

#### Explore Pages
- **explore_page.dart**: Destination browsing & search
- **map_page.dart**: Google Maps integration

#### Planner Pages
- **planner_page.dart**: Trip list management
- **add_itinerary_page.dart**: Activity creation form

#### Profile Pages
- **profile_page.dart**: User account & settings

#### Splash
- **splash_page.dart**: Launch screen with branding

### Services Layer

External integrations and API calls:

#### `api_service.dart`
- Dio HTTP client wrapper
- Request/response interceptors
- Error handling
- JWT token injection

#### `auth_service.dart`
- Login API endpoint
- Register API endpoint
- Get profile endpoint

#### `location_service.dart`
- Geolocator integration
- Permission requests
- Coordinate to address conversion

#### `currency_service.dart`
- Fetch currencies
- Convert currency amounts

#### `notification_service.dart`
- Flutter Local Notifications setup
- Schedule notifications
- Display notifications

#### `time_service.dart`
- Date/time manipulation utilities
- Date comparison helpers

### Storage Layer

#### `local_storage.dart`
- GetStorage wrapper
- Token persistence
- User data caching
- Search history
- Last location storage

### Routes Layer

#### `app_routes.dart`
- Route name constants
- Centralized route management

#### `app_pages.dart`
- GetX page definitions
- Route to page mapping

### Widgets Layer

Reusable UI components:

#### `custom_button.dart`
- Primary/outlined button variants
- Loading state support
- Customizable colors & sizes

#### `custom_textfield.dart`
- Form input with validation
- Password visibility toggle
- Icon support

#### `loading_widget.dart`
- Circular progress indicator
- Optional loading message

#### `empty_state_widget.dart`
- Empty list placeholder
- Icon, title, subtitle
- Optional action button

### Utils Layer

#### `constants.dart`
- App configuration constants
- API endpoints
- Color theme
- String resources
- Storage keys

#### `validators.dart`
- Form validation rules
- Email validation
- Password strength
- Required field checks

#### `helpers.dart`
- Date formatting
- Currency formatting
- Distance calculations
- String utilities

## Data Flow

### Authentication Flow
```
LoginPage → AuthController → AuthService → API
  ↓
LocalStorage (save token)
  ↓
MainNavigationPage
```

### Destination Exploration Flow
```
ExplorePage → ExploreController → ApiService → API
  ↓
DestinationModel List
  ↓
UI Display
```

### Trip Creation Flow
```
PlannerPage → Create Trip → PlannerController
  ↓
POST /trips → API
  ↓
Refresh trip list
```

## State Management

The app uses **GetX** for state management:

- **Reactive State**: `.obs` observables
- **Controllers**: Business logic separation
- **Dependency Injection**: `Get.put()` and `Get.find()`
- **Navigation**: `Get.to()` and `Get.back()`
- **Dialogs/Snackbars**: `Get.dialog()` and `Get.snackbar()`

## API Integration

All API calls go through `api_service.dart`:

1. Request interceptor adds JWT token
2. Response interceptor handles errors
3. Controllers call service methods
4. Services return models

## Local Storage

Data persisted locally:
- Authentication token (JWT)
- User profile data
- Last known location
- Search history

## Key Dependencies

| Package | Purpose |
|---------|---------|
| get | State management & navigation |
| dio | HTTP client |
| get_storage | Local key-value storage |
| geolocator | GPS location services |
| google_maps_flutter | Maps integration |
| flutter_local_notifications | Push notifications |
| cached_network_image | Image caching |
| intl | Date/number formatting |

## Design Patterns

1. **MVC Pattern**: Model-View-Controller architecture
2. **Repository Pattern**: Services layer abstracts API calls
3. **Singleton Pattern**: ApiService, LocalStorage instances
4. **Observer Pattern**: GetX reactive state management

## Best Practices Implemented

- ✅ Separation of concerns
- ✅ Reusable widgets
- ✅ Centralized constants
- ✅ Error handling
- ✅ Form validation
- ✅ Loading states
- ✅ Empty states
- ✅ Code documentation
- ✅ Consistent naming
- ✅ Type safety

## Adding New Features

### To add a new page:

1. Create page file in `lib/pages/<feature>/`
2. Create controller in `lib/controllers/`
3. Add route in `routes/app_routes.dart`
4. Register route in `routes/app_pages.dart`
5. Add navigation from existing pages

### To add new API endpoint:

1. Add method in appropriate service file
2. Create/update model if needed
3. Call from controller
4. Update UI to display data

### To add new widget:

1. Create file in `lib/widgets/`
2. Make it reusable with parameters
3. Document parameters
4. Use in pages

## Testing Strategy

```
test/
├── unit/              # Unit tests for utils, models
├── widget/            # Widget tests for UI components
└── integration/       # Integration tests for flows
```

## Build Variants

- **Debug**: Development with hot reload
- **Profile**: Performance profiling
- **Release**: Production optimized

## Environment Configuration

Different configs for:
- Development (local API)
- Staging (test server)
- Production (live server)

Configure in `utils/constants.dart`

---

**Last Updated**: December 2024

For setup instructions, see `SETUP_GUIDE.md`