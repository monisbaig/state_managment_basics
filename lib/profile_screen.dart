import 'package:flutter/material.dart';
import 'package:state_managment_basics/models/state.dart';
import 'package:state_managment_basics/models/user.dart';

class ProfileScreen extends StatelessWidget {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    controller.text = MyInheritedWidget.of(context)!.user!.name;

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Screen'),
      ),
      body: Card(
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.file(
                    MyInheritedWidget.of(context)!.user!.image,
                    width: 100,
                    height: 100,
                  ),
                ),
                Expanded(
                  child: TextField(
                    controller: controller,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                User newUser = User(
                    name: controller.text,
                    image: MyInheritedWidget.of(context)!.user!.image);
                MyInheritedWidget.of(context)?.updateUsername(newUser);
              },
              child: const Text('Update Text'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Back Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
