import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swifty/core/error/error_utils.dart';
import 'package:swifty/features/authentication/domain/entities/token.dart';
import 'package:swifty/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:swifty/features/authentication/presentation/widgets/search_button.dart';
import 'package:swifty/features/login_data/data/data_sources/login_data_local_data_source.dart';
import 'package:swifty/features/login_data/domain/entities/login_data.dart';
import '../../../../core/theme/GlobalTheme.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../../../core/widgets/message_display.dart';
import '../../../../injection_container.dart';
import '../bloc/login_data_bloc.dart';
import 'navigate_to_home.dart';

class LoginDataBlocBuilder extends StatefulWidget {
  final String login;
  final Token token;
  const LoginDataBlocBuilder({Key key, this.login, this.token})
      : super(key: key);

  @override
  _LoginDataBlocBuilderState createState() => _LoginDataBlocBuilderState();
}

class _LoginDataBlocBuilderState extends State<LoginDataBlocBuilder> {
  int attempt;

  @override
  void initState() {
    attempt = 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: BlocListener<LoginDataBloc, LoginDataState>(
      listener: (context, state) {
        return _builderContent(state);
      },
      child:
          BlocBuilder<LoginDataBloc, LoginDataState>(builder: (context, state) {
        return _builderContent(state);
      }),
    ));
  }

  Widget _builderContent(LoginDataState state) {
    Widget content = Container();
    if (state is LoginDataStateInitial) {
      content = Container();
    } else if (state is LoginDataLoading) {
      content = LoadingWidget();
    } else if (state is LoginDataLoaded) {
      content = NavigateToHome(
        loginData: state.loginData,
      );

      // navigateToLoginProfilPage(context, state.loginData);
    } else if (state is LoginDataError) {
      if (state.message == TOKEN_EXPIRATION_FAILURE_MESSAGE && attempt == 1) {
        attempt = 0;

        BlocProvider.of<AuthenticationBloc>(context)
            .add(AuthenticateUser(login: widget.login));
      }
      content = MessageDisplay(
          message: state.message, messageColor: GlobalTheme.errorColor);
    }
    return content;
  }
}
