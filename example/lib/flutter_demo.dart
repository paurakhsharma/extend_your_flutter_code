import 'package:flutter/material.dart';

extension TextModifier on Text {
  Text color(Color color) {
    if (this.style == null) {
      return Text(
        this.data,
        style: TextStyle(color: color),
      );
    }
    return Text(
      this.data,
      style: this.style.copyWith(color: color),
    );
  }

  Text fontSize(double fontSize) {
    if (this.style == null) {
      return Text(
        this.data,
        style: TextStyle(fontSize: fontSize),
      );
    }

    return Text(
      this.data,
      style: this.style.copyWith(fontSize: fontSize),
    );
  }
}

extension WidgetModifier on Widget {
  Widget padding({horizontal, vertical}) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontal,
        vertical: vertical,
      ),
      child: this,
    );
  }

  Widget background(Color color) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: color,
      ),
      child: this,
    );
  }
}

class FlutterDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('Hello, World!')
        .color(Colors.purple)
        .fontSize(50.0)
        .background(Colors.lightBlue)
        .padding(horizontal: 10, vertical: 20)
        .background(Colors.purple)
        .padding(horizontal: 20, vertical: 50)
        .background(Colors.green);
  }
}

class FlutterWithoutExtention extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple,
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 20,
      ),
      child: Container(
        color: Colors.lightBlue,
        child: Text(
          'Hello, World!',
          style: TextStyle(color: Colors.purple, fontSize: 50.0),
        ),
      ),
    );
  }
}
