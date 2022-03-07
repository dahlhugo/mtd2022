import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:mtd2022/models/event.dart';
import 'package:mtd2022/widgets/event_card.dart';

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

  //inefficient way of setting banner image. Whole homescreen will reload i think
  void singleBannerImage() {
    database.child("/images/0/imageUrl").get().then((snapshot) {
      setState(() {
        glBannerImage = snapshot.value.toString();
      });
    });
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
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("MTD 2022"),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: SizedBox(
              width: 100.0.w,
              height: 30.0.h,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Material(
                  child: Ink.image(
                    fit: BoxFit.fill,
                    image: NetworkImage(glBannerImage),
                    child: InkWell(
                      onTap: () {},
                    ),
                  ),
                ),
              ),
            ),
          ),

          //TODO: future builder for getting once.

          StreamBuilder(
              stream: database
                  .child('events')
                  .orderByChild("date")
                  .limitToLast(3)
                  .onValue,
              builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                final tilesList = <EventCard>[];

                if (snapshot.hasData &&
                    !snapshot.hasError &&
                    snapshot.data!.snapshot.value != null) {
                  final myEvents = Map<String, dynamic>.from(
                      snapshot.data!.snapshot.value as Map);

                  tilesList.addAll(myEvents.values.map((value) {
                    final nextEvent =
                        MtdEvent.fromRTDB(Map<String, dynamic>.from(value));

                    return EventCard(eventData: nextEvent);
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
