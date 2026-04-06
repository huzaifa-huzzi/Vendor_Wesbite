// Figtree Light – 100 (Mapped to 300)
//
// Figtree Light – 200 (Mapped to 300)
//
// Figtree Light – 300
//
// Figtree Regular – 400
//
// Figtree Medium – 500
//
// Figtree SemiBold – 600
//
// Figtree Bold – 700
//
// Figtree ExtraBold – 800
//
// Figtree Black – 900


import 'package:flutter/material.dart';
import 'package:vendor_website/Resources/AppColors.dart';
import 'package:vendor_website/Resources/AppTextSizes.dart';


class TTextTheme {

  static TextStyle tableSemiBold14(BuildContext context){
    return _textStyle(fontSize:AppTextSizes.size(context, 14, 14, 14),fontWeight: FontWeight.w600,color: AppColors.whiteColor);
  }





  /// Main Functions
  static TextStyle _textStyle (
      {
        double fontSize = 12,
        required FontWeight fontWeight ,
        Color ? color,
      })  {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }
}