import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pinwheel/pinwheel.dart';
import 'package:rect_getter/rect_getter.dart';

void main() {
  Widget makeTestableWidget({Widget child}) {
    return MaterialApp(
      home: child,
    );
  }

  testWidgets("", (WidgetTester tester) async {
    String text = 'item';

    GlobalKey contentKey = RectGetter.createGlobalKey();
    GlobalKey firstItemKey = RectGetter.createGlobalKey();

    await tester.pumpWidget(makeTestableWidget(
        child: StickyContent(
            content: content(contentKey),
            child: ListView(
              children: <Widget>[
                Text(
                  text,
                  key: firstItemKey,
                ),
              ],
            ))));

    final Rect contentRect = RectGetter.getRectFromKey(contentKey);
    final Rect itemRect = RectGetter.getRectFromKey(firstItemKey);

    final bool notHit = contentRect.top != itemRect.top;
    expect(notHit, true);
  });
}

Widget content(GlobalKey key) {
  return Container(
    key: key,
    child: Text('Sticky content'),
    color: Colors.amber,
  );
}
