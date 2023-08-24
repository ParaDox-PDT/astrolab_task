class PostUserModel {
  final String name;
  final String phone;
  final String username;
  final String role;
  final bool status;

  PostUserModel(
      {required this.name,
      required this.phone,
      required this.username,
      required this.role,
      required this.status});

  factory PostUserModel.fromJson(Map<String, dynamic> json) {
    return PostUserModel(
        name: json["name"] as String? ?? "",
        phone: json["phone"] as String? ?? "",
        username: json["username"] as String? ?? "",
        role: json["role"] as String? ?? "",
        status: json["status"] as bool? ?? false );
  }
}
