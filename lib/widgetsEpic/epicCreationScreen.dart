import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test_feild/utils/constants.dart';
import 'package:flutter_test_feild/utils/focusDisabledNode.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_test_feild/utils/extensions.dart';

class EpicCreationScreen extends StatefulWidget {
  @override
  _EpicCreationScreenState createState() => _EpicCreationScreenState();
}

class _EpicCreationScreenState extends State<EpicCreationScreen> {

  String _epicName = '';
  String _epicDescription = '';

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
    padding: EdgeInsets.all(15.0),
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
          child: Container(
            padding: EdgeInsets.only(bottom: 15),
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 5),
                labelText: 'Epic Name',
                alignLabelWithHint: true
              ),
              onChanged: (text) {
                _epicName = text;
              },
            ),
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
          child: Container(
            padding: EdgeInsets.only(bottom: 15),
            child: TextField(
              controller: _isStartInitState ? TextEditingController() : TextEditingController(text: _startDate.toReadableString()),
              onTap: () => _showDateTimeDialog(context, true),
              focusNode: DisabledFocusNode(),
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 5),
                  labelText: 'Epic Start Date',
                  alignLabelWithHint: true
              ),
            ),
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
          child: Container(
            padding: EdgeInsets.only(bottom: 15),
            child: TextField(
              controller: _isEndInitState ? TextEditingController() : TextEditingController(text: _endDate.toReadableString()),
              onTap: () => _showDateTimeDialog(context, false),
              focusNode: DisabledFocusNode(),
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 5),
                  labelText: 'Epic End Date',
                  alignLabelWithHint: true
              ),
            ),
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
          child: Container(
            padding: EdgeInsets.only(bottom: 15),
            child: TextField(
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 5),
                  labelText: 'Epic Description',
                  alignLabelWithHint: true
              ),
              onChanged: (text) {
                _epicDescription = text;
              },
            ),
          ),
        ),
        _horizontalPadding
      ],
    );
  }

  SizedBox _makeCreateButton() {
    return SizedBox(
      width: double.infinity,
      height: 35.0,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: RaisedButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          color: appPurpleColor,
          child: Text('Create', style: TextStyle(color: Colors.white),),
          onPressed: (){
            Fluttertoast.showToast(msg: 'Epic created');
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Epic Creation'),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height - 95,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                _verticalPadding,
                _makeNameRow(),
                _verticalPadding,
                _makeStartDateRow(),
                _verticalPadding,
                _makeEndDateRow(),
                _verticalPadding,
                _makeDescriptionRow(),
                Expanded(child: Container(height: 10,),),
                _makeCreateButton()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
