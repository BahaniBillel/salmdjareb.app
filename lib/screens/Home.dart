import 'dart:io';
import 'package:path/path.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:salmdjareb/screens/SignIn.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<ScaffoldState> leftDrawerKey = GlobalKey();

  GlobalKey<ScaffoldState> endDrawerkey = GlobalKey();

  getUser() {
    var user = FirebaseAuth.instance.currentUser;
    print(user?.email);
  }

  FinduserState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print("==================================");
        print('User is currently signed out!');
        print("==================================");
      } else {
        print("==================================");
        print('User is signed in!');
        print("==================================");
      }
    });
  }

  List<dynamic>? fireList = [];

  // getData() async {
  //   FirebaseFirestore.instance
  //       .collection("books")
  //       .doc("gBpowpD9KGiXkReuW00bV6")
  //       .update({
  //         "title": "here you go",
  //       })
  //       .then((value) => AwesomeDialog(
  //               title: "doc deleted",
  //               context: context,
  //               desc: "The document was deleted successfuly")
  //           .show())
  //       .catchError((e) {
  //         print(e);
  //         AwesomeDialog(
  //           title: "Error",
  //           context: context,
  //           desc: "$e",
  //           autoHide: Duration(seconds: 5),
  //         ).show();
  //       });
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUser();
    FinduserState();
    // getData();
    getImagesFromStorage();
  }

  late File file;
  var imagePicker = ImagePicker();

  FirebaseStorage ref = FirebaseStorage.instance;

  UploadImage() async {
    var imgpicked = await imagePicker.pickImage(source: ImageSource.camera);

    if (imgpicked != null) {
      file = File(imgpicked.path);
      var nameimage = basename(imgpicked.path);

      // uploading image
      var refStorage = FirebaseStorage.instance.ref("$nameimage");

      await refStorage.putFile(File(imgpicked.path));
      var url = refStorage.getDownloadURL();
      print("======================================");
      print("$url");
      print("======================================");
    } else {
      print("Please choose image");
    }
  }

  getImagesFromStorage() async {
    var ref = await FirebaseStorage.instance.ref().list();
    ref.items.forEach((element) {
      print("======================================");
      print(element.name);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: leftDrawerKey,
      appBar: AppBar(
        // backgroundColor: Color(0xff067034),
        actions: [
          IconButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => SignIn()));
              },
              icon: Icon(Icons.exit_to_app, color: Colors.white))
        ],
        leading: IconButton(
            onPressed: () {
              endDrawerkey.currentState?.openEndDrawer();
            },
            icon: Icon(Icons.menu, color: Colors.white)),
        title: Text("Home"),
        bottom: PreferredSize(
          preferredSize: Size(100.0, 70),
          child: Container(
            color: Colors.grey,
            height: 70,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "images/logoWhite.png",
                    width: 130,
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.search,
                            color: Colors.white,
                          )),
                      IconButton(
                          onPressed: () {
                            leftDrawerKey.currentState?.openDrawer();
                          },
                          icon: Icon(
                            Icons.menu,
                            color: Colors.white,
                          )),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      drawer: SafeArea(
        top: false,
        bottom: false,
        child: Drawer(
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  color: Colors.grey,
                  width: double.infinity,
                  child: Image.asset(
                    'images/logoWhite.png',
                    scale: 6,
                  ),
                ),
              ),
              Expanded(
                flex: 10,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Menu",
                          style: TextStyle(),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ElevatedButton.icon(
                              onPressed: null,
                              icon: Icon(Icons.home),
                              label: Text("Home"),
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.transparent)),
                            ),
                            ElevatedButton.icon(
                              onPressed: null,
                              icon: Icon(Icons.star),
                              label: Text("Catergories"),
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.transparent)),
                            ),
                            ElevatedButton.icon(
                              onPressed: null,
                              icon: Icon(Icons.article),
                              label: Text("Blog"),
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.transparent)),
                            ),
                            ElevatedButton.icon(
                              onPressed: null,
                              icon: Icon(Icons.person),
                              label: Text("Login"),
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.transparent)),
                            ),
                            ElevatedButton.icon(
                              onPressed: null,
                              icon: Icon(Icons.business),
                              label: Text("For Businesses"),
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.transparent)),
                            ),
                            ElevatedButton.icon(
                              onPressed: null,
                              icon: Icon(Icons.people),
                              label: Text("Catergories"),
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.transparent)),
                            ),
                            ElevatedButton.icon(
                              onPressed: null,
                              icon: Icon(Icons.headphones),
                              label: Text("Contact"),
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.transparent)),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      endDrawer: Container(
        key: endDrawerkey,
        color: Colors.blueGrey.shade900,
        height: 500,
        width: 200,
      ),
      body: Column(
        children: [
          Stack(
            children: [
              HomeImage(),
              HomeContent(),
              SearchBox(),
            ],
          ),
          Center(
              child: ElevatedButton(
            child: Text("camera"),
            onPressed: () async {
              await UploadImage();
            },
          )),

          // SizedBox(
          //   height: 400,
          //   child: ListView.builder(
          //       itemCount: fireList?.length,
          //       itemBuilder: (context, i) {
          //         return ListTile(
          //           title: Text("${fireList![i]['title']}"),
          //           subtitle: Text("${fireList![i]['writer']}"),
          //           trailing: Text("${fireList![i]['year']}"),
          //           onTap: () {
          //             AwesomeDialog(
          //                     dialogType: DialogType.info,
          //                     dialogBackgroundColor: Colors.amberAccent,
          //                     body: ListTile(
          //                       title: Text("${fireList![i]['title']}"),
          //                       subtitle: Text("${fireList![i]['writer']}"),
          //                       trailing: Text("${fireList![i]['year']}"),
          //                     ),
          //                     context: context)
          //                 .show();
          //             print(Text("${fireList![i]['title']}"));
          //           },
          //         );
          //       }),
          // )
        ],
      ),
    );
  }
}

//////////////////////////

class Book {
  String? title;
  int? year;
  String? writer;

  Book({this.title, this.year, this.writer});
}

class SearchBox extends StatelessWidget {
  const SearchBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      width: 330,
      top: 200,
      left: 20,
      child: TextField(
        cursorColor: Colors.grey,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),

          fillColor: Colors.white,
          suffixIcon: IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          // contentPadding: EdgeInsets.symmetric(horizontal: 20),
        ),
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 60.0,
        left: 15.0,
        child: Text(
          "Read reviews. write\n reviews.Find companies \n you can trust",
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.w800),
        ));
  }
}

class HomeImage extends StatelessWidget {
  const HomeImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        // height: 300.0,
        width: double.infinity,
        child: ColorFiltered(
          colorFilter: ColorFilter.mode(Colors.black26, BlendMode.colorBurn),
          child: Image.asset(
            "images/lamp03.jpg",
            width: double.infinity,
          ),
        ),
      ),
    );
  }
}
