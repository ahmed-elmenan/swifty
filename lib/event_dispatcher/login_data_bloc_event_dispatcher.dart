import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swifty/features/login_data/domain/entities/login_data.dart';
import 'package:swifty/features/login_data/presentation/bloc/login_data_bloc.dart';

class LoginDataBlocDispatcher {
  static void dispatchMapProjectsToCursusEvent(BuildContext context, LoginData loginData, int cursusId) {
    BlocProvider.of<LoginDataBloc>(context)
        .add(ManageCursuses(loginData: loginData, cursusId: cursusId));
  }


// // bool collectCursusIds
//   static void dispatchSelectCursusProjectsEvent(BuildContext context, LoginData loginData) {
//     BlocProvider.of<LoginDataBloc>(context)
//         .add(ManageCursuses(loginData: loginData));
//   }


}