import 'package:flutter/material.dart';

class BudgetPage extends StatelessWidget {
  const BudgetPage({super.key});

  @override
  Widget build(BuildContext context){
    return Center(
      child:  Text(
        "Budget Page",
        style: TextStyle(fontSize: 24,
            fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}