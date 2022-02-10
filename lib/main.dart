import 'package:flutter/material.dart';

void main() {
  runApp(const MTDApp());
}

class MTDApp extends StatelessWidget {
  const MTDApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'routes',
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        //'/schedule': (context) => const ScheduleScreen(),
        //'/companies': (context) => const CompaniesScreen(),
        //'/about': (context) => const AboutScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: const NavBar():
    );
  }
}

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
      selectedItemColor: const Color(0xFF000000),
      backgroundColor: const Color(0xFF000000),
      unselectedItemColor: const Color(0xFFFFFFFF),
    );
  }
}
