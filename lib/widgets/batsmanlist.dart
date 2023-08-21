import 'package:flutter/material.dart';

class Batsmanlist extends StatelessWidget {
  final List batsmanlist;
  const Batsmanlist({super.key, required this.batsmanlist});

  @override
  Widget build(BuildContext context) {
    return Table(columnWidths: const <int, TableColumnWidth>{
      0: FlexColumnWidth(4),
      1: FlexColumnWidth(1.5),
      2: FlexColumnWidth(),
      3: FlexColumnWidth(),
      4: FlexColumnWidth(),
    }, children: [
      TableRow(children: [
        Container(
          height: 30,
          color: Colors.black.withOpacity(0.7),
          child: Text("Batsman",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
        ),
        Container(
          height: 30,
          color: Colors.black.withOpacity(0.7),
          child: Text("R(B)",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
        ),
        Container(
          height: 30,
          color: Colors.black.withOpacity(0.7),
          child: Text("4s",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
        ),
        Container(
          height: 30,
          color: Colors.black.withOpacity(0.7),
          child: Text("6s",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
        ),
        Container(
          height: 30,
          color: Colors.black.withOpacity(0.7),
          child: Text("SR",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
        ),
      ]),
      for (var bman in batsmanlist)
        TableRow(children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 30,
                width: MediaQuery.of(context).size.width,
                color: Colors.grey.withOpacity(0.7),
                child: Text(bman.batsman.name,
                    style: TextStyle(fontWeight: FontWeight.w700)),
              ),
              Container(
                height: 40,
                child: Text(bman.dismissalText,
                    style: TextStyle(fontWeight: FontWeight.w400)),
              ),
            ],
          ),
          Container(
            height: 30,
            color: Colors.grey.withOpacity(0.7),
            child: Text("${bman.r}(${bman.b})",
                style: TextStyle(fontWeight: FontWeight.w700)),
          ),
          Container(
            height: 30,
            color: Colors.grey.withOpacity(0.7),
            child: Text("${bman.the4S}",
                style: TextStyle(fontWeight: FontWeight.w700)),
          ),
          Container(
            height: 30,
            color: Colors.grey.withOpacity(0.7),
            child: Text("${bman.the6S}",
                style: TextStyle(fontWeight: FontWeight.w700)),
          ),
          Container(
            height: 30,
            color: Colors.grey.withOpacity(0.7),
            child: Text("${bman.sr}",
                style: TextStyle(fontWeight: FontWeight.w700)),
          ),
        ]),
    ]);
  }
}
