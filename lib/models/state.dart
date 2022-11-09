import 'package:flutter/material.dart';
import 'package:state_managment_basics/models/user.dart';

class AppStateWidget extends StatefulWidget {
  final Widget child;

  const AppStateWidget({super.key, required this.child});

  @override
  State<AppStateWidget> createState() => AppStateWidgetState();
}

class AppStateWidgetState extends State<AppStateWidget> {
  User? user;

  updateUsername(User newUser) => setState(() {
        user = newUser;
      });

  @override
  Widget build(BuildContext context) {
    return MyInheritedWidget(
      state: this,
      child: widget.child,
    );
  }
}

class MyInheritedWidget extends InheritedWidget {
  final AppStateWidgetState state;

  MyInheritedWidget({required super.child, required this.state});

  static AppStateWidgetState? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>()?.state;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}
