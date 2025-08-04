import 'package:flutter/material.dart';

class ActivitiesPage extends StatefulWidget {
  const ActivitiesPage({super.key});

  @override
  State<ActivitiesPage> createState() => _ActivitiesPageState();
}

class _ActivitiesPageState extends State<ActivitiesPage> {
  List<Map<String, dynamic>> activities = [];

  void _addActivity() {
    String newTitle = "";
    DateTime? selectedDate;
    TimeOfDay? selectedTime;

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              title: const Text("הוסף פעילות"),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // שם פעילות
                    TextField(
                      autofocus: true,
                      decoration: const InputDecoration(
                        labelText: "שם הפעילות",
                      ),
                      onChanged: (value) {
                        newTitle = value;
                      },
                    ),
                    const SizedBox(height: 16),

                    // בחירת תאריך
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          selectedDate == null
                              ? "לא נבחר תאריך"
                              : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
                        ),
                        TextButton(
                          onPressed: () async {
                            DateTime? date = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2020),
                              lastDate: DateTime(2070),
                            );
                            if (date != null) {
                              setDialogState(() {
                                selectedDate = date;
                              });
                            }
                          },
                          child: const Text("בחר תאריך"),
                        ),
                      ],
                    ),

                    // בחירת שעה
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          selectedTime == null
                              ? "לא נבחרה שעה"
                              : "${selectedTime!.hour}:${selectedTime!.minute.toString().padLeft(2, '0')}",
                        ),
                        TextButton(
                          onPressed: () async {
                            TimeOfDay? time = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            );
                            if (time != null) {
                              setDialogState(() {
                                selectedTime = time;
                              });
                            }
                          },
                          child: const Text("בחר שעה"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("ביטול"),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (newTitle.trim().isNotEmpty &&
                        selectedDate != null &&
                        selectedTime != null) {
                      setState(() {
                        activities.add({
                          'title': newTitle.trim(),
                          'date': selectedDate,
                          'time': selectedTime,
                        });
                      });
                      Navigator.pop(context);
                    }
                  },
                  child: const Text("שמור"),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: activities.isEmpty
          ? const Center(child: Text('אין פעילויות עדיין'))
          : ListView.builder(
        itemCount: activities.length,
        itemBuilder: (context, index) {
          var activity = activities[index];
          var date = activity['date'] as DateTime;
          var time = activity['time'] as TimeOfDay;

          return ListTile(
            leading: const Icon(Icons.event_note),
            title: Text(activity['title']),
            subtitle: Text(
                "${date.day}/${date.month}/${date.year} - ${time.hour}:${time.minute.toString().padLeft(2, '0')}"),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addActivity,
        backgroundColor: Colors.teal,
        child: const Icon(Icons.add),
        tooltip: 'הוסף פעילות',
      ),
    );
  }
}
