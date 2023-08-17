import 'package:crickapi_trial/apiController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FantacyPage extends StatelessWidget {
  FantacyPage({super.key});
  final Apicontroller apicontroller = Get.put(Apicontroller());

  @override
  Widget build(BuildContext context) {
    final recievedData = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Points",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: Obx(
        () => apicontroller.isloading == true
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: recievedData.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Column(
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Player",
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  recievedData[index].name,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Points",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  recievedData[index].points.toString(),
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Divider()
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}
