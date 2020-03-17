import 'package:flutter/material.dart';
import 'package:flutter_test_feild/models/epic.dart';
import 'package:flutter_test_feild/utils/constants.dart';
import 'package:flutter_test_feild/widgetsEpic/epicCreationScreen.dart';
import 'package:flutter_test_feild/widgetsEpic/epicListWidget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EpicChild Reborn',
      theme: ThemeData(
        primarySwatch: appPurpleColor,
      ),
      home: MyHome()
    );
  }
}

class MyHome extends StatefulWidget {

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  final List<Epic> _epicList = [];

  _createNewEpicOnPress(BuildContext context) async {
    final Epic _newEpic = await Navigator.push(context,
        MaterialPageRoute(
            builder: (context) => EpicCreationScreen()));

    if (_newEpic != null) setState(() {
      _epicList.add(_newEpic);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TestField'),
      ),
      body: EpicListWidget(_epicList),
      backgroundColor: Colors.grey[100],
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.grey[100],
        ),
        onPressed: () {
          _createNewEpicOnPress(context);
        },
      ),
    );
  }
}


//Test data generation
//List<Epic> generateEpicList({int count = 15}) {
//  List<Epic> resultList = <Epic>[];
//
//  for (var i = 1; i < count; i++) {
//    resultList
//        .add(Epic('Epic number $i', description: 'Epic description number $i'));
//  }
//
//  return resultList;
//}
