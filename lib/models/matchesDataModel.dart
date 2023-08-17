class Matches {
  String id;
  DateTime dateTimeGmt;
  String? matchType;
  String status;
  String ms;
  String t1;
  String t2;
  String t1S;
  String t2S;
  String? t1Img;
  String? t2Img;

  Matches({
    required this.id,
    required this.dateTimeGmt,
    required this.matchType,
    required this.status,
    required this.ms,
    required this.t1,
    required this.t2,
    required this.t1S,
    required this.t2S,
    this.t1Img,
    this.t2Img,
  });

  factory Matches.fromJson(Map<String, dynamic> json) => Matches(
        id: json["id"],
        dateTimeGmt: DateTime.parse(json["dateTimeGMT"]),
        matchType: json["matchType"]!,
        status: json["status"],
        ms: json["ms"],
        t1: json["t1"],
        t2: json["t2"],
        t1S: json["t1s"],
        t2S: json["t2s"],
        t1Img: json["t1img"],
        t2Img: json["t2img"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "dateTimeGMT": dateTimeGmt.toIso8601String(),
        "matchType": matchType,
        "status": status,
        "ms": ms,
        "t1": t1,
        "t2": t2,
        "t1s": t1S,
        "t2s": t2S,
        "t1img": t1Img,
        "t2img": t2Img,
      };
}
