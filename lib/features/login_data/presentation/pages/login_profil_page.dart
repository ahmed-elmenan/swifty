import 'package:flutter/material.dart';
import 'package:swifty/features/authentication/presentation/pages/logins_42_search_page.dart';
import 'package:swifty/features/login_data/domain/entities/login_data.dart';
import 'package:swifty/features/login_data/presentation/widgets/login_avatar.dart';
import 'package:swifty/features/login_data/presentation/widgets/login_info_header.dart';
import 'package:swifty/features/login_data/presentation/widgets/share_button.dart';

class LoginProfilPage extends StatefulWidget {
  final LoginData loginData;
  const LoginProfilPage({Key key, this.loginData}) : super(key: key);

  @override
  _LoginProfilPageState createState() => _LoginProfilPageState();
}

class _LoginProfilPageState extends State<LoginProfilPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () {
        _pushLogins42SearchPage();
        return Future.value(true);
      },
      child: Scaffold(
        body: Container(
          child: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                title: Center(child: Text(widget.loginData.login)),
                leading: IconButton(
                  icon: Icon(
                    Icons.chevron_left,
                    size: 30,
                  ),
                  onPressed: () {
                    _pushLogins42SearchPage();
                  },
                ),
                actions: <Widget>[
                  LoginAvatar(imageUrl: widget.loginData.image_url),
                ],
                expandedHeight: size.height / 3,
                floating: true,
                pinned: true,
                snap: true,
                elevation: 50,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  background: LoginInfoHeader(loginData: widget.loginData),
                ),
              ),
              new SliverList(
                  delegate: new SliverChildListDelegate(_buildList(5))),
            ],
          ),
        ),
      ),
    );
  }

  void _pushLogins42SearchPage() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (_) => Logins42SearchPage()));
  }

  List _buildList(int count) {
    List<Widget> listItems = [];
    for (int i = 0; i < count; i++) {
      listItems.add(
        Padding(padding: new EdgeInsets.all(8.0), child: Placeholder()),
      );
    }
    return listItems;
  }
}
