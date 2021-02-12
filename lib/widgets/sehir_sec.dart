import 'package:flutter/material.dart';

class SehirSec extends StatefulWidget {
  @override
  _SehirSecState createState() => _SehirSecState();
}

class _SehirSecState extends State<SehirSec> {
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sehir Seç"),
      ),
      body: Form(
          child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _textController,
                decoration: InputDecoration(
                  labelText: 'Şehir',
                  hintText: 'Şehir Seçin',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                Navigator.pop(context, _textController.text);
              })
        ],
      )),
    );
  }
}
