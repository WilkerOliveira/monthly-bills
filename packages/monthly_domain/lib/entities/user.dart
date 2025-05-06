class User {
  User({
    required this.uid,
    required this.email,
    required this.name,
    required this.photoUrl,
  });

  final String uid;
  final String email;
  final String? name;
  final String? photoUrl;
}
