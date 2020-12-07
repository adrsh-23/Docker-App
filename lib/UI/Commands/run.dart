import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Run extends StatefulWidget {
  @override
  _Run createState() => _Run();
}

class _Run extends State<Run> {
  var data;
// ignore: non_constant_identifier_names
  run_con(image, con_name) async {
    var url =
        // ignore: unnecessary_brace_in_string_interps
        "http://192.168.1.103/cgi-bin/run_con.py?img=${image}&name=${con_name}";
    var r = await http.get(url);
    setState(() {
      data = r.body;
    });
    print(data);
  }

  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    var image, con_name;

    return Scaffold(
      appBar: AppBar(
        title: Text("Run a Container"),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            TextField(
              onChanged: (img) => {image = img},
              autocorrect: false,
              decoration: InputDecoration(hintText: "Enter image name"),
            ),
            TextField(
              onChanged: (name) => {con_name = name},
              autocorrect: false,
              decoration: InputDecoration(hintText: "Enter container name"),
            ),
            RaisedButton(
              onPressed: () {
                run_con(image, con_name);
              },
              child: Text("Run this container"),
            ),
            Text(data ?? "Output"),
          ],
        ),
      ),
    );
  }
}
