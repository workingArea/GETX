import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/Home/home_controller.dart';

class HomePage extends StatelessWidget {
  late String title;
  late Color color;

  final controller = Get.find<HomeController>();

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xfffafafa),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(25, 16, 8, 16),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        onChanged: (value) {
                          if (value.isEmpty) {
                            controller.firstFieldValue.value = 0;
                          } else {
                            controller.firstFieldValue.value = int.parse(value);
                          }
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8, 16, 25, 16),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        onChanged: (value) {
                          if (value.isEmpty) {
                            controller.secondFieldValue.value = 0;
                          } else {
                            controller.secondFieldValue.value =
                                int.parse(value);
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Card(
                    color: Colors.transparent,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    child: Obx(
                        () => Text("Output: " + "${controller.result.value}")),
                  ),
                ),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    math_cards(
                      title: "+",
                      color: Color.fromARGB(255, 147, 198, 240),
                      onTap: '+',
                    ),
                    math_cards(
                      title: "-",
                      color: Color.fromARGB(255, 241, 228, 103),
                      onTap: '-',
                    ),
                  ]),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    math_cards(
                      title: "*",
                      color: Color.fromARGB(255, 148, 246, 152),
                      onTap: '*',
                    ),
                    math_cards(
                      title: "/",
                      color: Color.fromARGB(255, 251, 142, 178),
                      onTap: '/',
                    ),
                  ]),
            ]),
      ),
    );
  }
}

class math_cards extends StatelessWidget {
  math_cards(
      {Key? key, required this.title, required this.color, required this.onTap})
      : super(key: key);

  final String title;
  final Color color;
  late String onTap;

  final ctrl = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        if (onTap == "+") {
          ctrl.sum();
        } else if (onTap == "-") {
          ctrl.subtract();
        } else if (onTap == "*") {
          ctrl.product();
        } else {
          ctrl.division();
        }
        ;
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: SizedBox(
          height: width * 0.4,
          width: width * 0.4,
          child: Card(
              elevation: 3,
              color: Color.fromARGB(255, 47, 44, 44),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(width: 2, color: color),
              ),
              child: Center(
                child:
                    Text(title, style: TextStyle(color: color, fontSize: 35)),
              )),
        ),
      ),
    );
  }
}
