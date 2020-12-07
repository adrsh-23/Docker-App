import 'package:docker_app/UI/ui.dart';
import 'package:flutter/material.dart';

main() => runApp(app());

class app extends StatefulWidget {
  @override
  _app createState() => _app();
}

// ignore: camel_case_types
class _app extends State<app> {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: home(),
      debugShowCheckedModeBanner: false,
    );
  }
}
