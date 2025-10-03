# DogFood Mobile App Setup Instructions
   - Firebase configuration files are ignored in `.gitignore`. Each developer must provide their own.
   - Make sure you have the Flutter SDK installed and properly configured before running the app

1. **Firebase Setup:**
   - Go to the Firebase Console and create a project. (https://console.firebase.google.com/).
   - Enable Authentication, Firestore, and Storage as needed.
   - Download the Firebase config file for Android (google-services.json).
      - Place it inside both:
         - android/app/google-services.json
         - android/google-services.json
   - To make the google-services.json config values accessible to Firebase SDKs, you need the Google services Gradle plugin.
      - Important : Add Groovy (build.gradle file) plugin as a dependency to android\ .
                  : Follow the firbase instruction.

2. **Install dependencies:**
      ```
      flutter pub get
      ```
      
3. **Run the app:**
      ```
      flutter run
      ```
   - For Android: Run on an emulator or connected device.
   - For Web: Run `flutter run -d chrome` to launch in a web browser.
