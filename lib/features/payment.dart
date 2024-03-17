import 'package:flutter/material.dart';
class payment extends StatelessWidget {
  const payment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment"),
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
