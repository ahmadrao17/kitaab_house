import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kitaab_house/result_controller.dart';
import 'package:kitaab_house/summary.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

// ignore: must_be_immutable
class MobileScannerSimple extends StatelessWidget {
  MobileScannerSimple({required this.scan, super.key});
  String scan;
  ResultController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$scan Scanner"),
      ),
      body:
          // Center(
          //   child: Column(
          //     children: [
          //       Expanded(
          //         child: Container(
          //           margin: const EdgeInsets.all(20),
          //           child:
          MobileScanner(
        // scanWindow: Rect.fromCenter(center: , width: width, height: height),
        controller: MobileScannerController(
            // autoStart: false,
            detectionSpeed: DetectionSpeed.noDuplicates,
            returnImage: true),
        onDetect: (capture) {
          final List<Barcode> barcodes = capture.barcodes;
          final Uint8List? image = capture.image;

          if (image != null && barcodes.isNotEmpty) {
            Get.back();
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text(barcodes.first.rawValue ?? ""),
                    content: Image(image: MemoryImage(image)),
                    actions: (scan == "Product")
                        ? [
                            ElevatedButton(
                                onPressed: () {
                                  controller.productResult.value =
                                      barcodes.first.rawValue!;
                                  controller.addBook();
                                  Get.back();
                                  Get.to(SummaryData());
                                },
                                child: const Text("Next")),
                            ElevatedButton(
                                onPressed: () {
                                  controller.productResult.value =
                                      barcodes.first.rawValue!;
                                  controller.addBook();
                                  print("${controller.bookData}");
                                  Get.back();
                                  // Get.back();
                                },
                                child: const Text("Continue"))
                          ]
                        : [
                            ElevatedButton(
                                onPressed: () {
                                  controller.sourceResult.value =
                                      barcodes.first.rawValue!;
                                  Get.back();
                                  Get.to(MobileScannerSimple(scan: "Product"));
                                },
                                child: const Text("OK")),
                          ],
                  );
                });
          }
        },
      ),
      //         ),
      //       ),
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //         children: [
      //           ElevatedButton(onPressed: () {}, child: const Text("hello")),
      //           ElevatedButton(onPressed: () {}, child: const Text("hello"))
      //         ],
      //       )
      //     ],
      //   ),
      // ),
    );
  }
}
