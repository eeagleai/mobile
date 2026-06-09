class AuthUser {
  const AuthUser({
    required this.id,
    required this.email,
    required this.emailVerified,
    required this.admin,
  });

  final String id;
  final String email;
  final bool emailVerified;
  final bool admin;
}
