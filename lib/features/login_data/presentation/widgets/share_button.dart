import 'package:flutter/material.dart';
import 'package:share/share.dart';

class ShareButton extends StatelessWidget {
  const ShareButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: IconButton(
        icon: const Icon(
          Icons.share,
          size: 24,
        ),
        tooltip: 'Show Snackbar',
        onPressed: () {
          Share.share(
              'Check out 42 Swifty App on playstore https://play.google.com/store/apps/details?id=com.example.swifty',
              subject: 'Check it out!');
        },
      ),
    );
  }
}
