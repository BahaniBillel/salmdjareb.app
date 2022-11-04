import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Ella extends StatelessWidget {
  final PageController controller = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // width: MediaQuery.of(context).size.width,
        // height: MediaQuery.of(context).size.height,
        child: PageView(
          controller: controller,
          physics: BouncingScrollPhysics(),
          children: [
            Container(),
            Column(
              children: [
                SizedBox(
                  height: 60,
                ),
                Expanded(flex: 1, child: Text("Ella Highes")),
                Expanded(
                  flex: 10,
                  child: Image.asset(
                    "images/lamp03.jpg",
                    // width: double.infinity,
                    // height: double.infinity,
                  ),
                ),
                Expanded(flex: 4, child: Container())
              ],
            ),
            Image.asset(
              "images/lamp03.jpg",
              width: double.infinity,
              height: double.infinity,
            ),
            Image.asset(
              "images/lamp03.jpg",
              width: double.infinity,
              height: double.infinity,
            ),
            Image.asset(
              "images/lamp03.jpg",
              width: double.infinity,
              height: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
