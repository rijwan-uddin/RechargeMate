import 'package:flutter/material.dart';

class Offers extends StatelessWidget {
  const Offers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Offers"),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Handle notification button press
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Your Offers',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
            SizedBox(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  SizedBox(width: 8),
                  OfferButton(label: 'Minute'),
                  SizedBox(width: 8),
                  OfferButton(label: '  MB  '),
                  SizedBox(width: 8),
                  OfferButton(label: '  SMS '),
                  SizedBox(width: 8),
                  OfferButton(label: 'Combo'),
                  SizedBox(width: 8),
                  OfferButton(label: 'Bundle'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OfferButton extends StatelessWidget {
  final String label;

  const OfferButton({required this.label});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Handle button press
      },
      child: Text(label),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        primary: Colors.blue,
        textStyle: const TextStyle(fontSize: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}

