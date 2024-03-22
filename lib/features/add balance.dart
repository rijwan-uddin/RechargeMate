import 'package:flutter/material.dart';
import 'package:recharge_mate/features/payment.dart';
import 'package:recharge_mate/features/recharge.dart';

import 'Offers.dart';
import 'balance.dart';

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
      body: const Column(

        children: [

         Features(),
        ],
      ),
    );
  }
}

class Features extends StatelessWidget {
  const Features({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // color: Colors.white,
        borderRadius: BorderRadius.circular(40),
      ),
      child: const Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MenuItem(
                  title: 'Recharge',
                  imagePath: 'asset/RE.png',
                  page: Recharge()),
              MenuItem(
                  title: 'Balance',
                  imagePath: 'asset/balance.png',
                  page: balance()),
              MenuItem(
                  title: 'Offers',
                  imagePath: 'asset/offers.png',
                  page: Offers()),
              MenuItem(
                  title: 'Payment',
                  imagePath: 'asset/pay.png',
                  page: payment()),
            ],
          ),

        ],
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final String title;
  final String imagePath;
  final Widget page;

  const MenuItem({
    required this.title,
    required this.imagePath,
    required this.page,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        width: MediaQuery.of(context).size.width * 0.20,
        height: MediaQuery.of(context).size.width * 0.20,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          // color: Colors.white,
          boxShadow: const [
            /*BoxShadow(
              color: Colors.grey,
              spreadRadius: 1,
              blurRadius: 3,
            ),*/
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Image.asset(
                imagePath,
                width: double.infinity, // Match parent width
                height: double.infinity, // Match parent height
                // fit: BoxFit.cover, // Ensure the image fills the container
              ),
            ),
            const SizedBox(height: 5),
            Text(
              title,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
