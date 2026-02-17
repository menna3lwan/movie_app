import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie App',
      home: Scaffold(
        appBar: AppBar(title: const Text('Movie App')),
        body: const Center(child: Text('Welcome to the Movie App!')),
      ),
    );
  }
}

// 1- add package flutter_native_splash in pubspec.yaml part of dependencies
// 2- design splash android and ios screens
//    download splash images (icon) in assets folder say splash_ios_android_11.png
// 3- design splash android 12 screen
//    # in figma create frame w:640 h:640 and r:320
//    # create new frame w:960 h:960
// 4- create file in rote app flutter_native_splash.yaml
