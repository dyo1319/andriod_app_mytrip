import 'package:flutter/material.dart';
import 'start_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyTrip',
      debugShowCheckedModeBanner: false,
      locale: const Locale('he', 'IL'),
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.teal,
        fontFamily: 'Rubik',
      ),
      home: const StartPage(),
    );
  }
}
