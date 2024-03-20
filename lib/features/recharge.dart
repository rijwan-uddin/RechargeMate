// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:flutter/services.dart';
//
// class Recharge extends StatefulWidget {
//   const Recharge({Key? key}) : super(key: key);
//
//   @override
//   _RechargeState createState() => _RechargeState();
// }
//
// class _RechargeState extends State<Recharge> {
//   String? selectedOperator;
//   TextEditingController phoneNumberController = TextEditingController();
//   TextEditingController amountController = TextEditingController();
//   bool phoneNumberError = false;
//
//   List<String> rechargeHistory = [];
//
//   @override
//   void initState() {
//     super.initState();
//     // Load recharge history from SharedPreferences
//     _loadRechargeHistory();
//   }
//
//   Future<void> _loadRechargeHistory() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     setState(() {
//       rechargeHistory = prefs.getStringList('rechargeHistory') ?? [];
//     });
//   }
//
//   Future<void> _saveRechargeHistory() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setStringList('rechargeHistory', rechargeHistory);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Recharge"),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.notifications),
//             onPressed: () {
//               // Handle notification button press
//             },
//           ),
//           IconButton(
//             icon: const Icon(Icons.history),
//             onPressed: () {
//               _showHistoryModalBottomSheet(context);
//             },
//           )
//         ],
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               const Text(
//                 'Select Operator',
//                 style: TextStyle(fontSize: 20, color: Colors.grey),
//               ),
//               DropdownButton<String>(
//                 hint: const Text('Operators'),
//                 value: selectedOperator,
//                 items: [
//                   'Grameen',
//                   'Banglalink',
//                   'Robi',
//                   'Airtel',
//                   'Teletalk',
//                 ].map((String value) {
//                   return DropdownMenuItem<String>(
//                     value: value,
//                     child: Text(value),
//                   );
//                 }).toList(),
//                 onChanged: (String? value) {
//                   setState(() {
//                     selectedOperator = value;
//                     // Automatically populate the phone number prefix based on the selected operator
//                     switch (selectedOperator) {
//                       case 'Grameen':
//                         phoneNumberController.text = '017';
//                         break;
//                       case 'Banglalink':
//                         phoneNumberController.text = '019';
//                         break;
//                       case 'Robi':
//                         phoneNumberController.text = '016';
//                         break;
//                       case 'Airtel':
//                         phoneNumberController.text = '018';
//                         break;
//                       case 'Teletalk':
//                         phoneNumberController.text = '015';
//                         break;
//                       default:
//                         phoneNumberController.text = '';
//                     }
//                   });
//                 },
//               ),
//               const SizedBox(height: 20),
//               Visibility(
//                 visible: selectedOperator != null,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     TextField(
//                       controller: phoneNumberController,
//                       maxLength: 11,
//                       onChanged: (value) {
//                         if (value.length != 11) {
//                           setState(() {
//                             phoneNumberError = true;
//                           });
//                         } else {
//                           setState(() {
//                             phoneNumberError = false;
//                           });
//                         }
//                       },
//                       decoration: InputDecoration(
//                         labelText: 'Phone Number',
//                         border: const OutlineInputBorder(),
//                         errorText: phoneNumberError
//                             ? 'Phone number must be 11 digits'
//                             : null,
//                       ),
//                     ),
//                     const SizedBox(height: 10),
//                     TextField(
//                       controller: amountController,
//                       decoration: const InputDecoration(
//                         labelText: 'Recharge Amount',
//                         border: OutlineInputBorder(),
//                       ),
//                     ),
//                     const SizedBox(height: 10),
//                     Wrap(
//                       spacing: 8.0,
//                       children: [
//                         _buildSuggestedAmountChip(20),
//                         _buildSuggestedAmountChip(50),
//                         _buildSuggestedAmountChip(100),
//                         _buildSuggestedAmountChip(500),
//                         _buildSuggestedAmountChip(1000),
//                       ],
//                     ),
//                     const SizedBox(height: 20),
//                     Center(
//                       child: ElevatedButton(
//                         onPressed: () {
//                           _confirmRecharge(context);
//                         },
//                         child: const Text('Confirm Recharge'),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildSuggestedAmountChip(int amount) {
//     return ActionChip(
//       label: Text('$amount tk'),
//       onPressed: () {
//         amountController.text = amount.toString();
//       },
//     );
//   }
//
//   Future<void> _confirmRecharge(BuildContext context) async {
//     final phoneNumber = phoneNumberController.text;
//     final amount = amountController.text;
//
//     if (phoneNumber.length != 11) {
//       // Show failed message for invalid phone number
//       showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: const Text('Recharge Failed'),
//             content: Text('Phone number must be exactly 11 digits.'),
//             actions: <Widget>[
//               TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//                 child: const Text('OK'),
//               ),
//             ],
//           );
//         },
//       );
//     } else {
//       // Store recharge in history and show successful message
//       rechargeHistory.add("Phone Number: $phoneNumber, Recharge Amount: $amount tk");
//       await _saveRechargeHistory(); // Save recharge history to SharedPreferences
//       showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: const Text('Recharge Successful'),
//             content: SingleChildScrollView(
//               child: ListBody(
//                 children: <Widget>[
//                   Text('Phone Number: $phoneNumber'),
//                   Text('Recharge Amount: $amount tk'),
//                 ],
//               ),
//             ),
//             actions: <Widget>[
//               TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//                 child: const Text('OK'),
//               ),
//             ],
//           );
//         },
//       );
//     }
//   }
//
//   void _showHistoryModalBottomSheet(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       builder: (BuildContext context) {
//         return Container(
//           height: MediaQuery.of(context).size.height * 0.8,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Text(
//                   'Recharge History',
//                   style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.blue,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//               Divider(
//                 height: 1,
//                 color: Colors.grey,
//               ),
//               Expanded(
//                 child: ListView.builder(
//                   itemCount: rechargeHistory.length,
//                   itemBuilder: (context, index) {
//                     return Padding(
//                       padding: const EdgeInsets.symmetric(
//                         vertical: 8.0,
//                         horizontal: 16.0,
//                       ),
//                       child: Container(
//                         padding: const EdgeInsets.all(16.0),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10),
//                           color: Colors.grey[200],
//                         ),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               'Recharge ${index + 1}',
//                               style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 18,
//                                 color: Colors.blue,
//                               ),
//                             ),
//                             SizedBox(height: 8),
//                             Text(
//                               rechargeHistory[index],
//                               style: TextStyle(
//                                 fontSize: 16,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart'; // Import for TextInputFormatter

class Recharge extends StatefulWidget {
  const Recharge({Key? key}) : super(key: key);

  @override
  _RechargeState createState() => _RechargeState();
}

class _RechargeState extends State<Recharge> {
  String? selectedOperator;
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  bool phoneNumberError = false;

  List<String> rechargeHistory = [];

  @override
  void initState() {
    super.initState();
    // Load recharge history from SharedPreferences
    _loadRechargeHistory();
  }

  Future<void> _loadRechargeHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      rechargeHistory = prefs.getStringList('rechargeHistory') ?? [];
    });
  }

  Future<void> _saveRechargeHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('rechargeHistory', rechargeHistory);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Recharge"),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Handle notification button press
            },
          ),
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () {
              _showHistoryModalBottomSheet(context);
            },
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Select Operator',
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
              DropdownButton<String>(
                hint: const Text('Operators'),
                value: selectedOperator,
                items: [
                  'Grameen',
                  'Banglalink',
                  'Robi',
                  'Airtel',
                  'Teletalk',
                ].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    selectedOperator = value;
                    // Automatically populate the phone number prefix based on the selected operator
                    switch (selectedOperator) {
                      case 'Grameen':
                        phoneNumberController.text = '017';
                        break;
                      case 'Banglalink':
                        phoneNumberController.text = '019';
                        break;
                      case 'Robi':
                        phoneNumberController.text = '016';
                        break;
                      case 'Airtel':
                        phoneNumberController.text = '018';
                        break;
                      case 'Teletalk':
                        phoneNumberController.text = '015';
                        break;
                      default:
                        phoneNumberController.text = '';
                    }
                  });
                },
              ),
              const SizedBox(height: 20),
              Visibility(
                visible: selectedOperator != null,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: phoneNumberController,
                      maxLength: 11,
                      keyboardType: TextInputType.number, // Restrict to only numbers
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0}$')), // Allow only digits
                      ],
                      onChanged: (value) {
                        if (value.length != 11) {
                          setState(() {
                            phoneNumberError = true;
                          });
                        } else {
                          setState(() {
                            phoneNumberError = false;
                          });
                        }
                      },
                      decoration: InputDecoration(
                        labelText: 'Phone Number',
                        border: const OutlineInputBorder(),
                        errorText: phoneNumberError
                            ? 'Phone number must be 11 digits'
                            : null,
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: amountController,
                      keyboardType: const TextInputType.numberWithOptions(decimal: true), // Accepts decimal numbers
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,100}$')), // Allow only digits and up to 2 decimal places
                      ],
                      decoration: const InputDecoration(
                        labelText: 'Recharge Amount',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 8.0,
                      children: [
                        _buildSuggestedAmountChip(20),
                        _buildSuggestedAmountChip(50),
                        _buildSuggestedAmountChip(100),
                        _buildSuggestedAmountChip(500),
                        _buildSuggestedAmountChip(1000),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          _confirmRecharge(context);
                        },
                        child: const Text('Confirm Recharge'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSuggestedAmountChip(int amount) {
    return ActionChip(
      label: Text('$amount tk'),
      onPressed: () {
        amountController.text = amount.toString();
      },
    );
  }

  Future<void> _confirmRecharge(BuildContext context) async {
    final phoneNumber = phoneNumberController.text;
    final amount = amountController.text;

    if (phoneNumber.length != 11) {
      // Show failed message for invalid phone number
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Recharge Failed'),
            content: const Text('Phone number must be exactly 11 digits.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      // Store recharge in history and show successful message
      rechargeHistory.add("Phone Number: $phoneNumber, Recharge Amount: $amount tk");
      await _saveRechargeHistory(); // Save recharge history to SharedPreferences
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Recharge Successful'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('Phone Number: $phoneNumber'),
                  Text('Recharge Amount: $amount tk'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  void _showHistoryModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Recharge History',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Divider(
                height: 1,
                color: Colors.grey,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: rechargeHistory.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 16.0,
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[200],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Recharge ${index + 1}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.blue,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            Text(
                              rechargeHistory[index],
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }





}
