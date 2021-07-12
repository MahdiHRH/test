import 'package:flutter/material.dart';


class Verifi extends StatefulWidget {
  @override
  _VerifiState createState() => _VerifiState();
}

class _VerifiState extends State<Verifi> {
  var T1 = TextEditingController();
  var T2 = TextEditingController();
  var T3 = TextEditingController();
  var T4 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Center(
            child: Text(
          "Mahdi HRH",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
            fontFamily: 'IranSans',
          ),
        )),
      ),
      body: Stack(
        children: [
          Container(
              color: Colors.white,
              child: Column(
                children: [
                  Align(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 0,
                            color: Color.fromARGB(255, 86, 102, 239),
                          ),
                        ),
                      ),
                      child: Image.asset(
                        "assets/top.png",
                      ),
                    ),
                    alignment: Alignment.topCenter,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 86, 102, 239),
                        border: Border.all(
                          width: 0,
                          color: Color.fromARGB(255, 86, 102, 239),
                        ),
                      ),
                      width: MediaQuery.of(context).size.width,
                    ),
                  )
                ],
              )),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 500,
                  // color: Colors.red,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Text("کد تایید به شماره *********** ارسال شده است",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'IranSans',
                            )),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                              height: 70.0,
                              width: 70.0,
                              child: Card(
                                  color: Color.fromRGBO(173, 179, 191, 0.7),
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 10.0, right: 10.0),
                                    child: TextFieldMy("", T1),
                                  ))),
                          Container(
                              height: 70.0,
                              width: 70.0,
                              child: Card(
                                  color: Color.fromRGBO(173, 179, 191, 0.7),
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 10.0, right: 10.0),
                                    child: TextFieldMy("", T1),
                                  ))),
                          Container(
                              height: 70.0,
                              width: 70.0,
                              child: Card(
                                  color: Color.fromRGBO(173, 179, 191, 0.7),
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 10.0, right: 10.0),
                                    child: TextFieldMy("", T1),
                                  ))),
                          Container(height: 70.0, width: 70, child: Card(color: Color.fromRGBO(173, 179, 191, 0.7), child: TextFieldMy("", T1)))
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget TextFieldMy(String label, var controll) {
    return AspectRatio(
      aspectRatio: 1,
      child: Center(
        child: TextField(
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'IranSans',
          ),
          maxLines: 1,
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: const EdgeInsets.all(10.0),
            isDense: false,
          ),
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          controller: controll,
        ),
      ),
    );
  }
}
