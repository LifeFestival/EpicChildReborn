import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test_feild/models/epic.dart';
import 'package:flutter_test_feild/widgetsEpic/epicTile.dart';

class EpicListWidget extends StatefulWidget {

  final List<Epic> _epicList;

  EpicListWidget(this._epicList);

  @override
  _EpicListWidgetState createState() => _EpicListWidgetState(_epicList);
}

class _EpicListWidgetState extends State<EpicListWidget> {

  final List<Epic> _epicList;

  _EpicListWidgetState(this._epicList);

  //Генерировать контейнеры
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: _epicList.length,
      padding: EdgeInsets.symmetric(vertical: 3.0),
      itemBuilder: _generateEpicTiles,
      separatorBuilder: (context, index) {
        return Divider(thickness: 3.0, color: Colors.purple[800],);
      },
    );
  }

  EpicTile _generateEpicTiles(BuildContext context, int index) {
    return EpicTile(_epicList[index]);
  }
}
