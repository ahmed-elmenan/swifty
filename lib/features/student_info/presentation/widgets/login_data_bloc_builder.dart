import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swifty/core/theme/GlobalTheme.dart';
import 'package:swifty/core/widgets/loading_widget.dart';
import 'package:swifty/core/widgets/message_display.dart';
import 'package:swifty/features/student_info/presentation/bloc/login_data_bloc.dart';

class LoginDataBlocBuilder extends StatefulWidget {
  const LoginDataBlocBuilder({Key key}) : super(key: key);

  @override
  _LoginDataBlocBuilderState createState() => _LoginDataBlocBuilderState();
}

class _LoginDataBlocBuilderState extends State<LoginDataBlocBuilder> {


  


  @override
  Widget build(BuildContext context) {
    Widget widget;
    return Container(child: BlocBuilder<LoginDataBloc, LoginDataState>(
      builder: (context, state) {
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
    ));
  }
}
