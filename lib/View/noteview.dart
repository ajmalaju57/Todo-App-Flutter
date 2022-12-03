import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp_firebase/View/homeview.dart';
import '../Widget/colors.dart';
import '../listfile.dart';
class NoteView extends StatefulWidget {
  final text2;
  final description2;
  dynamic id;
  final color;
  QueryDocumentSnapshot? doc;
   NoteView({Key? key, this.text2,this.description2,this.id,this.doc,this.color}) : super(key: key);
  @override
  State<NoteView> createState() => _NoteViewState();
}
class _NoteViewState extends State<NoteView> {
  var titile = TextEditingController();
  var subtitle = TextEditingController();
  addText(){
    setState((){
      titile.text=widget.text2.toString();
      subtitle.text=widget.description2.toString();
    });
  }
  @override
  initState(){
    super.initState();
    addText();
  }
  Future<dynamic>updateData(id)async{
    FirebaseFirestore.instance.collection("noteapp").doc('${ListFile.email}').collection("notes").doc(id).update({
      "title":titile.text,
      "subTitle":subtitle.text,
      "color":ListFile.color,
    });
  }
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ListFile.cardColor[widget.color],
      appBar:AppBar(
        backgroundColor: ListFile.cardColor[widget.color],
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
      ),
      body:
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: titile,
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.white),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Title",
                ),
                maxLines: null,
                maxLength: 1024,
                textCapitalization: TextCapitalization.sentences,
              ),
              TextField(
                controller: subtitle,
                style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
                decoration: const InputDecoration.collapsed(hintText: 'Note'),
                maxLines: null,
                textCapitalization: TextCapitalization.sentences,
              ),
            ],
    ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text("Add Note",style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
        icon: Icon(Icons.task_alt,
          color: Color(0xFF000633),),
        onPressed: (){
          updateData(widget.id);
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeView()));
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // extendBodyBehindAppBar: true,
      bottomNavigationBar: BottomAppBar(
          shape: AutomaticNotchedShape(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
              ),
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
              children:<Widget> [
                Row(
                  crossAxisAlignment:CrossAxisAlignment.start,
                  children: [
                    MaterialButton(
                      minWidth: 40,
                      onPressed:(){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeView()));
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
                  crossAxisAlignment:CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(bottom: 5, right: size.width*.016),
                          child: Row(
                            children: [
                            InkWell(
                                  onTap: (){
                                    setState(() {
                                      ListFile.color=0;
                                    });
                                  },
                                  child: ColorsPanel(coloritem: Colors.blue,)),
                              SizedBox(width: size.width*.013,),
                             InkWell(
                                  onTap: (){
                                    setState(() {
                                      ListFile.color=1;
                                    });
                                  },
                                  child: ColorsPanel(coloritem: Colors.yellow)),
                              SizedBox(width: size.width*.013,),
                            InkWell(
                                  onTap: (){
                                    setState(() {
                                      ListFile.color=2;
                                    });
                                  },
                                  child: ColorsPanel(coloritem: Colors.pinkAccent)),
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
          )
      ),
    );
  }
}
