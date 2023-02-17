import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


final ThemeData kDarkTheme = _buildDarkTheme();

ThemeData _buildDarkTheme() {
  final ThemeData base = ThemeData.light();

  const ColorScheme _shrineColorScheme = ColorScheme(
    primary: Color(0XffF2A52),
    onPrimary: Color(0xff1F2A52),
    secondary:Color(0XFF8DAB7F),
    onSecondary: Color(0xffEAEEF2),
    surface: Color(0xffF3E8E9),
    onSecondaryContainer: Color(0xffF2F4F7),
    onTertiary: Color(0xff1F2A52),
    onTertiaryContainer: Color(0xff495E93),
    brightness: Brightness.light,
      outline: Colors.black,
      error:Colors.red,
      onError:Colors.white,
      background: Colors.grey,
      onBackground:Colors.white60,
      onSurface:Colors.white70,
  );
  return base.copyWith(
    colorScheme: _shrineColorScheme,
    cardColor: Colors.grey[100],
    dividerColor:Colors.black,
    drawerTheme: DrawerThemeData(
      backgroundColor: Color(0xff32429A)
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xff32429A),
    ),


    scrollbarTheme: ScrollbarThemeData(
      thumbColor: MaterialStateProperty.all(Color(0Xff3C5233),),
      thumbVisibility: MaterialStateProperty.all(true,),
      interactive: true

    ),

    scaffoldBackgroundColor: Colors.white,
    buttonTheme: ButtonThemeData(
      buttonColor: Color(0xff32429A),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor:MaterialStateProperty.all<Color>(Color(0xffB45156),),
        shadowColor:
        MaterialStateProperty.all(Colors.transparent),

      ),
    ),



    iconTheme: IconThemeData(color: Colors.black),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Color(0xff32429A),
        splashColor: Colors.greenAccent),
    textTheme: TextTheme(
        headline6: GoogleFonts.poppins(
            color: Colors.black, textStyle: TextStyle(color: Colors.black)),
        bodyText1: GoogleFonts.poppins(
            color: Colors.black, textStyle: TextStyle(color: Colors.black)),
        bodyText2: GoogleFonts.poppins(
            color: Colors.black, textStyle: TextStyle(color: Colors.black)),
        subtitle1: GoogleFonts.poppins(
            color: Colors.black, textStyle: TextStyle(color: Colors.black)),
        subtitle2: GoogleFonts.poppins(
            color: Colors.black, textStyle: TextStyle(color: Colors.black)),
        headline4: GoogleFonts.poppins(
          color: Colors.black,
        ),
        caption: GoogleFonts.poppins(
          color: Colors.black,
        ),
        overline: GoogleFonts.poppins(
          color: Colors.black,
        ),
        button: GoogleFonts.poppins(
          color: Colors.black,
        )),
    cardTheme: CardTheme(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16), topRight: Radius.circular(16)),
      ),
    ),
  );
}
