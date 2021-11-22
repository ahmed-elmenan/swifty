import 'package:flutter/material.dart';

class LoginAvatar extends StatelessWidget {
  final String imageUrl;
  const LoginAvatar({Key key, this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 25.0,
      backgroundImage: NetworkImage(imageUrl),
      backgroundColor: Colors.transparent,
    );
  }
}
