import 'package:flutter/material.dart';
import 'package:flutter_test_feild/models/epic.dart';
import 'package:flutter_test_feild/widgetsEpic/epicListWidget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  final List<Epic> _epicList = generateEpicList();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('TestField'),
        ),
        body: EpicListWidget(_epicList),
        backgroundColor: Colors.grey[100],
      ),
    );
  }
}

//Test data generation
List<Epic> generateEpicList({int count = 5}) {

  List<Epic> resultList = <Epic>[];

  for(var i = 1; i < count; i++) {
    resultList.add(Epic('Epic number $i', description: 'Epic description number $i'));
  }

  return resultList;
}