import 'package:flutter/material.dart';

class BidManagementScreen extends StatefulWidget {
  @override
  _BidManagementScreenState createState() => _BidManagementScreenState();
}

class _BidManagementScreenState extends State<BidManagementScreen> {
  @override
  void initState() {
    super.initState();
    // Implement initialization logic here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trade Mart | Bid management'),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Available items',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'You have X part requests',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 20.0),
            Expanded(
              child: ListView.builder(
                itemCount: 50, // Replace with the actual item count
                itemBuilder: (context, index) {
                  // Implement item rendering logic here
                  return ListTile(
                    title: Text('Item $index'),
                    subtitle: Text('Item description'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: BidManagementScreen(),
  ));
}
