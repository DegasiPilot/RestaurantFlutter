import 'dart:ffi';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/database/storage/image.dart';
import 'package:flutter_application_1/database/users_collection.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  dynamic userDoc;
  final String userId = FirebaseAuth.instance.currentUser!.uid;
  File? _selectedFile;
  XFile? _fileName; 
  ImageStorage imageStorage = ImageStorage();
  UsersCollection users = UsersCollection();

  TextEditingController nameController = TextEditingController();

  GetUserById() async {
    DocumentSnapshot documentSnapshot =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();
    setState(() {
      userDoc = documentSnapshot;
    });
  }

  SelectImageGallery() async {
    final returnedimage = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _fileName = returnedimage;
      _selectedFile = File(returnedimage!.path);
    });
  }

  UpdateInfo() async {
    if(_fileName != null || nameController.text != ""){
      String userName = nameController.text != "" ? nameController.text : userDoc['name'];
      String imagePath = imageStorage.urlImage != null ? imageStorage.urlImage : userDoc['image'];
      users.editUserCollection(userName, imagePath);
      setState(() {
        userDoc = GetUserById();
        nameController.clear();
      });
    }
  }

  @override
  void initState() {
    GetUserById();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 0.4,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: userDoc['image'] == ""
                    ? IconButton(
                        onPressed: () async {
                          SelectImageGallery();
                          await imageStorage.pushImage(_fileName!);
                          showDialog(
                            context: context,
                            builder: (context) => const Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                          Future.delayed(const Duration(seconds: 4));

                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      )
                    : Image.network(
                        userDoc['image'],
                      ),
              ),
            ),
              Text("Никнейм ${userDoc['name']}", style: const TextStyle(color: Colors.white), ),
              Text("Email ${userDoc['email']}", style: const TextStyle(color: Colors.white),),
              TextField(              
                controller: nameController,  
                decoration: const InputDecoration(
                  labelText: 'Новый никнейм',
                  hintText: 'никнейм',
                  hintStyle:TextStyle(
                    color: Colors.white54,
                  ),
                ),
              ),
              OutlinedButton(onPressed: UpdateInfo, child: const Text("Изменить"))
            ],
        ),
      ),
    );
  }
}