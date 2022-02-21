import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:firebase_database/firebase_database.dart';

FirebaseDatabase database = FirebaseDatabase.instance;

DatabaseReference events = database.ref("events");



class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.9,
      heightFactor: 1.0,
      child: Column(
        children: [
          Container(
            width: 100.0.w,
            height: 30.0.h,
            decoration: const BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
            ),
          ),
          Wrap(

            direction: Axis.vertical,
            spacing: 20
            ,
            children: [
              Spacer(),
              Text('Uppkommande Event'),
              Container(
                width: 90.0.w,
                height: 12.0.h,
                decoration: BoxDecoration(
                  color: Colors.green[500],
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                ),
              ),
              Container(
                width: 90.0.w,
                height: 12.0.h,
                decoration:  BoxDecoration(
                  color: Colors.green[400],
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                ),
              ),
              Container(
                width: 90.0.w,
                height: 12.0.h,
                decoration: BoxDecoration(
                  color: Colors.green[300],
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
