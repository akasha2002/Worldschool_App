import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/Feedback/review.dart';

class Reveiw_FeddBack extends StatefulWidget {
  const Reveiw_FeddBack({Key? key}) : super(key: key);

  @override
  State<Reveiw_FeddBack> createState() => _Reveiw_FeddBackState();
}

class _Reveiw_FeddBackState extends State<Reveiw_FeddBack> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Report_Review()));
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
                                "professor",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 11),
                              )
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
