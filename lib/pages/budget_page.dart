import 'package:flutter/material.dart';
import '../models/category_model.dart';
import '../models/expense_model.dart';

class BudgetPage extends StatefulWidget {
  const BudgetPage({super.key});

  @override
  State<BudgetPage> createState() => _BudgetPageState();
}

class _BudgetPageState extends State<BudgetPage> {
  List<Category> categories = [];
  List<Expense> expenses = [];

  @override
  void initState() {
    super.initState();
    _loadData(); // בעתיד נטען מ־SharedPreferences
  }

  void _loadData() {
    // לדוגמה בלבד: נטען קטגוריות והוצאות מזויפות כדי להציג UI
    categories = [
      Category(id: 1, name: "טיסות", plannedBudget: 3000),
      Category(id: 2, name: "מלון", plannedBudget: 2500),
    ];

    expenses = [
      Expense(id: 1, categoryId: 1, amount: 1500, description: "טיסה הלוך", date: DateTime.now()),
      Expense(id: 2, categoryId: 1, amount: 1200, description: "טיסה חזור", date: DateTime.now()),
      Expense(id: 3, categoryId: 2, amount: 2200, description: "מלון תל אביב", date: DateTime.now()),
    ];
  }

  double _sumExpensesForCategory(int categoryId) {
    return expenses
        .where((e) => e.categoryId == categoryId)
        .fold(0.0, (sum, e) => sum + e.amount);
  }

  void _addCategory() {
    String name = "";
    String budgetStr = "";
    bool nameError = false;
    bool budgetError = false;

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setStateDialog) {
            return AlertDialog(
              title: const Text("הוסף קטגוריה"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      labelText: "שם קטגוריה *",
                      errorText: nameError ? "שדה חובה" : null,
                    ),
                    onChanged: (val) {
                      name = val;
                      if (nameError) {
                        setStateDialog(() => nameError = false);
                      }
                    },
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "תקציב מתוכנן *",
                      errorText: budgetError ? "שדה חובה / לא תקין" : null,
                    ),
                    onChanged: (val) {
                      budgetStr = val;
                      if (budgetError) {
                        setStateDialog(() => budgetError = false);
                      }
                    },
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("ביטול"),
                ),
                ElevatedButton(
                  onPressed: () {
                    final parsedBudget = double.tryParse(budgetStr);
                    setStateDialog(() {
                      nameError = name.trim().isEmpty;
                      budgetError = parsedBudget == null || parsedBudget <= 0;
                    });

                    if (!nameError && !budgetError) {
                      setState(() {
                        final newCategory = Category(
                          id: DateTime.now().millisecondsSinceEpoch,
                          name: name.trim(),
                          plannedBudget: parsedBudget!,
                        );
                        categories.add(newCategory);
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


  void _addExpense(int categoryId) {
    // כאן יופיע טופס להוספת הוצאה לקטגוריה מסוימת
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ניהול תקציב")),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          final totalSpent = _sumExpensesForCategory(category.id);
          return Card(
            margin: const EdgeInsets.all(8),
            child: ListTile(
              title: Text(category.name),
              subtitle: Text("מתוכנן: ₪${category.plannedBudget.toStringAsFixed(0)}"
                  "\nהוצאות בפועל: ₪${totalSpent.toStringAsFixed(0)}"),
              trailing: IconButton(
                icon: const Icon(Icons.add),
                onPressed: () => _addExpense(category.id),
                tooltip: "הוסף הוצאה",
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addCategory,
        tooltip: "הוסף קטגוריה",
        child: const Icon(Icons.add),
      ),
    );
  }
}
