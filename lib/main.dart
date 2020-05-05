import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterapp/AuthServices.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  AuthService authService = AuthService();
  final formalkey = GlobalKey<FormState>();
  String error = '';
  String email = '';
  String pass = '';
  TextEditingController myContro = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Form(
          key: formalkey,
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(icon: Icon(Icons.email)),
                onChanged: (val) {
                  setState(() {
                    email = val;
                  });
                },
              ),
              SizedBox(
                height: 5,
              ),
              TextField(
                decoration: InputDecoration(icon: Icon(Icons.remove_red_eye)),
                onChanged: (val) {
                  setState(() {
                    pass = val;
                  });
                },
              ),
              ActionChip(
                  label: Text("Sing In"),
                  backgroundColor: Colors.blue,
                  onPressed: () async {
                    AuthService my = AuthService(name: email, pass: pass);
                    error = await my.signIn();
                    ShowTost(error);
                  })
            ],
          ),
        ),
      ),
    );
  }
}

ShowTost(String error) {}
