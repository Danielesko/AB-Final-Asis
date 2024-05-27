import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screen/principal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tbib_splash_screen/splash_screen_view.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
 

  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isLoaded = false;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2)).then((value) => setState(() {
          isLoaded = true;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      navigateWhere: isLoaded,
      navigateRoute: const Sesion(),
      text: WavyAnimatedText(
        "TuCarrito",
        textStyle: const TextStyle(
          color: Colors.red,
          fontSize: 32.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      imageSrc: "assets/images/logo.png",
      backgroundColor: Colors.grey,
    );
  }
}