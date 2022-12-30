import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Signup/components/signup_form.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late File imageFile;

  // final List<String> _listItem = [
  //   'assets/images/camera.jpg',
  //   'assets/images/upload.JPG'
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 248, 246, 246),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(186, 239, 192, 0.8),
        elevation: 0,
        leading: const Icon(
          Icons.menu,
          color: Colors.black,
        ),
        title: const Text(
          "Home",
          style: TextStyle(color: Colors.black),
        ),
        actions: const <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            // child: Container(
            //   width: 36,
            //   height: 30,
            //   decoration: BoxDecoration(
            //       color: Colors.grey[800],
            //       borderRadius: BorderRadius.circular(10)),
            //   child: Center(child: Text("0")),
            // ),
          )
        ],
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              // Container(
              //   width: double.infinity,
              //   height: 250,
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(20),
              //       image: DecorationImage(
              //           image: AssetImage('assets/images/one.jpg'),
              //           fit: BoxFit.cover)),
              //   child: Container(
              //     decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(20),
              //         gradient:
              //             LinearGradient(begin: Alignment.bottomRight, colors: [
              //           Colors.black.withOpacity(.4),
              //           Colors.black.withOpacity(.2),
              //         ])),
              //     child: Column(
              //       mainAxisAlignment: MainAxisAlignment.end,
              //       children: <Widget>[
              //         Text(
              //           "Lifestyle Sale",
              //           style: TextStyle(
              //               color: Colors.white,
              //               fontSize: 35,
              //               fontWeight: FontWeight.bold),
              //         ),
              //         SizedBox(
              //           height: 30,
              //         ),
              //         Container(
              //           height: 50,
              //           margin: EdgeInsets.symmetric(horizontal: 40),
              //           decoration: BoxDecoration(
              //               borderRadius: BorderRadius.circular(10),
              //               color: Colors.white),
              //           child: Center(
              //               child: Text(
              //             "Shop Now",
              //             style: TextStyle(
              //                 color: Colors.grey[900],
              //                 fontWeight: FontWeight.bold),
              //           )),
              //         ),
              //         SizedBox(
              //           height: 30,
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    children: [
                      GestureDetector(
                        onTap: () {
                          _getFromCamera();
                        },
                        child: Card(
                          color: Colors.transparent,
                          elevation: 0,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: const DecorationImage(
                                    image:
                                        AssetImage("assets/images/camera.jpg"),
                                    fit: BoxFit.cover)),
                            child: Transform.translate(
                              offset: Offset(50, -50),
                              // child: Container(
                              //   margin: EdgeInsets.symmetric(
                              //       horizontal: 65, vertical: 63),
                              //   decoration: BoxDecoration(
                              //       borderRadius: BorderRadius.circular(10),
                              //       color: Colors.black),
                              //   child: Icon(
                              //     Icons.bookmark_border,
                              //     size: 15,
                              //   ),
                            ), // ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          _getFromGallery();
                        },
                        child: Card(
                          color: Colors.transparent,
                          elevation: 0,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: const DecorationImage(
                                    image:
                                        AssetImage("assets/images/upload.jpg"),
                                    fit: BoxFit.cover)),
                            child: Transform.translate(
                              offset: Offset(50, -50),
                              // child: Container(
                              //   margin: EdgeInsets.symmetric(
                              //       horizontal: 65, vertical: 63),
                              //   decoration: BoxDecoration(
                              //       borderRadius: BorderRadius.circular(10),
                              //       color: Colors.black),
                              //   child: Icon(
                              //     Icons.bookmark_border,
                              //     size: 15,
                              //   ),
                              // ),
                            ),
                          ),
                        ),
                      ),
                    ]
                    // .map((item) => Card(
                    //       color: Colors.transparent,
                    //       elevation: 0,
                    //       child: Container(
                    //         decoration: BoxDecoration(
                    //             borderRadius: BorderRadius.circular(20),
                    //             image: DecorationImage(
                    //                 image: AssetImage(item),
                    //                 fit: BoxFit.cover)),
                    //         child: Transform.translate(
                    //           offset: Offset(50, -50),
                    // child: Container(
                    //   margin: EdgeInsets.symmetric(
                    //       horizontal: 65, vertical: 63),
                    //   decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(10),
                    //       color: Colors.black),
                    //   child: Icon(
                    //     Icons.bookmark_border,
                    //     size: 15,
                    //   ),
                    // ),
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  /// Get from Camera
  _getFromCamera() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }
}
