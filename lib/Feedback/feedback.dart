import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/Feedback/reveiw_feedback.dart';
import 'package:myapp/Feedback/review.dart';

import 'history_feedback.dart';
import 'report_feedback.dart';

class FeedBack extends StatefulWidget {
  const FeedBack({Key? key, required this.homeData}) : super(key: key);

  final List<dynamic> homeData;
  @override
  State<FeedBack> createState() => _FeedBackState();
}

class _FeedBackState extends State<FeedBack>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = new TabController(length: 2, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.green));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff03A375),
        title: Text("FeedBack"),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Feedback_Overview(
                            homeData: widget.homeData,
                          )));
            },
            child: Row(
              children: [
                Icon(Icons.report_gmailerrorred),
                Container(
                    margin: EdgeInsets.all(3),
                    child: Text(
                      "Report",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ))
              ],
            ),
          )
          //IconButton(onPressed: () {}, icon: Icon(Icons.report_gmailerrorred))
        ],
        bottom: TabBar(
          indicator: UnderlineTabIndicator(
              insets: EdgeInsets.symmetric(horizontal: 16.0)),
          controller: controller,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white,
          tabs: [
            Tab(
              child: Text(
                "History",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            Tab(
              child: Text(
                "Review FeedBack",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            )
          ],
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: <Widget>[
          History_Feedback(),
          Reveiw_FeddBack(),
        ],
      ),
    );
  }
}