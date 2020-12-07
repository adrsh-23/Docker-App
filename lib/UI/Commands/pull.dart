import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// ignore: non_constant_identifier_names

class Pull extends StatefulWidget {
  @override
  _Pullstate createState() => _Pullstate();
}

class _Pullstate extends State<Pull> {
  var image;
  var data;
  // ignore: non_constant_identifier_names
  pull_img(image) async {
    var url = "http://192.168.1.103/cgi-bin/image-pull.py?img=$image";
    var r = await http.get(url);
    setState(() {
      data = r.body;
    });
    print(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pull a image from Docker Hub"),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            TextField(
              textAlign: TextAlign.center,
              onChanged: (img) => {image = img},
              autocorrect: false,
              decoration: InputDecoration(hintText: "Enter image name"),
            ),
            RaisedButton(
              onPressed: () {
                pull_img(image);
              },
              child: Text("Submit"),
            ),
            Text(data ?? "Output will be here"),
          ],
        ),
      ),
    );
  }
}
