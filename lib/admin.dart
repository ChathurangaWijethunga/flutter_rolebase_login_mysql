import 'package:flutter/material.dart';

class Admin extends StatelessWidget {
  final String username;

  const Admin({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Replace this with your logic to fetch the account balance for the admin user
    double accountBalance = 1500.0;

    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Dashboard'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome, $username!',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Text(
              'Account Balance: \$${accountBalance.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
