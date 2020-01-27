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

class MyHome extends StatelessWidget {

  final List<Epic> _epicList = generateEpicList();

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
          color: appOrangeColor,
        ),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(
                  builder: (context) => EpicCreationScreen()));
        },
      ),
    );
  }
}


//Test data generation
List<Epic> generateEpicList({int count = 5}) {
  List<Epic> resultList = <Epic>[];

  for (var i = 1; i < count; i++) {
    resultList
        .add(Epic('Epic number $i', description: 'Epic description number $i'));
  }

  return resultList;
}
