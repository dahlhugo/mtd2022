import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "MTD 2022",
        ),
        centerTitle: true,
        foregroundColor: Colors.black87,
        backgroundColor: Color(0xfafafaFF),
        elevation: 0,
      ),
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.9,
          heightFactor: 1.0,
          child: Column(children: const [
            Image(image: AssetImage("assets/images/gl.png")),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                  'Medieteknikdagen är en arbetsmarknadsdag för medieteknikprogrammet på Linköpings universitet. För tjugoandra året i rad förenar vi hundratals studenter och företag i industrin. I år sker mässan på Graduateland.'),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                  'Civilingenjörsprogrammet i medieteknik är utbildningen där tekniken gifter sig med kreativiteten. Resultatet blir en unik spetskompetens inom områden som blir allt viktigare. Klassiska ingenjörsämnen blandas med programmering, visualisering, datorgrafik, interaktionsdesign, ljud och mycket mer.'),
            ),
          ]),
        ),
      ),
    );
  }
}
