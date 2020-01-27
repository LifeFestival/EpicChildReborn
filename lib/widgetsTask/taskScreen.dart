import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TaskScreen extends StatefulWidget {

  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.build, size: 50.0,),
          Text('Tasks under construction :(')
        ],
      ),
    );
  }
}
