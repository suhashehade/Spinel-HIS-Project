import 'package:flutter/material.dart';

class CallToAction extends StatelessWidget {
  const CallToAction({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 43, 43, 43),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 108, 108, 108),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(120.0),
            bottomRight: Radius.circular(10.0),
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
        ),
        child: ListView(
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                  height: 30.0,
                  margin: const EdgeInsets.all(0),
                  decoration: const BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(100.0),
                        bottomRight: Radius.circular(0.0),
                        topLeft: Radius.circular(100.0),
                        topRight: Radius.circular(0.0),
                      ),
                      boxShadow: [
                        BoxShadow(offset: Offset(10, 0), color: Colors.red)
                      ]),
                  child: const Text('ملفي الطبي',
                      textAlign: TextAlign.end,
                      style: TextStyle(fontSize: 16.0, color: Colors.white)),
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Text('لتصفح ملفك الطبي الرجاء تسجيل الدخول أو التسجيل اللآن',
                textAlign: TextAlign.end,
                style: TextStyle(fontSize: 20.0, color: Colors.white)),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Material(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  color: Colors.red,
                  child: MaterialButton(
                    height: 20,
                    onPressed: () {},
                    child: const Text('دخول',
                        style: TextStyle(fontSize: 16.0, color: Colors.white)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
