import 'package:get/get.dart';

class ResultController extends GetxController {
  RxString productResult = ''.obs;
  RxString sourceResult = ''.obs;
  var bookData = <Map<String, dynamic>>[];

  void addBook() {
    bookData
        .add({"product": productResult.value, "source": sourceResult.value});
    productResult.value = '';
    sourceResult.value = '';
  }
}
