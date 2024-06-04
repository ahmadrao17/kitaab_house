import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kitaab_house/mobile_scanner.dart';
import 'package:kitaab_house/result_controller.dart';

class Dashboard extends StatelessWidget {
  Dashboard({super.key});

  final controller = Get.put(ResultController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scanning the Data"),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Get.to(MobileScannerSimple(
                scan: "Source",
              ));
            },
            child: const Text("Start Scanning")),
      ),
    );
  }
}
