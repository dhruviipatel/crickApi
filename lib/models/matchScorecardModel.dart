class MatchScoreCard {
  String id;
  String name;
  String? matchType;
  String status;
  String venue;
  DateTime date;
  DateTime dateTimeGmt;
  List<String> teams;
  List<TeamInfo> teamInfo;
  List<Score> score;
  String tossWinner;
  String tossChoice;
  String? matchWinner;
  String seriesId;
  List<Scorecard> scorecard;
  bool matchStarted;
  bool matchEnded;

  MatchScoreCard({
    required this.id,
    required this.name,
    this.matchType,
    required this.status,
    required this.venue,
    required this.date,
    required this.dateTimeGmt,
    required this.teams,
    required this.teamInfo,
    required this.score,
    required this.tossWinner,
    required this.tossChoice,
    this.matchWinner,
    required this.seriesId,
    required this.scorecard,
    required this.matchStarted,
    required this.matchEnded,
  });

  factory MatchScoreCard.fromJson(Map<String, dynamic> json) => MatchScoreCard(
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
        score: List<Score>.from(json["score"].map((x) => Score.fromJson(x))),
        tossWinner: json["tossWinner"],
        tossChoice: json["tossChoice"],
        matchWinner: json["matchWinner"],
        seriesId: json["series_id"],
        scorecard: List<Scorecard>.from(
            json["scorecard"].map((x) => Scorecard.fromJson(x))),
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
        "score": List<dynamic>.from(score.map((x) => x.toJson())),
        "tossWinner": tossWinner,
        "tossChoice": tossChoice,
        "matchWinner": matchWinner,
        "series_id": seriesId,
        "scorecard": List<dynamic>.from(scorecard.map((x) => x.toJson())),
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

class Scorecard {
  List<Batting> batting;
  List<Bowling> bowling;
  List<Catching> catching;
  Extras extras;
  Totals totals;
  String inning;

  Scorecard({
    required this.batting,
    required this.bowling,
    required this.catching,
    required this.extras,
    required this.totals,
    required this.inning,
  });

  factory Scorecard.fromJson(Map<String, dynamic> json) => Scorecard(
        batting:
            List<Batting>.from(json["batting"].map((x) => Batting.fromJson(x))),
        bowling:
            List<Bowling>.from(json["bowling"].map((x) => Bowling.fromJson(x))),
        catching: List<Catching>.from(
            json["catching"].map((x) => Catching.fromJson(x))),
        extras: Extras.fromJson(json["extras"]),
        totals: Totals.fromJson(json["totals"]),
        inning: json["inning"],
      );

  Map<String, dynamic> toJson() => {
        "batting": List<dynamic>.from(batting.map((x) => x.toJson())),
        "bowling": List<dynamic>.from(bowling.map((x) => x.toJson())),
        "catching": List<dynamic>.from(catching.map((x) => x.toJson())),
        "extras": extras.toJson(),
        "totals": totals.toJson(),
        "inning": inning,
      };
}

class Batting {
  Batsman batsman;
  String? dismissal;
  Batsman? bowler;
  Batsman? catcher;
  String dismissalText;
  int r;
  int b;
  int the4S;
  int the6S;
  double sr;
  int? empty;

  Batting({
    required this.batsman,
    this.dismissal,
    this.bowler,
    this.catcher,
    required this.dismissalText,
    required this.r,
    required this.b,
    required this.the4S,
    required this.the6S,
    required this.sr,
    this.empty,
  });

  factory Batting.fromJson(Map<String, dynamic> json) => Batting(
        batsman: Batsman.fromJson(json["batsman"]),
        dismissal: json["dismissal"],
        bowler:
            json["bowler"] == null ? null : Batsman.fromJson(json["bowler"]),
        catcher:
            json["catcher"] == null ? null : Batsman.fromJson(json["catcher"]),
        dismissalText: json["dismissal-text"],
        r: json["r"],
        b: json["b"],
        the4S: json["4s"],
        the6S: json["6s"],
        sr: json["sr"]?.toDouble(),
        empty: json[""],
      );

  Map<String, dynamic> toJson() => {
        "batsman": batsman.toJson(),
        "dismissal": dismissal,
        "bowler": bowler?.toJson(),
        "catcher": catcher?.toJson(),
        "dismissal-text": dismissalText,
        "r": r,
        "b": b,
        "4s": the4S,
        "6s": the6S,
        "sr": sr,
        "": empty,
      };
}

class Batsman {
  String id;
  String name;
  List<String>? altnames;

  Batsman({required this.id, required this.name, this.altnames});

  factory Batsman.fromJson(Map<String, dynamic> json) => Batsman(
        id: json["id"],
        name: json["name"],
        altnames: json["altnames"] == null
            ? []
            : List<String>.from(json["altnames"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "altnames":
            altnames == null ? [] : List<dynamic>.from(altnames!.map((x) => x)),
      };
}

class Bowling {
  Bowler bowler;
  dynamic? o;
  int? m;
  int? r;
  int? w;
  int? nb;
  int? wd;
  dynamic? eco;

  Bowling({
    required this.bowler,
    this.o,
    this.m,
    this.r,
    this.w,
    this.nb,
    this.wd,
    this.eco,
  });

  factory Bowling.fromJson(Map<String, dynamic> json) => Bowling(
        bowler: Bowler.fromJson(json["bowler"]),
        o: json["o"],
        m: json["m"],
        r: json["r"],
        w: json["w"],
        nb: json["nb"],
        wd: json["wd"],
        eco: json["eco"],
      );

  Map<String, dynamic> toJson() => {
        "bowler": bowler.toJson(),
        "o": o,
        "m": m,
        "r": r,
        "w": w,
        "nb": nb,
        "wd": wd,
        "eco": eco,
      };
}

class Bowler {
  String id;
  String name;
  List<String>? altnames;

  Bowler({
    required this.id,
    required this.name,
    this.altnames,
  });

  factory Bowler.fromJson(Map<String, dynamic> json) => Bowler(
        id: json["id"],
        name: json["name"],
        altnames: json["altnames"] == null
            ? []
            : List<String>.from(json["altnames"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "altnames":
            altnames == null ? [] : List<dynamic>.from(altnames!.map((x) => x)),
      };
}

class Catching {
  int stumped;
  int runout;
  int catchingCatch;
  Batsman catcher;

  Catching({
    required this.stumped,
    required this.runout,
    required this.catchingCatch,
    required this.catcher,
  });

  factory Catching.fromJson(Map<String, dynamic> json) => Catching(
        stumped: json["stumped"],
        runout: json["runout"],
        catchingCatch: json["catch"],
        catcher: Batsman.fromJson(json["catcher"]),
      );

  Map<String, dynamic> toJson() => {
        "stumped": stumped,
        "runout": runout,
        "catch": catchingCatch,
        "catcher": catcher.toJson(),
      };
}

class Extras {
  int? r;
  int? b;
  int? lb;
  int? w;
  int? nb;
  int? p;

  Extras({
    this.r,
    this.b,
    this.lb,
    this.w,
    this.nb,
    this.p,
  });

  factory Extras.fromJson(Map<String, dynamic> json) => Extras(
        r: json["r"],
        b: json["b"],
        lb: json["lb"],
        w: json["w"],
        nb: json["nb"],
        p: json["p"],
      );

  Map<String, dynamic> toJson() => {
        "r": r,
        "b": b,
        "lb": lb,
        "w": w,
        "nb": nb,
        "p": p,
      };
}

class Totals {
  int? r;
  int? o;
  int? w;
  double? rr;

  Totals({
    this.r,
    this.o,
    this.w,
    this.rr,
  });

  factory Totals.fromJson(Map<String, dynamic> json) => Totals(
        r: json["R"],
        o: json["O"],
        w: json["W"],
        rr: json["RR"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "R": r,
        "O": o,
        "W": w,
        "RR": rr,
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
