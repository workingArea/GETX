import 'package:get/get.dart';

class HomeController extends GetxController {
  var firstFieldValue = 0.obs;
  var secondFieldValue = 0.obs;
  var operator = "".obs;
  var result = 0.obs;

  sum() {
    result.value = firstFieldValue.value + secondFieldValue.value;
  }

  subtract() {
    result.value = firstFieldValue.value - secondFieldValue.value;
  }

  product() {
    result.value = firstFieldValue.value * secondFieldValue.value;
  }

  division() {
    result.value = firstFieldValue.value / secondFieldValue.value as int;
  }
}
