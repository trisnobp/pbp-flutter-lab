import 'package:counter_7/models/data.dart';
import 'package:counter_7/widgets/drawer.dart';
import 'package:flutter/material.dart';

class BudgetData extends StatelessWidget {
  const BudgetData({Key? key, required this.title}) : super(key: key);

  final String title;
  static var listData = []; // List yang akan berisi Data object (dynamic)

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        drawer: const DrawerBar(),
        body: ListView.builder(
          itemBuilder: ((context, index) {
            final Data data = listData[index];
            return Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          data.namaData,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          data.date,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          data.nominal.toString(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          data.jenisBudgeting.toString(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
          itemCount: listData.length,
        ),
      ),
    );
  }
}
