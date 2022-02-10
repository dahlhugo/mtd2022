import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(

      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          label: 'Hem',
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
            label: 'Schema',
            icon: Icon(Icons.calendar_month)
        ),
        BottomNavigationBarItem(
            label: 'Företag',
            icon: Icon(Icons.business)
        ),
        BottomNavigationBarItem(
            label: 'Om MTD',
            icon: Icon(Icons.info)
        ),
      ],
      type: BottomNavigationBarType.fixed,
      selectedItemColor: const Color(0xFFC97A26),
      backgroundColor: const Color(0xFF000000),
      unselectedItemColor: const Color(0xFFFFFFFF),
    );
  }
}