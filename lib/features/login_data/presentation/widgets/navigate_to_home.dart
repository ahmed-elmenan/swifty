import 'package:flutter/material.dart';
import 'package:swifty/features/login_data/domain/entities/login_data.dart';
import 'package:swifty/features/login_data/presentation/pages/login_profil_page.dart';

class NavigateToHome extends StatefulWidget {
  final LoginData loginData;
  NavigateToHome({Key key, this.loginData}) : super(key: key);

  @override
  _NavigateToHomeState createState() => _NavigateToHomeState();
}

class _NavigateToHomeState extends State<NavigateToHome> {
  Future navigateToLoginProfilPage(context, LoginData loginData) async {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) {
          return LoginProfilPageParent(loginData: loginData);
        },
      ));
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    navigateToLoginProfilPage(context, widget.loginData);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
