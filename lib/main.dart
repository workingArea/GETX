import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/Home/home_binding.dart';

import 'Home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: [
        GetPage(name: "/home", page: () => HomePage(), binding: HomeBinding()),
      ],
      initialRoute: "/home",
    );
  }
}
