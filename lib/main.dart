import 'package:flutter/material.dart';
import 'package:footmoney/src/themes/themes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import 'constants/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, _, __) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppConstants.appName,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: appColor),
          useMaterial3: true,
          textTheme: GoogleFonts.inriaSerifTextTheme(),
        ),
        home: Container(),
      );
    });
  }
}
