import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test_feild/utils/constants.dart';

class EpicCreationScreen extends StatefulWidget {
  @override
  _EpicCreationScreenState createState() => _EpicCreationScreenState();
}

class _EpicCreationScreenState extends State<EpicCreationScreen> {

  String _epicName = '';
  final DateTime _currentDateTime = DateTime.now();
  DateTime _startDate;
  DateTime _endDate;

  _EpicCreationScreenState() {
    _startDate = _currentDateTime;
    _endDate = _startDate.add(Duration(days: 1));
  }

  Future<Null> _showDateTimeDialog(BuildContext context, bool isStartDate) async {
    final DateTime _pickedDateTime = await showDatePicker(
        context: context,
        initialDate: _currentDateTime,
        firstDate: DateTime(_currentDateTime.year - 2),
        lastDate: DateTime(_currentDateTime.year + 2));

    if(_pickedDateTime != null) {
      setState(() {
        isStartDate ? _startDate = _pickedDateTime : _endDate = _pickedDateTime;
      });
    }
  }

  static const padding = Padding(
    padding: EdgeInsets.all(5.0),
  );

  Row _makeNameRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Icon(Icons.account_box, color: appPurpleColor),
        TextField(
          onChanged: (text) {
            _epicName = text;
          },
        )
      ],
    );
  }

  Row _makeStartDateRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Icon(Icons.calendar_today, color: appPurpleColor,),
        TextField(

          onTap: () => _showDateTimeDialog(context, true),
        )
      ],
    );
  }

  Row _makeEndDateRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Icon(Icons.date_range, color: appPurpleColor,),
        TextField(
          onTap: () => _showDateTimeDialog(context, false),
        )
      ],
    );
  }

  Row _makeDescriptionRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Icon(Icons.description, color: appPurpleColor,),
        TextField()
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Epic Creation'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          padding,
          _makeNameRow(),
          padding,
          _makeStartDateRow(),
          padding,
          _makeEndDateRow(),
          padding,
          _makeDescriptionRow()
        ],
      ),
    );
  }
}
