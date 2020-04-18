import 'package:flutter/material.dart';

class RefundWidget extends StatefulWidget {
  @override
  _RefundWidgetState createState() => _RefundWidgetState();
}

class _RefundWidgetState extends State<RefundWidget> {
  Color laranjaPagow = Color(0xFFFF7C61);
  @override
  Widget build(BuildContext context) {
    return Container(
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
          /////widget prefab reembolsos
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
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
                Text(
                  "13 de mar, 2020",
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.w400),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "R\$ 29,90",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
                ),
                Text(
                  "Pendente",
                  style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                      color: Colors.red),
                ),
              ],
            ),
            Container()
          ],
        ));
  }
}
