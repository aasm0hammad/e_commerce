import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../color/colors.dart';

class UiHelper {
  static Widget customText(
      {required String text, required FontWeight? fontWeight, required double fontSize, required Color color, TextAlign? textAlign}) {
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

  static customTextField({required TextEditingController controller,
    required String? hint,
    required String? label,
    required String? Function(String?)? validator,
    bool obscureText = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UiHelper.customText(
            text: label!,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Neutral.black,
            textAlign: TextAlign.start),
        SizedBox(
          height: 8,
        ),
        TextFormField(
          validator: validator,
          controller: controller,

          obscureText: obscureText,

          decoration: InputDecoration(
            filled: true,

            hintText: hint,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Primary.base, width: 1),

                borderRadius: BorderRadius.circular(11)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Neutral.black, width: 1),

                borderRadius: BorderRadius.circular(11)),

            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          ),
        ),
      ],
    );
  }

  static customButton(
      {required Widget child, required Color color, required Color textColor, required VoidCallback? onPressed,}) {
    return ElevatedButton(
      onPressed: onPressed,



      child:  child,
      style: ElevatedButton.styleFrom(
        foregroundColor: textColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30)
        ),
        textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w500,),
        backgroundColor: color,
        minimumSize: Size(double.infinity, 55),


      ),
    );
  }

}
