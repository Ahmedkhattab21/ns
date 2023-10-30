import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const platform = MethodChannel('com.example.myapp/user_activity');

  @override
  void initState() {
    super.initState();
  }


  Future<void> setupUserActivity() async {
    try {
      platform.setMethodCallHandler((call)async {
        if (call.method == 'handleActivity') {
          print(call.arguments);
        }
      });
    } on PlatformException catch (e) {
      print(e);
    }
  }
  
  String activityText = "No activity data";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("title"),
      ),
      body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
              onPressed: setupUserActivity ,
              child: const Text('Get activity '),
          ),
          Text(activityText),
        ],
      ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
