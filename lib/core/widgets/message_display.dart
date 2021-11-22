import 'package:flutter/material.dart';

class MessageDisplay extends StatelessWidget {
  final String message;
  final Color messageColor;

  MessageDisplay({
    Key key,
    @required this.message,
    this.messageColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Center(
        child: Text(
          message,
          textAlign: TextAlign.center,
          style: TextStyle(color: messageColor),
        ),
      ),
    );
  }
}
