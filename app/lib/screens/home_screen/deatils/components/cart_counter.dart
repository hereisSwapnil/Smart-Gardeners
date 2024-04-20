import 'package:flutter/material.dart';
import 'package:sg_android/model/product.dart';
import 'package:sg_android/utils/constants.dart';
import 'rounded_icon_button.dart';
import 'package:sg_android/model/product_purchased.dart';
import 'package:sg_android/controllers/home_screen_controller.dart';

class CartCounter extends StatefulWidget {
  const CartCounter({
    Key? key,
    required this.onQuantityChanged,
    required Product product,
  }) : super(key: key);

  final ValueChanged<int> onQuantityChanged;

  @override
  _CartCounterState createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  HomeController _homeController =
      HomeController(); // Create an instance of HomeController

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: kBackgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(40)),
      ),
      child: Row(
        children: [
          RoundIconBtn(
            iconData: Icons.remove,
            color: kTextColor.withOpacity(0.4),
            press: () {
              setState(() {
                if (_homeController.totalCartItems > 1) {
                  // Access totalCartItems from HomeController
                  for (var item in _homeController.cart) {
                    item.subtract(1); // Subtract one from each item in the cart
                  }
                  widget.onQuantityChanged(_homeController.totalCartItems);
                }
              });
            },
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: kDefaultPadding / 4),
            child: Text(
              "${_homeController.totalCartItems}",
              // Access totalCartItems from HomeController
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
            ),
          ),
          RoundIconBtn(
            iconData: Icons.add,
            press: () {
              setState(() {
                for (var item in _homeController.cart) {
                  item.add(1); // Add one to each item in the cart
                }
                widget.onQuantityChanged(_homeController.totalCartItems);
              });
            },
          ),
        ],
      ),
    );
  }
}
