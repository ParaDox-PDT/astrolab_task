import 'package:flutter_defualt_project/data/models/user_model/warehouse.dart';

class UserModel {
  final int id;
  final String name;
  final String phone;
  final String username;
  final WarehouseModel warehouseModel;

  UserModel(
      {required this.id,
      required this.name,
      required this.phone,
      required this.username,
      required this.warehouseModel});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"] as int? ?? 0,
      name: json["name"] as String? ?? "",
      phone: json["phone"] as String? ?? "",
      username: json["username"] as String? ?? "",
      warehouseModel: WarehouseModel.fromJson(
        json["warehouse"],
      ),
    );
  }
}
