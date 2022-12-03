import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final auth = FirebaseAuth.instance;

  var name = TextEditingController();
  var age = TextEditingController();
  var phonenumber = TextEditingController();
  var username = TextEditingController();
  var pass = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF000633),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter Name";
                      }
                      return null;

                    },
                    controller: name,
                    decoration: InputDecoration(
                        hintText: "Name",
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
                    height: 10,
                  ),
                  TextFormField(
                    controller: age,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter Age";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: "age",
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
                    height: 10,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: phonenumber,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter PhoneNumner";
                      }
                      if (value.length < 10) {
                        return "Enter 10 Number";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: "Phone Number",
                      hintStyle: TextStyle(color: Colors.white),
                      enabledBorder:OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      focusedBorder:OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.circular(25.0),
                      ),),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: username,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter Username";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: "UserName",
                      hintStyle: TextStyle(color: Colors.white),
                      enabledBorder:OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      focusedBorder:OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.circular(25.0),
                      ),),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter Password";
                      }
                      return null;
                    },
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
                      ),),
                  ),
                  SizedBox(height: 30,),
                  ElevatedButton(
                      onPressed: () async {
                        final valid = _formKey.currentState!.validate();
                        if (valid == true) {
                          var userdata =
                              await auth.createUserWithEmailAndPassword(
                                  email: username.text, password: pass.text);
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Login()));
                        } else {
                          return;
                        }
                      },
                      child: Text("Sing Up"))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
