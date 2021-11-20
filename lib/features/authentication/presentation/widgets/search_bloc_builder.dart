import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swifty/features/login_data/presentation/widgets/login_data_bloc_builder.dart';
import '../../../../core/theme/GlobalTheme.dart';
import '../../../../core/utils/token_utils.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../../../core/widgets/message_display.dart';
import '../bloc/authentication_bloc.dart';
import 'search_button.dart';
import '../../../login_data/presentation/bloc/login_data_bloc.dart';

import '../../../../injection_container.dart';

class SearchBlocBuilder extends StatefulWidget {
  final String login;
  SearchBlocBuilder({Key key, this.login}) : super(key: key);

  @override
  _SearchBlocBuilderState createState() => _SearchBlocBuilderState();
}

class _SearchBlocBuilderState extends State<SearchBlocBuilder> {
  @override
  Widget build(BuildContext context) {
    Widget content;
    return Container(
        child: BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is Loading) {
          content = LoadingWidget();
        } else if (state is Authenticated) {
          content = Container();
           BlocProvider.of<LoginDataBloc>(context)
        .add(FetchLoginData(widget.login, state.token));
          // dispatch search Event to push
        } else if (state is Error) {
          content = MessageDisplay(
              message: state.message, color: GlobalTheme.errorColor);
        }
      },
      child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        //  buildWhen: (p, c) => p.propreties != c.propreties,
        builder: (context, state) {
          if (state is AuthenticationInitial) {
            content = Container();
          }
          return content;
        },
      ),
    ));
  }
}
