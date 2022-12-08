import 'dart:convert';

import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/Feedback/report_feedback.dart';
import 'package:myapp/Feedback/reveiw_feedback.dart';
import 'package:myapp/Feedback/review.dart';
import 'package:http/http.dart' as http;

import 'history_feedback.dart';

class FeedBack extends StatefulWidget {
  const FeedBack({Key? key, required, required this.homeData})
      : super(key: key);

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
    controller = TabController(length: 2, vsync: this, initialIndex: 0);
    FeedbackDetailsHistory();
  }

  @override
  void dispose() {
    super.dispose();

    isLoadingState();
  }

  var jsonfeedback;
  var jsonHistoryFeedback;
  bool isLoading = true;

  Future<void> FeedbackDetailsHistory() async {
    print("api calls");
    var response = await http.get(Uri.parse(
        "http://10.0.2.2:8090/api/feedbackrecieve/${widget.homeData[0]['register_number']}"));
    print(" feedback ${response.statusCode}");
    jsonHistoryFeedback = jsonDecode(response.body);
    print(jsonHistoryFeedback);
    print(widget.homeData[0]['register_number']);
    isLoadingState();
  }

  Future<void> fedback() async {
    var response = await http
        .get(Uri.parse("http://localhost:8090/api/feedbackrecieve/2015032"));
    print(response.body);
  }

  void isLoadingState() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.green));
    jsonfeedback = fedback();
    print('fun $jsonfeedback');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff03A375),
        title: Text("FeedBack"),
        actions: [
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      Feedback_Overview(homeData: widget.homeData)));
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
          BlurryModalProgressHUD(
            inAsyncCall: isLoading,
            blurEffectIntensity: 1,
            progressIndicator: const CircularProgressIndicator(
              backgroundColor: Colors.white,
              color: Colors.green,
            ),
            dismissible: false,
            opacity: 0.3,
            color: Colors.white,
            child: History_Feedback(
              homeData: widget.homeData,
              historyData: jsonHistoryFeedback,
            ),
          ),
          Reveiw_FeddBack(
              homeData: widget.homeData, jsonfeedback: jsonfeedback),
        ],
      ),
    );
  }
}
