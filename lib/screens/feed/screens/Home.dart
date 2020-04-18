import 'package:flutter/material.dart';
import 'package:pagowandroidmobile/screens/feed/helpers/input.dart';
import 'RefundPrefab.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Color laranjaPagow = Color(0xFFFF7C61);

  InputHelper helper = InputHelper();

  @override
  void initState() {
    super.initState();

    Input i = Input();
    i.value = "30,0";
    i.categ = "Hospedagem";
    i.desc = "Hotel trivago";
    i.date = "18/04/2020";
    i.img = "notafiscalteste";

    helper.saveInput(i);


  }


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
          RefundWidget()
        ],
      ),
    );
  }
}