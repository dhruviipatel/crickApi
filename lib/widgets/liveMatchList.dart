import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../apiController.dart';
import '../models/matchDetailsModel.dart';
import '../models/seriesAllDetailModel.dart';
import '../pages/matchDatailsPage.dart';

class LiveMatchList extends StatelessWidget {
  LiveMatchList({super.key});
  final Apicontroller apicontroller = Get.put(Apicontroller());
  @override
  Widget build(BuildContext context) {
    final ScrollController _scrollController = ScrollController();
    return apicontroller.liveMatches.length == 0
        ? Center(
            child: Text("No live match found"),
          )
        : ListView.builder(
            controller: _scrollController,
            reverse: false,
            itemCount: apicontroller.liveMatches.length,
            itemBuilder: (context, index) {
              String team1 = "";

              String t1 = apicontroller.liveMatches[index].t1;

              if (t1.length > 25) {
                team1 =
                    t1.substring(0, 25) + "\n " + t1.substring(26, t1.length);
              } else {
                team1 = t1;
              }

              String team2 = "";
              String t2 = apicontroller.liveMatches[index].t2;
              if (t2.length > 25) {
                team2 =
                    t2.substring(0, 25) + "\n " + t2.substring(26, t2.length);
              } else {
                team2 = t2;
              }

              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                child: Column(
                  children: [
                    Obx(
                      () => Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          apicontroller.liveMatches[index].t2S == ""
                              ? apicontroller.liveMatches[index].t1S
                              : apicontroller.liveMatches[index].t2S,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            apicontroller.liveMatches[index].t1Img == null
                                ? Container(
                                    height: 50,
                                    width: 50,
                                    color: Colors.black,
                                  )
                                : Container(
                                    height: 50,
                                    width: 50,
                                    child: Image.network(
                                      apicontroller.liveMatches[index].t1Img,
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
                          ],
                        ),
                        Column(
                          children: [
                            apicontroller.liveMatches[index].t2Img == null
                                ? Container(
                                    height: 50,
                                    width: 50,
                                    color: Colors.black,
                                  )
                                : Container(
                                    height: 50,
                                    width: 50,
                                    child: Image.network(
                                      apicontroller.liveMatches[index].t2Img,
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
                          apicontroller.liveMatches[index].status,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    InkWell(
                      onTap: () async {
                        MDetails matchdetails =
                            await apicontroller.fetchMatchDetails(
                                apicontroller.liveMatches[index].id);
                        SeriesInfo2 serisdetails = await apicontroller
                            .getSeriesInfo(matchdetails.seriesId);
                        String seriesName = serisdetails.name;

                        Get.to(() => MatchDetailsPage(),
                            arguments: [matchdetails, seriesName]);
                      },
                      child: Container(
                        height: 30,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.deepPurple,
                        child: Center(
                          child: Text(
                            "View More",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
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
