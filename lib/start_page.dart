import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'pages/ActivitiesPage.dart';
import 'pages/BudgetPage.dart';
import 'pages/WeatherPage.dart';
import 'pages/SummaryPage.dart';


class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    ActivitiesPage(),
    BudgetPage(),
    WeatherPage(),
    SummaryPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF02F2F6),
      child: SafeArea(
        top: false,
        left: false,
        right: false,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFF02F2F6),
            foregroundColor: Colors.white,
            title: Text(
              "Curved Bottom Navigation Bar",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          body: _pages[_currentIndex],
          bottomNavigationBar: CurvedNavigationBar(
            color: Colors.teal,
            buttonBackgroundColor: Colors.teal,
            backgroundColor: Colors.transparent,
            onTap: (value) {
              setState(() {
                _currentIndex = value;
              });
            },
              items: [
                Icon(
                  _currentIndex == 0 ? Icons.event : Icons.event_outlined,
                    size: 30,
                    color: Colors.white,
                ),
                Icon(
                  _currentIndex == 0 ? Icons.attach_money : Icons.attach_money_outlined,
                  size: 30,
                  color: Colors.white,
                ),
                Icon(
                  _currentIndex == 0 ? Icons.cloud : Icons.cloud_outlined,
                  size: 30,
                  color: Colors.white,
                ),
                Icon(
                  _currentIndex == 0 ? Icons.pie_chart : Icons.pie_chart,
                  size: 30,
                  color: Colors.white,
                ),
              ],
          ),
        ),
      ),
    );
  }
}