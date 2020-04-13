import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'register.dart';
import 'forgot.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final formKey = GlobalKey<FormState>();

  final scaffoldKey = GlobalKey<ScaffoldState>();

  String _email;
  String _password;

  void _submitCommand() {
    final form = formKey.currentState;

    if (form.validate()) {
      form.save();

      _loginCommand();
    }
  }

  void _loginCommand() {
    final snackbar = SnackBar(
      content: Text('Email: $_email, password: $_password'),
    );

    scaffoldKey.currentState.showSnackBar(snackbar);
  }

  @override

  ///
  ///  Tela Login
  /// 
  /// 
  /*

      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.white,
        accentColor: Colors.white,
      ),

*/
  /// 
  Widget build(BuildContext context) {   
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.white,
        accentColor: Colors.white,
      ),
      home: Scaffold(
      backgroundColor: Color(0xFFFF7255),
      key: scaffoldKey,
      body: Center(child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('images/logo.png', width: 110.0),
              ],
            ),
            Divider(
              color: Color(0xFFFF7255),
              height: 80.0,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Olá novamente!",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0,
                          color: Colors.white),
                    )
                  ],
                ),
                Divider(
                  color: Color(0xFFFF7255),
                  height: 20.0,
                ),
                Form(
                  key: formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.email,
                            color: Colors.white,
                          ),
                          hintText: 'Insira seu email',
                          labelText: 'Endereço de Email',
                        ),
                        style: TextStyle(color: Colors.white),
                        validator: (val) => !EmailValidator.validate(val, true)
                            ? 'Email inválido.'
                            : null,
                        onSaved: (val) => _email = val,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            icon: Icon(
                              Icons.lock,
                              color: Colors.white,
                            ),
                            hintText: 'Insira sua senha',
                            focusColor: Colors.white,
                            labelText: 'Senha'),
                        validator: (val) =>
                            val.length < 4 ? 'Senha inválida' : null,
                        onSaved: (val) => _password = val,
                        obscureText: true,
                      ),
                      Divider(
                        color: Color(0xFFFF7255),
                        height: 30.0,
                      ),
                      ConstrainedBox(
                          constraints:
                              const BoxConstraints(minWidth: double.infinity),
                          child: RaisedButton(
                              shape: new RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(30.0)),
                              padding:
                                  EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
                              onPressed: () {
                                _submitCommand();
                              },
                              color: Colors.white,
                              child: Text(
                                'Entrar',
                                style: TextStyle(
                                  fontSize: 17.0,
                                  color: Color(0xFFFF7255),
                                  fontWeight: FontWeight.bold,
                                ),
                              )))
                    ],
                  ),
                ),
                Divider(
                  color: Color(0xFFFF7255),
                  height: 40.0,
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EsqueciSenha()));
                  },
                  child: Text(
                    'Esqueceu a senha?',
                    style: TextStyle(fontSize: 17),
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TelaCadastro()));
                  },
                  child: Text(
                    'Crie uma conta agora',
                    style: TextStyle(fontSize: 17),
                  ),
                )
              ],
            ),
          ],
        ),
      ),)));
  }
}