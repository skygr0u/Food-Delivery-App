import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/my_receipt.dart';
import 'package:flutter_application_1/models/restaurant.dart';
import 'package:flutter_application_1/services/auth/database/firebase.dart';
import 'package:provider/provider.dart';

class DeliveryProgressPage extends StatefulWidget {
  const DeliveryProgressPage({super.key});

  @override
  State<DeliveryProgressPage> createState() => _DeliveryProgressPageState();
}

class _DeliveryProgressPageState extends State<DeliveryProgressPage> {
  // get acces to db
  FirestoreService db = FirestoreService();

  @override
  void initState() {
    super.initState();

    // if we get to this page we can submit order to firestore db
    String receipt = context.read<Restaurant>().displayCartReceipt();
    db.saveOrderToDatabase(receipt);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Delivery in progress.."),
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Expanded(
            child: MyReceipt(),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Icon(
                  Icons.person, // You can choose any icon you prefer
                  size: 40,
                  color: Colors.grey,
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Mitch Koko",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Driver",
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.call),
                  color: Colors.green,
                  onPressed: () {
                    // Handle call button press
                  },
                ),
                IconButton(
                  icon: Icon(Icons.message),
                  color: Colors.grey,
                  onPressed: () {
                    // Handle message button press
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
