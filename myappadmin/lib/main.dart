import 'package:flutter/material.dart';
import 'package:myappadmin/sms.dart';
import 'package:myappadmin/users.dart';

import 'font.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 86, 102, 239),
        centerTitle: true,
        title: Center(child: Text("Mahdi HRH Admin")),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width / 2,
              height: 50,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return users();
                    }));
                  },
                  child: Text(
                    "لیست کاربران",
                    style: MyFontStyleSelect(context, "btn"),
                  )),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 2,
              height: 50,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return SMS();
                    }));
                  },
                  child: Text(
                    "تنظیمات سرویس sms",
                    textDirection: TextDirection.rtl,
                    style: MyFontStyleSelect(context, "btn"),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
