import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/Feedback/history_message.dart';
import 'package:myapp/Feedback/review.dart';

class History_Feedback extends StatefulWidget {
  const History_Feedback({Key? key}) : super(key: key);

  @override
  State<History_Feedback> createState() => _History_FeedbackState();
}

class _History_FeedbackState extends State<History_Feedback> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Messages()));
              },
              child: Column(
                children: <Widget>[
                  Container(
                    height: 45,
                    width: double.infinity,
                    //: 60,
                    margin: EdgeInsets.all(8),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.all(5),
                          child: CircleAvatar(
                            backgroundColor: Colors.green,
                            foregroundColor: Colors.green,
                            backgroundImage: AssetImage("images/pikkachu.jpg"),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Teacher Name",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              Text(
                                "Message Description",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 11),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 150,
                        ),
                        Text(
                          "9:30 AM",
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 1,
                  )
                ],
              ),
            );
          }),
    );
  }
}
