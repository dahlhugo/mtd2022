import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  final void Function(int) onTapped;

  const NavBar({
    Key? key,
    required this.onTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: const Color(0xFFC97A26),
      backgroundColor: const Color(0xFF000000),
      unselectedItemColor: const Color(0xFFFFFFFF),
      onTap: onTapped,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          label: 'Hem',
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          label: 'Schema',
          icon: Icon(Icons.calendar_month),
        ),
        BottomNavigationBarItem(
          label: 'Företag',
          icon: Icon(Icons.business),
        ),
        BottomNavigationBarItem(
          label: 'Om MTD',
          icon: Icon(Icons.info),
        ),
      ],
    );
  }
}
