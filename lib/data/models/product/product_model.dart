class ProductModelFields{
  static const String name="name";
  static const String count="count";
  static const String id="id";
  static const String createdAt="createdAt";
  static const String qrCode="qrCode";

  static const String table="product_table";
}

class ProductModel {
  final int id;
  final String name;
  final String createdAt;
  final String qrCode;
  final int count;

  ProductModel(
      {required this.name,
      required this.createdAt,
      this.id = 0,
      required this.count,
      required this.qrCode});

  ProductModel copyWith({
    int? id,
    String? name,
    int? count,
    String? qrCode,
    String? createdAt,
  }) =>
      ProductModel(
          name: name ?? this.name,
          createdAt: createdAt ?? this.createdAt,
          count: count ?? this.count,
          qrCode: qrCode ?? this.qrCode,
          id: id ?? this.id);

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        id: json["id"] as int? ?? 0,
        name: json["name"] as String? ?? "",
        createdAt: json["createdAt"] as String? ?? "",
        count: json["count"] as int? ?? 0,
        qrCode: json["qrCode"] as String? ?? "");
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "qrCode": qrCode,
      "count": count,
      "createdAt": createdAt
    };
  }
}
