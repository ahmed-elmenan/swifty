import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swifty/core/theme/GlobalTheme.dart';
import 'package:swifty/core/widgets/loading_widget.dart';
import 'package:swifty/core/widgets/message_display.dart';
import 'package:swifty/event_dispatcher/login_data_bloc_event_dispatcher.dart';
import 'package:swifty/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:swifty/features/authentication/presentation/pages/logins_42_search_page.dart';
import 'package:swifty/features/login_data/data/model/cursus_model.dart';
import 'package:swifty/features/login_data/data/model/managed_cursus.dart';
import 'package:swifty/features/login_data/domain/entities/login_data.dart';
import 'package:swifty/features/login_data/domain/entities/projects_cursus.dart';
import 'package:swifty/features/login_data/presentation/bloc/login_data_bloc.dart';
import 'package:swifty/features/login_data/presentation/widgets/empty_data_message.dart';
import 'package:swifty/features/login_data/presentation/widgets/login_avatar.dart';
import 'package:swifty/features/login_data/presentation/widgets/login_info_header.dart';
import 'package:swifty/features/login_data/presentation/widgets/project_details_card.dart';

import '../../../../injection_container.dart';

class LoginProfilPageParent extends StatelessWidget {
  final LoginData loginData;
  const LoginProfilPageParent({Key key, this.loginData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginDataBloc>(
      create: (_) => sl<LoginDataBloc>(),
      child: LoginProfilPage(loginData: loginData),
    );
  }
}

class LoginProfilPage extends StatefulWidget {
  static bool isTriggered;
  final LoginData loginData;
  const LoginProfilPage({Key key, this.loginData}) : super(key: key);

  @override
  _LoginProfilPageState createState() => _LoginProfilPageState();
}

class _LoginProfilPageState extends State<LoginProfilPage> {
  ManagedCursus projectCursus;

  @override
  void initState() {
    List<CursusModel> cursusUsers = widget.loginData.cursus_users;
    print(cursusUsers.length);
    final initCursusId = cursusUsers.length == 0
        ? -1
        : widget.loginData.cursus_users[0].cursus.id;
    LoginDataBlocDispatcher.dispatchMapProjectsToCursusEvent(
        context, widget.loginData, initCursusId);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return WillPopScope(
      onWillPop: () {
        _pushLogins42SearchPage();
        return Future.value(false);
      },
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          body: new BlocBuilder<LoginDataBloc, LoginDataState>(
            builder: (context, state) {
              Widget content;
              if (state is LoginDataStateInitial) {
                content = Container();
              } else if (state is LoginDataLoading) {
                content = LoadingWidget();
              } else if (state is ProjectsMapedToCursus) {
                projectCursus = state.projectCursusMap;

                content = Container(
                  color: GlobalTheme.homeBgColor,
                  child: DefaultTabController(
                    length: 2,
                    child: CustomScrollView(
                      slivers: <Widget>[
                        SliverAppBar(
                          backgroundColor: GlobalTheme.homeBgColor,
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
                          expandedHeight: isLandscape
                              ? size.height - 70
                              : size.height / 3 + 70,
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
                            delegate: new SliverChildListDelegate(
                                _buildList(state.projectCursusMap, size)))
                      ],
                    ),
                  ),
                );
              }
              return content;
            },
          ),
        ),
      ),
    );
  }

  void _pushLogins42SearchPage() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (_) => Logins42SearchPage()));
  }

  List _buildList(ManagedCursus managedCursus, Size size) {
    List<Widget> listProjects = [];

    if (managedCursus.selectedProjects != null) {
      int len = managedCursus.selectedProjects.length;

      for (int i = 0; i < len; i++) {
        listProjects.add(
          Padding(
              padding: new EdgeInsets.all(8.0),
              child: ProjectDetailsCard(
                  managedCursus: managedCursus.selectedProjects[i])),
        );
      }
    } else
      listProjects.add(EmptyDataMessage());
    return listProjects;
  }
}
