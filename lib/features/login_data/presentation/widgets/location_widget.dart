import 'package:flutter/material.dart';
import 'package:swifty/core/theme/GlobalTheme.dart';

class LocationWidget extends StatelessWidget {
  final String location;

  const LocationWidget({Key key, this.location}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: GlobalTheme.secondaryBgColor,
        ),
        child: location == null ? _isUnavailable() : _isAvailable());
  }

  Widget _isAvailable() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Available",
          style: GlobalTheme.primaryTextStyle,
        ),
        SizedBox(
          height: 3,
        ),
        Text(
          location,
          style: GlobalTheme.primaryTextStyle,
        )
      ],
    );
  }

  Widget _isUnavailable() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Unavailable",
          style: GlobalTheme.primaryTextStyle,
        ),
        Text(
          "-",
          style: GlobalTheme.primaryTextStyle,
        )
      ],
    );
  }
}
