import 'package:flutter/material.dart';

class SidebarWidget extends StatelessWidget {
  const SidebarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: 30,
        top: 250,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("Home", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue, fontSize: 25)),

            SizedBox(height: 10),

            Text("My Account", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue, fontSize: 25)),

            SizedBox(height: 10),

            Text("My Orders", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue, fontSize: 25)),

            SizedBox(height: 10),

            Text("Settings", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue, fontSize: 25)),
            
          ],
        ));
  }
}
