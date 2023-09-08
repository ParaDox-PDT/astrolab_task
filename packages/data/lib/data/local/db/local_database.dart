
import 'package:data/data/models/student/student_model.dart';
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
    CREATE TABLE ${StudentField.studentTable}(
    ${StudentField.id} $idType,
    ${StudentField.course} $intType,
    ${StudentField.averageScore} $intType,
    ${StudentField.gender} $textType,
    ${StudentField.avatar} $textType,
    ${StudentField.contact} $textType,
    ${StudentField.studentName} $textType
    )
    ''');
  }

  static Future<StudentModel> insertStudent(
      StudentModel studentModel) async {
    final db = await getInstance.database;
    final int id = await db.insert(
        StudentField.studentTable, studentModel.toJson());
    return studentModel.copyWith(id: id);
  }

  static Future<List<StudentModel>> getAllStudents() async {
    List<StudentModel> allUsers = [];
    final db = await getInstance.database;
    allUsers = (await db.query(StudentField.studentTable))
        .map((e) => StudentModel.fromJson(e))
        .toList();

    return allUsers;
  }

  static updateStudent({required StudentModel studentModel,required int id}) async {
    final db = await getInstance.database;
    print("${studentModel.toJson()}");
    db.update(
      StudentField.studentTable,
      studentModel.toJson(),
      where: "${StudentField.id} = ?",
      whereArgs: [id],
    );
  }

  static deleteStudent(int id) async {
    final db = await getInstance.database;
    db.delete(
      StudentField.studentTable,
      where: "${StudentField.id} = ?",
      whereArgs: [id],
    );
  }

  static deleteAllStudent() async {
    final db = await getInstance.database;
    db.delete(
      StudentField.studentTable,
    );
  }

}