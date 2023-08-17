import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../apiController.dart';

class CompletedMatchList extends StatelessWidget {
  const CompletedMatchList({super.key});

  @override
  Widget build(BuildContext context) {
    final Apicontroller apicontroller = Get.put(Apicontroller());
    return ListView.builder(
      itemCount: apicontroller.completedMatches.length,
      itemBuilder: (context, index) {
        String team1 = "";
        String t1 = apicontroller.completedMatches[index].t1;

        if (t1.length > 25) {
          team1 = t1.substring(0, 25) + "\n " + t1.substring(26, t1.length);
        } else {
          team1 = t1;
        }

        String team2 = "";
        String t2 = apicontroller.completedMatches[index].t2;
        if (t2.length > 25) {
          team2 = t2.substring(0, 25) + "\n " + t2.substring(26, t2.length);
        } else {
          team2 = t2;
        }

        DateTime dateTimeGMTString =
            apicontroller.completedMatches[index].dateTimeGmt;
        String formattedDate =
            DateFormat('EEE, MMM d, y').format(dateTimeGMTString);
        String formattedTime = DateFormat.jm().format(dateTimeGMTString);

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          child: Column(
            children: [
              Text(formattedDate),
              Text(formattedTime),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      apicontroller.completedMatches[index].t1Img == null
                          ? Container(
                              height: 50,
                              width: 50,
                              color: Colors.black,
                            )
                          : Container(
                              height: 50,
                              width: 50,
                              child: Image.network(
                                apicontroller.completedMatches[index].t1Img,
                                height: 200,
                                width: 200,
                              ),
                            ),
                      Text(
                        team1,
                        style: TextStyle(
                            fontSize: 10,
                            color: Colors.red,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        apicontroller.completedMatches[index].t1S,
                        style: TextStyle(fontSize: 12),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      apicontroller.completedMatches[index].t2Img == null
                          ? Container(
                              height: 50,
                              width: 50,
                              color: Colors.black,
                            )
                          : Container(
                              height: 50,
                              width: 50,
                              child: Image.network(
                                apicontroller.completedMatches[index].t2Img,
                                height: 200,
                                width: 200,
                              ),
                            ),
                      Text(
                        team2,
                        style: TextStyle(
                            fontSize: 10,
                            color: Colors.red,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        apicontroller.completedMatches[index].t2S,
                        style: TextStyle(fontSize: 12),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 30,
                width: MediaQuery.of(context).size.width,
                color: Colors.green,
                child: Center(
                  child: Text(
                    apicontroller.completedMatches[index].status,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Divider()
            ],
          ),
        );
      },
    );
  }
}
