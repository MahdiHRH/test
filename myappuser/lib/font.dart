import 'package:flutter/material.dart';




class MyFontStyle {
  // ignore: non_constant_identifier_names
  static TextTheme get Style {
    return TextTheme(

      // overline: TextStyle(
      //     fontSize: 15.0,fontFamily: 'IranSans'
      // ),
      bodyText1: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15.0,fontFamily: 'IranSans',
      ),
      bodyText2: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 17.0,fontFamily: 'IranSans',
      ),
      caption: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 12.0,
      ),
      button: TextStyle(
        fontWeight: FontWeight.bold,color: Colors.white,
        fontSize: 16.0,
      ),
      subtitle1: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16.0,fontFamily: 'IranSans',
      ),
      subtitle2: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18.0,
      ),
      headline1: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 30.0,
      ),
      headline6: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18.0,
      ),
      headline5: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 27.0,
      ),
    );
  }
}

MyFontStyleSelect(BuildContext context,String name) {
  // you can adjust this values according to your accuracy requirements
  var SizeWidth = MediaQuery.of(context).size.width;
  var SizeHeight = MediaQuery.of(context).size.height;

  switch (name) {

    case "btn":
      if (SizeWidth >= 595) { //> Tablet
        return TextStyle(
          fontWeight: FontWeight.bold,color: Colors.white,
          fontSize: SizeWidth * .028,
          fontFamily: 'IranSans',
        );
      }
      if (SizeWidth < 595) { //> Mobile
        return TextStyle(
          fontWeight: FontWeight.bold,color: Colors.white,
          fontSize: SizeWidth * .033,
          fontFamily: 'IranSans',
        );
      }
    break;

    case "txt":
      if (SizeWidth >= 595) { //> Tablet
        return TextStyle(

          fontSize: SizeWidth * .032,
          fontFamily: 'IranSans',
        );
      }
      if (SizeWidth < 595) { //> Mobile
        return TextStyle(

          fontSize: SizeWidth * .037,
          fontFamily: 'IranSans',
        );
      }
      break;

    case "peigiri_txt_titr":
      if (SizeWidth >= 595) { //> Tablet
        return TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: SizeWidth * .028,color: Colors.white,
          fontFamily: 'IranSans',
        );
      }
      if (SizeWidth < 595) { //> Mobile
        return TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: SizeWidth * .033,color: Colors.white,
          fontFamily: 'IranSans',
        );
      }
      break;

    case "peigiri_txt":
      if (SizeWidth >= 595) { //> Tablet
        return TextStyle(

          fontSize: SizeWidth * .028,
          fontFamily: 'IranSans',
        );
      }
      if (SizeWidth < 595) { //> Mobile
        return TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: SizeWidth * .033,
          fontFamily: 'IranSans',
        );
      }
      break;

    case "caption":
      if (SizeWidth >= 595) { //> Tablet
        return TextStyle(

          fontSize: SizeWidth * .032,
          fontFamily: 'IranSans',
        );
      }
      if (SizeWidth < 595) { //> Mobile
        return TextStyle(

          fontSize: SizeWidth * .036,
          fontFamily: 'IranSans',
        );
      }
      break;

    case "titr_2":
      if (SizeWidth >= 595) { //> Tablet
        return TextStyle(
          fontWeight: FontWeight.bold,color: Colors.white,
          fontSize: SizeWidth * .034,
          fontFamily: 'IranSans',
        );
      }
      if (SizeWidth < 595) { //> Mobile
        return TextStyle(
          fontWeight: FontWeight.bold,color: Colors.white,
          fontSize: SizeWidth * .042,
          fontFamily: 'IranSans',
        );
      }
      break;

    case "titr":
      if (SizeWidth >= 595) { //> Tablet
        return TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: SizeWidth * .032,
          fontFamily: 'IranSans',
        );
      }
      if (SizeWidth < 595) { //> Mobile
        return TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: SizeWidth * .037,
          fontFamily: 'IranSans',
        );
      }
      break;

    case "nokteh":
      if (SizeWidth >= 595) { //> Tablet
        return TextStyle(
          fontWeight: FontWeight.bold,color: Colors.red,
          fontSize: SizeWidth * .027,
          fontFamily: 'IranSans',
        );
      }
      if (SizeWidth < 595) { //> Mobile
        return TextStyle(
          fontWeight: FontWeight.bold,color: Colors.red,
          fontSize: SizeWidth * .03,
          fontFamily: 'IranSans',
        );
      }
      break;

    case "textfield":
      if (SizeWidth >= 595) { //> Tablet
        return TextStyle(
          fontSize: SizeWidth * .028,
          fontFamily: 'IranSans',
        );
      }
      if (SizeWidth < 595) { //> Mobile
        return TextStyle(
          fontSize: SizeWidth * .033,
          fontFamily: 'IranSans',
        );
      }
      break;

    case "textfieldhint":
      if (SizeWidth >= 595) { //> Tablet
        return TextStyle(
          fontSize: SizeWidth * .03,
          fontFamily: 'IranSans',
        );
      }
      if (SizeWidth < 595) { //> Mobile
        return TextStyle(
          fontSize: SizeWidth * .035,
          fontFamily: 'IranSans',
        );
      }
      break;

    case "pagetitle":
      if (SizeWidth >= 595) { //> Tablet
        return TextStyle(
          fontSize: SizeWidth * .035,
          fontFamily: 'IranSans',
        );
      }
      if (SizeWidth < 595) { //> Mobile
        return TextStyle(
          fontSize: SizeWidth * .043,
          fontFamily: 'IranSans',
        );
      }
      break;

    case "coin":
      if (SizeWidth >= 595) { //> Tablet
        return TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: SizeWidth * .032,
          fontFamily: 'IranSans',
        );
      }
      if (SizeWidth < 595) { //> Mobile
        return TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: SizeWidth * .037,
          fontFamily: 'IranSans',
        );
      }
      break;

    case "coinvalue":
      if (SizeWidth >= 595) { //> Tablet
        return SizeWidth * .035;

      }
      if (SizeWidth < 595) { //> Mobile
        return SizeWidth * .039;

      }
      break;

    case "radio":
      if (SizeWidth >= 595) { //> Tablet
        return TextStyle(
          fontSize: SizeWidth * .032,
          fontFamily: 'IranSans',
        );
      }
      if (SizeWidth < 595) { //> Mobile
        return TextStyle(
          fontSize: SizeWidth * .035,
          fontFamily: 'IranSans',
        );
      }
      break;

    case "label":
      if (SizeWidth >= 595) { //> Tablet
        return TextStyle(
          fontSize: SizeWidth * .033,
          fontFamily: 'IranSans',
        );
      }
      if (SizeWidth < 595) { //> Mobile
        return TextStyle(
          fontSize: SizeWidth * .035,
          fontFamily: 'IranSans',
        );
      }
      break;

    case "other1":
      if (SizeWidth >= 595) { //> Tablet
        return TextStyle(
          fontSize: SizeWidth * .053,
          fontFamily: 'IranSans',

        );
      }
      if (SizeWidth < 595) { //> Mobile
        return TextStyle(
          fontSize: SizeWidth * .063,
          fontFamily: 'IranSans',

        );
      }
      break;

  }


}


