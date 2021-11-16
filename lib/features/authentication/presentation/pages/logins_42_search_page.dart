import 'package:flutter/material.dart';

class Logins42SearchPage extends StatefulWidget {
  @override
  _Logins42SearchPageState createState() => _Logins42SearchPageState();
}

class _Logins42SearchPageState extends State<Logins42SearchPage> {
  TextEditingController loginController;

  @override
  void dispose() {
    loginController.dispose();

    super.dispose();
  }

  @override
  void initState() {
    loginController = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                  controller: loginController,
                  decoration: InputDecoration(
                    hintText: "enter a 42 login",
                    hintStyle: TextStyle(
                      color: Color(0xFF979BA3),
                    ),
                    // filled: true,
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            ElevatedButton(
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
              onPressed: () async {},
              style: ElevatedButton.styleFrom(
                // primary: GlobalTheme.kColorLime,
                onPrimary: Colors.white,

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
