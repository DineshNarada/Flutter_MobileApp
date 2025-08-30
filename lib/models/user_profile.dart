class UserProfile {
  final String id;
  final String name;
  final String email;
  final String address;
  final String paymentMethod;
  final Map<String, dynamic>? paymentDetails;

  UserProfile({
    required this.id,
    required this.name,
    required this.email,
    this.address = '',
    this.paymentMethod = 'Cash on Delivery',
    this.paymentDetails,
  });

  factory UserProfile.fromFirestore(Map<String, dynamic> data, String id) {
    return UserProfile(
      id: id,
      name: data['name'] ?? '',
      email: data['email'] ?? '',
      address: data['address'] ?? '',
      paymentMethod: data['paymentMethod'] ?? 'Cash on Delivery',
      paymentDetails: data['paymentDetails'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'email': email,
      'address': address,
      'paymentMethod': paymentMethod,
      'paymentDetails': paymentDetails,
      'updatedAt': DateTime.now().toIso8601String(),
    };
  }

  UserProfile copyWith({
    String? name,
    String? email,
    String? address,
    String? paymentMethod,
    Map<String, dynamic>? paymentDetails,
  }) {
    return UserProfile(
      id: id,
      name: name ?? this.name,
      email: email ?? this.email,
      address: address ?? this.address,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      paymentDetails: paymentDetails ?? this.paymentDetails,
    );
  }
}
