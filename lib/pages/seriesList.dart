import 'package:crickapi_trial/apiController.dart';
import 'package:crickapi_trial/pages/seriesDetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SeriesList extends StatelessWidget {
  SeriesList({super.key});

  final Apicontroller apicontroller = Get.put(Apicontroller());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text(
            "Series list",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Obx(
          () => apicontroller.isloading == false
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    itemCount: apicontroller.allSeries.length,
                    itemBuilder: (context, index) {
                      int actualindex =
                          apicontroller.allSeries.length - index - 1;

                      DateTime dateTimeGMTString =
                          apicontroller.allSeries[actualindex].startDate;
                      String formattedDate =
                          DateFormat('MMM d').format(dateTimeGMTString);
                      String seriesName =
                          apicontroller.allSeries[actualindex].name;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            apicontroller.allSeries[actualindex].name,
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 16),
                          ),
                          Row(
                            children: [
                              Text("Start Date:  "),
                              Text(formattedDate)
                            ],
                          ),
                          Row(
                            children: [
                              Text("End Date: "),
                              Text(apicontroller.allSeries[actualindex].endDate)
                            ],
                          ),
                          Row(
                            children: [
                              Text("Total Matches: "),
                              Text(apicontroller.allSeries[actualindex].matches
                                  .toString())
                            ],
                          ),
                          Row(
                            children: [
                              Text("Odi: "),
                              Text(apicontroller.allSeries[actualindex].odi
                                  .toString())
                            ],
                          ),
                          Row(
                            children: [
                              Text("t20: "),
                              Text(apicontroller.allSeries[actualindex].t20
                                  .toString())
                            ],
                          ),
                          Row(
                            children: [
                              Text("test: "),
                              Text(apicontroller.allSeries[actualindex].test
                                  .toString())
                            ],
                          ),
                          InkWell(
                            onTap: () async {
                              await apicontroller.getMatchSeriesWise(
                                  apicontroller.allSeries[actualindex].id);

                              var sMatchlist = apicontroller.seriesmatchList;

                              Get.to(() => SeriesDetails(),
                                  arguments: [sMatchlist, seriesName]);
                            },
                            child: Container(
                                height: 30,
                                color: Colors.deepPurple.withOpacity(0.2),
                                child: Center(
                                    child: Text("View Matches",
                                        style: TextStyle(
                                            color: Colors.deepPurple)))),
                          ),
                          Divider()
                        ],
                      );
                    },
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(),
                ),
        ),
      ),
    );
  }
}
