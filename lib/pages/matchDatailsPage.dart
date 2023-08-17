import 'package:crickapi_trial/apiController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MatchDetailsPage extends StatelessWidget {
  MatchDetailsPage({super.key});

  final Apicontroller apicontroller = Get.put(Apicontroller());

  @override
  Widget build(BuildContext context) {
    final recievedData = Get.arguments as List<dynamic>;
    final matchdetails = recievedData[0];
    final seriesName = recievedData[1];

    String gmtTimeString = matchdetails.dateTimeGmt.toString();
    DateTime dateTimeGMT = DateTime.parse(gmtTimeString);

    var localTimeZone = DateTime.now().timeZoneOffset;
    DateTime localDateTime = dateTimeGMT.add(localTimeZone);
    String formattedTime = DateFormat.jm().format(localDateTime);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "MatchDetails",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.deepPurple,
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Series Name: ",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                ),
                Text(
                  seriesName,
                  style: TextStyle(fontSize: 14, color: Colors.red),
                )
              ],
            ),
            Text(
              matchdetails.name,
              style: TextStyle(fontSize: 16),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Match Starting Time: ",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                  Text(formattedTime),
                ],
              ),
            ),
            Container(
              height: 50,
              color: Colors.deepPurple.withOpacity(0.1),
              child: Center(child: Text(matchdetails.status)),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Image.network(
                        matchdetails.teamInfo[0].img,
                        height: 50,
                        width: 50,
                      ),
                      Text(matchdetails.teamInfo[0].name)
                    ],
                  ),
                  Column(
                    children: [
                      Image.network(
                        matchdetails.teamInfo[1].img,
                        height: 50,
                        width: 50,
                      ),
                      Text(matchdetails.teamInfo[1].name)
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Toss Winner: ",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Text(matchdetails.tossWinner != null
                      ? matchdetails.tossWinner
                      : ""),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Toss Choice: ",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Text(matchdetails.tossWinner != null
                      ? matchdetails.tossChoice
                      : ""),
                ],
              ),
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Venue: ",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
                Text(matchdetails.venue),
              ],
            ),
            Divider(),
            Text(
              "Scoreboard:",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            ),
            matchdetails.score == null || matchdetails.score.isEmpty
                ? Text("The scorecard will appear once the match starts.")
                : Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              matchdetails.teamInfo[0].name,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 14),
                            ),
                          ),
                          Text(matchdetails.score[0].r.toString()),
                          Text("-"),
                          Text(matchdetails.score[0].w.toString()),
                          Text("(${matchdetails.score[0].o.toString()})")
                        ],
                      ),
                      matchdetails.score.length > 1
                          ? Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    matchdetails.teamInfo[1].name,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14),
                                  ),
                                ),
                                Text(matchdetails.score[1].r.toString()),
                                Text("-"),
                                Text(matchdetails.score[1].w.toString()),
                                Text("(${matchdetails.score[1].o.toString()})")
                              ],
                            )
                          : Text("")
                    ],
                  )
          ],
        ),
      ),
    );
  }
}
