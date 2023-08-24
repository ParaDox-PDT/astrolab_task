class WarehouseModel {
  final String name;
  final String address;

  WarehouseModel({required this.name, required this.address});

  factory WarehouseModel.fromJson(Map<String, dynamic> json) {
    return WarehouseModel(
        name: json["name"] as String? ?? "",
        address: json["address"] as String? ?? "");
  }
}
