import 'package:uuid/uuid.dart';

class Task {

  String id;
  String epicId;

  String name;
  String description;
  DateTime endDate;
  bool isFinished;

  List<String> marks;

  Task(this.name, this.endDate) {
    Uuid uuid = Uuid();

    id = uuid.v1();
    epicId = uuid.v1();

    description = '';
    isFinished = false;

    marks = <String>[];
  }
}