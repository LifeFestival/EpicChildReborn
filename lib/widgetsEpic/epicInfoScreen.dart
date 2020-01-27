import 'package:flutter/widgets.dart';
import 'package:flutter_test_feild/models/epic.dart';

class EpicInfoScreen extends StatefulWidget {

  final Epic _epic;

  EpicInfoScreen(this._epic);

  @override
  _EpicInfoScreenState createState() => _EpicInfoScreenState();
}

class _EpicInfoScreenState extends State<EpicInfoScreen> {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Epic name: ${widget._epic.name}'),
            Text('Epic description: ${widget._epic.description}'),
            Text('Start Date: ${widget._epic.startData}'),
            Text('End Date: ${widget._epic.endDate}'),
            Text('IsFinished: ${widget._epic.isFinished}')
          ],
        ),
      ),
    );
  }
}
