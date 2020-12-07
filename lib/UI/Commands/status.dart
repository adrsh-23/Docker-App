import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Status extends StatefulWidget {
  @override
  _Status createState() => _Status();
}

class _Status extends State<Status> {
  var data;
  check_on(name) async {
    var url = "http://192.168.1.103/cgi-bin/status.py";
    var r = await http.get(url);
    setState(() {
      data = r.body;
    });
    print(data);
  }

  check_off() async {
    var url = "http://192.168.1.103/cgi-bin/status_off.py";
    var r = await http.get(url);
    setState(() {
      data = r.body;
    });
    print(data);
  }

  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    var con_name;
    return Scaffold(
      appBar: AppBar(
        title: Text("Check Status of Containers"),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Text("To check which containers are running"),
            RaisedButton(
              onPressed: () {
                check_on(con_name);
              }, // connect to the vm here
              child: Text("Check"),
            ),
            const SizedBox(
              height: 40,
            ),
            Text("To check all the containers"),
            RaisedButton(
              onPressed: () {
                check_off();
              }, // connect to the vm here
              child: Text("Check"),
            ),
            Text(data ?? "Output"),
          ],
        ),
      ),
    );
  }
}
