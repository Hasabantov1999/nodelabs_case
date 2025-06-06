part of '../main.dart';

List<CleanArchTheme> get _appThemes => [
      CleanArchTheme(themeName: "light", palette: _theme),
      CleanArchTheme(
        themeName: "dark",
        palette: _theme,
      ),
    ];

ThemeData get _theme {
  return ThemeData(
      primaryColor: const Color(
        0xffE50914,
      ),
      scaffoldBackgroundColor: Colors.black,
      buttonTheme: ButtonThemeData(),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: Colors.white,
      ),
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(
          color: Colors.white54,
        ),
        errorStyle: TextStyle(
          color: Colors.white,
          fontSize: 14,
        ),
        hintStyle: TextStyle(
          color: Colors.white54,
          fontSize: 14,
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 7,
        ),
        fillColor: Colors.white10,
        filled: true,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide(color: Colors.white24)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide(color: Colors.white)),
      ),
      fontFamily: "Euclid Circular A");
}
