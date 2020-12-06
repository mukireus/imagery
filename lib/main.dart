import 'package:flutter/material.dart';

import 'ui/home/view/home_view.dart';

void main() => runApp(Imagery());

class Imagery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: buildThemeData,
      title: 'Imagery',
      home: HomeView(),
      debugShowCheckedModeBanner: false,
    );
  }

  ThemeData get buildThemeData {
    return ThemeData(
      primaryColor: Colors.black,
      accentColor: Colors.grey[400],
      indicatorColor: Colors.black,
    );
  }
}
