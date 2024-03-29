import 'package:flutter/material.dart';

import 'package:developer_options/developer_options.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'developer_options Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'developer_options example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isDeveloper = false;
  DeveloperOptions developerOptions = DeveloperOptions();
  String developerStatusText = "No";

  @override
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
        title: Text(widget.title!),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
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
        child: const Icon(Icons.hardware),
      ),
    );
  }
}
