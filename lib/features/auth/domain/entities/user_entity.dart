class UserEntity {
  final String userId; // Unique identifier for the user
  final String email; // User's email address
  final String name; // User's name
  final String? profilePicture; // Optional profile picture URL
  final List<String>? roles; // Optional roles or permissions

  UserEntity({
    required this.userId,
    required this.email,
    required this.name,
    this.profilePicture,
    this.roles,
  });
}
