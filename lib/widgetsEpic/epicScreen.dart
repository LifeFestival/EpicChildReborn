import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test_feild/models/epic.dart';
import 'package:flutter_test_feild/widgetsAttach/attachScreen.dart';
import 'package:flutter_test_feild/widgetsEpic/epicInfoScreen.dart';
import 'package:flutter_test_feild/widgetsEvent/eventsScreen.dart';
import 'package:flutter_test_feild/widgetsTask/taskScreen.dart';

class EpicScreen extends StatefulWidget {

  static const String routeName = '/epic';

  final Epic currentEpic;

  EpicScreen(this.currentEpic);

  @override
  _EpicScreenState createState() => _EpicScreenState(currentEpic);
}

class _EpicScreenState extends State<EpicScreen> with SingleTickerProviderStateMixin{

  Epic _currentEpic;
  List<Widget> _tabsList = [];
  TabController _tabController;

  _EpicScreenState(this._currentEpic) {

   _tabsList.addAll(
     [Icon(Icons.event_note),
       Icon(Icons.done_all),
       Icon(Icons.event),
       Icon(Icons.attach_file)]);
  }

  @override
  void initState() {
    super.initState();
        _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();

    _tabController.dispose();
  }

  TabBar _createTabBar() {
    return TabBar(
      controller: _tabController,
      tabs: _tabsList,
    );
  }

  TabBarView _createTabBarView(var tabs) {
    return TabBarView(
      children: tabs,
      controller: _tabController,
      dragStartBehavior: DragStartBehavior.start,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Epic ${_currentEpic.name}'),
        bottom: _createTabBar(),
      ),
      body: _createTabBarView([EpicInfoScreen(_currentEpic), TaskScreen(), EventsScreen(), AttachScreen()]),
    );
  }
}
