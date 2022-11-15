import 'package:counter_7/pages/budget_data.dart';
import 'package:counter_7/pages/budget_form.dart';
import 'package:counter_7/pages/counter7_page.dart';
import 'package:flutter/material.dart';

class DrawerBar extends StatelessWidget {
  const DrawerBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
          children: [
            ListTile(
              title: const Text('counter_7'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Counter7(title: "Program Counter")),
                );
              },
            ),
            ListTile(
              title: const Text('Tambah Budget'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const BudgetForm(title: "Form Budget")),
                );
              },
            ),
            ListTile(
              title: const Text('Data Budget'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const BudgetData(title: "Data Budget")),
                );
              },
            ),
          ],
        ),
    );
  }
}
