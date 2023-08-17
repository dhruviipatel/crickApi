import 'package:crickapi_trial/pages/seriesList.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'pages/fantacyTitlepage.dart';
import 'pages/homePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(iconTheme: IconThemeData(color: Colors.white)),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                Get.to(() => Home());
              },
              child: Text("Match Data")),
          ElevatedButton(
              onPressed: () {
                Get.to(() => FantacyTitlePage());
              },
              child: Text("Fantacy Data")),
          ElevatedButton(
              onPressed: () {
                Get.to(() => SeriesList());
              },
              child: Text("Series List")),
        ],
      ),
    ));
  }
}

class MatchesData extends StatelessWidget {
  const MatchesData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Points",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
