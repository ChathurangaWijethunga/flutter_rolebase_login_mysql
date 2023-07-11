import 'package:flutter/material.dart';
import 'package:role_base/RequestManagement.dart';
import 'package:role_base/drawer.dart';

class Admin extends StatefulWidget {
  final String username;

  const Admin({Key? key, required this.username}) : super(key: key);

  @override
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    DashboardPage(),
    TicketPage(),
    BookingPage(),
  ];

  void _onPageSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin'),
        centerTitle: true,
      ),
      drawer: AppDrawer(username: widget.username),
      body: _pages[_selectedIndex],

    );
  }
}

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          RequestManagementCard(),
          PurchaseOrderCard(),
        ],
      ),
    );
  }
}

class RequestManagementCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.request_page),
        title: Text('Request Management'),
        subtitle: Text('Manage and track requests'),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BidManagementScreen()),
          );
        },
      ),
    );
  }
}

class PurchaseOrderCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.shopping_cart),
        title: Text('Purchase Order'),
        subtitle: Text('Manage purchase orders'),
        onTap: () {
          // TODO: Handle tap on Purchase Order card
        },
      ),
    );
  }
}

class TicketPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Ticket Page'),
    );
  }
}

class BookingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Booking Page'),
    );
  }
}

