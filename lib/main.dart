import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_state_provider/modal/shop.dart';
import 'package:flutter_state_provider/pages/cart.dart';
import 'package:flutter_state_provider/pages/intro_page.dart';
import 'package:flutter_state_provider/pages/menu.dart';
import 'package:provider/provider.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(ChangeNotifierProvider(
    create: (BuildContext context) => Shop(),
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => Shop())],
      child: MaterialApp(
        title: 'Taste of India',
        home: const IntroPage(),
        routes: {
          './menu': (context) => const Menu(),
          './cart': (context) => const Cart(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
