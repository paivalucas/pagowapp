import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';

final String refundTable = "refundTable";
final String idColumn = "idColumn";
final String valueColumn = "valueColumn";
final String categColumn = "categColumn";
final String descColumn = "descColumn";
final String dateColumn = "dateColumn";
final String imgColumn = "imgColumn";

class InputHelper {

  static final InputHelper _instance = InputHelper.internal();

  factory InputHelper() => _instance;

  InputHelper.internal();

  Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    } else {
      _db = await initDb();
    }
  }
  //inicializando db
  Future<Database> initDb() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, "refunds.db");

    return await openDatabase(path, version: 1,
        onCreate: (Database db, int newerVersion) async {
      await db.execute(
          "CREATE TABLE $refundTable($idColumn INTEGER PRIMARY KEY, $valueColumn TEXT, $categColumn TEXT, $dateColumn TEXT, $descColumn TEXT, $imgColumn TEXT) ");
    });
  }
  // salvando input
  Future<Input> saveInput(Input input) async {
    Database dbInput = await db;
    input.id = await dbInput.insert(refundTable, input.toMap());
    return input;
  }

  //input id
  Future<Input> getInput(int id) async {
    Database dbInput = await db;
    List<Map> maps = await dbInput.query(refundTable,
        columns: [
          idColumn,
          valueColumn,
          categColumn,
          descColumn,
          dateColumn,
          imgColumn
        ],
        where: "$idColumn = ?",
        whereArgs: [id]);
    if (maps.length > 0) {
      return Input.fromMap(maps.first);
    } else {
      return null;
    }
  }

  //deletar ou desfazer input de reembolso
  Future<int> deleteInput(int id) async {
    Database dbInput = await db;
    return await dbInput
        .delete(refundTable, where: "$idColumn = ?", whereArgs: [id]);
  }

  //atualizar ou alterar algum dado do input de reembolso
  Future<int> updateInput(Input input) async {
    Database dbInput = await db;
    return await dbInput.update(refundTable, input.toMap(),
        where: "$idColumn = ?", whereArgs: [input.id]);
  }

  //pegando todos inputs
  Future<List> getAllInputs() async {
    Database dbInput = await db;
    List listMap = await dbInput.rawQuery("SELECT * FROM $refundTable");
    List<Input> listInput = List();
    for (Map m in listMap) {
      listInput.add(Input.fromMap(m));
    }
    return listInput;
  }


  //pegando quantidade de elementos da tabela
  Future<int> getNumber() async{
    Database dbInput = await db;
    return Sqflite.firstIntValue(await dbInput.rawQuery("SELECT COUNT (*) FROM $refundTable"));
  }

  //fechar db
  Future close()async{
    Database dbInput = await db;
    dbInput.close();
  }

}

class Input {

  int id;
  String value;
  String categ;
  String desc;
  String date;
  String img;

  Input();

  Input.fromMap(Map map) {
    id = map[idColumn];
    value = map[valueColumn];
    categ = map[categColumn];
    desc = map[descColumn];
    date = map[dateColumn];
    img = map[imgColumn];
  }

  Map toMap() {
    Map<String, dynamic> map = {
      idColumn: id, //apagar talvez
      valueColumn: value,
      categColumn: categ,
      descColumn: desc,
      dateColumn: date,
      imgColumn: img
    };
    if (id != null) {
      map[idColumn] = id;
    }
    return map;
  }

  @override
  String toString() {
    return "Input(id: $id, value: $value, categ: $categ, desc: $desc, date: $desc, img: $img)";
  }
}
