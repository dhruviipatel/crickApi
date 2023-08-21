import 'package:crickapi_trial/apiController.dart';
import 'package:crickapi_trial/models/matchScorecardModel.dart';
import 'package:crickapi_trial/widgets/batsmanlist.dart';
import 'package:crickapi_trial/widgets/bowlerlist.dart';
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
        body: ListView(
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
            Table(
              columnWidths: <int, TableColumnWidth>{
                0: FixedColumnWidth(70),
              },
              children: [
                TableRow(children: [
                  Text(
                    "Venue: ",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                  Text(matchdetails.venue),
                ])
              ],
            ),
            Divider(),
            matchdetails.score == null || matchdetails.score.isEmpty
                ? Text("The scorecard will appear once the match starts.")
                : Column(
                    children: [
                      Obx(
                        () => ElevatedButton(
                            onPressed: () {
                              apicontroller.clickOnButton();
                              apicontroller.getScorecard(matchdetails.id);
                            },
                            child: apicontroller.clickvalue == false
                                ? Text("View Scoreboard")
                                : Text("Hide Scoreboard")),
                      ),
                      Obx(() => apicontroller.clickvalue == true &&
                              apicontroller.myscorecard != null
                          ? ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount:
                                  apicontroller.myscorecard!.score.length,
                              itemBuilder: (context, index) {
                                String inningTitile = apicontroller
                                    .myscorecard!.score[index].inning
                                    .toString();
                                var run =
                                    apicontroller.myscorecard!.score[index].r;
                                var wicket =
                                    apicontroller.myscorecard!.score[index].w;
                                var over =
                                    apicontroller.myscorecard!.score[index].o;
                                var allscorcardIndex =
                                    apicontroller.myscorecard!.scorecard;
                                Scorecard? myscard;
                                for (var scard in allscorcardIndex) {
                                  if (scard.inning == inningTitile) {
                                    myscard = scard;
                                  }
                                }

                                print(myscard);
                                var batsmanlist = myscard!.batting;
                                var bowlerlist = myscard.bowling;

                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 50,
                                      width: MediaQuery.of(context).size.width,
                                      color: Colors.deepPurple,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            inningTitile,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          Text(
                                            "$run-$wicket($over)",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w700),
                                          )
                                        ],
                                      ),
                                    ),
                                    //batsman info
                                    Batsmanlist(batsmanlist: batsmanlist),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Bowlerlist(bowlerlist: bowlerlist),
                                    SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                );
                              },
                            )
                          : Text(""))
                    ],
                  )
          ],
        ),
      ),
    );
  }
}
