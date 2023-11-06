import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:movie_site/Watchlist.dart';
import 'Menu.dart';
import 'search.dart';
import 'profile.dart';
import 'signin.dart';

class Cineflex extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser;
  Cineflex();
  Cineflex.login(this.is_logged_in);
  bool is_logged_in = !(FirebaseAuth.instance.currentUser==null);

  String moviename = "Name of the movie";

  void openMenu(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: ((context) => Menu())));
  }
  void search(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: ((context) => Search())));
  }
  void profile(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: ((context) => Profile())));
  }
  void signin(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: ((context) => StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        return Cineflex();
      }
    ))));
  }
  void watchlist(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: ((context) => Watchlist())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Cineflex")),),
      body: 
      Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(onPressed: (){
                  openMenu(context);
                }, child: Text("Menu")),
              ),
              
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(onPressed: (){
                  search(context);
                }, child: Text("Search")),
              ),
              
              is_logged_in?Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(onPressed: (){
                  profile(context);
                }, child: Text("Profile")),
              ):
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(onPressed: (){
                  signin(context);
                }, child: Text("Sign in")),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(onPressed: (){
                  watchlist(context);
                }, child: Text("Watch\n  List")),
              ),
            ],
          ),
          Container(
            height: 300,
            width: 300,
            color: Colors.grey,
            child: Icon(
              Icons.videocam_sharp,
              size: 80,
              color: Colors.red,
            ),
          ),
          Text(moviename),
          Row(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50, 30, 50, 100),
                    child: Text("Reviews & Ratings"),
                  ),
                  SizedBox(height: 5,width: 5,
                  //user reviews
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20,30,0,100),
                    child: Text("Suggestion"),
                  ),
                  SizedBox(
                    height: 5,
                    width: 5,
                    //more suggested videos
                  )
                ],
              )
            ],
            ),
            
            Row(
              children: [
                Text("    "),
                Text(
                  is_logged_in?user!.email!:"Visitor"
                  ,
                  style: TextStyle(color: Colors.yellow,backgroundColor: Colors.grey),
                  ),
                  SizedBox(width: 10,),
                  if(is_logged_in)
                  ElevatedButton(onPressed: (){
                    FirebaseAuth.instance.signOut();
                  }, child: Text("Sign out")),
              ],
            ),
            ],
      ),
    );
  }
}