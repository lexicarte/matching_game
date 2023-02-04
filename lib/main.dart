import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'constants.dart';
import 'home_page.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Proverbs',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.jostTextTheme(Theme.of(context).textTheme),
        primarySwatch: Colors.grey,
        appBarTheme: const AppBarTheme(
          backgroundColor: kMainBgColor,
          foregroundColor: kMainTextColor,
          elevation: 0,
        ),
        scrollbarTheme: ScrollbarThemeData(
            thickness: MaterialStateProperty.all(10),
            thumbColor: MaterialStateProperty.all(kCardBorderColor),
            radius: const Radius.circular(10),
            minThumbLength: 100),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: kMainBgColor,
            backgroundColor: kCardBorderColor, // foreground (text) color
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}
