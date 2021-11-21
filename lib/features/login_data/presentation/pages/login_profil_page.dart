import 'package:flutter/material.dart';
import 'package:swifty/features/authentication/presentation/pages/logins_42_search_page.dart';
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
    return WillPopScope(
      onWillPop: () {
        _pushLogins42SearchPage();
        return Future.value(true);
      },
      child: Scaffold(
        body: Container(
          color: Colors.yellow,
          child: Center(
              child: GestureDetector(
                  onTap: () {
                    _pushLogins42SearchPage();
                  },
                  child:
                      Text(widget.loginData.projects_users.length.toString()))),
        ),
      ),
    );
  }

  void _pushLogins42SearchPage() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (_) => Logins42SearchPage()));
  }
}
