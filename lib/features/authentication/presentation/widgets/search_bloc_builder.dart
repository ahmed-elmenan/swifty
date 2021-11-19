import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swifty/core/theme/GlobalTheme.dart';
import 'package:swifty/core/utils/token_utils.dart';
import 'package:swifty/core/widgets/loading_widget.dart';
import 'package:swifty/core/widgets/message_display.dart';
import 'package:swifty/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:swifty/features/authentication/presentation/widgets/search_button.dart';
import 'package:swifty/features/student_info/presentation/bloc/login_data_bloc.dart';

import '../../../../injection_container.dart';

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
          widget = BlocProvider(
            create: (context) => sl<LoginDataBloc>(),
            // child: LoginDataBlocBuilder(),
          );
          // dispatch search Event to push
        } else if (state is Error) {
          widget = MessageDisplay(
              message: state.message, color: GlobalTheme.errorColor);
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
