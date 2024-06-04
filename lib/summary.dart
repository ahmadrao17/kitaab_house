import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kitaab_house/result_controller.dart';

// ignore: must_be_immutable
class SummaryData extends StatelessWidget {
  SummaryData({super.key});
  ResultController ctrl = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Summary of Data"),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              height: 600,
              child: ListView.builder(
                itemCount: ctrl.bookData.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ListTile(
                        title:
                            Text("Source: ${ctrl.bookData[index]['source']}"),
                        subtitle: Text(
                            "Product: ${ctrl.bookData[index]['product']}")),
                  );
                },
              ),
            ),
            SizedBox(
              height: 50,
              child: Wrap(
                alignment: WrapAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {}, child: const Text("Complete Now")),
                  const SizedBox(width: 20),
                  ElevatedButton(
                      onPressed: () {}, child: const Text("Complete Later")),
                  const SizedBox(width: 20),
                  ElevatedButton(
                      onPressed: () {}, child: const Text("Add more")),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
