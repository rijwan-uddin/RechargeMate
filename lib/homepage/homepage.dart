import 'package:flutter/material.dart';

import '../features/Offers.dart';
import '../features/add balance.dart';
import '../features/balance.dart';
import '../features/payment.dart';
import '../features/recharge.dart';
import '../others/charge.dart';
import '../others/contactus.dart';
import '../others/safety.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(

        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: screenWidth,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                  ),
                  child: ClipRRect(
                    child: Image.asset(
                      'asset/RM.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const Text(
                  'Recharge Mate',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            Container(
              alignment: Alignment.centerLeft,
              child: const Text(
                '    Services',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 18,fontWeight: FontWeight.w200),
              ),
            ),
            const SizedBox(height: 20), // Add some spacing between image and buttons
            const Features(),
            const SizedBox(height: 20),
            Container(
              alignment: Alignment.centerLeft,
              child: const Text(
                '    Others',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 18,fontWeight: FontWeight.w200),
              ),
            ),
            const SizedBox(height: 20),
            otherFeatures(),
            // Add the features widget with buttons beneath the image
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white, // Background color of bottom navigation bar
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.green), // Icon color for Home
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet, color: Colors.green), // Icon color for Transactions
            label: 'Transactions',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts, color: Colors.green), // Icon color for Contacts
            label: 'Contacts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment, color: Colors.green), // Icon color for My Recharge Mate
            label: 'My Recharge Mate',
          ),
        ],
      ),



    );

  }

}
//Services
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
              MenuItem(title: 'Recharge', imagePath: 'asset/RE.png', page:  Recharge()),
              MenuItem(title: 'Balance', imagePath: 'asset/balance.png', page: balance()),

              MenuItem(title: 'Offers', imagePath: 'asset/offers.png', page: Offers()),
              MenuItem(title: 'Payment', imagePath: 'asset/pay.png', page: payment()),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MenuItem(title: 'Add Balance', imagePath: 'asset/add.png', page: addBalance()),

               // Add Spacer widget to occupy remaining space
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

//Others
class otherFeatures extends StatelessWidget {
  const otherFeatures({Key? key}) : super(key: key);

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

              others(title: 'Charge', imagePath: 'asset/char.png', page: charge()),
              others(title: 'Contact', imagePath: 'asset/conUS.png', page:  Contact()),
              others(title: 'Safety', imagePath: 'asset/safety.png', page: safety()),
              others(title: 'RM', imagePath: 'asset/pay.png', page: payment()),
            ],
          ),
        ],
      ),
    );
  }
}
class others extends StatelessWidget {
  final String title;
  final String imagePath;
  final Widget page;

  const others({
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
