import 'package:flutter/material.dart';

class GamesDetails extends StatefulWidget {
  final String name;
  final String cover;

  GamesDetails({Key key, this.name, this.cover}) : super(key: key);
  @override
  _GamesDetailsState createState() => new _GamesDetailsState();
}

class _GamesDetailsState extends State<GamesDetails> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(this.widget.name),
      ),
      body: new Container(
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Image(
                image: new NetworkImage("https://images.igdb.com/igdb/image/upload/t_cover_big/"+this.widget.cover+".jpg"),
              ),
              new Text(this.widget.name)
            ],
          ),
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: null,
        child: new Icon(Icons.add),
      ),
    );
  }
}
