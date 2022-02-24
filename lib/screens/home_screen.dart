import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';
import 'package:mtd2022/models/events.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final database = FirebaseDatabase.instance.ref();

  String glBannerImage = "";
  var lists = [];

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

  void testDB() {
    database
        .child('events')
        .orderByKey()
        .limitToFirst(3)
        .get()
        .then((value) => print(value.value));
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
          const Text("MTD 2022"),
          SizedBox(
            width: 100.0.w,
            height: 30.0.h,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Material(
                child: Ink.image(
                  fit: BoxFit.fill,
                  image: NetworkImage(glBannerImage),
                  child: InkWell(
                    onTap: () {
                      _launchURL(context, "https://massa.medieteknikdagen.se");
                    },
                  ),
                ),
              ),
            ),
          ),

          //TODO: future builder for getting once.

          StreamBuilder(
              stream:
                  database.child('events').orderByKey().limitToFirst(3).onValue,
              builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                final tilesList = <Card>[];

                if (snapshot.hasData &&
                    !snapshot.hasError &&
                    snapshot.data!.snapshot.value != null) {
                  final myEvents = Map<String, dynamic>.from(
                      snapshot.data!.snapshot.value as Map);

                  myEvents.forEach((key, value) {
                    print(value["name"]);
                  });

                  tilesList.addAll(myEvents.values.map((value) {
                    final nextEvent =
                        MtdEvent.fromRTDB(Map<String, dynamic>.from(value));

                    return Card(
                      child: ListTile(
                        leading: Container(
                          color: Colors.amber[900],
                          width: 48,
                          height: 48,
                        ),
                        title: Text(nextEvent.name),
                        subtitle: Text(nextEvent.description),
                      ),
                    );
                  }));
                  return Expanded(
                    child: ListView(
                      children: tilesList,
                    ),
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              }),
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
