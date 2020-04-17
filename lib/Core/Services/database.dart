import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pagowandroidmobile/Core/Models/colaborator.dart';
import 'package:pagowandroidmobile/Core/Models/despesa.dart';
import './auth.dart';

//  Atualizar dados OK
// TODO: Estruturar atualização de dados
// Deletar dados OK
// TODO: Estruturar a forma apagar dados

class Services {
  final Firestore _databaseReference = Firestore.instance;
  CollectionReference ref;
  final String path;

  Services(this.path) {
    ref = _databaseReference.collection(path);
  }

  //Registro no banco de dados das informações de usuário

  Future<void> cadastrarUsuarioNoBancoDeDados(String email, String senha,
      String nome, String cpf, String empresa, String telefone) async {
    await ref.document(email).setData({
      'email': email,
      'senha': senha,
      'nomeDaEmpresa': empresa,
      'CPF': cpf,
      'Telefone': telefone,
      'nome': nome
    });

    // Instância da classe Auth
    Auth auth = Auth();
    // Cria uma autenticação com email e senha
    auth.registerEmailAndPassword(email, senha);
  }

  // Retorna um documento do firestore
  Future<DocumentSnapshot> searchDocument(String id) async {
    try {
      return await ref.document(id).get();
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

  Future deleteData(String id) async {
    try {
      return await ref.document(id).delete();
    } catch (e) {
      print(e.toString());
    }
  }

  // TODO: resolber problema de resolução
  Future<Colaborador> searchColab(String id) async {
    if (id.contains('@')) {
      return await ref
          .where('email', isEqualTo: id)
          .getDocuments()
          .then((value) => Colaborador.fromMap(value.documents.first))
          .catchError((onError) => print(onError));
    } else {
      return await ref
          .where('nome', isEqualTo: id)
          .getDocuments()
          .catchError((onError) => print(onError))
          .then((value) => Colaborador.fromMap(value.documents.first));
    }
  }

  Future updateDocument(Colaborador colaborador) async {
    String email = colaborador.email;
    return await ref
        .document(email)
        .updateData(colaborador.toJson())
        .catchError((e) => print(e.toString()));
  }

  // TODO: resolber problema de resolução
  Future<List<Colaborador>> searchCollection() async {
    var result = await ref.getDocuments();
    return result.documents
        .map((documentSnapshot) => Colaborador.fromMap(documentSnapshot));
  }

  // Imcompleto
  // TODO: resolver o problema da busca na base de dados
  Future<void> inputReembolso(Despesa despesa, String id) async {
    // Adiciona a despesa no documento despesa
    ref.add(despesa.toJson());
  }
}
