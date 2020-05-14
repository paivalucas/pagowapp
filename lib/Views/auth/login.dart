import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:pagowandroidmobile/Core/Services/auth.dart';
import 'register.dart';
import 'forgot.dart';

class Login extends StatefulWidget {
  Login({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();

  final scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  void _submitCommand() {
    final form = formKey.currentState;

    if (form.validate()) {
      form.save();

      _loginCommand();
    }
  }

  void _loginCommand() {
    var email = _email.text;
    var pass = _password.text;
    final snackbar = SnackBar(
      content: Text('Autenticado com sucesso!'),
    );
    scaffoldKey.currentState.showSnackBar(snackbar);

    Auth auth;
    auth.signInWithEmailAndPassword(_email.text, _password.text);
  }

  @override

  ///
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFF7255),
      key: scaffoldKey,
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              height: 80.0,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      width: 10,
                    ),
                    Image(
                      image: AssetImage('images/logo.png'),
                      width: 120,
                    ),
                    FlatButton(
                      onPressed: () {
                        
                      },
                      child: Icon(Icons.help, color: Colors.white, size: 25),
                    )
                  ],
                ),
                Container(
                  height: 100.0,
                ),
                Text(
                  "Entre na sua conta",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28.0,
                      color: Colors.white),
                ),
                Container(
                  height: 20,
                ),
                Form(
                  key: formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelStyle: TextStyle(color: Colors.white),
                          hintStyle: TextStyle(color: Colors.white),
                          fillColor: Colors.white,
                          border: new UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          icon: Icon(
                            Icons.email,
                            color: Colors.white,
                          ),
                          hintText: 'Insira seu email',
                          labelText: 'Endereço de Email',
                        ),
                        validator: (val) => !EmailValidator.validate(val, true)
                            ? 'Email inválido.'
                            : null,
                        onSaved: (val) =>
                            _email = TextEditingController(text: val),
                        controller: _email,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            labelStyle: TextStyle(color: Colors.white),
                            hintStyle: TextStyle(color: Colors.white),
                            border: new UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            icon: Icon(
                              Icons.lock,
                              color: Colors.white,
                            ),
                            hintText: 'Insira sua senha',
                            focusColor: Colors.white,
                            labelText: 'Senha'),
                        validator: (val) =>
                            val.length < 4 ? 'Senha inválida' : null,
                        onSaved: (val) =>
                            _password = TextEditingController(text: val),
                        obscureText: true,
                        controller: _password,
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
                Container(
                  height: 20.0,
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
                    style: TextStyle(fontSize: 17, color: Colors.white),
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
                    style: TextStyle(fontSize: 17, color: Colors.white),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
