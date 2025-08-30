# Firebase Authentication Setup Guide for DogFood Flutter App

This guide explains how Firebase Authentication is integrated and used in the DogFood Flutter app.

## Prerequisites

- A Firebase project created in the [Firebase Console](https://console.firebase.google.com/)
- Android and iOS apps registered in the Firebase project
- `google-services.json` added to `android/app/`
- `GoogleService-Info.plist` added to `ios/Runner/`
- Flutter environment set up on your machine

## Dependencies

The following dependencies are included in `pubspec.yaml`:

```yaml
dependencies:
  flutter:
    sdk: flutter
  firebase_core: ^3.15.1
  firebase_auth: ^5.6.2
  provider: ^6.0.5
```

## Firebase Initialization

Firebase is initialized in `lib/main.dart` before running the app:

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(DogFoodApp());
}
```

## Provider Setup

`AuthService` and other services are provided using the `provider` package in `main.dart`:

```dart
MultiProvider(
  providers: [
    ChangeNotifierProvider<AuthService>(
      create: (_) => AuthService(),
    ),
    // Other providers...
  ],
  child: MaterialApp(
    // ...
  ),
);
```

## Authentication Service

`lib/services/auth_service.dart` contains the `AuthService` class which wraps Firebase Authentication methods:

- `signIn({email, password})`: Signs in a user with email and password.
- `signUp({email, password})`: Registers a new user.
- `signOut()`: Signs out the current user.
- `authStateChanges`: Stream to listen to authentication state changes.
- `currentUser`: Getter for the current logged-in user.

Example usage in `login_screen.dart`:

```dart
final authService = Provider.of<AuthService>(context);

await authService.signIn(email: email, password: password);
await authService.signUp(email: email, password: password);
await authService.signOut();
```

## Authentication Flow

The app uses an `AuthWrapper` widget in `main.dart` to listen to authentication state changes and show the appropriate screen:

- If the user is logged in, show `HomeScreen`.
- If the user is not logged in, show `LoginScreen`.

```dart
StreamBuilder(
  stream: authService.authStateChanges,
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.active) {
      final user = snapshot.data;
      if (user == null) {
        return LoginScreen();
      } else {
        return HomeScreen();
      }
    }
    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  },
);
```

## Login Screen

The login screen (`lib/screens/login_screen.dart`) provides UI for login and registration using email and password. It uses `AuthService` methods and displays error messages if authentication fails.

## Additional Setup

- Make sure to add your Firebase project configuration files (`google-services.json` and `GoogleService-Info.plist`) to the respective platform folders.
- For Android, ensure your `android/build.gradle` and `android/app/build.gradle` files are configured for Firebase (usually done by Firebase CLI or manual setup).
- For iOS, ensure CocoaPods are installed and run `pod install` in the `ios` directory.

## Running the App

Run the app on an emulator or physical device:

```bash
flutter run
```

You should be able to register a new user, log in, and log out using Firebase Authentication.

---

This completes the Firebase Authentication setup and usage guide for the DogFood Flutter app.
