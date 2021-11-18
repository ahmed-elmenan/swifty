import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swifty/features/authentication/data/data_sources/auth_local_data_source.dart';
import 'package:swifty/features/authentication/data/models/token_model.dart';
import 'package:swifty/features/authentication/domain/entities/token.dart';
import 'package:swifty/features/authentication/presentation/bloc/authentication_bloc.dart';

import '../../../../injection_container.dart';

class SearchButton extends StatefulWidget {
  const SearchButton({Key key}) : super(key: key);

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
              ? dispatchLoginSearchEvent(token)
              : dispatchAuthenticationEvent();
        },
        style: ElevatedButton.styleFrom(
          // primary: GlobalTheme.kColorLime,
          onPrimary: Colors.white,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40.0),
          ),
        ),
      ),
    );
  }

  void dispatchAuthenticationEvent() {
    BlocProvider.of<AuthenticationBloc>(context).add(AuthenticateUser());
  }

  void dispatchLoginSearchEvent(Token token) {
    print("cached token =>" + token.access_token);

    // BlocProvider.of<LoginSearchBloc>(context).add(LoginSearch(token));
  }
}
