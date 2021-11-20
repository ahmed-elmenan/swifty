import 'package:flutter/material.dart';
import 'package:swifty/features/login_data/domain/entities/login_data.dart';

class LoginProfilPage extends StatefulWidget {
  final LoginData loginData;
  const LoginProfilPage({Key key, this.loginData}) : super(key: key);

  @override
  _LoginProfilPageState createState() => _LoginProfilPageState();
}

class _LoginProfilPageState extends State<LoginProfilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.yellow,
        child: Center(
            child: Text(widget.loginData.projects_users.length.toString())),
      ),
    );
  }
}
