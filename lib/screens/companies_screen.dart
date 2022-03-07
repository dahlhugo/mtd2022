import 'package:flutter/material.dart';

import 'package:firebase_database/firebase_database.dart';
import 'package:mtd2022/models/company.dart';
import 'package:mtd2022/widgets/company_card.dart';
import 'package:sizer/sizer.dart';

class CompaniesScreen extends StatelessWidget {
  CompaniesScreen({Key? key}) : super(key: key);

  final database = FirebaseDatabase.instance.ref();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Företag på mässan",
        ),
        centerTitle: true,
        foregroundColor: Colors.black87,
        backgroundColor: Color(0xfafafaFF),
        elevation: 0,
      ),
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.9,
          child: StreamBuilder(
              stream: database.child('companies').orderByKey().onValue,
              builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                final cardList = <CompanyCard>[];

                if (snapshot.hasData &&
                    !snapshot.hasError &&
                    snapshot.data!.snapshot.value != null) {
                  final companies =
                      List.from(snapshot.data!.snapshot.value as List);

                  cardList.addAll(companies.map((value) {
                    final nextCompany = Company.fromRTDB(Map.from(value));

                    return CompanyCard(companyData: nextCompany);
                  }));
                  return Container(
                    child: GridView(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 4.0,
                        mainAxisSpacing: 4.0,
                      ),
                      children: cardList,
                    ),
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              }),
        ),
      ),
    );
  }
}
