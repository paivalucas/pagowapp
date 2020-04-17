import 'package:sqflite/sqflite.dart';

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

  get gb{
    if (_db != null){
      return _db;
    } else {
      
    }
  }

}


class Input {
  int id;
  String value;
  String categ;
  String desc;
  String date;
  String img;

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
      valueColumn: value,
      categColumn: categ,
      descColumn: desc,
      dateColumn: date,
      imgColumn: img
    };
    if (id != null){
      map [idColumn] = id;
    }
    return map;
  }

  @override
  String toString() {
    return "Input(id: $id, value: $value, categ: $categ, desc: $desc, date: $desc, img: $img)";
  }

}
