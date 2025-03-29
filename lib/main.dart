import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_quote_generator_app/providers/quote_provider.dart';
import 'package:random_quote_generator_app/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => QuoteProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,        
        home: const HomeScreen(),
      ),
    );
  }
}

