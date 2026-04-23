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

  static TextStyle h1Style(BuildContext context){
    return _textStyle(fontSize:AppTextSizes.size(context, 35, 38, 40),fontWeight: FontWeight.w500,color: AppColors.whiteColor);
  }

  static TextStyle h1StyleBlack(BuildContext context){
    return _textStyle(fontSize:AppTextSizes.size(context, 35, 38, 40),fontWeight: FontWeight.w500,color: AppColors.blackColor);
  }

  static TextStyle h3Style(BuildContext context){
    return _textStyle(fontSize:AppTextSizes.size(context, 22, 24, 26),fontWeight: FontWeight.w500,color: AppColors.textColor);
  }

  static TextStyle h5Style(BuildContext context){
    return _textStyle(fontSize:AppTextSizes.size(context, 21, 22, 24),fontWeight: FontWeight.w500,color: AppColors.textColor);
  }

  static TextStyle h5StylePrimary(BuildContext context){
    return _textStyle(fontSize:AppTextSizes.size(context, 21, 22, 24),fontWeight: FontWeight.w500,color: AppColors.primaryColor);
  }

  static TextStyle h4Style(BuildContext context){
    return _textStyle(fontSize:AppTextSizes.size(context, 28, 30, 32),fontWeight: FontWeight.w700,color: AppColors.textColor);
  }


  static TextStyle hNews(BuildContext context){
    return _textStyle(fontSize:AppTextSizes.size(context, 26, 28, 30),fontWeight: FontWeight.w600,color: AppColors.textColor);
  }

  static TextStyle insidetextfieldWrittenText(BuildContext context){
    return _textStyle(fontSize:AppTextSizes.size(context, 10, 10, 10),fontWeight: FontWeight.w500,color: AppColors.blackColor,
    );
  }

  static TextStyle textFieldWrittenText(BuildContext context){
    return _textStyle(fontSize:AppTextSizes.size(context, 11, 12, 14),fontWeight: FontWeight.w400,color: AppColors.quadrantalTextColor,
    );
  }




  static TextStyle h2Style(BuildContext context){
    return _textStyle(fontSize:AppTextSizes.size(context, 16, 18, 18),fontWeight: FontWeight.w500,color: AppColors.blackColor);
  }

  static TextStyle h2Stylewhite(BuildContext context){
    return _textStyle(fontSize:AppTextSizes.size(context, 16, 18, 18),fontWeight: FontWeight.w500,color: AppColors.whiteColor);
  }

  static TextStyle h2StylePrimary(BuildContext context){
    return _textStyle(fontSize:AppTextSizes.size(context, 16, 18, 18),fontWeight: FontWeight.w500,color: AppColors.primaryColor);
  }

  static TextStyle tableSemiBold14(BuildContext context){
    return _textStyle(fontSize:AppTextSizes.size(context, 14, 14, 14),fontWeight: FontWeight.w600,color: AppColors.whiteColor);
  }

  static TextStyle btnTwo(BuildContext context){
    return _textStyle(fontSize:AppTextSizes.size(context, 11, 12, 12),fontWeight: FontWeight.w400,color: AppColors.secondTextColor);
  }

  static TextStyle titleOne(BuildContext context){
    return _textStyle(fontSize:AppTextSizes.size(context, 11, 12, 14),fontWeight: FontWeight.w400,color: AppColors.textColor);
  }

  static TextStyle titleTwo(BuildContext context){
    return _textStyle(fontSize:AppTextSizes.size(context, 10, 10, 10),fontWeight: FontWeight.w400,color: AppColors.tertiaryTextColor);
  }

  static TextStyle medium14(BuildContext context){
    return _textStyle(fontSize:AppTextSizes.size(context, 14, 14, 14),fontWeight: FontWeight.w500,color: AppColors.secondTextColor);
  }

  static TextStyle medium16black(BuildContext context){
    return _textStyle(fontSize:AppTextSizes.size(context, 13, 15, 16),fontWeight: FontWeight.w500,color: AppColors.blackColor);
  }

  static TextStyle bodyRegular12black(BuildContext context){
    return _textStyle(fontSize:AppTextSizes.size(context, 12, 12, 12),fontWeight: FontWeight.w400,color: AppColors.blackColor);
  }

  static TextStyle h1StyleOtherModule(BuildContext context){
    return _textStyle(fontSize:AppTextSizes.size(context, 22, 24, 24),fontWeight: FontWeight.w700,color: AppColors.textColor);
  }

  static TextStyle h1StylePrimary(BuildContext context){
    return _textStyle(fontSize:AppTextSizes.size(context, 22, 24, 24),fontWeight: FontWeight.w700,color: AppColors.primaryColor);
  }

  static TextStyle h2StyleOtherModule(BuildContext context){
    return _textStyle(fontSize:AppTextSizes.size(context, 20, 20, 20),fontWeight: FontWeight.w600,color: AppColors.textColor);
  }

  static TextStyle h3StyleOtherModule(BuildContext context){
    return _textStyle(fontSize:AppTextSizes.size(context, 32, 40, 40),fontWeight: FontWeight.w600,color: AppColors.textColor);
  }

  static TextStyle h2PrimaryStyle(BuildContext context){
    return _textStyle(fontSize:AppTextSizes.size(context, 20, 20, 20),fontWeight: FontWeight.w600,color: AppColors.primaryColor);
  }

  static TextStyle h2MediumStyle(BuildContext context){
    return _textStyle(fontSize:AppTextSizes.size(context, 20, 20, 20),fontWeight: FontWeight.w500,color: AppColors.textColor);
  }

  static TextStyle logoStyle(BuildContext context){
    return _textStyle(fontSize:AppTextSizes.size(context, 22, 24, 24),fontWeight: FontWeight.w500,color: AppColors.textColor);
  }
  static TextStyle bodyRegular10(BuildContext context){
    return _textStyle(fontSize:AppTextSizes.size(context, 16, 17.5, 17.5),fontWeight: FontWeight.w400,color: AppColors.tertiaryTextColor);
  }

  static TextStyle bodySecondRegular10(BuildContext context){
    return _textStyle(fontSize:AppTextSizes.size(context, 10, 10, 10),fontWeight: FontWeight.w400,color: AppColors.tertiaryTextColor);
  }

  static TextStyle bodyRegular12(BuildContext context){
    return _textStyle(fontSize:AppTextSizes.size(context, 12, 12, 12),fontWeight: FontWeight.w400,color: AppColors.tertiaryTextColor);
  }


  static TextStyle bodyRegular12Primary(BuildContext context){
    return _textStyle(fontSize:AppTextSizes.size(context, 12, 12, 12),fontWeight: FontWeight.w400,color: AppColors.primaryColor);
  }

  static TextStyle bodyRegular14(BuildContext context){
    return _textStyle(fontSize:AppTextSizes.size(context, 14, 14, 14),fontWeight: FontWeight.w400,color: AppColors.secondTextColor);
  }

  static TextStyle bodyRegular14TabsSelected(BuildContext context){
    return _textStyle(fontSize:AppTextSizes.size(context, 14, 14, 14),fontWeight: FontWeight.w400,color: Colors.white);
  }

  static TextStyle bodyRegular14Green(BuildContext context){
    return _textStyle(fontSize:AppTextSizes.size(context, 14, 14, 14),fontWeight: FontWeight.w400,color: AppColors.completedColor);
  }

  static TextStyle bodyRegular14Primary(BuildContext context){
    return _textStyle(fontSize:AppTextSizes.size(context, 14, 14, 14),fontWeight: FontWeight.w400,color: AppColors.primaryColor);
  }

  static TextStyle bodyRegular14tertiary(BuildContext context){
    return _textStyle(fontSize:AppTextSizes.size(context, 14, 14, 14),fontWeight: FontWeight.w400,color: AppColors.tertiaryTextColor);
  }

  static TextStyle bodyRegular16(BuildContext context){
    return _textStyle(fontSize:AppTextSizes.size(context, 16, 16, 16),fontWeight: FontWeight.w400,color: AppColors.tertiaryTextColor);
  }

  static TextStyle bodyRegular16white(BuildContext context){
    return _textStyle(fontSize:AppTextSizes.size(context, 16, 16, 16),fontWeight: FontWeight.w400,color: AppColors.whiteColor);
  }

  static TextStyle footertitle(BuildContext context){
    return _textStyle(fontSize:AppTextSizes.size(context, 14, 14, 14),fontWeight: FontWeight.w400,color: AppColors.whiteColor);
  }


  static TextStyle bodyRegular16secondary(BuildContext context){
    return _textStyle(fontSize:AppTextSizes.size(context, 16, 16, 16),fontWeight: FontWeight.w400,color: AppColors.secondTextColor);
  }

  static TextStyle bodyRegular16Primary(BuildContext context){
    return _textStyle(fontSize:AppTextSizes.size(context, 16, 16, 16),fontWeight: FontWeight.w400,color: AppColors.primaryColor);
  }

  static TextStyle bodyRegular16black(BuildContext context){
    return _textStyle(fontSize:AppTextSizes.size(context, 16, 16, 16),fontWeight: FontWeight.w400,color: AppColors.blackColor);
  }

  static TextStyle bodySemiBold12(BuildContext context){
    return _textStyle(fontSize:AppTextSizes.size(context, 12, 12, 12),fontWeight: FontWeight.w600,color: AppColors.textColor);
  }

  static TextStyle bodySemiBold14(BuildContext context){
    return _textStyle(fontSize:AppTextSizes.size(context, 14, 14, 14),fontWeight: FontWeight.w600,color: AppColors.tertiaryTextColor);
  }

  static TextStyle bodySemiBold14White(BuildContext context){
    return _textStyle(fontSize:AppTextSizes.size(context, 14, 14, 14),fontWeight: FontWeight.w600,color: Colors.white);
  }

  static TextStyle bodySemiBold14black(BuildContext context){
    return _textStyle(fontSize:AppTextSizes.size(context, 14, 14, 14),fontWeight: FontWeight.w600,color: AppColors.blackColor);
  }

  static TextStyle bodySemiBold16(BuildContext context){
    return _textStyle(fontSize:AppTextSizes.size(context, 16, 16, 16),fontWeight: FontWeight.w600,color: AppColors.primaryColor);
  }

  static TextStyle medium12(BuildContext context){
    return _textStyle(fontSize:AppTextSizes.size(context, 12, 12, 12),fontWeight: FontWeight.w500,color: AppColors.textColor);
  }

  static TextStyle medium12White(BuildContext context){
    return _textStyle(fontSize:AppTextSizes.size(context, 12, 12, 12),fontWeight: FontWeight.w500,color: Colors.white);
  }

  static TextStyle medium14tableHeading(BuildContext context){
    return _textStyle(fontSize:AppTextSizes.size(context, 14, 14, 14),fontWeight: FontWeight.w500,color: AppColors.tableHeading);
  }

  static TextStyle medium14White(BuildContext context){
    return _textStyle(fontSize:AppTextSizes.size(context, 14, 14, 14),fontWeight: FontWeight.w500,color: Colors.white);
  }

  static TextStyle medium14black(BuildContext context){
    return _textStyle(fontSize:AppTextSizes.size(context, 14, 14, 14),fontWeight: FontWeight.w500,color: AppColors.textColor);
  }

  static TextStyle medium14tertiaryColor(BuildContext context){
    return _textStyle(fontSize:AppTextSizes.size(context, 14, 14, 14),fontWeight: FontWeight.w500,color: AppColors.tertiaryTextColor);
  }
  static TextStyle tableRegular14(BuildContext context){
    return _textStyle(fontSize:AppTextSizes.size(context, 14, 14, 14),fontWeight: FontWeight.w400,color: AppColors.tertiaryTextColor);
  }


  static TextStyle tableRegular14black(BuildContext context){
    return _textStyle(fontSize:AppTextSizes.size(context, 14, 14, 14),fontWeight: FontWeight.w400,color: AppColors.blackColor);
  }

  static TextStyle tableRegular14Primary(BuildContext context){
    return _textStyle(fontSize:AppTextSizes.size(context, 14, 14, 14),fontWeight: FontWeight.w400,color: AppColors.primaryColor);
  }

  static TextStyle tableMedium14(BuildContext context){
    return _textStyle(fontSize:AppTextSizes.size(context, 14, 14, 14),fontWeight: FontWeight.w500,color: AppColors.tableHeading);
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