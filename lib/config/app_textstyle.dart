import 'package:flutter/material.dart';
import 'package:project_structure/config/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {
  static TextStyle appBarTitle = GoogleFonts.poppins(color: AppColors.kBlack, fontSize: 23, fontWeight: FontWeight.bold);
  static TextStyle balance = GoogleFonts.poppins(
      color: AppColors.kBlack, fontSize: 17, fontWeight: FontWeight.normal);
  static TextStyle regular =GoogleFonts.poppins(
    fontSize: 14,
    color: AppColors.kBlack,
    fontWeight: FontWeight.w500,
  );
  static TextStyle bold = GoogleFonts.poppins(
    fontSize: 14,
    color: AppColors.kBlack,
    fontWeight: FontWeight.bold,
  );
  static TextStyle semiBold =GoogleFonts.poppins(
    fontSize: 14,
    color: AppColors.kBlack,
    fontWeight: FontWeight.w600,
  );
  static TextStyle medium =GoogleFonts.poppins(
    fontSize: 14,
    color: AppColors.kBlack,
    fontWeight: FontWeight.w400,
  );
}
