import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:pagowandroidmobile/Core/Services/auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      theme: ThemeData(
        ///
        /// tema app
        ///
        brightness: Brightness.dark,
        primaryColor: Colors.white,
        accentColor: Colors.white,
      ),
      home: MyHomePage(title: 'Pagina Inicial'),
    );
  }
}

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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFF7255),
      key: scaffoldKey,
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(40, 60, 40, 0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('images/logo.png', width: 120.0),
              ],
            ),
            Divider(
              color: Color(0xFFFF7255),
              height: 160.0,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Olá novamente!",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28.0,
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
      ),
    );
  }
}

/* 
navigator onPress(){~~~}
    Navigator.push(
    context,
     MaterialPageRoute(
     builder: (context) => TelaPrincipal()),
);                        
*/

///
///
///  Tela Esqueci a senha
///
///
///

class EsqueciSenha extends StatefulWidget {
  @override
  _EsqueciSenhaState createState() => _EsqueciSenhaState();
}

class _EsqueciSenhaState extends State<EsqueciSenha> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController emailController = TextEditingController();
  String _emailEsqueci;

  void _submitEsqueci() {
    final form = formKey.currentState;

    if (form.validate()) {
      form.save();

      _esqueciComando();
    }
  }

  void _esqueciComando() {
    final snackbar = SnackBar(
      content: Text('Email: $_emailEsqueci'),
    );

    scaffoldKey.currentState.showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF333333),
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

            ///
            /// Fim cabecalho
            ///
            Divider(
              color: Color(0xFF333333),
              height: 160,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Recuperar senha",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28.0,
                      color: Colors.white),
                ),
              ],
            ),
            Text(
              "Insira o email da sua conta para que possamos te ajudar a recuperar",
              style: TextStyle(
                  fontWeight: FontWeight.w100,
                  fontSize: 20.0,
                  color: Colors.white),
            ),
            Divider(color: Color(0xFF33333), height: 40.0),
            TextFormField(
              decoration: InputDecoration(
                icon: Icon(
                  Icons.email,
                  color: Colors.white,
                ),
                hintText: 'Insira seu email',
                labelText: 'Endereço de Email',
              ),
              controller: emailController,
              keyboardType: TextInputType.text,
              style: TextStyle(color: Colors.white),
              validator: (val) => !EmailValidator.validate(val, true)
                  ? 'Email inválido.'
                  : null,
            ),
            Divider(color: Color(0xFF33333), height: 40.0),
            ConstrainedBox(
                constraints: const BoxConstraints(minWidth: double.infinity),
                child: RaisedButton(
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
                    onPressed: () {
                      Auth auth = Auth();
                      auth.passwordResetEmail(emailController.text);
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
      ),
    );
  }
}

///
///
///
/// Tela Cadastro
///
///
///

class TelaCadastro extends StatefulWidget {
  @override
  _TelaCadastroState createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  String _signEmail;
  String _signPassword;
  String _signPasswordConfirm;

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
    final snackbar = SnackBar(
      content: Text('Email: $_signEmail, password: $_signPassword'),
    );

    scaffoldKey.currentState.showSnackBar(snackbar);
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
                          onSaved: (val) => _signEmail = val,
                          validator: (val) =>
                              !EmailValidator.validate(val, true)
                                  ? 'Email inválido.'
                                  : null,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              icon: Icon(
                                Icons.email,
                                color: Colors.white,
                              ),
                              hintText: 'Insira o seu email',
                              labelText: 'Endereço de email')),
                      TextFormField(
                          validator: (val) =>
                              val.length < 4 ? 'Senha inválida' : null,
                          onSaved: (val) => _signPassword = val,
                          obscureText: true,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              icon: Icon(
                                Icons.lock_outline,
                                color: Colors.white,
                              ),
                              hintText: 'Insira sua senha',
                              labelText: 'Senha')),
                      TextFormField(
                          validator: (val) =>
                              val.length < 4 ? 'Senha inválida' : null,
                          onSaved: (val) => _signPasswordConfirm = val,
                          obscureText: true,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              icon: Icon(
                                Icons.lock_open,
                                color: Colors.white,
                              ),
                              hintText: 'Repita a senha',
                              labelText: 'Confirmar senha')),
                      Divider(color: Color(0xFF33333), height: 40.0),
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
                  ))
            ],
          ),
        ));
  }
}
