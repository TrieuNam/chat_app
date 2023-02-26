import 'package:camera/camera.dart';
import 'package:chap_app/Screens/CameraScreen.dart';
import 'package:chap_app/Screens/Homescreen.dart';
import 'package:flutter/material.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  cameras =await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        fontFamily: "OpenSans",
        primaryColor: Color(0xFF075E54),
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: Color(0xFF128C7E)),
      ),
      home: const HomeScreen(),
    );
  }
}
