import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:mtd2022/widgets/event_card.dart';
import 'package:mtd2022/models/event.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  _ScheduleScreenState createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  final database = FirebaseDatabase.instance.ref();

  int currentWeek = 7;
  bool isBackButtonDisabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Row(children: [
          Flexible(
            flex: 1,
            child: IconButton(
              onPressed:
                  !isBackButtonDisabled ? () => selectWeek(currentWeek) : null,
              icon: const Icon(Icons.arrow_back),
            ),
          ),
          Flexible(
            flex: 1,
            child: IconButton(
              onPressed:
                  isBackButtonDisabled ? () => selectWeek(currentWeek) : null,
              icon: const Icon(Icons.arrow_forward),
            ),
          )
        ]),
        title: Text("Vecka " + currentWeek.toString()),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.9,
          heightFactor: 1.0,
          child: Column(
            children: [
              StreamBuilder(
                  stream: database
                      .child('events')
                      .orderByChild("date")
                      .startAt("")
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
                  })
            ],
          ),
        ),
      ),
    );
  }

  selectWeek(int currentWeek) {
    setState(() {
      if (currentWeek == 7) {
        currentWeek = 8;
        isBackButtonDisabled = !isBackButtonDisabled;
      } else if (currentWeek == 8) {
        currentWeek = 7;
        isBackButtonDisabled = !isBackButtonDisabled;
      }
    });
  }
}
