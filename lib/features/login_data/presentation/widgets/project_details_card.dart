import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:swifty/core/theme/GlobalTheme.dart';
import 'package:swifty/features/login_data/data/model/project_details_model.dart';
import 'package:swifty/features/login_data/presentation/bloc/login_data_bloc.dart';

class ProjectDetailsCard extends StatelessWidget {
  final ProjectDetailsModel managedCursus;
  ProjectDetailsCard({Key key, this.managedCursus}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String finalMark = managedCursus.final_mark == null
        ? "-"
        : managedCursus.final_mark.toString();
    print(managedCursus.validated.toString());
    print(managedCursus.project.slug.toString());
    final Map projectStatusMap = {
      "in_progress": FaIcon(FontAwesomeIcons.spinner),
      "waiting_for_correction": FaIcon(FontAwesomeIcons.spinner),
      "finished": managedCursus.validated == null ||
              managedCursus.validated == false
          ? FaIcon(FontAwesomeIcons.times)
          : FaIcon(FontAwesomeIcons.check)
    };

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      height: size.height / 7,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xFFFAFAFA),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 8,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(flex: 2, child: Text(managedCursus.project.slug)),
          Expanded(child: Text(finalMark)),
          Expanded(child: projectStatusMap[managedCursus.status])
        ],
      ),
    );
  }
}
