import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swifty/features/authentication/domain/entities/token.dart';
import 'package:swifty/features/authentication/presentation/widgets/search_button.dart';
import 'package:swifty/features/login_data/domain/entities/login_data.dart';
import 'package:swifty/features/login_data/presentation/pages/login_profil_page.dart';
import '../../../../core/theme/GlobalTheme.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../../../core/widgets/message_display.dart';
import '../bloc/login_data_bloc.dart';

class LoginDataBlocBuilder extends StatefulWidget {
  final String login;
  final Token token;
  const LoginDataBlocBuilder({Key key, this.login, this.token})
      : super(key: key);

  @override
  _LoginDataBlocBuilderState createState() => _LoginDataBlocBuilderState();
}

class _LoginDataBlocBuilderState extends State<LoginDataBlocBuilder> {
  @override
  void initState() {
    print(' >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> obj');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget widget;
    return Container(
        child: BlocListener<LoginDataBloc, LoginDataState>(
      listener: (context, state) {
        if (state is LoginDataLoading) {
          widget = LoadingWidget();
        } else if (state is LoginDataLoaded) {
          widget = MessageDisplay(message: state.loginData.email);
        } else if (state is LoginDataError) {
          widget = MessageDisplay(
              message: state.message, color: GlobalTheme.errorColor);
        }
        return widget;
      },
      child: BlocBuilder<LoginDataBloc, LoginDataState>(
        // buildWhen: (p, c) => p.propreties != c.propreties,
        builder: (context, state) {
          if (state is LoginDataStateInitial) {
            widget = Container();
          } else if (state is LoginDataLoading) {
            widget = LoadingWidget();
          } else if (state is LoginDataLoaded) {
            widget = Container();
            navigateToLoginProfilPage(context, state.loginData);
          } else if (state is LoginDataError) {
            widget = MessageDisplay(
                message: state.message, color: GlobalTheme.errorColor);
          }
          return widget;
        },
      ),
    ));
  }

  Future navigateToLoginProfilPage(context, LoginData loginData) async {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => LoginProfilPage(loginData: loginData)));
    });
  }
}
