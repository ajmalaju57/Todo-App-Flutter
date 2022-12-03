// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:todoapp_firebase/Controller/colors.dart';
// import '../Controller/listfile.dart';
// import '../View/newnote.dart';
// import 'homeview.dart';
//
// class Home extends StatefulWidget {
//   final Title;
//   final SubTitle;
//   Home({Key? key, this.Title, this.SubTitle}) : super(key: key);
//
//   @override
//   State<Home> createState() => _HomeState();
// }
//
// class _HomeState extends State<Home> {
//
//
//
//   // static int currentTab = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: PageStorage(
//         child: ListFile.currentScreen,
//         bucket: ListFile.bucket,
//       ),
//       floatingActionButton: FloatingActionButton.extended(
//         label: ListFile.currentTab == 0
//             ? Text(
//                 "New Note",
//                 style: TextStyle(color: Colors.black),
//               )
//             : Text(
//                 "Add Note",
//                 style: TextStyle(color: Colors.black),
//               ),
//         backgroundColor: Colors.white,
//         icon: Icon(
//           ListFile.currentTab == 0 ? Icons.add : Icons.task_alt,
//           color: Color(0xFF000633),
//         ),
//         onPressed: () {
//           setState(() {
//             if (ListFile.currentTab == 0) {
//               ListFile.currentScreen = NewNote();
//               ListFile.currentTab = 1;
//               print("1${ListFile.currentScreen}");
//             } else if (ListFile.currentTab == 1) {
//               if (ListFile.Title.text.isNotEmpty) {
//                 // Postdata();
//               } else {
//                 final snackBar = SnackBar(
//                     backgroundColor: Colors.red,
//                     content: Text("notes No add"),
//                     duration: Duration(seconds: 1));
//                 ScaffoldMessenger.of(context).showSnackBar(snackBar);
//               }
//               ListFile.currentScreen = HomeView();
//               ListFile.currentTab = 0;
//               ListFile.Title.text = "";
//               ListFile.SubTitle.text = "";
//             }
//           });
//         },
//       ),
//       // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       // backgroundColor: Color(0xFF000633),
//       // // extendBodyBehindAppBar: true,
//       // bottomNavigationBar: BottomAppBar(
//       //     shape: AutomaticNotchedShape(
//       //       RoundedRectangleBorder(
//       //         borderRadius: BorderRadius.vertical(),
//       //       ),
//       //       RoundedRectangleBorder(
//       //         borderRadius: BorderRadius.all(Radius.circular(6)),
//       //       ),
//       //     ),
//       //     notchMargin: 3,
//       //     elevation: 0,
//       //     child: Container(
//       //       height: 60,
//       //       child: Row(
//       //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       //         children: <Widget>[
//       //           Row(
//       //             crossAxisAlignment: CrossAxisAlignment.start,
//       //             children: [
//       //               MaterialButton(
//       //                 minWidth: 40,
//       //                 onPressed: () {
//       //                   setState(() {
//       //                     if (ListFile.currentTab == 1) {
//       //                       ListFile.currentScreen = HomeView();
//       //                       ListFile.currentTab = 0;
//       //                     }
//       //                   });
//       //                 },
//       //                 child: Column(
//       //                   mainAxisAlignment: MainAxisAlignment.center,
//       //                   children: [
//       //                     Icon(ListFile.currentTab == 0
//       //                         ? Icons.menu
//       //                         : Icons.home),
//       //                     // Text("Menu")
//       //                   ],
//       //                 ),
//       //               )
//       //             ],
//       //           ),
//       //           // Right Tab Bar
//       //           Row(
//       //             crossAxisAlignment: CrossAxisAlignment.start,
//       //             children: [
//       //               Column(
//       //                 mainAxisAlignment: MainAxisAlignment.center,
//       //                 children: [
//       //                   Padding(
//       //                     padding: EdgeInsets.only(bottom: 5, right: 13),
//       //                     child: Row(
//       //                       children: [
//       //                         Icon(ListFile.currentTab == 0
//       //                             ? Icons.search
//       //                             : null),
//       //                         ListFile.currentTab == 1
//       //                             ? InkWell(
//       //                                 onTap: () {
//       //                                   setState(() {
//       //                                     ListFile.color = 0;
//       //                                   });
//       //                                 },
//       //                                 child: ColorsPanel(
//       //                                   coloritem: Colors.blue,
//       //                                 ))
//       //                             : Container(),
//       //                         SizedBox(
//       //                           width: 10,
//       //                         ),
//       //                         ListFile.currentTab == 1
//       //                             ? InkWell(
//       //                                 onTap: () {
//       //                                   setState(() {
//       //                                     ListFile.color = 1;
//       //                                   });
//       //                                 },
//       //                                 child:
//       //                                     ColorsPanel(coloritem: Colors.yellow))
//       //                             : Container(),
//       //                         SizedBox(
//       //                           width: 10,
//       //                         ),
//       //                         ListFile.currentTab == 1
//       //                             ? InkWell(
//       //                                 onTap: () {
//       //                                   setState(() {
//       //                                     ListFile.color = 2;
//       //                                   });
//       //                                 },
//       //                                 child: ColorsPanel(
//       //                                     coloritem: Colors.pinkAccent))
//       //                             : Container(),
//       //                       ],
//       //                     ),
//       //                   ),
//       //                   // Text("Menu")
//       //                 ],
//       //               )
//       //             ],
//       //           ),
//       //         ],
//       //       ),
//       //     )),
//     );
//   }
// }
