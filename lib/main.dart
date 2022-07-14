import 'package:beacon_flutter_mobapp/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      //systemNavigationBarColor: Colors.white,
      //systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //primarySwatch: Colors.black,
        //primary swatch should be a Material Color, hence the below code.
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.black
        ),
        scaffoldBackgroundColor: const Color(0xFFf1f1f1),
        inputDecorationTheme: const InputDecorationTheme(
          labelStyle: TextStyle(fontSize: 14),
          border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 2),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
