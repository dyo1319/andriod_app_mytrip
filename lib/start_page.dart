import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  int _currentIndex = 0;

  // final List<Widget> _pages = [
  //   ActivitiesPage(),
  //   BudgetPage(),
  //   WeatherPage(),
  //   SummaryPage(),
  // ];

  final List<Widget> _pages = [
    Center(child: Text('Home Page')),
    Center(child: Text('Search Page')),
    Center(child: Text('Add Page')),
    Center(child: Text('Profile Page')),
    Center(child: Text('Settings Page')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF02F2F6),
        foregroundColor: Colors.white,
        title: Text(
          "Curved Bottom Navigation Bar",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
          items: [
            Icon(
              Icons.event,
                size: 30,
            ),
            Icon(
              Icons.attach_money,
              size: 30,
            ),
            Icon(
              Icons.cloud,
              size: 30,
            ),
            Icon(
              Icons.pie_chart,
              size: 30,
            ),
            Icon(
              Icons.settings_outlined,
              size: 30,
            ),
          ],
          
      ),
    );
  }
}