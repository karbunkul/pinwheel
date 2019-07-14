import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StickyContent extends StatefulWidget {
  final Widget content;
  final Widget child;
  const StickyContent({Key key, @required this.content, @required this.child})
      : super(key: key);
  @override
  _StickyContentState createState() => _StickyContentState();
}

class _StickyContentState extends State<StickyContent> {
  final GlobalKey _key = GlobalKey();

  StreamController<double> _paddingController = StreamController<double>();
  Stream<double> get padding => _paddingController.stream;

  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _postFrameCallback());
  }

  _postFrameCallback() {
    try {
      final RenderBox renderBox = _key.currentContext.findRenderObject();
      _paddingController.sink.add(renderBox.size.height);
    } catch (_) {
      _paddingController.sink.add(0.0);
    }
  }

  @override
  void dispose() {
    _paddingController?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        StreamBuilder<double>(
          stream: padding,
          initialData: 0.001, // not 0.0 need for hit on test
          builder: (_, snap) => Padding(
//                padding: EdgeInsets.all(0.0),
                padding: EdgeInsets.only(top: snap.data),
                child: widget.child,
              ),
        ),
        Positioned(
          key: _key,
          child: widget.content,
        ),
      ],
    );
  }
}
