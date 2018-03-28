import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class GamesDetails extends StatefulWidget {
  final String name;
  final String cover;

  GamesDetails({Key key, this.name, this.cover}) : super(key: key);
  @override
  _GamesDetailsState createState() => new _GamesDetailsState();
}

class _GamesDetailsState extends State<GamesDetails> {
  File jsonFile;
  Directory dir;
  String fileName = "myGamesSaved.json";
  bool fileExists = false;
  Map<String, String> fileContent;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getApplicationDocumentsDirectory().then((Directory directory) {
      dir = directory;
      jsonFile = new File(dir.path + "/" + fileName);
      fileExists = jsonFile.existsSync();
      if (fileExists)
        this.setState(
            () => fileContent = json.decode(jsonFile.readAsStringSync()));
    });
  }

  void createFile(Map<String, String> content, Directory dir, String fileName) {
    print("Creating file!");
    File file = new File(dir.path + "/" + fileName);
    file.createSync();
    fileExists = true;
    file.writeAsStringSync(json.encode(content));
  }

  void writeToFile(String key, String value) {
    print("Writing to file!");
    Map<String, String> content = {key: value};
    if (fileExists) {
      print("File exists");
      Map<String, String> jsonFileContent =
          json.decode(jsonFile.readAsStringSync());
      jsonFileContent.addAll(content);
      jsonFile.writeAsStringSync(json.encode(jsonFileContent));
    } else {
      print("File does not exist!");
      createFile(content, dir, fileName);
    }
    this.setState(() => fileContent = json.decode(jsonFile.readAsStringSync()));
    print(fileContent);
  }

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
                image: new NetworkImage(
                    "https://images.igdb.com/igdb/image/upload/t_cover_big/" +
                        this.widget.cover +
                        ".jpg"),
              ),
              new Text(this.widget.name)
            ],
          ),
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: (){writeToFile("name", this.widget.name);},
        child: new Icon(Icons.add),
      ),
    );
  }
}
