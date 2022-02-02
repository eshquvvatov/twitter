class TweetModel {
  String? actionType;
  String? actionIcon;
  List<String>? actionUserNameList;
  String userImage;
  String userName;
  String nickName;
  String tweetTime;
  String textContent;
  String? contentImage;
  int commentNumber = 0;
  int retweetNumber = 0;
  int likeNumber = 0;

  TweetModel({
    this.actionType,
    this.actionIcon,
    this.actionUserNameList,
    required this.userImage,
    required this.userName,
    required this.nickName,
    required this.tweetTime,
    required this.textContent,
    this.contentImage,
    required this.commentNumber,
    required this.retweetNumber,
    required this.likeNumber,
  });
}

class UsesInfo {
  List<TweetModel> userinfo = [
    TweetModel(
        actionUserNameList:["Kieron Dotson and Zack John liked"],
        userImage: "assets/images/Round.png",
        userName: "Martha Craig",
        nickName: "@craig_love",
        tweetTime: "12h",
        textContent:
            "UXR/UR:You can only bring one item to a remote island to assint your research of native use of tools and usability.What do youbring #TellMeAboutYou",
        commentNumber: 28,
        retweetNumber: 5,
        likeNumber: 21),
    TweetModel(
        actionUserNameList:["Zack John liked"],
        userImage: "assets/images/Round (1).png",
        userName: "Maximmilian",
        nickName: "@maxjacobson",
        tweetTime: "3h",
        textContent:"Y'all ready for this  next post",
        commentNumber: 46,
        retweetNumber: 18,
        likeNumber: 363),
    TweetModel(
        actionUserNameList:["Kieron Dotson Retweeted"],
        userImage: "assets/images/Round (2).png",
        userName: "Tabitha Potter",
        nickName: "@mis_potter",
        tweetTime: "14h",
        textContent:
         "Kobe's passing is really sticking w/ me in a way I didn't expect\n \n he was an icon, the kind of person who wouldn't die this way.My wife compared it to Princess Di's axxident.\n\nBut the end can happen for anyone at any time, & I can't help but think of anything else lately.",
        commentNumber: 7,
        retweetNumber: 1,
        likeNumber: 11),
    TweetModel(
        actionUserNameList:["Zack John liked"],
        userImage: "assets/images/Round (3).png",
        userName: "Karennne",
        nickName: "@karennne",
        tweetTime: "10h",
        textContent:
          "Name a show where the lead character is the worsy character oon the show I'll go Sabrina Spellman",
        commentNumber: 1096,
        retweetNumber: 1249,
        likeNumber: 7461),
  ];
}
