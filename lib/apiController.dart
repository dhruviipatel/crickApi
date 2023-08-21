import 'dart:async';
import 'dart:convert';
import 'package:crickapi_trial/matchUrl.dart';
import 'package:crickapi_trial/models/matchesDataModel.dart';
import 'package:crickapi_trial/models/seriesInfoModel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'models/fantacyDataModel.dart';
import 'models/matchDetailsModel.dart';
import 'models/matchScorecardModel.dart';
import 'models/seriesAllDetailModel.dart';

class Apicontroller extends GetxController {
  RxBool isloading = false.obs;
  Timer? liveDataTimer;
  @override
  void onInit() {
    super.onInit();
    setMatchesData();

    //getFantacyData();
    getSeriesList();
    liveDataTimer = Timer.periodic(Duration(seconds: 100000), (_) {
      setMatchesData();
    });
  }

  @override
  void onClose() {
    super.onClose();
    liveDataTimer?.cancel();
  }

  // Method to update live match data using periodic polling
  RxList liveMatches = [].obs;
  RxList upcomingMatches = [].obs;
  RxList completedMatches = [].obs;
  void setMatchesData() async {
    isloading.value = true;
    final api = cricScoreApi;

    final response = await http.get(Uri.parse(api));

    try {
      if (response.statusCode == 200) {
        isloading.value = false;
        var jsonData = json.decode(response.body);
        var maindata = jsonData['data'];
        var newmatches = maindata.map((e) => Matches.fromJson(e)).toList();

        // Clear the existing liveMatches list and add new data
        liveMatches.clear();
        liveMatches.addAll(newmatches.where((match) => match.ms == "live"));

        upcomingMatches.clear();
        upcomingMatches
            .addAll(newmatches.where((match) => match.ms == "fixture"));

        completedMatches.clear();
        completedMatches
            .addAll(newmatches.where((match) => match.ms == "result"));

        print("Live match data updated");
      }
    } catch (e) {
      print(e);
    }
  }

  var innings = [];
  var allTotal = [];

//get fantacy data points
  getFantacyData() async {
    isloading.value = true;

    final api = matchPointsApi;

    var response = await http.get(Uri.parse(api));

    try {
      if (response.statusCode == 200) {
        isloading.value = false;
        var jsonData = json.decode(response.body);

        var maindata = jsonData['data'];
        var inn = maindata["innings"];
        var totalData = maindata["totals"];
        allTotal = totalData.map((e) => Total.fromJson(e)).toList();

        innings = inn.map((e) => Inning.fromJson(e)).toList();

        print("data retrive successfully");
      }
    } catch (e) {
      isloading.value = false;
      print(e);
    }
  }

  RxList batsmanlist = [].obs;
  MatchScoreCard? myscorecard;
  Future<MatchScoreCard> getScorecard(String id) async {
    final api = matchScoreCardApi + id;
    var response = await http.get(Uri.parse(api));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      var maindata = data["data"];
      print("score data get");
      myscorecard = MatchScoreCard.fromJson(maindata);

      print(myscorecard);

      return MatchScoreCard.fromJson(maindata);
    } else {
      throw Exception('Failed to load score data');
    }
  }

  Future<MDetails> fetchMatchDetails(String id) async {
    print("id $id");
    final response = await http.get(Uri.parse(matchInfoApi + id));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);

      Map<String, dynamic> maindata = data["data"];
      return MDetails.fromJson(maindata);
    } else {
      throw Exception('Failed to load data');
    }
  }

  var allSeries = [];
  getSeriesList() async {
    isloading.value = true;
    final response = await http.get(Uri.parse(seriesListApi));
    try {
      if (response.statusCode == 200) {
        isloading.value = false;
        var jsonData = json.decode(response.body);
        var maindata = jsonData['data'];

        allSeries = maindata.map((e) => SeriesInfo.fromJson(e)).toList();

        print("Series retrived successfully");
      }
    } catch (e) {
      isloading.value = false;
      print(e);
    }
  }

  Future<SeriesInfo2> getSeriesInfo(String id) async {
    final response = await http.get(Uri.parse(seriesInfoApi + id));
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      Map<String, dynamic> maindata = data["data"];

      Map<String, dynamic> info = maindata["info"];

      return SeriesInfo2.fromJson(info);
    } else {
      throw Exception("failsed to load data");
    }
  }

  var seriesmatchList = [];
  getMatchSeriesWise(String id) async {
    isloading.value = true;
    final response = await http.get(Uri.parse(seriesInfoApi + id));
    if (response.statusCode == 200) {
      isloading.value = false;
      var data = jsonDecode(response.body);
      var maindata = data["data"];
      var matchList = maindata["matchList"];

      seriesmatchList =
          matchList.map((e) => SeriesWiseMatchList.fromJson(e)).toList();
    } else {
      isloading.value = false;
      throw Exception("failsed to load data");
    }
  }

  RxBool clickvalue = false.obs;

  clickOnButton() {
    clickvalue.value = !clickvalue.value;
  }
}
