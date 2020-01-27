import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AttachScreen extends StatefulWidget {

  @override
  _AttachScreenState createState() => _AttachScreenState();
}

class _AttachScreenState extends State<AttachScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.build, size: 50.0,),
          Text('Attachments under constractions :(')
        ],
      ),
    );
  }
}
