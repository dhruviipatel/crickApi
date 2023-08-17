import 'package:crickapi_trial/apiController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'fantacyPage.dart';

class FantacyTitlePage extends StatelessWidget {
  FantacyTitlePage({super.key});
  final Apicontroller apicontroller = Get.put(Apicontroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(
          "Innings",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () => Get.to(() => FantacyPage(),
                  arguments: apicontroller.allTotal),
              child: Text(
                "All Total",
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
      body: Obx(
        () => apicontroller.isloading == true
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: apicontroller.innings.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          apicontroller.innings[index].inning,
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w700),
                        ),
                        InkWell(
                            onTap: () => Get.to(() => FantacyPage(),
                                arguments:
                                    apicontroller.innings[index].batting),
                            child: Text("Batting")),
                        InkWell(
                            onTap: () => Get.to(() => FantacyPage(),
                                arguments:
                                    apicontroller.innings[index].bowling),
                            child: Text("Bowling")),
                        InkWell(
                            onTap: () => Get.to(() => FantacyPage(),
                                arguments:
                                    apicontroller.innings[index].catching),
                            child: Text("Catching")),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}
