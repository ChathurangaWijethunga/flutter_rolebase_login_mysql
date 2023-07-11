import 'package:flutter/material.dart';
import 'package:role_base/drawer.dart';
import 'package:role_base/main.dart';

class User extends StatefulWidget {
  final String username;

  const User({Key? key, required this.username}) : super(key: key);

  @override
  _UserState createState() => _UserState();
}

class _UserState extends State<User> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Profile"),
        
      ),
      drawer: AppDrawer(username: widget.username), // Added line
      body: const Center(
        
      ),
    );
  }
}
