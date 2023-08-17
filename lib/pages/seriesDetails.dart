import 'package:crickapi_trial/apiController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SeriesDetails extends StatelessWidget {
  SeriesDetails({super.key});

  final Apicontroller apicontroller = Get.put(Apicontroller());

  @override
  Widget build(BuildContext context) {
    final recievedData = Get.arguments as List<dynamic>;
    final matchdetails = recievedData[0];
    final seriesName = recievedData[1];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(
          seriesName,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder(
        itemCount: matchdetails.length,
        itemBuilder: (context, index) {
          DateTime dateTimeGMTString = matchdetails[index].dateTimeGmt;
          String formattedDate =
              DateFormat('EEE, MMM d, y').format(dateTimeGMTString);
          String formattedTime = DateFormat.jm().format(dateTimeGMTString);
          return Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  matchdetails[index].name,
                  style: TextStyle(color: Colors.green, fontSize: 17),
                ),
                Table(
                  columnWidths: const {
                    0: FlexColumnWidth(1.5),
                    1: FlexColumnWidth(4),
                  },
                  children: [
                    TableRow(children: [
                      Text("Match Type: ",
                          style: TextStyle(fontWeight: FontWeight.w700)),
                      Text(matchdetails[index].matchType)
                    ]),
                    TableRow(children: [
                      Text("Date: ",
                          style: TextStyle(fontWeight: FontWeight.w700)),
                      Text(formattedDate)
                    ]),
                    TableRow(children: [
                      Text("Time: ",
                          style: TextStyle(fontWeight: FontWeight.w700)),
                      Text(formattedTime)
                    ]),
                    TableRow(children: [
                      Text("Venue: ",
                          style: TextStyle(fontWeight: FontWeight.w700)),
                      Text(matchdetails[index].venue)
                    ]),
                  ],
                ),
                Divider()
              ],
            ),
          );
        },
      ),
    );
  }
}
