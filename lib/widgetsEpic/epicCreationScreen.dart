import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test_feild/utils/constants.dart';
import 'package:flutter_test_feild/utils/focusDisabledNode.dart';

class EpicCreationScreen extends StatefulWidget {
  @override
  _EpicCreationScreenState createState() => _EpicCreationScreenState();
}

class _EpicCreationScreenState extends State<EpicCreationScreen> {

  String _epicName = '';
  final DateTime _currentDateTime = DateTime.now();
  DateTime _startDate;
  DateTime _endDate;

  bool _isStartInitState = true;
  bool _isEndInitState = true;

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

      isStartDate ? _isStartInitState = false : _isEndInitState = false;

      setState(() {
        isStartDate ? _startDate = _pickedDateTime : _endDate = _pickedDateTime;
      });
    }
  }

  static const _verticalPadding = Padding(
    padding: EdgeInsets.all(20.0),
  );

  static const _horizontalPadding = Padding(
    padding: EdgeInsets.all(10.0),
  );

  Row _makeNameRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        _horizontalPadding,
        Icon(Icons.account_box, color: appPurpleColor),
        _horizontalPadding,
        Flexible(
          child: TextField(
            onChanged: (text) {
              _epicName = text;
            },
          ),
        ),
        _horizontalPadding
      ],
    );
  }

  Row _makeStartDateRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        _horizontalPadding,
        Icon(Icons.calendar_today, color: appPurpleColor,),
        _horizontalPadding,
        Flexible(
          child: TextField(
            controller: _isStartInitState ? TextEditingController() : TextEditingController(text: _startDate.toString()),
            onTap: () => _showDateTimeDialog(context, true),
            focusNode: DisabledFocusNode(),
          ),
        ),
        _horizontalPadding
      ],
    );
  }

  Row _makeEndDateRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        _horizontalPadding,
        Icon(Icons.date_range, color: appPurpleColor,),
        _horizontalPadding,
        Flexible(
          child: TextField(
            controller: _isEndInitState ? TextEditingController() : TextEditingController(text: _endDate.toString()),
            onTap: () => _showDateTimeDialog(context, false),
            focusNode: DisabledFocusNode(),
          ),
        ),
        _horizontalPadding
      ],
    );
  }

  Row _makeDescriptionRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        _horizontalPadding,
        Icon(Icons.description, color: appPurpleColor,),
        _horizontalPadding,
        Flexible(
          child: TextField(),
        ),
        _horizontalPadding
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
          _verticalPadding,
          _makeNameRow(),
          _verticalPadding,
          _makeStartDateRow(),
          _verticalPadding,
          _makeEndDateRow(),
          _verticalPadding,
          _makeDescriptionRow()
        ],
      ),
    );
  }
}
