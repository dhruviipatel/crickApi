import 'package:crickapi_trial/apiController.dart';
import 'package:crickapi_trial/widgets/completedMatchList.dart';
import 'package:crickapi_trial/widgets/liveMatchList.dart';
import 'package:crickapi_trial/widgets/upcomingMatchList.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final Apicontroller apicontroller = Get.put(Apicontroller());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.deepPurple,
            title: Text(
              "Matches",
              style: TextStyle(color: Colors.white),
            ),
          ),
          body: DefaultTabController(
              length: 3,
              child: Column(
                children: [
                  Container(
                    height: 60,
                    child: TabBar(
                        overlayColor: MaterialStateProperty.all<Color>(
                            Colors.transparent),
                        tabs: [
                          Text("Upcoming"),
                          Text("Live"),
                          Text("Completed")
                        ]),
                  ),
                  Expanded(
                      child: TabBarView(children: [
                    UpcomingMatchList(),
                    LiveMatchList(),
                    CompletedMatchList()
                  ]))
                ],
              ))),
    );
  }
}
