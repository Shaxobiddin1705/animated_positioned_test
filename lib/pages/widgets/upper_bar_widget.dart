import 'package:flutter/material.dart';

class UpperBarWidget extends StatelessWidget {
  const UpperBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 40,
        left: 30,
        child: Row(
          children: [
            const CircleAvatar(child: Icon(Icons.person_outline)),

            const SizedBox(width: 10),

            const Text("User name", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),

            const SizedBox(width: 80),

            Container(
              width: 100,
              height: 40,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.blue),
              child: const Center(child: Text("View Profile", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
            )
          ],
        ));
  }
}
