import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Remove extends StatefulWidget {
  @override
  _Remove createState() => _Remove();
}

class _Remove extends State<Remove> {
  var data;
  remove_one(name) async {
    var url = "http://192.168.1.103/cgi-bin/rm1.py?con_name=$name";
    var r = await http.get(url);
    setState(() {
      data = r.body;
    });
    print(data);
  }

  remove_all() async {
    var url = "http://192.168.1.103/cgi-bin/rm.py";
    var r = await http.get(url);
    setState(() {
      data = r.body;
    });
    print(data);
  }

  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    var con_name;
    return Scaffold(
      appBar: AppBar(
        title: Text("Remove Container"),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Text("Remove A single container"),
            TextField(
              onChanged: (name) => con_name = name,
              decoration: InputDecoration(hintText: "Enter Container name"),
            ),
            RaisedButton(
              onPressed: () {
                remove_one(con_name);
              }, // connect to the vm here
              child: Text("Submit"),
            ),
            const SizedBox(
              height: 40,
            ),
            Text("If you want to remove all containers"),
            RaisedButton(
              onPressed: () {
                remove_all();
              }, // connect to the vm here
              child: Text("Submit"),
            ),
            Text(data ?? "Output"),
          ],
        ),
      ),
    );
  }
}
