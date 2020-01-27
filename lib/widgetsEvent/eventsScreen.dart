import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EventsScreen extends StatefulWidget {

  @override
  _EventsScreenState createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.build, size: 50.0),
          Text('Events under constractions :(')
        ],
      ),
    );
  }
}
