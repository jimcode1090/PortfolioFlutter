import 'package:client/src/auth/sign_in_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
          primarySwatch: Colors.green,
          scaffoldBackgroundColor: Colors.white.withAlpha(190),
          useMaterial3: false
      ),
      debugShowCheckedModeBanner: false,
      home: const SignInScreen()
    );
  }
}

