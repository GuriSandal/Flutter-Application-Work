import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Hello World!"),
        ),
        body: TextInputWidget());
  }
}

class TextInputWidget extends StatefulWidget {
  @override
  _TextInputWidgetState createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  final controller = TextEditingController();
  String text = "";

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  void changeText(text) {
    if (text == "Hello World!") {
      controller.clear();
      text = "";
    }
    setState(() {
      this.text = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      TextField(
        controller: this.controller,
        decoration: InputDecoration(
            prefix: Icon(Icons.message), labelText: "Type a message"),
        onChanged: (text) => this.changeText(text),
      ),
      Text(this.text)
    ]);
  }
}