import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:pagowandroidmobile/Core/Services/auth.dart';
import 'login.dart';

class TelaCadastro extends StatefulWidget {
  @override
  _TelaCadastroState createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController _signEmail = TextEditingController();
  TextEditingController _signPassword = TextEditingController();
  TextEditingController _signPasswordConfirm = TextEditingController();

  void _submitCadastro() {
    final form = formKey.currentState;

    if (form.validate()) {
      form.save();
      if (_signPassword == _signPasswordConfirm) {
        _cadastroComando();
      } else {
        final snackbarErro = SnackBar(
          content: Text(
              'Erro: Senhas "$_signPassword" e "$_signPasswordConfirm" não conferem'),
        );

        scaffoldKey.currentState.showSnackBar(snackbarErro);
      }
    }
  }

  void _cadastroComando() {
    var email = _signEmail.text;
    var senha = _signPassword.text;
    final snackbar = SnackBar(
      content: Text('Email: $email, password: $senha'),
    );

    scaffoldKey.currentState.showSnackBar(snackbar);
    Auth at;
    at.registerEmailAndPassword(_signEmail.text, _signPassword.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(40, 60, 40, 40),
        child: Column(
          children: <Widget>[
            Row(
              //cabecalho
              children: <Widget>[
                Column(
                  children: <Widget>[
                    // coluna 1/3
                    FlatButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyHomePage()));
                      },
                      child: Icon(Icons.arrow_back, color: Colors.white),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    //coluna 2/3
                    Image.asset('images/logo.png', width: 120.0),
                  ],
                ),
                Column(
                  children: <Widget>[
                    //coluna 3/3
                  ],
                )
              ],
            ),
            Divider(
              color: Color(0xFF333333),
              height: 140,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Crie sua conta",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28.0,
                      color: Colors.white),
                ),
              ],
            ),
            Divider(color: Color(0xFF33333), height: 40.0),
            Form(
              key: formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    onSaved: (val) =>
                        _signEmail = TextEditingController(text: val),
                    validator: (val) => !EmailValidator.validate(val, true)
                        ? 'Email inválido.'
                        : null,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.email,
                          color: Colors.white,
                        ),
                        hintText: 'Insira o seu email',
                        labelText: 'Endereço de email'),
                    controller: _signEmail,
                    keyboardType: TextInputType.text,
                  ),
                  TextFormField(
                    validator: (val) =>
                        val.length < 4 ? 'Senha inválida' : null,
                    onSaved: (val) =>
                        _signPassword = TextEditingController(text: val),
                    obscureText: true,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.lock_outline,
                          color: Colors.white,
                        ),
                        hintText: 'Insira sua senha',
                        labelText: 'Senha'),
                    controller: _signPassword,
                    keyboardType: TextInputType.text,
                  ),
                  TextFormField(
                    validator: (val) =>
                        val.length < 4 ? 'Senha inválida' : null,
                    onSaved: (val) =>
                        _signPasswordConfirm = TextEditingController(text: val),
                    obscureText: true,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.lock_open,
                          color: Colors.white,
                        ),
                        hintText: 'Repita a senha',
                        labelText: 'Confirmar senha'),
                    controller: _signPasswordConfirm,
                    keyboardType: TextInputType.text,
                  ),
                  Divider(color: Color(0xFF33333), height: 40.0),
                  ConstrainedBox(
                      constraints:
                          const BoxConstraints(minWidth: double.infinity),
                      child: RaisedButton(
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0)),
                          padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
                          onPressed: () {
                            _submitCadastro();
                          },
                          color: Colors.white,
                          child: Text(
                            'Enviar',
                            style: TextStyle(
                              fontSize: 17.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          )))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
