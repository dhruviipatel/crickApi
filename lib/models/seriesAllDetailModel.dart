class SeriesAllData {
  SeriesInfo2 info;
  List<SeriesWiseMatchList> matchList;

  SeriesAllData({
    required this.info,
    required this.matchList,
  });

  factory SeriesAllData.fromJson(Map<String, dynamic> json) => SeriesAllData(
        info: SeriesInfo2.fromJson(json["info"]),
        matchList: List<SeriesWiseMatchList>.from(
            json["matchList"].map((x) => SeriesWiseMatchList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "info": info.toJson(),
        "matchList": List<dynamic>.from(matchList.map((x) => x.toJson())),
      };
}

class SeriesInfo2 {
  String id;
  String name;
  DateTime startdate;
  String enddate;
  int odi;
  int t20;
  int test;
  int squads;
  int matches;

  SeriesInfo2({
    required this.id,
    required this.name,
    required this.startdate,
    required this.enddate,
    required this.odi,
    required this.t20,
    required this.test,
    required this.squads,
    required this.matches,
  });

  factory SeriesInfo2.fromJson(Map<String, dynamic> json) => SeriesInfo2(
        id: json["id"],
        name: json["name"],
        startdate: DateTime.parse(json["startdate"]),
        enddate: json["enddate"],
        odi: json["odi"],
        t20: json["t20"],
        test: json["test"],
        squads: json["squads"],
        matches: json["matches"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "startdate":
            "${startdate.year.toString().padLeft(4, '0')}-${startdate.month.toString().padLeft(2, '0')}-${startdate.day.toString().padLeft(2, '0')}",
        "enddate": enddate,
        "odi": odi,
        "t20": t20,
        "test": test,
        "squads": squads,
        "matches": matches,
      };
}

class SeriesWiseMatchList {
  String id;
  String name;
  String matchType;
  String status;
  String venue;
  DateTime date;
  DateTime dateTimeGmt;
  List<String> teams;
  bool fantasyEnabled;
  bool bbbEnabled;
  bool hasSquad;
  bool matchStarted;
  bool matchEnded;
  List<TeamInfo>? teamInfo;

  SeriesWiseMatchList({
    required this.id,
    required this.name,
    required this.matchType,
    required this.status,
    required this.venue,
    required this.date,
    required this.dateTimeGmt,
    required this.teams,
    required this.fantasyEnabled,
    required this.bbbEnabled,
    required this.hasSquad,
    required this.matchStarted,
    required this.matchEnded,
    this.teamInfo,
  });

  factory SeriesWiseMatchList.fromJson(Map<String, dynamic> json) =>
      SeriesWiseMatchList(
        id: json["id"],
        name: json["name"],
        matchType: json["matchType"],
        status: json["status"],
        venue: json["venue"],
        date: DateTime.parse(json["date"]),
        dateTimeGmt: DateTime.parse(json["dateTimeGMT"]),
        teams: List<String>.from(json["teams"].map((x) => x)),
        fantasyEnabled: json["fantasyEnabled"],
        bbbEnabled: json["bbbEnabled"],
        hasSquad: json["hasSquad"],
        matchStarted: json["matchStarted"],
        matchEnded: json["matchEnded"],
        teamInfo: json["teamInfo"] == null
            ? []
            : List<TeamInfo>.from(
                json["teamInfo"]!.map((x) => TeamInfo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "matchType": matchType,
        "status": status,
        "venue": venue,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "dateTimeGMT": dateTimeGmt.toIso8601String(),
        "teams": List<dynamic>.from(teams.map((x) => x)),
        "fantasyEnabled": fantasyEnabled,
        "bbbEnabled": bbbEnabled,
        "hasSquad": hasSquad,
        "matchStarted": matchStarted,
        "matchEnded": matchEnded,
        "teamInfo": teamInfo == null
            ? []
            : List<dynamic>.from(teamInfo!.map((x) => x.toJson())),
      };
}

class TeamInfo {
  String name;
  String? shortname;
  String img;

  TeamInfo({
    required this.name,
    this.shortname,
    required this.img,
  });

  factory TeamInfo.fromJson(Map<String, dynamic> json) => TeamInfo(
        name: json["name"],
        shortname: json["shortname"],
        img: json["img"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "shortname": shortname,
        "img": img,
      };
}
