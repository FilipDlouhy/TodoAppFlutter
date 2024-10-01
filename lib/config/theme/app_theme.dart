import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

@immutable
class AppTheme {
  const AppTheme._();

  static final light = FlexThemeData.light(
    scheme: FlexScheme.mandyRed,
    surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
    blendLevel: 30,
    appBarStyle: FlexAppBarStyle.background,
    appBarOpacity: 1.0,
    appBarElevation: 4,
    transparentStatusBar: false,
    tabBarStyle: FlexTabBarStyle.forBackground,
    tooltipsMatchBackground: false,
    swapColors: false,
    lightIsWhite: false,
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    fontFamily: GoogleFonts.lato().fontFamily,
    subThemesData: const FlexSubThemesData(
      useTextTheme: true,
      fabUseShape: false,
      interactionEffects: false,
      bottomNavigationBarElevation: 2,
      bottomNavigationBarOpacity: 0.9,
      navigationBarOpacity: 0.9,
      navigationBarMutedUnselectedIcon: false,
      inputDecoratorIsFilled: false,
      inputDecoratorBorderType: FlexInputBorderType.underline,
      inputDecoratorUnfocusedHasBorder: false,
      blendOnColors: false,
      blendTextTheme: false,
      popupMenuOpacity: 1.0,
    ),
  );
}