// MyFontStyleDevice(BuildContext context) {
//   var SizeWidth = MediaQuery.of(context).size.width;
//   var SizeHeight = MediaQuery.of(context).size.height;
//
//   if (SizeWidth >= 595) {
//     return SizeWidth * .028;
//   }
//   if (SizeWidth < 595) {
//     return SizeWidth * .034;
//   }
// }

MyFontStyleDevice(BuildContext context,double value1,double value2) {
  var SizeWidth = MediaQuery.of(context).size.width;
  var SizeHeight = MediaQuery.of(context).size.height;

  if (SizeWidth >= 595) {
    return SizeWidth * value1;
  }
  if (SizeWidth < 595) {
    return SizeWidth * value2;
  }
}

MyFontStyleDevice2(BuildContext context,double value1,double value2) {
  var SizeWidth = MediaQuery.of(context).size.width;
  var SizeHeight = MediaQuery.of(context).size.height;

  if (SizeWidth >= 595) {
    return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: SizeWidth * value1,
      fontFamily: 'IranSans',
    );

  }
  if (SizeWidth < 595) {
    return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: SizeWidth * value2,
      fontFamily: 'IranSans',
    );
}
}

MyFontStyleCustom(BuildContext context,double value) {
  // you can adjust this values according to your accuracy requirements


  var SizeWidth = MediaQuery.of(context).size.width;
  var SizeHeight = MediaQuery.of(context).size.height;

  return TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: SizeWidth * value,
    fontFamily: 'IranSans',
  );

}



MyFontStyleCustomColor(BuildContext context,double value) {
  // you can adjust this values according to your accuracy requirements


  var SizeWidth = MediaQuery.of(context).size.width;
  var SizeHeight = MediaQuery.of(context).size.height;

  return SizeWidth * value;


}

// MyFontStyleCustomColorChange(BuildContext context,double value) {
//   // you can adjust this values according to your accuracy requirements
//
//
//   var SizeWidth = MediaQuery.of(context).size.width;
//   var SizeHeight = MediaQuery.of(context).size.height;
//
//   return TextStyle(
//     fontWeight: FontWeight.bold,
//     fontSize: SizeWidth * value,color: Colors.white,
//     fontFamily: 'IranSans',
//   );
//
//
// }

MyUiCustom(BuildContext context,double value) {
  // you can adjust this values according to your accuracy requirements


  var SizeWidth = MediaQuery.of(context).size.width;
  var SizeHeight = MediaQuery.of(context).size.height;

  return SizeWidth * value;


}