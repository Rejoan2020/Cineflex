import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:movie_site/Home.dart';

class Signin extends StatelessWidget {
  Signin();
  TextEditingController _tc = TextEditingController();
  TextEditingController _tcpass = TextEditingController();

  Future getloggedin(BuildContext context) async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _tc.text.trim(), password: _tcpass.text.trim(),
      );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(title: Text("Sign In")),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: _tc,
              decoration: InputDecoration(labelText: "  Email"),
            ),
            TextField(
              controller: _tcpass,
              decoration: InputDecoration(labelText: "  Pass"),
            ),
            ElevatedButton(onPressed: (){
              getloggedin(context);
            }, child: Text("Sign in"))
          ],
        ),
      )
    );
  }
}