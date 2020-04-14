// TODO: Definir campos e estruturar
import 'package:cloud_firestore/cloud_firestore.dart';

class Despesa {
  String valor;
  String codigo;

  Despesa({this.valor, this.codigo});


  Despesa.fromMap(DocumentSnapshot snapshot):
    valor = snapshot['valor'],
    codigo = snapshot['codigo'];


  toJson(){
    return {
      'valor':valor,
      'codigo':codigo,
    };
  }
}