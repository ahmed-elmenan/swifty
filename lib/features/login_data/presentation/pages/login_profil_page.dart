import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swifty/core/widgets/loading_widget.dart';
import 'package:swifty/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:swifty/features/authentication/presentation/pages/logins_42_search_page.dart';
import 'package:swifty/features/login_data/data/model/managed_cursus.dart';
import 'package:swifty/features/login_data/domain/entities/login_data.dart';
import 'package:swifty/features/login_data/domain/entities/projects_cursus.dart';
import 'package:swifty/features/login_data/presentation/bloc/login_data_bloc.dart';
import 'package:swifty/features/login_data/presentation/widgets/login_avatar.dart';
import 'package:swifty/features/login_data/presentation/widgets/login_info_header.dart';

import '../../../../injection_container.dart';

class LoginProfilPageParent extends StatelessWidget {
  final LoginData loginData;
  const LoginProfilPageParent({Key key, this.loginData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginDataBloc>(
      create: (context) => sl<LoginDataBloc>(),
      child: LoginProfilPage(loginData: loginData),
    );
  }
}

class LoginProfilPage extends StatefulWidget {
  final LoginData loginData;
  const LoginProfilPage({Key key, this.loginData}) : super(key: key);

  @override
  _LoginProfilPageState createState() => _LoginProfilPageState();
}

class _LoginProfilPageState extends State<LoginProfilPage> {
  ManagedCursus projectCursus;
  void dispatchMapProjectsToCursusEvent() {
    BlocProvider.of<LoginDataBloc>(context)
        .add(ManageCursuses(loginData: widget.loginData));
  }

  @override
  void initState() {
    dispatchMapProjectsToCursusEvent();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () {
        _pushLogins42SearchPage();
        return Future.value(true);
      },
      child: Scaffold(
        body: new BlocBuilder<LoginDataBloc, LoginDataState>(
          builder: (context, state) {
            Widget content;
            if (state is LoginDataStateInitial) {
              return Container();
            } else if (state is LoginDataLoading) {
              return LoadingWidget();
            } else if (state is ProjectsMapedToCursus) {
              projectCursus = state.projectCursusMap;
            }
            return Container(
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
                    expandedHeight: size.height / 3 + 50,
                    floating: true,
                    pinned: true,
                    snap: true,
                    elevation: 50,
                    flexibleSpace: FlexibleSpaceBar(
                      centerTitle: true,
                      background: Center(
                          child: LoginInfoHeader(
                              loginData: widget.loginData,
                              projectCursus: projectCursus)),
                    ),
                  ),
                  SliverList(
                      delegate: new SliverChildListDelegate(_buildList(5)))
                ],
              ),
            );
          },
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
