import 'package:flutter/material.dart';
import 'package:mtd2022/models/company.dart';

import 'package:sizer/sizer.dart';

class CompanyCard extends StatelessWidget {
  const CompanyCard({Key? key, required this.companyData}) : super(key: key);

  final Company companyData;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        //bild
        Container(
          width: 100.0.h,
          height: 90,
          child: Padding(
              padding: const EdgeInsets.all(16),
              child: Image(
                  image: AssetImage('assets/images/' + companyData.logo))),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  "assets/images/" + companyData.partner + "_background.png"),
            ),
          ),
        ),

        Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  companyData.company,
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(companyData.partner.toUpperCase()),
              ),
            ],
          ),
          decoration: const BoxDecoration(),
        ),
      ]),
      decoration: BoxDecoration(boxShadow: const [
        BoxShadow(
            color: Colors.black,
            offset: Offset(0, 1),
            blurRadius: 6,
            spreadRadius: -12),
      ], color: Theme.of(context).primaryColor),
    );
  }
}
