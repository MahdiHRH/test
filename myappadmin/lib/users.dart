import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'font.dart';
import 'json.dart';

class users extends StatefulWidget {
  @override
  _usersState createState() => _usersState();
}

class _usersState extends State<users> {
  List<user_all> userall = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    usersget();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 86, 102, 239),
        centerTitle: true,
        title: Text(
          "لیست کاربران",
          style: MyFontStyleSelect(context, "titr"),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Container(
          child: ListView.builder(
            itemCount: userall.length,
            itemBuilder: ListUser,
          ),
        ),
      ),
    );
  }

  Widget ListUser(BuildContext context, int index) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
            child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                userall[index].mobile,
                style: MyFontStyleSelect(context, "txt"),
              ),
              Text(
                "شماره موبایل :",
                style: MyFontStyleSelect(context, "txt"),
                textDirection: TextDirection.rtl,
              ),
            ],
          ),
        )),
      ),
    );
  }

  void usersget() async {
    var url = "http://www.instasekke.ir/myapptest/admin/api.php?apicall=user_all_get";
    var body = Map<String, dynamic>();

    Response response = await post(Uri.parse(url), body: body);
    if (response.statusCode == 200) {
      //successful

      var Json = json.decode(utf8.decode(response.bodyBytes));

      Json.forEach((element) {
        setState(() {
          userall.add(user_all(data: element));
        });
      });
    } else {
      //error

    }
  }
}
