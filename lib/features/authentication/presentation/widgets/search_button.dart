import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/token_utils.dart';
import '../../data/data_sources/auth_local_data_source.dart';
import '../../data/models/token_model.dart';
import '../../domain/entities/token.dart';
import '../bloc/authentication_bloc.dart';
import '../../../login_data/presentation/bloc/login_data_bloc.dart';

import '../../../../injection_container.dart';

class SearchButton extends StatefulWidget {
  final String login;
  SearchButton({Key key, this.login}) : super(key: key);

  @override
  _SearchButtonState createState() => _SearchButtonState();
}

class _SearchButtonState extends State<SearchButton> {
  AuthLocalDataSource localDataSource;

  @override
  void initState() {
    localDataSource = sl<AuthLocalDataSource>();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 7, horizontal: 17),
          child: Center(
            child: Text(
              "Search",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        onPressed: () async {
          Token token = await localDataSource.getCachedTokenData();
          (token != null)
          ? dispatchLoginSearchEvent(widget.login, token)
                    : dispatchAuthenticationEvent(widget.login);
          
        },
        style: ElevatedButton.styleFrom(
          onPrimary: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40.0),
          ),
        ),
      ),
    );
  }

  void dispatchAuthenticationEvent(String login) {
    BlocProvider.of<AuthenticationBloc>(context).add(AuthenticateUser(login: login));
  }

  void dispatchLoginSearchEvent(String login, Token token) {
    BlocProvider.of<LoginDataBloc>(context).add(FetchLoginData(login, token));
  }
}
