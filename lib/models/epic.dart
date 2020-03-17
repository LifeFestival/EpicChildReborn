import 'package:flutter_test_feild/models/attachment.dart';
import 'package:flutter_test_feild/models/event.dart';
import 'package:flutter_test_feild/models/task.dart';
import 'package:uuid/uuid.dart';

class Epic {

  final String id = Uuid().v1();

  String name;
  String description;
  DateTime startDate;
  DateTime endDate;

  List<Task> taskList;
  List<Event> eventList;
  List<Attachment> attachList;

  bool isFinished;

  Epic(this.name, this.startDate, this.endDate, { String description}) {

    this.description = description ?? '';

    taskList = <Task>[];
    eventList = <Event>[];
    attachList = <Attachment>[];

    isFinished = false;
  }
}