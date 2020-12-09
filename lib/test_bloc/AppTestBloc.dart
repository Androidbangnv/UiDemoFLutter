import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_demo_1/test_bloc/ContrllerGet.dart';

void main() => runApp(GetMaterialApp(
      home: TestBloc(),
    ));

class TestBloc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Instantiate your class using Get.put() to make it available for all "child" routes there.
    final Controller c = Get.put(Controller());

    return Scaffold(
        appBar: AppBar(
          title: Obx(() => Text("click : ${c.count}")),
        ),
        body: Center(
            child: RaisedButton(
                child: Text("Go to Other"), onPressed: () => Get.to(Other()))),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add), onPressed: c.increment));
  }
}

class Other extends StatelessWidget {
  // You can ask Get to find a Controller that is being used by another page and redirect you to it.
  final Controller c = Get.find();

  @override
  Widget build(context) {
    // Access the updated count variable
    return Scaffold(body: Center(child: Text("${c.count}")));
  }
}
