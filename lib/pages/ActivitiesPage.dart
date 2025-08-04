import 'package:flutter/material.dart';

class ActivitiesPage extends StatefulWidget {
  const ActivitiesPage({super.key});

  @override
  State<ActivitiesPage> createState() => _ActivitiesPageState();
}

class _ActivitiesPageState extends State<ActivitiesPage> {
  List<String> activities = [];

  void _addActivity(String newActivity) {
    setState(() {
      activities.add(newActivity);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: activities.isEmpty
          ? const Center(child: Text('אין פעילויות עדיין'))
          : ListView.builder(
          itemCount: activities.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: const Icon(Icons.event_note),
              title: Text(activities[index]),
            );
          },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addActivity('פעילות חדשה');
        },
        backgroundColor: Colors.teal,
        child: const Icon(Icons.add),
        tooltip: 'הוסף פעילות',
      ),
    );
  }
}