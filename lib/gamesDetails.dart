import 'package:flutter/material.dart';

class GamesDetails extends StatefulWidget {
  final String name;
  final String cover;

  GamesDetails({Key key, this.name, this.cover}) : super (key: key);
  @override
  _GamesDetailsState createState() => new _GamesDetailsState();
}

class _GamesDetailsState extends State<GamesDetails> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Games Details"),
      ),
      body: new Container(
      child: new Column(
        children: <Widget>[
          new Text(widget.name),
          new Image(image: new NetworkImage("http:"+widget.cover),)
        ],
      ),
      ),
    );
  }
}