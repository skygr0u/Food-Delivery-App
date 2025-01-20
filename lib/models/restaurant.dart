import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/cart_item.dart';
import 'package:intl/intl.dart';

import 'food.dart';

class Restaurant extends ChangeNotifier {
  // list of food menu
  final List<Food> _menu = [
    // burgers
    Food(
      name: "Classic Cheeseburger",
      description:
          "A juicy beef patty with melted cheddar, lettuce, tomato, and a hint of onion and pickle.",
      imagePath: "lib/images/burgers/Classic Cheeseburger.jpg",
      price: 0.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra cheese", price: 0.99),
        Addon(name: "Bacon", price: 1.99),
        Addon(name: "Avocado", price: 2.99),
      ],
    ),
    Food(
      name: "Bacon Deluxe Burger",
      description:
          "A beef patty topped with crispy bacon, melted cheddar, lettuce, tomato, and a special sauce.",
      imagePath: "lib/images/burgers/Bacon Avocado Burger.jpg",
      price: 1.49,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra bacon", price: 1.99),
        Addon(name: "Fried egg", price: 0.99),
        Addon(name: "Jalapeños", price: 0.99),
      ],
    ),
    Food(
      name: "Veggie Burger",
      description:
          "A plant-based patty with lettuce, tomato, avocado, and a tangy mayo sauce.",
      imagePath: "lib/images/burgers/Spicy Jalapeño Burger.jpg",
      price: 1.29,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra avocado", price: 1.99),
        Addon(name: "Grilled mushrooms", price: 0.99),
        Addon(name: "Caramelized onions", price: 0.99),
      ],
    ),

    // salads
    Food(
      name: "Caesar Salad",
      description:
          "Crisp romaine lettuce, crunchy croutons, shaved Parmesan cheese, and Caesar dressing.",
      imagePath: "lib/images/salads/Caesar Salad.jpg",
      price: 2.99,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Grilled chicken", price: 2.99),
        Addon(name: "Shrimp", price: 3.99),
        Addon(name: "Avocado", price: 1.99),
      ],
    ),
    Food(
      name: "Greek Salad",
      description:
          "Fresh greens, Kalamata olives, feta cheese, cucumbers, tomatoes, and red onions with a Greek vinaigrette.",
      imagePath: "lib/images/salads/Greek Salad.jpg",
      price: 2.79,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Grilled chicken", price: 2.99),
        Addon(name: "Shrimp", price: 3.99),
        Addon(name: "Avocado", price: 1.99),
      ],
    ),
    Food(
      name: "Caprese Salad",
      description:
          "Fresh mozzarella, ripe tomatoes, basil leaves, and a balsamic glaze.",
      imagePath: "lib/images/salads/Caprese Salad.jpg",
      price: 3.49,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Grilled chicken", price: 2.99),
        Addon(name: "Shrimp", price: 3.99),
        Addon(name: "Avocado", price: 1.99),
      ],
    ),

    // sides
    Food(
      name: "French Fries",
      description: "Crispy golden fries seasoned to perfection.",
      imagePath: "lib/images/sides/Fries.jpg",
      price: 1.49,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Cheese sauce", price: 0.99),
        Addon(name: "Bacon bits", price: 1.49),
        Addon(name: "Sour cream", price: 0.99),
      ],
    ),
    Food(
      name: "Onion Rings",
      description: "Crispy onion rings with a tangy dipping sauce.",
      imagePath: "lib/images/sides/Onion Rings.jpg",
      price: 1.99,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Cheese sauce", price: 0.99),
        Addon(name: "Bacon bits", price: 1.49),
        Addon(name: "Sour cream", price: 0.99),
      ],
    ),
    Food(
      name: "Mozzarella Sticks",
      description: "Crispy mozzarella sticks served with marinara sauce.",
      imagePath: "lib/images/sides/Cheese Balls..jpg",
      price: 2.49,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Cheese sauce", price: 0.99),
        Addon(name: "Bacon bits", price: 1.49),
        Addon(name: "Sour cream", price: 0.99),
      ],
    ),

    // desserts
    Food(
      name: "Chocolate Lava Cake",
      description:
          "A rich chocolate cake with a molten center, served with whipped cream.",
      imagePath: "lib/images/desserts/Chocolate Lava Cake.jpg",
      price: 3.99,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Vanilla ice cream", price: 1.49),
        Addon(name: "Caramel sauce", price: 0.99),
        Addon(name: "Whipped cream", price: 0.99),
      ],
    ),
    Food(
      name: "New York Cheesecake",
      description:
          "Creamy cheesecake with a graham cracker crust, served with a berry compote.",
      imagePath: "lib/images/desserts/trawberry Shortcake.jpg",
      price: 3.79,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Vanilla ice cream", price: 1.49),
        Addon(name: "Caramel sauce", price: 0.99),
        Addon(name: "Whipped cream", price: 0.99),
      ],
    ),
    Food(
      name: "Tiramisu",
      description:
          "Layers of coffee-soaked ladyfingers and mascarpone cheese, dusted with cocoa powder.",
      imagePath: "lib/images/desserts/Tiramisu.jpg",
      price: 4.49,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Vanilla ice cream", price: 1.49),
        Addon(name: "Caramel sauce", price: 0.99),
        Addon(name: "Whipped cream", price: 0.99),
      ],
    ),

    // drinks
    Food(
      name: "Classic Coke",
      description: "A refreshing classic Coca-Cola.",
      imagePath: "lib/images/drinks/Ice-Cold Cola..jpg",
      price: 0.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Extra ice", price: 0.00),
        Addon(name: "Lemon slice", price: 0.00),
      ],
    ),
    Food(
      name: "Chocolate Milkshake",
      description: "A Chocolate Milkshake with a hint of lemon.",
      imagePath: "lib/images/drinks/Chocolate Milkshake.jpg",
      price: 1.49,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Extra ice", price: 0.00),
        Addon(name: "Lemon slice", price: 0.00),
      ],
    ),
    Food(
      name: "Mango Smoothie",
      description: "A creamy and tropical mango smoothie.",
      imagePath: "lib/images/drinks/Mango Smoothie..jpg",
      price: 2.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Extra ice", price: 0.00),
        Addon(name: "Lemon slice", price: 0.00),
      ],
    ),
  ];

  // user cart
  final List<CartItem> _cart = [];

  // delivery adresse
  String _deliveryAdresse = '99 Hollywood Blv';

  // GETTERS
  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;
  String get DeliveryAdresse => _deliveryAdresse;

  // Operations

  // add to cart
  void addToCart(Food food, List<Addon> selectedAddons) {
    // see if there is a cart item already with the same food and selected addons
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      //check if the food items are the same
      bool isSameFood = item.food == food;

      // check if the list of selected addons are the same
      bool isSameAddons =
          ListEquality().equals(item.selectedAddons, selectedAddons);

      return isSameAddons && isSameAddons;
    });

    // if item already exists, increase it's quantity
    if (cartItem != null) {
      cartItem.quantity++;
    }

    // otherwise, add a new cart item to the cart
    else {
      _cart.add(
        CartItem(food: food, selectedAddons: selectedAddons),
      );
    }

    notifyListeners();
  }

  // remove from cart
  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);

    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.remove(cartIndex);
      }
    }
    notifyListeners();
  }

  void incrementQuantity(CartItem cartItem) {
    cartItem.quantity++;
    notifyListeners();
  }

  void decrementQuantity(CartItem cartItem) {
    if (cartItem.quantity > 1) {
      cartItem.quantity--;
      notifyListeners();
    }
  }

  // get total price of cart
  double getTotalPrice() {
    double total = 0.0;

    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;

      for (Addon addon in cartItem.selectedAddons) {
        itemTotal += addon.price;
      }

      total += itemTotal * cartItem.quantity;
    }

    return total;
  }

  // Get the total number of items in the cart
  int getTotalItemCount() {
    int totalItemCount = 0;

    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }

    return totalItemCount;
  }

  // Clear the cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  // update delivery adress
  void updateDeliveryAdress(String newAdress) {
    _deliveryAdresse = newAdress;
    notifyListeners();
  }

  // HELPERS

  // generate a receipt
  String displayCartReceipt() {
    final receipt = StringBuffer();
    receipt.writeln("Here's your receipt.");
    receipt.writeln();

    // format the date to include up to seconds only
    String formattedDate =
        DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
    receipt.writeln(formattedDate);
    receipt.writeln();
    receipt.writeln("----------------");

    for (final cartItem in _cart) {
      receipt.writeln(
          "${cartItem.quantity} x ${cartItem.food.name} - \$${_formatPrice(cartItem.food.price)}");
      if (cartItem.selectedAddons.isNotEmpty) {
        receipt
            .writeln("  Add-ons: \$${_formatAddons(cartItem.selectedAddons)}");
      }
      receipt.writeln();
    }

    receipt.writeln("----------------");
    receipt.writeln("----------------");
    receipt.writeln("Total Items : ${getTotalItemCount()}");
    receipt.writeln("Total price : ${_formatPrice(getTotalPrice())}");

    return receipt.toString();
  }

  // format double value into money
  String _formatPrice(double price) {
    return "\$${price.toStringAsFixed(2)}";
  }

  // format list of addons into a string summary
  String _formatAddons(List<Addon> addons) {
    return addons
        .map((addon) => "${addon.name} (\$${_formatPrice(addon.price)})")
        .join(", ");
  }
}
