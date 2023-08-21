import 'package:flutter/material.dart';

class TestingPage extends StatelessWidget {
  const TestingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List mylist = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0, 67, 5, 45, 4, 6];
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Text("text1"),
            Container(
              height: 50,
              child: Text("container"),
              decoration: BoxDecoration(color: Colors.grey),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: mylist.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(mylist[index].toString()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
