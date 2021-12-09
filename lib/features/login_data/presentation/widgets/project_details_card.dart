import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:swifty/core/theme/GlobalTheme.dart';
import 'package:swifty/features/login_data/data/model/project_details_model.dart';
import 'package:swifty/features/login_data/presentation/bloc/login_data_bloc.dart';

class ProjectStatus {
  final FaIcon icon;
  final Color color;

  ProjectStatus({this.icon, this.color});
}

class ProjectDetailsCard extends StatelessWidget {
  final ProjectDetailsModel managedCursus;
  ProjectDetailsCard({Key key, this.managedCursus}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String finalMark = managedCursus.final_mark == null
        ? "-"
        : managedCursus.final_mark.toString() + "%";
    print(managedCursus.validated.toString());
    print(managedCursus.project.slug.toString());
    final Map<String, ProjectStatus> projectStatusMap = {
      "in_progress": ProjectStatus(
          icon: FaIcon(FontAwesomeIcons.spinner, color: Colors.cyan[300]),
          color: Colors.cyan[300]),
      "waiting_for_correction": ProjectStatus(
          icon: FaIcon(FontAwesomeIcons.spinner, color: Colors.cyan[300]),
          color: Colors.cyan[300]),
      "finished": managedCursus.validated == null ||
              managedCursus.validated == false
          ? ProjectStatus(
              icon: FaIcon(FontAwesomeIcons.times, color: Colors.red[300]),
              color: Colors.red[300])
          : ProjectStatus(
              icon: FaIcon(FontAwesomeIcons.check, color: Colors.green[300]),
              color: Colors.green[300])
    };

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      height: size.height / 7,
      decoration: BoxDecoration(
        color: GlobalTheme.homeCardColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              flex: 2,
              child: Text(
                managedCursus.project.slug,
                style: TextStyle(color: Colors.white),
              )),
          Expanded(
              child: Text(finalMark, style: TextStyle(color: Colors.white))),
          Expanded(
            child: projectStatusMap[managedCursus.status].icon,
          )
        ],
      ),
    );
  }
}
