import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swifty/features/authentication/presentation/bloc/authentication_bloc.dart';

class SearchButton extends StatefulWidget {
  const SearchButton({Key key}) : super(key: key);

  @override
  _SearchButtonState createState() => _SearchButtonState();
}

class _SearchButtonState extends State<SearchButton> {
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
          dispatchAuthenticationEvent();
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
}
