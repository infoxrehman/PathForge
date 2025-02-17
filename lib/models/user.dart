class User {
  final String id;
  final String name;
  final String imageUrl;
  final String email;
  final String role;

  User({
    required this.email,
    required this.role,
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "imageUrl": imageUrl,
      "role": role,
      "email": email,
    };
  }
}
