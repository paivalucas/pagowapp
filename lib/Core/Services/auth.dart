import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  FirebaseAuth auth = FirebaseAuth.instance;

  // Registo e autenticação com email e senha e Redefinição de senha

  Future<dynamic> registerEmailAndPassword(String email, String senha) async {
    try {
      AuthResult result = await auth.createUserWithEmailAndPassword(
          email: email, password: senha);
      FirebaseUser user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
    }
  }

  Future signInWithEmailAndPassword(String email, String senha) async {
    try {
      AuthResult result = await auth.signInWithEmailAndPassword(
          email: email, password: senha);
      FirebaseUser user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<void> passwordResetEmail(String email) async {
    try{
      await auth.sendPasswordResetEmail(email: email);
    }catch(e){
      print(e.toString());
    }
  }

  // TODO: Autenticação por celular
  // TODO: Ler documentação
}
