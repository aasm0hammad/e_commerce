import 'package:flutter/cupertino.dart';

class UiHelper {
  static Widget customText(

  {required String text,required FontWeight? fontWeight,required double fontSize,required Color color, TextAlign? textAlign}) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontWeight: fontWeight,
        fontSize: fontSize,
        color: color,
      ),
    );
  }
}
