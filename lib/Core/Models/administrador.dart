import 'package:cloud_firestore/cloud_firestore.dart';

class Administrador {
  String email;
  String nome;
  String nomeDaEmpresa;
  String nTelefone;
  String senha;
  String cpf;
  String nomeDoBanco;
  String nDaConta;
  String nDaAgencia;

  Administrador(
      {this.email,
      this.nome,
      this.nomeDaEmpresa,
      this.nTelefone,
      this.senha,
      this.cpf,
      this.nomeDoBanco,
      this.nDaAgencia,
      this.nDaConta});

  // Transforma o objeto JSON obtido pela requisição do Firebase em um objeto Administrador
  Administrador.fromMap(DocumentSnapshot snapshot)
      : email = snapshot['email'],
        nome = snapshot['nome'],
        nomeDaEmpresa = snapshot['nomeDaEmpresa'],
        nTelefone = snapshot['nTelefone'],
        senha = snapshot['senha'],
        cpf = snapshot['cpf'],
        nomeDoBanco = snapshot['nomeDoBanco'],
        nDaAgencia = snapshot['nTelefone'],
        nDaConta = snapshot['nTelefone'];

  // Transforma um objeto Colaborador em um objeto JSON para ser enviado para o Firebase
  toJson() {
    return {
      'email': email,
      'nome': nome,
      'nomeDaEmpresa': nomeDaEmpresa,
      'nTelefone': nTelefone,
      'senha': senha,
      'cpf': cpf,
      'nomeDoBanco': nomeDoBanco,
      'nDaAgencia': nTelefone,
      'nDaConta': nTelefone
    };
  }
}
