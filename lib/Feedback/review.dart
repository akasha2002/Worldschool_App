import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Report_Review extends StatefulWidget {
  const Report_Review({Key? key}) : super(key: key);

  @override
  State<Report_Review> createState() => _Report_ReviewState();
}

class _Report_ReviewState extends State<Report_Review> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff03A375),
        title: Text("Review"),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                padding: EdgeInsets.all(3),
                color: Color(0xFFC8E6C9),
                child: Text(
                  "ERP",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
            Container(
                margin: EdgeInsets.all(10),
                height: 50,
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(width: 0.1),
                        left: BorderSide(width: 0.5),
                        right: BorderSide(width: 0.5),
                        bottom: BorderSide(width: 0.1))),
                // color: Colors.grey,
                width: double.infinity,
                child: Text("data")),
            Text("Reply :"),
            SizedBox(
              height: 5,
            ),
            Container(
              margin: EdgeInsets.all(10),
              height: 150,
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(width: 0.5),
                      left: BorderSide(width: 0.5),
                      right: BorderSide(width: 0.5),
                      bottom: BorderSide(width: 0.3))),
              // color: Colors.grey,
              width: double.infinity,
              child: TextField(
                // minLines: 1,
                maxLines: 10,
                decoration:
                    InputDecoration(hintText: "Please enter the message"),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff03A375), // background
                      onPrimary: Colors.white, // foreground
                    ),
                    onPressed: () {},
                    child: Icon(Icons.send)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
