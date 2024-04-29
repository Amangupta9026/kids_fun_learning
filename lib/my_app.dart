import 'package:flutter/material.dart';
import 'package:kids/bottomnavigation.dart';
import 'package:responsive_framework/responsive_framework.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => ResponsiveBreakpoints.builder(breakpoints: [
        const Breakpoint(start: 0, end: 450, name: MOBILE),
        const Breakpoint(start: 450, end: 800, name: TABLET),
        const Breakpoint(start: 800, end: 1000, name: TABLET),
        const Breakpoint(start: 1000, end: 1200, name: TABLET),
        const Breakpoint(start: 1200, end: 2460, name: "4K"),
      ], child: child!),
      title: "Fun Learning",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.red,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: Colors.white),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const BottomNav(),
    );
  }
}
