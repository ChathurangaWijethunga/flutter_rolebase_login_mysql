import 'package:flutter/material.dart';
import 'package:role_base/admin.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  CustomBottomNavigationBar({
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  _CustomBottomNavigationBarState createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.selectedIndex,
      onTap: (index) {
        widget.onItemTapped(index);
        if (index == 0) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Admin(username: "your_username")),
          );
        }
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.dashboard,
            color: widget.selectedIndex == 0 ? Color.fromARGB(255, 22, 64, 234) : Colors.grey,
          ),
          label: 'Dashboard',
        ),
      ],
    );
  }
}
