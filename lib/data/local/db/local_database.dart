import 'package:flutter_defualt_project/data/models/product/product_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LocalDatabase{
  static final LocalDatabase getInstance = LocalDatabase._init();

  LocalDatabase._init();

  factory LocalDatabase(){
    return getInstance;
  }

  static Database? _database;

  Future<Database> get database async{
    if(_database !=null){
      return _database!;
    }else{
      _database = await _initDB("defaultDatabase.db");
      return _database!;
    }
  }

  Future<Database> _initDB(String dbName)async{
    final dbPath = await getDatabasesPath();
    final path = join(dbPath,dbName);
    return await openDatabase(path,version: 1,onCreate: _createDB);
  }

  Future _createDB(Database db, int version)async{
    const idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
    const textType = "TEXT NOT NULL";
    const intType = "INTEGER DEFAULT 0";


    await db.execute('''
    CREATE TABLE ${ProductModelFields.table}(
    ${ProductModelFields.id} $idType,
    ${ProductModelFields.count} $intType,
    ${ProductModelFields.name} $textType,
    ${ProductModelFields.createdAt} $textType,
    ${ProductModelFields.qrCode} $textType
    )
    ''');
  }

  static Future<ProductModel> insertContact(
      ProductModel productModel) async {
    final db = await getInstance.database;
    final int id = await db.insert(
        ProductModelFields.table, productModel.toJson());
    return productModel.copyWith(id: id);
  }

  static updateContactName({required String qrCode, required int count}) async {
    final db = await getInstance.database;
    db.update(
      ProductModelFields.table,
      {ProductModelFields.count: count},
      where: "${ProductModelFields.qrCode} = ?",
      whereArgs: [qrCode],
    );
  }

  static updateInfo({required ProductModel productModel}) async {
    final db = await getInstance.database;
    db.update(
      ProductModelFields.table,
      productModel.toJson(),
      where: "${ProductModelFields.qrCode} = ?",
      whereArgs: [productModel.qrCode],
    );
  }

  static Future<ProductModel> getSingleContact(String qrCode) async {
    List<ProductModel> allInfo = [];
    final db = await getInstance.database;
    allInfo = (await db.query(
      ProductModelFields.table,
      where: "${ProductModelFields.qrCode} = ?",
      whereArgs: [qrCode],
    ))
        .map((e) => ProductModel.fromJson(e))
        .toList();

    if (allInfo.isNotEmpty) {
      return allInfo.first;
    }
    return allInfo.last;
  }

}