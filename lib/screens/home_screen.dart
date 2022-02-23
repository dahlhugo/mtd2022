import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final database = FirebaseDatabase.instance.ref();

  String glBannerImage = "";

  @override
  void initState() {
    super.initState();
    singleBannerImage();
  }

  // void _activateListener() {
  //   //final _imagesRef = database.child("images/");
  // }

  //inefficient way of setting banner image. Whole homescreen will reload
  void singleBannerImage() {
    database.child("/images/0/imageUrl").get().then((snapshot) {
      setState(() {
        glBannerImage = snapshot.value.toString();
      });
    });
    return;
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.9,
      heightFactor: 1.0,
      child: Column(
        children: [
          // ignore: todo
          //TODO: fix glBannerImage is "" when initiliazed
          // const Text("MTD 2022"),
          // SizedBox(
          //   width: 100.0.w,
          //   height: 30.0.h,
          //   child: ClipRRect(
          //     borderRadius: BorderRadius.circular(12),
          //     child: Material(
          //       child: Ink.image(
          //         fit: BoxFit.fill,
          //         image: NetworkImage(glBannerImage),
          //         child: InkWell(
          //           onTap: () {
          //             _launchURL(context, "https://massa.medieteknikdagen.se");
          //           },
          //         ),
          //       ),
          //     ),
          //   ),
          // ),

          // Wrap(
          //   direction: Axis.vertical,
          //   spacing: 20,
          //   children: [
          //     const Spacer(),
          //     const Text('Uppkommande Event'),
          //     Container(
          //       width: 90.0.w,
          //       height: 12.0.h,
          //       decoration: BoxDecoration(
          //         color: Colors.green[500],
          //         borderRadius: const BorderRadius.all(
          //           Radius.circular(12.0),
          //         ),
          //       ),
          //     ),
          //     Container(
          //       width: 90.0.w,
          //       height: 12.0.h,
          //       decoration: BoxDecoration(
          //         color: Colors.green[400],
          //         borderRadius: const BorderRadius.all(
          //           Radius.circular(12.0),
          //         ),
          //       ),
          //     ),
          //     Container(
          //       width: 90.0.w,
          //       height: 12.0.h,
          //       decoration: BoxDecoration(
          //         color: Colors.green[300],
          //         borderRadius: const BorderRadius.all(
          //           Radius.circular(12.0),
          //         ),
          //       ),
          //     ),
          //   ],
          //)
        ],
      ),
    );
  }
}

void _launchURL(BuildContext context, String url) async {
  try {
    await launch(
      url,
      customTabsOption: CustomTabsOption(
        toolbarColor: Theme.of(context).primaryColor,
        enableDefaultShare: true,
        enableUrlBarHiding: true,
        showPageTitle: true,
        animation: CustomTabsSystemAnimation.slideIn(),
        // or user defined animation.
        extraCustomTabs: const <String>[
          // ref. https://play.google.com/store/apps/details?id=org.mozilla.firefox
          'org.mozilla.firefox',
          // ref. https://play.google.com/store/apps/details?id=com.microsoft.emmx
          'com.microsoft.emmx',
        ],
      ),
      safariVCOption: SafariViewControllerOption(
        preferredBarTintColor: Theme.of(context).primaryColor,
        preferredControlTintColor: Colors.white,
        barCollapsingEnabled: true,
        entersReaderIfAvailable: false,
        dismissButtonStyle: SafariViewControllerDismissButtonStyle.close,
      ),
    );
  } catch (e) {
    // An exception is thrown if browser app is not installed on Android device.
    debugPrint(e.toString());
  }
}
