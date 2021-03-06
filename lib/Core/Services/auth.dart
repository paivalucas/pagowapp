import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  FirebaseAuth auth = FirebaseAuth.instance;

  /* TODO: ActionSettings
   Dynamic link 
   Gerar links de ação
   Signin com email e link*/

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
      AuthResult result =
          await auth.signInWithEmailAndPassword(email: email, password: senha);
      FirebaseUser user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<void> passwordResetEmail(String email) async {
    try {
      await auth
          .sendPasswordResetEmail(email: email)
          .catchError((e) => print(e.toString()));
    } catch (e) {
      print(e.toString());
    }
  }

  void deslogar() async {
    await auth.signOut().catchError((e) => print(e.toString()));
  }
}
