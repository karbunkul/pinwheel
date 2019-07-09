import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pinwheel/pinwheel.dart';

void main() {
  Widget makeTestableWidget({Widget child}) {
    return MaterialApp(
      home: child,
    );
  }

  testWidgets("Show child when condition is true", (WidgetTester tester) async {
    await tester.pumpWidget(makeTestableWidget(
        child: ConditionContainer(condition: true, child: content())));

    expect(find.text(label()), findsOneWidget);
  });

  testWidgets("Hide child when condition is true", (WidgetTester tester) async {
    await tester.pumpWidget(makeTestableWidget(
        child: ConditionContainer(condition: false, child: content())));

    expect(find.text(label()), findsNothing);
  });
}

String label() {
  return 'foo bar';
}

Widget content() {
  return Text(label());
}
