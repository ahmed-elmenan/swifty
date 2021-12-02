import 'package:flutter/material.dart';

import 'features/authentication/presentation/pages/logins_42_search_page.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MaterialApp(
    theme: ThemeData(fontFamily: 'futur'),
    home: Logins42SearchPage(),
  ));
}
