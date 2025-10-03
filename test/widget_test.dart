// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:provider/provider.dart';

import 'package:dogfood_app/main.dart';
import 'package:dogfood_app/services/auth_service.dart';
import 'package:dogfood_app/services/cart_service.dart';
import 'package:dogfood_app/services/user_profile_service.dart';

void main() {
  testWidgets('DogFood app smoke test', (WidgetTester tester) async {
    // Use mock Firebase services for testing
    final mockAuth = MockFirebaseAuth();
    final fakeFirestore = FakeFirebaseFirestore();

    // Build our app with mocked services and trigger a frame.
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<AuthService>(
            create: (_) => AuthService(mockAuth),
          ),
          ChangeNotifierProvider<CartService>(
            create: (_) => CartService(),
          ),
          Provider<UserProfileService>(
            create: (_) => UserProfileService(mockAuth, fakeFirestore),
          ),
        ],
        child: MaterialApp(
          title: 'DogFood',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const AuthWrapper(),
        ),
      ),
    );

    // Wait for the StreamBuilder to resolve
    await tester.pump();

    // Verify that the app loads without crashing
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
