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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
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
  AuthService authService= AuthService();
  final formalkey =  GlobalKey<FormState>();
  String error = '';
  String email = '';
  String pass = '';
TextEditingController myContro = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Form(
          key : formalkey,
          child: Column(
            children: <Widget>[
            TextField(
              decoration: InputDecoration(icon: Icon(Icons.email)),
              onChanged:(val) {
                setState(() {
                email = val;
                });
                },
            ),
            SizedBox(height: 5,),
              TextField(
                decoration: InputDecoration(icon: Icon(Icons.remove_red_eye)),
                onChanged:(val) {
                  setState(() {
                    pass = val;
                  });
                },
              ),
              ActionChip(label: Text("Sing In"),backgroundColor: Colors.blue, onPressed: () {
                  AuthService my  = AuthService(name: email,pass:pass ) ;
                error = my.signIn();
                ShowTost(error);
              })
        ],
        ),

        ),
      ),
    );
  }
}

 ShowTost(String error) {

}
