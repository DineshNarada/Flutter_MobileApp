# Profile Screen Implementation

## Overview

This implementation provides a complete profile screen with Firestore integration for the dogfood_new app.

## Features

- **User Profile Display**: Shows current user information (name, email, address)
- **Editable Fields**: Users can update name, address, and payment method
- **Payment Methods**: 
  - Cash on Delivery
  - Credit/Debit Card (simulated)
- **Firestore Integration**: All data is stored in Firestore
- **Real-time Updates**: Profile changes are reflected immediately

## Setup Instructions

### 1. Firebase Setup
Ensure Firebase is properly configured:
- Add your `google-services.json` to `android/app/`
- Configure Firebase in `lib/firebase_options.dart`

### 2. Firestore Database Structure
The app expects a Firestore collection called `users` with documents structured as:
```json
{
  "name": "User Name",
  "email": "user@example.com",
  "address": "User Address",
  "paymentMethod": "Cash on Delivery",
  "paymentDetails": {
    "cardNumber": "**** **** **** 1234",
    "expiry": "12/25",
    "cvv": "***"
  },
  "updatedAt": "2024-01-01T00:00:00.000Z"
}
```

### 3. Dependencies Added
- `cloud_firestore: ^5.6.3` - For Firestore integration

### 4. Usage
The profile screen automatically:
- Loads user data from Firestore
- Displays current user information
- Allows editing of name, address, and payment method
- Saves changes to Firestore
- Shows loading states and error messages

### 5. Testing
To test the profile screen:
1. Run the app and log in
2. Navigate to the profile screen
3. Edit your profile information
4. Click "Save Profile" to update Firestore

## Files Created/Modified
- `lib/models/user_profile.dart` - User profile data model
- `lib/services/user_profile_service.dart` - Firestore service
- `lib/screens/profile_screen.dart` - Updated profile screen
- `lib/main.dart` - Added UserProfileService provider
- `pubspec.yaml` - Added cloud_firestore dependency
