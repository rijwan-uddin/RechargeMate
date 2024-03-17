import 'package:flutter/material.dart';
class addBalance extends StatelessWidget {
  const addBalance({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Balance"),
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
