import 'package:flutter/material.dart';

import 'ui/home/view/home_view.dart';

void main() => runApp(Imagery());

class Imagery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Imagery',
      home: HomeView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
