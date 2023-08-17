class MDetails {
  String id;
  String name;
  String? matchType;
  String status;
  String venue;
  DateTime date;
  DateTime dateTimeGmt;
  List<String> teams;
  List<TeamInfo> teamInfo;
  List<Score>? score;
  String? tossWinner;
  String? tossChoice;
  String seriesId;
  bool fantasyEnabled;
  bool bbbEnabled;
  bool hasSquad;
  bool matchStarted;
  bool matchEnded;

  MDetails({
    required this.id,
    required this.name,
    this.matchType,
    required this.status,
    required this.venue,
    required this.date,
    required this.dateTimeGmt,
    required this.teams,
    required this.teamInfo,
    this.score,
    this.tossWinner,
    this.tossChoice,
    required this.seriesId,
    required this.fantasyEnabled,
    required this.bbbEnabled,
    required this.hasSquad,
    required this.matchStarted,
    required this.matchEnded,
  });

  factory MDetails.fromJson(Map<String, dynamic> json) => MDetails(
        id: json["id"],
        name: json["name"],
        matchType: json["matchType"],
        status: json["status"],
        venue: json["venue"],
        date: DateTime.parse(json["date"]),
        dateTimeGmt: DateTime.parse(json["dateTimeGMT"]),
        teams: List<String>.from(json["teams"].map((x) => x)),
        teamInfo: List<TeamInfo>.from(
            json["teamInfo"].map((x) => TeamInfo.fromJson(x))),
        score: json["score"] != null
            ? List<Score>.from(json["score"].map((x) => Score.fromJson(x)))
            : null,
        //score: List<Score>.from(json["score"].map((x) => Score.fromJson(x))),
        tossWinner: json["tossWinner"],
        tossChoice: json["tossChoice"],
        seriesId: json["series_id"],
        fantasyEnabled: json["fantasyEnabled"],
        bbbEnabled: json["bbbEnabled"],
        hasSquad: json["hasSquad"],
        matchStarted: json["matchStarted"],
        matchEnded: json["matchEnded"],
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
        "teamInfo": List<dynamic>.from(teamInfo.map((x) => x.toJson())),
        "score": score != null
            ? List<dynamic>.from(score!.map((x) => x.toJson()))
            : null,
        //"score": List<dynamic>.from(score!.map((x) => x.toJson())),
        "tossWinner": tossWinner,
        "tossChoice": tossChoice,
        "series_id": seriesId,
        "fantasyEnabled": fantasyEnabled,
        "bbbEnabled": bbbEnabled,
        "hasSquad": hasSquad,
        "matchStarted": matchStarted,
        "matchEnded": matchEnded,
      };
}

class Score {
  int r;
  int w;
  dynamic o;
  String inning;

  Score({
    required this.r,
    required this.w,
    required this.o,
    required this.inning,
  });

  factory Score.fromJson(Map<String, dynamic> json) => Score(
        r: json["r"],
        w: json["w"],
        o: json["o"],
        inning: json["inning"],
      );

  Map<String, dynamic> toJson() => {
        "r": r,
        "w": w,
        "o": o,
        "inning": inning,
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
