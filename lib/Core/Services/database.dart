import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pagowandroidmobile/Core/Models/colaborator.dart';
import 'package:pagowandroidmobile/Core/Models/despesa.dart';
import './auth.dart';

/* TODO: 
        auth para alteração de usuário; 
        sessão atual
        preencher dinamicamente a tela de usuário
        preencher dinamicamente o feed de usuário
        Estruturar databse
        Integrar campo cnpj
*/

class Database {
  final Firestore _databaseReference = Firestore.instance;
  CollectionReference ref;
  final String path;
  List<Colaborador> colaboradores;

  Database(this.path) {
    ref = _databaseReference.collection(path);
  }

  //Registro no banco de dados das informações de usuário

  Future<void> cadastrarUsuarioNoBancoDeDados(String email, String senha,
      String nome, double cpf, String empresa, double telefone) async {
    await ref
        .document(empresa)
        .collection('Colaboradores')
        .document(email)
        .setData({
      'email': email,
      'senha': senha,
      'nome': nome,
      'telefone': telefone,
      'empresa': empresa,
      'cpf': cpf,
      'despesas': []
    }).catchError((e) => print(e.toString()));

    Auth auth = Auth();
    await auth
        .registerEmailAndPassword(email, senha)
        .catchError((e) => print(e.toString()));
  }

  // Retorna um documento do firestore
  Future<DocumentSnapshot> searchDocument(String id) async {
    try {
      return await ref
          .document(id)
          .get()
          .catchError((onError) => print(onError));
    } catch (e) {
      print('No such file on the database');
      return null;
    }
  }

  Future updateUser(String id, Map colaborador) async {
    try {
      return await ref.document(id).updateData(colaborador);
    } catch (e) {
      print(e.toString());
    }
  }

  Future deleteAccount(String id) async {
    try {
      await ref.document(id).delete();
      FirebaseUser user;
      await user.delete();
    } catch (e) {
      print(e.toString());
    }
  }

  // Working
  Future<Colaborador> searchColab(String id) async {
    if (id.contains('@')) {
      var colab = await ref
          .where('email', isEqualTo: id)
          .getDocuments()
          // TODO: Adicionar tratamento adequado
          .catchError((onError) => print(onError))
          .then((value) => Colaborador.fromMap(
              value.documents.first, value.documents.first.documentID));
      return colab;
    } else {
      var colab = await ref
          .where('nome', isEqualTo: id)
          .getDocuments()
          // TODO: Adicionar tratamento adequado
          .catchError((onError) => print(onError))
          .then((value) => Colaborador.fromMap(
              value.documents.first, value.documents.first.documentID));
      return colab;
    }
  }

  Future updateColaborador(Colaborador colaborador) async {
    ref
        .document(colaborador.id)
        .updateData(colaborador.toJson())
        .catchError((e) => print(e.toString()));
  }

  // Working
  Future<List<Colaborador>> searchColaboradores() async {
    var result = await ref.getDocuments();
    colaboradores = result.documents
        .map((doc) => Colaborador.fromMap(doc, doc.documentID))
        .toList();
    return colaboradores;
  }

  Future<List<Despesa>> searchDespesas() async {
    var result = await ref.getDocuments();
    var despesas = result.documents
        .map((doc) => Despesa.fromMap(doc, doc.documentID))
        .toList();
    return despesas;
  }

  // Working Dados falsos
  Future inputReembolso(Despesa despesa) async {
    // Adiciona a despesa no documento despesa
    await ref.add(despesa.toJson());
    
    // Referencia ao arquivo de colaboradores da empresa
    // TODO: tomar conhecimento da empresa para vincular path
    ref = _databaseReference.collection('Empresas/Pagow/Colaboradores');

    /* TODO: Tomar conhecimento do usuário atual para que possa poder atualizar as informações
        Pode ser feito apartir do auth, mais estudos são necessáros
        **auth.currentUser()**
    */

    var colab = await this.searchColab('funcionou');

    colab.despesas.add(despesa.toJson());

    await this.updateColaborador(colab);
  }
}
