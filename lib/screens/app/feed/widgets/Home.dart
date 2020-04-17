import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _username;
  String _userImage;

  Color laranjaPagow = Color(0xFFFF7C61);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(40, 80, 40, 40),
      child: Column(
        children: <Widget>[
          Container(
            /// cabeçalho
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage("images/eu.jpg"),
                ),
                Container(
                  width: 20,
                ),
                Text(
                  "Olá, Lucas!",
                  style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Container(height: 40),
          Container(
            padding: const EdgeInsets.fromLTRB(40, 40, 40, 40),
            width: double.infinity,
            height: 180,
            decoration: new BoxDecoration(
                boxShadow: <BoxShadow>[
                  new BoxShadow(
                    color: laranjaPagow,
                    blurRadius: 8.0,
                    offset: new Offset(3.0, 3.0),
                  ),
                ],
                color: laranjaPagow, //new Color.fromRGBO(255, 0, 0, 0.0),
                borderRadius: new BorderRadius.only(
                    topLeft: const Radius.circular(40.0),
                    bottomRight: const Radius.circular(40.0))),
            child: Row(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Despesas no \nmês de abril:",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                          color: Colors.white),
                    ),
                    Text(
                      "R\$ 29,90",
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Últimas despesas",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              Icon(Icons.keyboard_arrow_right)
            ],
          ),
          Container(height: 30),
          Container(
              padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
              width: double.infinity,
              height: 100,
              decoration: new BoxDecoration(
                  boxShadow: <BoxShadow>[
                    new BoxShadow(
                      color: Colors.grey[300],
                      blurRadius: 19.0,
                      offset: new Offset(2.0, 2.0),
                    ),
                  ],
                  color: Colors.white, //new Color.fromRGBO(255, 0, 0, 0.0),
                  borderRadius: BorderRadius.circular(20.0)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Icon(
                    Icons.fastfood,
                    size: 45,
                    color: laranjaPagow,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Alimentação",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        "13 de mar, 2020",
                        style: TextStyle(
                            fontSize: 11, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "R\$ 29,90",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        "Pendente",
                        style: TextStyle(
                            fontSize: 11, fontWeight: FontWeight.w400, color: Colors.red),
                      ),
                    ],
                  ),
                  Container()
                ],
              ))
        ],
      ),
    );
  }
}
