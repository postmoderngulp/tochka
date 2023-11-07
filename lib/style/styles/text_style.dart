import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Tochka_Sbora/style/styles/colors.dart';

abstract class TextStylee {
  static TextStyle main_text = TextStyle(
      color: colors.MainColor, fontFamily: "HelveticaRegular", fontSize: 14.sp);
  static TextStyle second_text = TextStyle(
      color: colors.TextColor, fontFamily: "GeometriaLight", fontSize: 12.sp);
  static TextStyle Localsecond_text = TextStyle(
      color: colors.TextColor, fontFamily: "GeometriaMedium", fontSize: 12.sp);
  static TextStyle big_second_text = TextStyle(
      color: colors.TextColor, fontFamily: "GeometriaLight", fontSize: 16.sp);
  static TextStyle white_text = TextStyle(
      color: Colors.white, fontFamily: "HelveticaRegular", fontSize: 14.sp);
  static TextStyle title_text = TextStyle(
      color: Colors.black, fontFamily: "GeometriaMedium", fontSize: 28.sp);
  static TextStyle alert_title_text = TextStyle(
      color: colors.MainColor, fontFamily: "GeometriaMedium", fontSize: 28.sp);
  static TextStyle hobby_text = TextStyle(
      color: Colors.white, fontFamily: "GeometriaMedium", fontSize: 16.sp);
  static TextStyle main_title_text = TextStyle(
      color: Colors.black, fontFamily: "GeometriaBold", fontSize: 32.sp);
  static TextStyle subAlert_title_text = TextStyle(
      color: Colors.black, fontFamily: "GeometriaMedium", fontSize: 16.sp);
  static TextStyle appBar_title_text = TextStyle(
      color: colors.MainColor, fontFamily: "GeometriaBold", fontSize: 14.sp);
  static TextStyle location_text = TextStyle(
      color: Colors.white, fontFamily: "GeometriaMedium", fontSize: 12.sp);
  static TextStyle light_location_text = TextStyle(
      color: Colors.white, fontFamily: "GeometriaLight", fontSize: 12.sp);
  static TextStyle homepage_text = TextStyle(
      color: Colors.black, fontFamily: "GeometriaMedium", fontSize: 16.sp);
  static TextStyle Banner_text = TextStyle(
      color: colors.MainColor, fontFamily: "GeometriaMedium", fontSize: 12.sp);
  static TextStyle bannerDate_text = TextStyle(
      color: colors.TextColor, fontFamily: "GeometriaMedium", fontSize: 12.sp);
  static TextStyle bannerName_text = TextStyle(
      color: Colors.black, fontFamily: "GeometriaMedium", fontSize: 14.sp);
  static TextStyle bannerGroup_text = TextStyle(
      color: colors.TextColor, fontFamily: "GeometriaMedium", fontSize: 14.sp);
  static TextStyle myWhite_text = TextStyle(
      color: Colors.white, fontFamily: "HelveticaLight", fontSize: 12.sp);
  static TextStyle myDateWhite_text = TextStyle(
      color: Colors.white, fontFamily: "HelveticaRegular", fontSize: 12.sp);
  static TextStyle NotNotification_text = TextStyle(
      color: colors.MainColor, fontFamily: "GeometriaMedium", fontSize: 16.sp);
}
