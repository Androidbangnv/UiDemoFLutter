import 'package:get/get.dart';

/**
 * https://github.com/cjamcu/getx-snippets-intelliJ
 */
class Controller extends GetxController {
  var count = 0.obs;
  void increment() {
    count++;
  }
}