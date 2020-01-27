import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test_feild/models/epic.dart';
import 'package:flutter_test_feild/utils/constants.dart';
import 'package:flutter_test_feild/widgetsEpic/epicScreen.dart';
import 'package:uuid/uuid.dart';

class EpicTile extends StatefulWidget {
  final Epic epic;

  EpicTile(this.epic);

  @override
  _EpicTileState createState() => _EpicTileState(epic);
}

class _EpicTileState extends State<EpicTile> {
  final Uuid uuid = Uuid();
  final Epic _epic;

  _EpicTileState(this._epic);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      key: Key(uuid.v1()),
      leading: Icon(Icons.list,
      color: appPurpleColor),
      title: Text(_epic.name),
      subtitle: Text(_epic.description),
      trailing: Icon(_epic.isFinished ? Icons.done : Icons.work,
        color: _epic.isFinished ? appGreenColor : appOrangeColor),
      onTap: (){
        Navigator.push(context,
        MaterialPageRoute(
          builder: (context) => EpicScreen(_epic)
        ));
      },
    );
  }
}
