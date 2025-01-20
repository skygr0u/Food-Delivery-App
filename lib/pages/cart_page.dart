import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/my_button.dart';
import 'package:flutter_application_1/components/my_cart_tile.dart';
import 'package:flutter_application_1/models/restaurant.dart';
import 'package:flutter_application_1/pages/payment_page.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) {
        final userCart = restaurant.cart;

        return Scaffold(
          appBar: AppBar(
            title: const Text("Cart"),
            backgroundColor: Colors.transparent,
            foregroundColor: Theme.of(context).colorScheme.inversePrimary,
            actions: [
              // clear cart button
              IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: const Text(
                                  "Are you sure you want to clear the cart"),
                              actions: [
                                //cancel button
                                TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text("Cancel")),

                                // yess button
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      restaurant.clearCart();
                                    },
                                    child: const Text("Yes")),
                              ],
                            ));
                  },
                  icon: const Icon(Icons.delete)),
            ],
          ),
          body: Column(
            children: [

              // List of cart
              Expanded(
                child: Column(
                  children: [
                    userCart.isEmpty
                        ? const Expanded(
                            child: Center(
                            child: const Text("Cart is Empty..."),
                          ))
                        : Expanded(
                            child: ListView.builder(
                              itemCount: userCart.length,
                              itemBuilder: (context, index) {
                                // Get individual cart item
                                final cartItem = userCart[index];
                
                                // Return cart tile UI
                                return MyCartTile(cartItem: cartItem);
                              },
                            ),
                          ),
                  ],
                ),
              ),
              
              // button to pay
              MyButton(onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PaymentPage())
              ), text: "Go to checkout"),

              const SizedBox(height: 25,),
            ],
          ),


        );
      },
    );
  }
}
