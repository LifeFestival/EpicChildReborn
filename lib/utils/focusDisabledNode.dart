import 'package:flutter/widgets.dart';

class DisabledFocusNode extends FocusNode {

  @override
  bool get hasFocus => false;
}