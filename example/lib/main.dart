import 'package:flutter/material.dart';

import 'package:developer_options/developer_options.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'developer_options Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'developer_options example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isDeveloper = false;
  DeveloperOptions developerOptions = new DeveloperOptions();
  String developerStatusText = "No";

  void initState() async {
    await developerOptions.init();
    isDeveloper = developerOptions.getDeveloperStatus();
    developerStatusText = isDeveloper ? "Yes" : "No";
    super.initState();
  }

  void _setDeveloper() async {
    await developerOptions.setDeveloperStatus(true);
    setState(() {
      isDeveloper = true;
      developerStatusText = isDeveloper ? "Yes" : "No";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Are you a developer?',
            ),
            Text(
              developerStatusText,
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _setDeveloper,
        tooltip: 'Be a developer',
        child: Icon(Icons.hardware),
      ),
    );
  }
}
