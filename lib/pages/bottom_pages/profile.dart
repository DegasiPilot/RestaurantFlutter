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
    userDoc = documentSnapshot;
    return userDoc;
  }

  SelectImageGallery() async {
    final returnedimage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(returnedimage != null){
      _fileName = returnedimage;
      _selectedFile = File(returnedimage.path);
    }
  }

  UpdateInfo() async {
    if(_fileName != null || nameController.text != ""){
      String userName = nameController.text != "" ? nameController.text : userDoc['name'];
      String imagePath = userDoc['image'];
      users.editUserCollection(userName, imagePath);
      setState(() {
        userDoc = GetUserById();
        nameController.clear();
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: GetUserById(), builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot)
    {
    if(snapshot.hasData){
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 0.4,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: snapshot.requireData['image'] == ""
                    ? IconButton(
                        onPressed: () async {
                          showDialog(
                            context: context,
                            builder: (context) => const Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                          await SelectImageGallery();
                          await imageStorage.pushImage(_fileName!);
                          users.editUserCollection(userDoc['name'], imageStorage.urlImage!);
                          Navigator.pop(context);
                          setState(() {});
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
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextField(              
                  controller: nameController,  
                  decoration: const InputDecoration(
                    labelText: 'Новый никнейм',
                    hintText: 'никнейм',
                    hintStyle:TextStyle(
                      color: Colors.white54,
                    ),
                  ),
                ),
              ),
              OutlinedButton(onPressed: UpdateInfo, child: const Text("Изменить"))
            ],
        ),
      ),
    );
    }
    else{
      return const Scaffold(
        body: Center(child:
        Column(
          children: [
            Text("Получение даных пользователя..."),
            CircularProgressIndicator(),
          ],
        ),
         ),
      );
    }
    }
    );
  }
}