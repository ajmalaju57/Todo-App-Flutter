import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:todoapp_firebase/listfile.dart';
import 'package:todoapp_firebase/View/newnote.dart';
import 'login.dart';
import 'noteview.dart';
class HomeView extends StatefulWidget {
  final dynamic title;
  final dynamic subtitle;
  HomeView({this.title, this.subtitle});
  @override
  State<HomeView> createState() => _HomeViewState();
}
class _HomeViewState extends State<HomeView> {
  Future? deleteData(String id) {
    FirebaseFirestore.instance.collection("noteapp").doc('${ListFile.email}').collection("notes").doc(id).delete();
  }
  dynamic formattedDate(timeStamp) {
    var dateFromTimeStamp =
        DateTime.fromMillisecondsSinceEpoch(timeStamp.seconds * 1000);
    return DateFormat('dd-MM-yyyy hh:mm a').format(dateFromTimeStamp);
  }
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    final auth = FirebaseAuth.instance;
    return Scaffold(
      backgroundColor: Color(0xFF000633),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFF000633),
        elevation: 0,
        title: Text(
          "Notes",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 35, color: Colors.white),
        ),
        actions: [
          ElevatedButton(
              onPressed: () async {
                ListFile.email='';
                await auth.signOut().then((value) => Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => Login())));
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF000633), // background
              ),
              child: Text("Logout")),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                setState(() {});
              },
              child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance.collection("noteapp").doc('${ListFile.email}').collection("notes").orderBy("date", descending: true).snapshots(),
                  builder: (context, AsyncSnapshot snapshop) {
                    if (snapshop.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return ListView.builder(
                          itemCount: snapshop.data.docs.length,
                          itemBuilder: (context, index) {
                            QueryDocumentSnapshot data =
                                snapshop.data.docs[index];
                            return Dismissible(
                                key: Key(data.id),
                                background: Container(
                                    child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    )
                                  ],
                                )),
                                onDismissed: (dirction) async {
                                  await deleteData(
                                      snapshop.data.docs[index].id);
                                  final snackBar = SnackBar(
                                      backgroundColor: Colors.red,
                                      content: Text("note Delete"),
                                      duration: Duration(seconds: 1));
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                },
                                child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => NoteView(
                                                    text2: data["title"].toString(), description2: data["subTitle"].toString(), id: snapshop.data.docs[index].id, doc: data, color: data['color'],)));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        width: double.infinity,
                                        height: size.height*.154,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Text(formattedDate(
                                                      data['date'])),
                                                ],
                                              ),
                                              Text(
                                                data["title"].toString(),
                                                style: TextStyle(
                                                    fontSize: 24,
                                                    fontWeight: FontWeight.bold,
                                                    overflow:
                                                        TextOverflow.ellipsis),
                                              ),
                                              Text(
                                                data["subTitle"].toString(),
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    overflow:
                                                        TextOverflow.ellipsis),
                                              ),
                                            ],
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                            color: ListFile
                                                .cardColor[data['color']],
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                    )));
                          });
                    }
                  }),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text(
          "New Note",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        icon: Icon(
          Icons.add_circle,
          color: Color(0xFF000633),
        ),
        onPressed: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => NewNote()));
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
            height: 50,
          )),
    );
  }
}
