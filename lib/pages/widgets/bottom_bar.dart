import 'package:flutter/material.dart';

class BottomBarWidget extends StatelessWidget {
  const BottomBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 10,
        left: 30,
        child: Row(
          children: [
            const Text("Reset Password", style: TextStyle(color: Colors.grey, fontSize: 25)),
            const SizedBox(width: 60),
            Container(
              width: 100,
              height: 40,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.blue),
              child: const Center(
                  child: Text("Log Out", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
            )
          ],
        ));
  }
}

