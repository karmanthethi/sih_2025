# Krishi Sakhi - AI-Powered Farming Assistant

## Overview
Krishi Sakhi is a Flutter mobile application designed specifically for Kerala's smallholder farmers. The app converts the existing HTML pages into a comprehensive mobile solution with seamless navigation and Malayalam language support.

## Features

### Core Functionality
1. **Farmer & Farm Profiling** - Complete profile setup with location, land size, crop details
2. **Conversational Interface** - Malayalam voice and text chat with AI assistant
3. **Activity Tracking** - Log farming activities (sowing, irrigation, pest control, etc.)
4. **Personalized Advisory** - AI-powered weather alerts, pest warnings, and crop recommendations
5. **Reminders & Alerts** - Push notifications for farming activities
6. **Knowledge Engine** - Local farming guides and best practices

### Technical Features
- **Flutter Framework** - Cross-platform mobile development
- **Material Design** - Following Indian flag color scheme (Saffron, White, Green)
- **Malayalam Support** - Localized UI and content
- **Voice Integration** - Speech-to-text and text-to-speech capabilities
- **Offline Support** - Works without internet connection
- **Progressive Enhancement** - Ready for AI integration

## App Flow

1. **Splash Screen** - App loading with Krishi Sakhi branding
2. **Welcome Screen** - Introduction to the app
3. **Tutorial Screen** - Feature overview with progress indicators
4. **Permissions Screen** - Location and notification permissions
5. **Login/Registration** - User authentication
6. **Farmer Profiling** - Multi-step profile creation
7. **Dashboard** - Main advisory interface with insights
8. **Chat Interface** - Malayalam conversational AI
9. **Activity Tracking** - Farming activity logging
10. **Knowledge Base** - Searchable farming guides
11. **Settings** - App configuration and help

## Architecture

```
lib/
├── main.dart                 # App entry point
├── screens/                  # All screen implementations
│   ├── splash_screen.dart
│   ├── welcome_screen.dart
│   ├── tutorial_screen.dart
│   ├── permissions_screen.dart
│   ├── login_screen.dart
│   ├── farmer_profile_screen.dart
│   ├── account_creation_screen.dart
│   ├── conversational_interface.dart
│   ├── activity_tracking_screen.dart
│   ├── advisory_dashboard_screen.dart
│   ├── knowledge_base_screen.dart
│   └── settings_help_screen.dart
├── services/                 # App services
│   └── navigation_service.dart
├── utils/                    # Utilities
│   └── app_theme.dart
├── widgets/                  # Reusable widgets
├── models/                   # Data models
└── l10n/                     # Localization files
```

## Color Scheme
- **Saffron (#FF9933)** - Primary color (buttons, highlights)
- **Green (#138808)** - Secondary color (success, nature)
- **White (#FFFFFF)** - Background and text
- **Blue Chakra (#000080)** - Accent color (Ashoka Chakra representation)

## Dependencies
- flutter_localizations - For Malayalam support
- provider - State management
- speech_to_text - Voice input
- flutter_tts - Text-to-speech
- geolocator - Location services
- permission_handler - Permission management
- shared_preferences - Local storage
- http - API communication

## Getting Started

1. Install Flutter SDK
2. Clone the repository
3. Run `flutter pub get` to install dependencies
4. Run `flutter run` to start the app

## Future Enhancements
- AI model integration for crop recommendations
- Weather API integration
- Market price feeds
- IoT sensor integration
- Community features
- Multilingual support (Tamil, Kannada)

## Target Users
- Smallholder farmers in Kerala
- Agricultural extension workers
- Farming cooperatives
- New farmers seeking guidance

This app empowers farmers with personalized, on-demand support, enhances productivity and sustainability, and bridges the knowledge gap using AI and local context.