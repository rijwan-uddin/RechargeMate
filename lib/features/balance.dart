import 'package:flutter/material.dart';
class balance extends StatelessWidget {
  const balance({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Balance"),
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
