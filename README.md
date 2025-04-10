# Movie App

A modern Flutter application that showcases trending movies with a beautiful, responsive UI and smooth user experience.

## Features

- 🎬 Display trending movies from TMDB API
- 🎨 Dynamic UI colors based on movie posters
- 🔄 Efficient image loading and caching
- 🌐 Robust network connectivity handling
- ⚡ Optimized performance with state management
- 💫 Smooth animations and transitions

## Project Structure

```
lib/
├── core/
│   ├── constants/
│   │   └── apiend_point.dart
│   ├── enums/
│   │   └── enums.dart
│   ├── services/
│   │   └── connectivity_service.dart
│   └── utils/
├── data/
│   ├── models/
│   │   └── movies_list_module.dart
│   ├── remote/
│   │   └── api_call.dart
│   └── repositories/
│       └── home_repository.dart
├── presentation/
│   ├── controllers/
│   │   ├── home_controller.dart
│   │   └── home_bindings.dart
│   ├── pages/
│   │   ├── home_page.dart
│   │   └── movie_details_page.dart
│   └── widgets/
│       ├── movie_card.dart
│       └── error_widget.dart
└── main.dart
```

## Requirements

- Flutter SDK: >=3.0.0
- Dart SDK: >=3.0.0
- iOS: 11.0 or higher
- Android: API level 21 (Android 5.0) or higher

## Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8
  get: ^4.7.2
  http: ^1.3.0
  palette_generator: ^0.3.3+6
  intl: ^0.20.2
  connectivity_plus: ^5.0.2
  cached_network_image: ^3.3.1
```

## Setup and Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd dummy_project
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

## Configuration

1. The app uses TMDB API. Make sure to update the API key in `lib/data/remote/api_call.dart`
2. For iOS, network permissions are configured in `ios/Runner/Info.plist`
3. For Android, network permissions are in `android/app/src/main/AndroidManifest.xml`

## Architecture

- **State Management**: GetX for reactive state management and dependency injection
- **Network Layer**: HTTP client with proper error handling and connectivity checks
- **UI Components**: Custom widgets with optimized rendering and caching
- **Data Flow**: Repository pattern for clean separation of concerns

## Performance Optimizations

- Image caching for faster loading
- Dominant color extraction with caching mechanism
- Lazy loading of movie details
- Network connectivity monitoring
- Efficient state management to minimize rebuilds

## Error Handling

- Comprehensive network error handling
- Graceful fallbacks for missing data
- User-friendly error messages
- Offline support with proper user feedback

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details

## Acknowledgments

- TMDB API for providing movie data
- Flutter team for the amazing framework
- GetX team for the state management solution
