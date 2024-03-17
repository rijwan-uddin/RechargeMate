import 'package:flutter/material.dart';
class recharge extends StatelessWidget {
  const recharge({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Recharge"),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
// Handle notification button press
            },
          ),
        ],
      ),

    );
  }
}
