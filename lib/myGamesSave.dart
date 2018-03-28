import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class MyGamesSave extends StatefulWidget {
  @override
  _MyGamesSaveState createState() => new _MyGamesSaveState();
}

class _MyGamesSaveState extends State<MyGamesSave> {
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

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("My Games Saved")),
      body: new Text(fileContent['name'].toString()),
    );
  }
}
