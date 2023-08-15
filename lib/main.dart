import 'package:flutter/material.dart';
import 'package:tpanime/pages/info.dart';
import 'package:tpanime/pages/movies.dart';

// Pages
import 'package:tpanime/pages/popular.dart';

void main() {
  runApp(const MyApp());
}

Color mainColor = Color.fromARGB(255, 0, 208, 255);
Color cardColor = Color.fromARGB(180, 0, 0, 0);
Color hoverColor = Color.fromARGB(144, 140, 202, 219);
Color borderColor = Color.fromARGB(64, 158, 158, 158);
// Color shadowColor = Color.fromARGB(176, 0, 0, 0);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PopularPage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: true,
          cardTheme: CardTheme(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              color: cardColor,
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
          primaryColor: mainColor,
          cardColor: cardColor,
          colorScheme: ColorScheme(
              primary: mainColor,
              background: Colors.black,
              onBackground: Colors.black,
              shadow: Colors.white.withOpacity(0.5),
              brightness: Brightness.dark,
              onPrimary: const Color.fromARGB(255, 207, 21, 21),
              secondary: Colors.blueAccent,
              onSecondary: Colors.white,
              error: Colors.red,
              onError: Colors.white,
              surface: Colors.black,
              onSurface: Colors.white),
          textTheme: TextTheme(
              displayLarge: TextStyle(
                color: mainColor,
                fontSize: 26,
                fontWeight: FontWeight.w500,
                overflow: TextOverflow.ellipsis,
              ),
              titleLarge: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis,
                shadows: [
                  Shadow(
                      color: Color.fromARGB(176, 0, 0, 0),
                      offset: Offset(1, 1),
                      blurRadius: 5.0)
                ],
              ),
              titleMedium: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  overflow: TextOverflow.ellipsis,
                  shadows: [
                    Shadow(
                        color: Colors.black,
                        offset: Offset(8, 5),
                        blurRadius: 20.0)
                  ]),
              titleSmall: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w300,
                overflow: TextOverflow.ellipsis,
                shadows: [
                  Shadow(
                      color: Colors.black,
                      offset: Offset(2, 3),
                      blurRadius: 30.0)
                ],
              ),
              labelSmall: const TextStyle(
                color: Colors.white,
                fontSize: 14,
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
              bodySmall: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w400,
                overflow: TextOverflow.ellipsis,
              ))),
      initialRoute: 'full',
      routes: {
        "popular": (context) => const PopularPage(),
        "movies": (context) => const MoviesPage(),
        "full": (context) => const InfoPage(infoId: "5114"),
      },
    );
  }
}
