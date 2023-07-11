import 'package:flutter/material.dart';
import 'package:role_base/main.dart';

class AppDrawer extends StatelessWidget {
  final String username;

  const AppDrawer({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 40,
                    child: Icon(Icons.person),
                    backgroundColor: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Hello $username',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: Text('Profile'),
            leading: Icon(Icons.person_sharp),
            onTap: () {
              // Handle "Profile" option tap
            },
          ),
          ListTile(
            title: Text('Settings'),
            leading: Icon(Icons.settings),
            onTap: () {
              // Handle "Settings" option tap
            },
          ),
          ListTile(
            title: Text('About'),
            leading: Icon(Icons.height_sharp),
            onTap: () {
              // Handle "About" option tap
            },
          ),
          ListTile(
            title: Text('Logout'),
            leading: Icon(Icons.logout),
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const Login()),
              );
            },
          ),
        ],
      ),
    );
  }
}
