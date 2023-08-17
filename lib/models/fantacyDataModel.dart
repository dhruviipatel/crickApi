import 'dart:convert';

FantacyDataModel fantacyDataModelFromJson(String str) =>
    FantacyDataModel.fromJson(json.decode(str));

String fantacyDataModelToJson(FantacyDataModel data) =>
    json.encode(data.toJson());

class FantacyDataModel {
  String apikey;
  AllData data;

  FantacyDataModel({
    required this.apikey,
    required this.data,
  });

  factory FantacyDataModel.fromJson(Map<String, dynamic> json) =>
      FantacyDataModel(
        apikey: json["apikey"],
        data: AllData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "apikey": apikey,
        "data": data.toJson(),
      };
}

class AllData {
  List<Inning> innings;
  List<Total> totals;

  AllData({
    required this.innings,
    required this.totals,
  });

  factory AllData.fromJson(Map<String, dynamic> json) => AllData(
        innings:
            List<Inning>.from(json["innings"].map((x) => Inning.fromJson(x))),
        totals: List<Total>.from(json["totals"].map((x) => Total.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "innings": List<dynamic>.from(innings.map((x) => x.toJson())),
        "totals": List<dynamic>.from(totals.map((x) => x.toJson())),
      };
}

class Inning {
  String inning;
  List<Total> batting;
  List<Total> bowling;
  List<Total> catching;

  Inning({
    required this.inning,
    required this.batting,
    required this.bowling,
    required this.catching,
  });

  factory Inning.fromJson(Map<String, dynamic> json) => Inning(
        inning: json["inning"],
        batting:
            List<Total>.from(json["batting"].map((x) => Total.fromJson(x))),
        bowling:
            List<Total>.from(json["bowling"].map((x) => Total.fromJson(x))),
        catching:
            List<Total>.from(json["catching"].map((x) => Total.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "inning": inning,
        "batting": List<dynamic>.from(batting.map((x) => x.toJson())),
        "bowling": List<dynamic>.from(bowling.map((x) => x.toJson())),
        "catching": List<dynamic>.from(catching.map((x) => x.toJson())),
      };
}

class Total {
  String id;
  String name;
  int points;
  List<String>? altnames;

  Total({
    required this.id,
    required this.name,
    required this.points,
    this.altnames,
  });

  factory Total.fromJson(Map<String, dynamic> json) => Total(
        id: json["id"],
        name: json["name"],
        points: json["points"],
        altnames: json["altnames"] == null
            ? []
            : List<String>.from(json["altnames"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "points": points,
        "altnames":
            altnames == null ? [] : List<dynamic>.from(altnames!.map((x) => x)),
      };
}
