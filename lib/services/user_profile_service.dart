import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/user_profile.dart';

class UserProfileService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Get current user ID
  String? get currentUserId => _auth.currentUser?.uid;

  // Get user profile stream
  Stream<UserProfile?> getUserProfile() {
    final userId = currentUserId;
    if (userId == null) return Stream.value(null);

    return _firestore
        .collection('users')
        .doc(userId)
        .snapshots()
        .map((snapshot) {
      if (snapshot.exists) {
        return UserProfile.fromFirestore(snapshot.data()!, snapshot.id);
      }
      return null;
    });
  }

  // Create or update user profile
  Future<void> updateUserProfile(UserProfile profile) async {
    final userId = currentUserId;
    if (userId == null) throw Exception('No user logged in');

    await _firestore
        .collection('users')
        .doc(userId)
        .set(profile.toFirestore(), SetOptions(merge: true));
  }

  // Initialize user profile with auth data
  Future<void> initializeUserProfile(String name, String email) async {
    final userId = currentUserId;
    if (userId == null) return;

    final profile = UserProfile(
      id: userId,
      name: name,
      email: email,
    );

    await updateUserProfile(profile);
  }
}
