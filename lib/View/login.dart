import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:todoapp_firebase/View/homeview.dart';
import 'package:todoapp_firebase/View/sign_up.dart';

import '../listfile.dart';
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var username = TextEditingController();
  var pass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF000633),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: 200,
                    height: 200,
                    child:
                        Lottie.asset('assets/106680-login-and-sign-up.json')),
                TextField(
                  style:TextStyle(color: Colors.white),
                  controller: username,
                  decoration: InputDecoration(
                      hintText: "Username",
                      hintStyle: TextStyle(color: Colors.white),
                    enabledBorder:OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    focusedBorder:OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                     ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  style:TextStyle(color: Colors.white),
                  controller: pass,
                  decoration: InputDecoration(
                      hintText: "Password",
                      hintStyle: TextStyle(color: Colors.white),
                    enabledBorder:OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    focusedBorder:OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                ),
                SizedBox(height: 40,),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      maxRadius: 20,
                        backgroundColor: Color(0xFF000633),
                      child: Image.asset("assets/images/download.png",fit: BoxFit.fill,)
                    ),
                    SizedBox(width: 30,),
                    CircleAvatar(
                        maxRadius: 20,
                        backgroundColor: Color(0xFF000633),
                        child: Image.asset("assets/images/facebook.png",fit: BoxFit.fill,)
                    ),
                  ],
                ),
                SizedBox(height: 40,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUp()));
                        },
                        child: Text("Sing Up")),
                    SizedBox(
                      width: 25,
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          try {
                            await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                    email: username.text, password: pass.text)
                                .then((value) {
                              ListFile.email=username.text;
                              final snackBar = SnackBar(
                                  backgroundColor: Colors.green,
                                  content: Text("Login Scccus"),
                                  duration: Duration(seconds: 1));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeView()));
                            });
                          } on Exception catch (e) {
                            print(
                                "..................dgfdhsgjgsfsk............................${e}");
                            String error = e.toString();
                            final a = error.contains("user-not-found");
                            final b = error.contains("wrong-password");
                            final c = error.contains("unknown");
                            final d = error.contains("invalid-email");
                            if (a == true) {
                              final snackBar = SnackBar(
                                  backgroundColor: Colors.red,
                                  content: Text("User Not Found"),
                                  duration: Duration(seconds: 1));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                            if (b == true) {
                              final snackBar = SnackBar(
                                  backgroundColor: Colors.red,
                                  content:
                                      Text("Email / password does not match"),
                                  duration: Duration(seconds: 1));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                            if (c == true) {
                              final snackBar = SnackBar(
                                  backgroundColor: Colors.red,
                                  content:
                                      Text("Please Enter email and password"),
                                  duration: Duration(seconds: 1));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                            if (d == true) {
                              final snackBar = SnackBar(
                                  backgroundColor: Colors.red,
                                  content: Text("Enter a valid email address"),
                                  duration: Duration(seconds: 1));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                          }
                        },
                        child: Text("Login")),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
