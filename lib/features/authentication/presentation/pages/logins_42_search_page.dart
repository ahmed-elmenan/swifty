import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swifty/features/login_data/presentation/bloc/login_data_bloc.dart';
import 'package:swifty/features/login_data/presentation/widgets/login_data_bloc_builder.dart';
import '../../data/data_sources/auth_local_data_source.dart';
import '../bloc/authentication_bloc.dart';
import '../widgets/search_bloc_builder.dart';
import '../widgets/search_button.dart';

import '../../../../injection_container.dart';

class Logins42SearchPage extends StatefulWidget {
  @override
  _Logins42SearchPageState createState() => _Logins42SearchPageState();
}

class _Logins42SearchPageState extends State<Logins42SearchPage> {
  String login;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => sl<AuthenticationBloc>(),
            
          ),
          BlocProvider(
            create: (context) => sl<LoginDataBloc>(),
          ),
        ],
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          color: Colors.grey[50],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Form(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 7, horizontal: 17),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "enter a 42 login",
                      hintStyle: TextStyle(
                        color: Color(0xFF979BA3),
                      ),
                      // filled: true,
                      border: InputBorder.none,
                    ),
                    onChanged: (value) {
                      setState(() {
                        login = value;
                      });
                    },
                  ),
                ),
              ),
              LoginDataBlocBuilder(login: login),
              SearchBlocBuilder(login: login),
              SearchButton(login: login)
            ],
          ),
        ),
      ),
    );
  }
}
