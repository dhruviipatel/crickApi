import 'dart:convert';

class SeriesInfo {
  String id;
  String name;
  DateTime startDate;
  String endDate;
  int odi;
  int t20;
  int test;
  int squads;
  int matches;

  SeriesInfo({
    required this.id,
    required this.name,
    required this.startDate,
    required this.endDate,
    required this.odi,
    required this.t20,
    required this.test,
    required this.squads,
    required this.matches,
  });

  factory SeriesInfo.fromJson(Map<String, dynamic> json) => SeriesInfo(
        id: json["id"],
        name: json["name"],
        startDate: DateTime.parse(json["startDate"]),
        endDate: json["endDate"],
        odi: json["odi"],
        t20: json["t20"],
        test: json["test"],
        squads: json["squads"],
        matches: json["matches"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "startDate":
            "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
        "endDate": endDate,
        "odi": odi,
        "t20": t20,
        "test": test,
        "squads": squads,
        "matches": matches,
      };
}
