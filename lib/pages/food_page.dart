import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/my_button.dart';
import 'package:flutter_application_1/models/food.dart';
import 'package:flutter_application_1/models/restaurant.dart';
import 'package:provider/provider.dart';

class FoodPage extends StatefulWidget {
  final Food food;
  final Map<Addon, bool> selectedAddons = {};

  FoodPage({
    super.key,
    required this.food,
  }) {
    // initialize selected addons to be false
    for (Addon addon in food.availableAddons) {
      selectedAddons[addon] = false;
    }
  }

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {



  // Method to add to cart
  void addToCart(Food food, Map<Addon, bool> selectedAddons) {

      // close the current food page to go back to menu
      Navigator.pop(context);
      
      // format the selected addons
      List<Addon> currentlySelectedAddons = [];
      for (Addon addon in widget.food.availableAddons) {
          if (widget.selectedAddons[addon] == true) {
              currentlySelectedAddons.add(addon);
          }
      }

      // add to cart
      context.read<Restaurant>().addToCart(food, currentlySelectedAddons);
  }


  
  final List<bool> _addonSelections = [];

  @override
  void initState() {
    super.initState();
    _addonSelections
        .addAll(List<bool>.filled(widget.food.availableAddons.length, false));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Food image
              ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(widget.food.imagePath)
              ),

              const SizedBox(height: 10),
           
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Food name
                  Text(
                    widget.food.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),

                  //food price
                  Text(
                    '\$' + widget.food.price.toString(),
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Food description
                  Text(
                    widget.food.description,
                  ),

                  const SizedBox(height: 10),

                  Divider(
                    color: Theme.of(context).colorScheme.secondary,
                  ),

                  // Addons
                  Text(
                    "Add-ons",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 10),

                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemCount: widget.food.availableAddons.length,
                      itemBuilder: (context, index) {
                        // Get individual addons
                        Addon addon = widget.food.availableAddons[index];

                        return CheckboxListTile(
                          title: Text(addon.name),
                          subtitle: Text(
                            '\$${addon.price}',
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary),
                          ),
                          value: widget.selectedAddons[addon],
                          onChanged: (bool? value) {
                            setState(() {
                              widget.selectedAddons[addon] = value!;
                            });
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 25),
              // Button -> add to cart
              MyButton(
                onTap: () => addToCart(widget.food, widget.selectedAddons),
                text: "Add to cart",
              ),

              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}
