import 'package:flutter/material.dart';
import 'package:mtd2022/models/event.dart';

class EventCard extends StatelessWidget {
  const EventCard({Key? key, required this.eventData}) : super(key: key);

  final MtdEvent eventData;

  final List<String> weekdays = const [
    "JAN",
    "FEB",
    "MAR",
    "APR",
    "MAJ",
    "JUNI",
    "JULI",
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: Colors.amber[900],
          ),
          width: 48,
          height: 48,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(eventData.date.day.toString()),
                Text(weekdays[eventData.date.month - 1])
              ]),
        ),
        title: Text(eventData.name),
        subtitle: Text(eventData.description),
      ),
    );
  }
}
