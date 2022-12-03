import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp_firebase/View/newnote.dart';
import 'package:todoapp_firebase/View/noteview.dart';
import 'View/homeview.dart';

class ListFile{
  static TextEditingController  Title = TextEditingController();
  static TextEditingController SubTitle = TextEditingController();
  static  dynamic color=3;
  static List<Color> cardColor = [
    Colors.blue,
    Colors.green.shade200,
    Colors.pinkAccent,
    Colors.blueGrey
  ];
  final List<Widget>screens = [
    HomeView(),
    NewNote(),
    NoteView(),
  ];

  static dynamic email;
  static  QueryDocumentSnapshot? bg;
}
