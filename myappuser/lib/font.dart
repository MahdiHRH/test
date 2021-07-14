import 'package:flutter/material.dart';

MyFontStyleSelect(BuildContext context, String name) {
  // you can adjust this values according to your accuracy requirements
  var SizeWidth = MediaQuery.of(context).size.width;
  var SizeHeight = MediaQuery.of(context).size.height;

  switch (name) {
    case "btn":
      if (SizeWidth >= 595) {
        //> Tablet
        return TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: SizeWidth * .028,
          fontFamily: 'IranSans',
        );
      }
      if (SizeWidth < 595) {
        //> Mobile
        return TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: SizeWidth * .033,
          fontFamily: 'IranSans',
        );
      }
      break;

    case "txt":
      if (SizeWidth >= 595) {
        //> Tablet
        return TextStyle(
          fontSize: SizeWidth * .032,
          fontFamily: 'IranSans',
        );
      }
      if (SizeWidth < 595) {
        //> Mobile
        return TextStyle(
          fontSize: SizeWidth * .037,
          fontFamily: 'IranSans',
        );
      }
      break;

    case "titr":
      if (SizeWidth >= 595) {
        //> Tablet
        return TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: SizeWidth * .032,
          fontFamily: 'IranSans',
        );
      }
      if (SizeWidth < 595) {
        //> Mobile
        return TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: SizeWidth * .037,
          fontFamily: 'IranSans',
        );
      }
      break;

    case "textfield":
      if (SizeWidth >= 595) {
        //> Tablet
        return TextStyle(
          fontSize: SizeWidth * .028,
          fontFamily: 'IranSans',
        );
      }
      if (SizeWidth < 595) {
        //> Mobile
        return TextStyle(
          fontSize: SizeWidth * .033,
          fontFamily: 'IranSans',
        );
      }
      break;
  }
}
