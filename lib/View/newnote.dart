import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp_firebase/View/homeview.dart';
import '../Widget/colors.dart';
import '../listfile.dart';

class NewNote extends StatefulWidget {
  QueryDocumentSnapshot? docNew;
  NewNote({
    Key? key,
    this.docNew,
  }) : super(key: key);

  @override
  State<NewNote> createState() => _NewNoteState();
}

class _NewNoteState extends State<NewNote> {
  Postdata() async {
    FirebaseFirestore.instance
        .collection('noteapp')
        .doc('${ListFile.email}')
        .collection('notes')
        .add({
      'title': ListFile.Title.text,
      'subTitle': ListFile.SubTitle.text,
      'color': ListFile.color,
      'date': DateTime.now()
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print(size.width);
    print(size.height);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ListFile.cardColor[ListFile.color],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ListFile.cardColor[ListFile.color],
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: Text(
          "New Note",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: ListFile.Title,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 29),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Title",
                    hintStyle: TextStyle(color: Colors.white24, fontSize: 20)),
                maxLines: null,
                textCapitalization: TextCapitalization.sentences,
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: ListFile.SubTitle,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
                decoration: InputDecoration.collapsed(
                    hintText: 'Note',
                    hintStyle: TextStyle(color: Colors.white24, fontSize: 20)),
                maxLines: null,
                textCapitalization: TextCapitalization.sentences,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text(
          "New Note",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        icon: Icon(
          Icons.task_alt,
          color: Color(0xFF000633),
        ),
        onPressed: () {
          if (ListFile.Title.text.isNotEmpty) {
            Postdata();
            setState((){
              ListFile.Title.text="";
              ListFile.SubTitle.text="";
            });
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomeView()));
          } else {
            final snackBar = SnackBar(
                backgroundColor: Colors.red,
                content: Text("notes No add"),
                duration: Duration(seconds: 1));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
          shape: AutomaticNotchedShape(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(),
            ),
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(6)),
            ),
          ),
          notchMargin: 3,
          elevation: 0,
          child: Container(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeView()));
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.home),
                          // Text("Menu")
                        ],
                      ),
                    )
                  ],
                ),
                // Right Tab Bar
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 5, right: size.width*.016),
                          child: Row(
                            children: [
                              InkWell(
                                  onTap: () {
                                    setState(() {
                                      ListFile.color = 0;
                                    });
                                  },
                                  child: ColorsPanel(
                                    coloritem: Colors.blue,
                                  )),
                              SizedBox(
                                width: size.width*.013,
                              ),
                              InkWell(
                                  onTap: () {
                                    setState(() {
                                      ListFile.color = 1;
                                    });
                                  },
                                  child: ColorsPanel(coloritem: Colors.green.shade200)),
                              SizedBox(
                                width: size.width*.013,
                              ),
                              InkWell(
                                  onTap: () {
                                    setState(() {
                                      ListFile.color = 2;
                                    });
                                  },
                                  child: ColorsPanel(
                                      coloritem: Colors.pinkAccent)),
                            ],
                          ),
                        ),
                        // Text("Menu")
                      ],
                    )
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
