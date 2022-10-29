import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Messages extends StatelessWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff03A375),
        title: Text("Messages"),
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
            Text(
              "You Reply :",
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
                margin: EdgeInsets.all(10),
                height: 80,
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(width: 0.5),
                        left: BorderSide(width: 0.5),
                        right: BorderSide(width: 0.5),
                        bottom: BorderSide(width: 1))),
                // color: Colors.grey,
                width: double.infinity,
                child: Text("data")),
          ],
        ),
      ),
    );
  }
}
