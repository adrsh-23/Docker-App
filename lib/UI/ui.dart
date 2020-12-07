import 'package:docker_app/UI/Commands/pull.dart';
import 'package:docker_app/UI/Commands/remove.dart';
import 'package:docker_app/UI/Commands/run.dart';
import 'package:docker_app/UI/Commands/status.dart';
import 'package:flutter/material.dart';

class home extends StatefulWidget {
  @override
  _home createState() => _home();
}

// ignore: camel_case_types
class _home extends State<home> {
  Widget build(BuildContext context) {
    var design = Scaffold(
      appBar: AppBar(
        title: Text("Execute Docker Commands"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    'https://miro.medium.com/max/630/1*j_zP74-cpvXRcs8dM_pkMQ.jpeg'))),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            RaisedButton(
              color: Colors.transparent,
              onPressed: () => Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => Pull())), // change
              child: Text("Pull Image"),
            ),
            const SizedBox(
              height: 30,
            ),
            RaisedButton(
              color: Colors.transparent,
              onPressed: () => Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => Run())), // change
              child: Text("Run Container"),
            ),
            const SizedBox(
              height: 300,
            ),
            RaisedButton(
              color: Colors.transparent,
              onPressed: () => Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => Status())), // change
              child: Text("Check Container state"),
            ),
            const SizedBox(
              height: 30,
            ),
            RaisedButton(
              color: Colors.transparent,
              onPressed: () => Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => Remove())), // change
              child: Text("Remove Container"),
            ),
          ],
        ),
      ),
    );
    return design;
  }
}
