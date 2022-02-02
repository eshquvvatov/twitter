import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model.dart';

class Twitter_Home_Page extends StatefulWidget {
  const Twitter_Home_Page({Key? key}) : super(key: key);

  @override
  _Twitter_Home_PageState createState() => _Twitter_Home_PageState();
}

class _Twitter_Home_PageState extends State<Twitter_Home_Page> {
  int currentIndex = 0;
  bool ok = false;
  List text=[];
  List htext=[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: Image(
          image: AssetImage("assets/images/Account.png"),
        ),
        title: Image(
          image: AssetImage("assets/images/Twitter Logo.png"),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            alignment: Alignment.centerLeft,
            height: 20,
            width: 30,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage("assets/images/Feature stroke icon.png"),
            )),
          )
        ],
      ),
      body: ListView.separated(
        itemCount: UsesInfo().userinfo.length,
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            height: 5,
            thickness: 1,
          );
        },
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.only(left: 5, top: 10),
            width: double.infinity,
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        width: 50,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            index % 2 == 1
                                ? Icon(
                                    Icons.favorite,
                                    color: Colors.grey,
                                    size: 13,
                                  )
                                : Icon(
                                    CupertinoIcons.arrow_2_squarepath,
                                    color: Colors.grey,
                                    size: 16,
                                  ),
                            CircleAvatar(
                              radius: 25,
                              backgroundImage: AssetImage(
                                  UsesInfo().userinfo[index].userImage),
                            ),
                          ],
                        )),
                    Expanded(
                        child: Container(
                            padding: EdgeInsets.only(left: 5, right: 5),
                            child: story(index: index))),
                  ],
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        currentIndex: currentIndex,
        onTap: (int) {
          setState(() {
            currentIndex = int;
          });
        },
        items: [
          BottomNavigationBarItem(
              label: "", icon: Icon(CupertinoIcons.arrow_up_bin_fill)),
          BottomNavigationBarItem(label: "", icon: Icon(CupertinoIcons.search)),
          BottomNavigationBarItem(
              label: "", icon: Icon(Icons.notifications_outlined)),
          BottomNavigationBarItem(label: "", icon: Icon(CupertinoIcons.mail)),
        ],
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {},
            radius: 1000,

            /// bu bosilgan action tarqalish radiusi
            borderRadius: BorderRadius.circular(25),

            /// Bu bilan bosganda hosil buladigan actionga shape bera olamiz
            highlightColor: Colors.blue,
            splashColor: Colors.green,
            /// Bu bosganda shape oladigan rang
            child: Container(
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
              ),
              alignment: Alignment.center,

              height: 50,
              //color: Colors.transparent,
              child: Text(
                "+",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget story({required int index}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          UsesInfo().userinfo[index].actionUserNameList!.first.toString(),
          style: TextStyle(color: Colors.grey.shade500, fontSize: 13),
        ),
        Row(
          children: [
            Text(
              UsesInfo().userinfo[index].userName,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              UsesInfo().userinfo[index].nickName,
              style: TextStyle(fontSize: 18, color: Colors.grey.shade500),
            ),
            Text(
              UsesInfo().userinfo[index].tweetTime,
              style: TextStyle(fontSize: 18, color: Colors.grey.shade500),
            )
          ],
        ),
        Container(
          alignment: Alignment.centerLeft,
          child:!UsesInfo().userinfo[index].textContent.contains("#")?
          RichText(
              textAlign: TextAlign.start,
              text: TextSpan(
                style: TextStyle(fontSize: 18, color: Colors.black87),
                text: UsesInfo().userinfo[index].textContent
                )):RichText(
              textAlign: TextAlign.start,
              text: TextSpan(
                  style: TextStyle(fontSize: 18, color: Colors.black87),
                  children:[
                    for(var i in UsesInfo().userinfo[index].textContent.split(" "))
                      TextSpan(text: i+" ",style: i[0]=="#"?TextStyle(color: Colors.blue):TextStyle(color: Colors.black))
                  ]
              ))

        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 60),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    CupertinoIcons.chat_bubble,
                    color: Colors.grey,
                    size: 16,
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Text(
                    UsesInfo().userinfo[index].commentNumber.toString(),
                    style: TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    CupertinoIcons.arrow_2_squarepath,
                    color: Colors.grey,
                    size: 16,
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Text(
                    UsesInfo().userinfo[index].retweetNumber.toString(),
                    style: TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.favorite_border,
                    size: 16,
                    color: Colors.grey,
                  ),
                  Text(
                    UsesInfo().userinfo[index].likeNumber.toString(),
                    style: TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                ],
              ),
              Icon(
                Icons.cloud_upload_outlined,
                color: Colors.grey,
                size: 16,
              )
            ],
          ),
        )
      ],
    );
  }
}
