import 'package:flutter/material.dart';
class Offers extends StatelessWidget {
  const Offers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Offers"),
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
