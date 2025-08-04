import 'package:flutter/material.dart';

class ActivitiesPage extends StatelessWidget {
  const ActivitiesPage({super.key});

  @override
  Widget build(BuildContext context){
    return Center(
      child:  Text(
        "Activites Page",
        style: TextStyle(fontSize: 24,
        fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}