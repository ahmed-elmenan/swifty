import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../../injection_container.dart';

class LoginAvatar extends StatefulWidget {
  final String imageUrl;
  LoginAvatar({Key key, this.imageUrl}) : super(key: key);

  @override
  _LoginAvatarState createState() => _LoginAvatarState();
}

class _LoginAvatarState extends State<LoginAvatar> {
  NetworkImage image;

  @override
  void initState() {
    getImage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 25.0,
      backgroundImage: image,
      backgroundColor: Colors.transparent,
    );
  }

  void getImage() async {
    final res = await http.get(Uri.parse(widget.imageUrl));
    if (res.statusCode == 200)
      changeImageState(widget.imageUrl);
    else
      changeImageState(
          "https://www.pinclipart.com/picdir/middle/60-601431_contact-starwars-user-default-yoda-comments-silhouette-star.png");
  }

  changeImageState(String url) {
    setState(() {
      image = NetworkImage(url);
    });
  }
}
