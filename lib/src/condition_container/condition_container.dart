import 'package:flutter/widgets.dart';

class ConditionContainer extends StatelessWidget {
  final bool condition;
  final Widget child;

  const ConditionContainer(
      {Key key, @required this.condition, @required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (this.condition) {
      return this.child;
    }

    return Container();
  }
}
