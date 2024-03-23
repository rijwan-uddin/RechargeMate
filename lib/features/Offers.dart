import 'package:flutter/material.dart';
import 'package:recharge_mate/features/youroffer/Minute.dart';

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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Padding(
                
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Your Offers',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
            ),
            SizedBox(
              height: 40, // Reduced height
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    OfferButton(
                      label: 'Minute',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Minute()),
                        );
                      },
                    ),
                    OfferButton(
                      label: 'MB',
                      onTap: () {
                        // Handle onTap for 2.MB
                        Navigator.pushNamed(context, '/mb');
                      },
                    ),
                    OfferButton(
                      label: 'SMS',
                      onTap: () {
                        // Handle onTap for 3.SMS
                        Navigator.pushNamed(context, '/sms');
                      },
                    ),
                    OfferButton(
                      label: 'Combo',
                      onTap: () {
                        // Handle onTap for 4.Combo
                        Navigator.pushNamed(context, '/combo');
                      },
                    ),
                    OfferButton(
                      label: 'Bundle',
                      onTap: () {
                        // Handle onTap for 5.Bundle
                        Navigator.pushNamed(context, '/bundle');
                      },
                    ),
                    OfferButton(
                      label: 'Bundle',
                      onTap: () {
                        // Handle onTap for 5.Bundle
                        Navigator.pushNamed(context, '/bundle');
                      },
                    ),
                    OfferButton(
                      label: 'Bundle',
                      onTap: () {
                        // Handle onTap for 5.Bundle
                        Navigator.pushNamed(context, '/bundle');
                      },
                    ),
                    OfferButton(
                      label: 'Bundle',
                      onTap: () {
                        // Handle onTap for 5.Bundle
                        Navigator.pushNamed(context, '/bundle');
                      },
                    ),
                    OfferButton(
                      label: 'Bundle',
                      onTap: () {
                        // Handle onTap for 5.Bundle
                        Navigator.pushNamed(context, '/bundle');
                      },
                    ),
                  ],
                ),
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
  final VoidCallback onTap;

  const OfferButton({
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0), // Adjust padding as needed
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              label,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
