import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:tpanime/models/collection/colors.dart';
import 'package:tpanime/models/collection/dimensions.dart';
import 'package:tpanime/pages/home.dart';
import 'package:tpanime/pages/movies.dart';

// Pages
import 'package:tpanime/pages/popular.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const PopularPage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: true,
          cardTheme: CardTheme(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              color: AppColors.cardColor,
              elevation: 1,
              shadowColor: Colors.black26,
              shape: const RoundedRectangleBorder(
                  side: BorderSide(
                      color: Colors.white,
                      width: 1,
                      strokeAlign: 0.8,
                      style: BorderStyle.solid))),
          tooltipTheme: const TooltipThemeData(
              decoration: BoxDecoration(color: Colors.black),
              textStyle: TextStyle(color: Colors.white)),
          primaryColor: AppColors.mainColor,
          cardColor: AppColors.cardColor,
          colorScheme: ColorScheme(
              primary: AppColors.mainColor,
              background: Colors.black,
              onBackground: Colors.black,
              shadow: Colors.white.withOpacity(0.5),
              brightness: Brightness.dark,
              onPrimary: AppColors.closeMain,
              secondary: AppColors.mainColor,
              onSecondary: AppColors.hoverColor,
              error: Colors.redAccent.withOpacity(0.5),
              onError: Colors.red,
              surface: AppColors.surface,
              onSurface: AppColors.onSurface),
          textTheme: TextTheme(
              displayLarge: TextStyle(
                color: AppColors.mainColor,
                fontSize: Dimensions.screenSize3,
                fontWeight: FontWeight.w500,
                overflow: TextOverflow.ellipsis,
              ),
              titleLarge: TextStyle(
                color: Colors.white,
                fontSize: Dimensions.screenSize5,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis,
                shadows: [
                  Shadow(
                      color: AppColors.textShadow,
                      offset: Offset(2, 6),
                      blurRadius: 5.0)
                ],
              ),
              titleMedium: TextStyle(
                  color: Colors.white,
                  fontSize: Dimensions.screenSize2,
                  fontWeight: FontWeight.w500,
                  overflow: TextOverflow.ellipsis,
                  shadows: [
                    Shadow(
                        color: AppColors.textShadow,
                        offset: Offset(2, 2),
                        blurRadius: 20.0)
                  ]),
              titleSmall: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w300,
                overflow: TextOverflow.ellipsis,
              ),
              labelSmall: TextStyle(
                color: Colors.white,
                fontSize: Dimensions.screenSize2,
                fontWeight: FontWeight.w400,
                overflow: TextOverflow.ellipsis,
              ),
              labelMedium: TextStyle(
                color: Colors.white,
                backgroundColor: Colors.blueAccent.withOpacity(0.5),
                fontSize: 12,
                fontWeight: FontWeight.w400,
                overflow: TextOverflow.ellipsis,
              ),
              bodySmall: TextStyle(
                color: Colors.white,
                fontSize: Dimensions.screenSize2,
                fontWeight: FontWeight.w400,
                overflow: TextOverflow.ellipsis,
              ))),
      initialRoute: 'home',
      routes: {
        "home": (context) => const HomePage(),
        "popular": (context) => const PopularPage(),
        "movies": (context) => const MoviesPage(),
        // "full": (context) => const InfoPage(infoId: "5114"),
      },
    );
  }
}
