import 'package:flutter/material.dart';
import 'screens/companies_screen.dart';
import 'screens/about_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MTDApp());
}

class MTDApp extends StatelessWidget {
  const MTDApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const MyContent(),
        theme: ThemeData(primaryColor: Colors.white, fontFamily: 'Barlow'),
      );
    });
  }
}

class MyContent extends StatefulWidget {
  const MyContent({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return PageView(
      controller: controller,
    );
  }

  @override
  State<StatefulWidget> createState() => _MyContentState();
}

class _MyContentState extends State<MyContent> {
  int currentIndex = 0;
  final PageController _pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  void changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) => (changePage(index)),
          children: <Widget>[
            const AboutScreen(),
            CompaniesScreen(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFFC97A26),
        backgroundColor: const Color(0xFF000000),
        unselectedItemColor: const Color(0xFFFFFFFF),
        currentIndex: currentIndex,
        onTap: (index) => (_pageController.jumpToPage(index)),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: 'Om MTD',
            icon: Icon(Icons.info),
          ),
          BottomNavigationBarItem(
            label: 'F??retag',
            icon: Icon(Icons.business),
          ),
        ],
      ),
    );
  }
}
