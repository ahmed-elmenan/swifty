import 'package:flutter/material.dart';
import 'package:swifty/core/theme/GlobalTheme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:swifty/features/login_data/data/model/cursus_details_model.dart';
import 'package:swifty/features/login_data/data/model/managed_cursus.dart';
import 'package:swifty/features/login_data/domain/entities/projects_cursus.dart';

class CursusDropDownButton extends StatefulWidget {
  final ManagedCursus projectCursus;

  const CursusDropDownButton({Key key, this.projectCursus}) : super(key: key);

  @override
  _CursusDropDownButtonState createState() => _CursusDropDownButtonState();
}

class _CursusDropDownButtonState extends State<CursusDropDownButton> {
  List x = ['Asssssssss', 'B', 'C', 'D'];
  String selectedValue;
  List<String> cursusNamesList;
  Map m = {};

  @override
  void initState() {
    // TODO: implement initState
    cursusNamesList = widget.projectCursus.cursusNames;
    selectedValue = cursusNamesList[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.red,
        child: DropdownButton<String>(
          iconSize: 12,
          style: GlobalTheme.primaryTextStyle.copyWith(color: Colors.black),
          icon: FaIcon(FontAwesomeIcons.chevronDown, color: Colors.white),
          hint: Text(selectedValue, style: GlobalTheme.primaryTextStyle),
          underline: Container(),
          items: cursusNamesList.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              selectedValue = value;
            });
          },
        ));
  }
}
