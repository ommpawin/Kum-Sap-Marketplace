import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:kumsap_marketplace/pages/splash/splashPage.dart';
import 'package:kumsap_marketplace/style/ksFonts.dart';
import 'package:status_bar_control/status_bar_control.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Set and Make Sure Color of Statusbar color is White when using an app
    StatusBarControl.setStyle(StatusBarStyle.DARK_CONTENT);
    StatusBarControl.setColor(Colors.transparent);

    // Set up color of Theme context
    FlexSchemeColor themeColor = const FlexSchemeColor(
      primary: Color(0xff004881),
      primaryContainer: Color(0xffd0e4ff),
      secondary: Color(0xffac3306),
      secondaryContainer: Color(0xffffdbcf),
      tertiary: Color(0xff006875),
      tertiaryContainer: Color(0xff95f0ff),
      appBarColor: Color(0xffffdbcf),
      error: Color(0xffb00020),
    );

    // Declare Router provider and Set up ThemeData and Color
    return MaterialApp(
      title: 'Kum-Sap',
      themeMode: ThemeMode.light,
      theme: FlexThemeData.light(
        colors: themeColor,
        surfaceMode: FlexSurfaceMode.highScaffoldLevelSurface,
        blendLevel: 20,
        appBarOpacity: 1,
        subThemesData: const FlexSubThemesData(
          elevatedButtonSchemeColor: SchemeColor.onPrimaryContainer,
          elevatedButtonRadius: 8,
          bottomNavigationBarSelectedLabelSchemeColor: SchemeColor.onPrimary,
          bottomNavigationBarUnselectedLabelSchemeColor: SchemeColor.onTertiary,
          bottomNavigationBarSelectedIconSchemeColor: SchemeColor.onPrimary,
          bottomNavigationBarUnselectedIconSchemeColor: SchemeColor.onTertiary,
          bottomNavigationBarBackgroundSchemeColor:
              SchemeColor.onPrimaryContainer,
        ),
        keyColors: const FlexKeyColors(),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        scaffoldBackground: Colors.white,
        appBarBackground: Colors.white,
        fontFamily: KsFontFamily.ibmPlexSansThai,
      ),
      
      home: const SplashPage(),
    );
  }
}

