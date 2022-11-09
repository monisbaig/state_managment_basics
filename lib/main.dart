import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:state_managment_basics/models/state.dart';
import 'package:state_managment_basics/models/user.dart';
import 'package:state_managment_basics/profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AppStateWidget(
      child: MaterialApp(
        home: Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  TextEditingController userCtrl = TextEditingController();

  pickImage(BuildContext context) async {
    final ImagePicker _picker = ImagePicker();
    XFile? pickedImage = await _picker.pickImage(source: ImageSource.gallery);
    var myAppState = MyInheritedWidget.of(context);
    myAppState?.updateUsername(
      User(
        name: userCtrl.text,
        image: File(pickedImage?.path ?? ''),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var myAppState = MyInheritedWidget.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page ${myAppState?.user?.name}'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: userCtrl,
              decoration: const InputDecoration(
                hintText: 'Enter your username',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ProfileScreen(),
                  ),
                );
              },
              child: const Text('Go to Profile Page'),
            ),
            ElevatedButton(
              onPressed: () {
                pickImage(context);
              },
              child: const Text('Update Username'),
            ),
            if (myAppState?.user != null)
              Image.file(
                myAppState!.user!.image,
                height: 200,
              ),
          ],
        ),
      ),
    );
  }
}
