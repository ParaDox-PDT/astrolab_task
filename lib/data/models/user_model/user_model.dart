class UserModel {
  final String name;
  final String phone;
  final String date;

  UserModel({
    required this.date,
    required this.name,
    required this.phone,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json["name"] as String? ?? "",
      phone: json["phone"] as String? ?? "",
      date: json["date"] as String? ?? "",
    );
  }
}
