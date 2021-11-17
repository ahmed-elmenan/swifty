import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swifty/core/widgets/loading_widget.dart';
import 'package:swifty/core/widgets/message_display.dart';
import 'package:swifty/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:swifty/features/authentication/presentation/widgets/search_button.dart';

class SearchBlocBuilder extends StatefulWidget {
  const SearchBlocBuilder({Key key}) : super(key: key);

  @override
  _SearchBlocBuilderState createState() => _SearchBlocBuilderState();
}

class _SearchBlocBuilderState extends State<SearchBlocBuilder> {
  @override
  Widget build(BuildContext context) {
    Widget widget;
    return Container(
        child: BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is Loading) {
          widget = LoadingWidget();
        } else if (state is Authenticated) {
          print(state.token.access_token);
          widget = MessageDisplay(message: "Auth Success");
        } else if (state is Error) {
          widget = MessageDisplay(message: state.message);
        }
      },
      child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is AuthenticationInitial) {
            widget = Container();
          }
          return widget;
        },
      ),
    ));
  }
}
