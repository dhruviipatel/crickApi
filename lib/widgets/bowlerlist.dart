import 'package:flutter/material.dart';

class Bowlerlist extends StatelessWidget {
  final List bowlerlist;
  const Bowlerlist({super.key, required this.bowlerlist});

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
          child: Text("Bowler",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
        ),
        Container(
          height: 30,
          color: Colors.black.withOpacity(0.7),
          child: Text("O",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
        ),
        Container(
          height: 30,
          color: Colors.black.withOpacity(0.7),
          child: Text("M",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
        ),
        Container(
          height: 30,
          color: Colors.black.withOpacity(0.7),
          child: Text("R",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
        ),
        Container(
          height: 30,
          color: Colors.black.withOpacity(0.7),
          child: Text("W",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
        ),
      ]),
      //bowler info
      for (var blr in bowlerlist)
        TableRow(children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 30,
                width: MediaQuery.of(context).size.width,
                color: Colors.grey.withOpacity(0.7),
                child: Text(blr.bowler.name,
                    style: TextStyle(fontWeight: FontWeight.w700)),
              ),
            ],
          ),
          Container(
            height: 30,
            color: Colors.grey.withOpacity(0.7),
            child:
                Text("${blr.o}", style: TextStyle(fontWeight: FontWeight.w700)),
          ),
          Container(
            height: 30,
            color: Colors.grey.withOpacity(0.7),
            child:
                Text("${blr.m}", style: TextStyle(fontWeight: FontWeight.w700)),
          ),
          Container(
            height: 30,
            color: Colors.grey.withOpacity(0.7),
            child:
                Text("${blr.r}", style: TextStyle(fontWeight: FontWeight.w700)),
          ),
          Container(
            height: 30,
            color: Colors.grey.withOpacity(0.7),
            child:
                Text("${blr.w}", style: TextStyle(fontWeight: FontWeight.w700)),
          ),
        ]),
    ]);
  }
}
