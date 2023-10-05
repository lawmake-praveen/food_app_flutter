import 'package:flutter/material.dart';
import 'package:flutter_state_provider/components/button.dart';
import 'package:provider/provider.dart';
import '../modal/shop.dart';

class FoodDetails extends StatefulWidget {
  const FoodDetails({super.key, required this.food});
  final Food food;

  @override
  State<FoodDetails> createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        title: Text(
          widget.food.name,
          style: const TextStyle(
              fontSize: 30, fontWeight: FontWeight.w800, letterSpacing: 1),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  children: [
                    Image.asset(widget.food.image),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "₹ ${widget.food.price}",
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          size: 22,
                          color: Color.fromARGB(255, 189, 170, 0),
                        ),
                        Text(widget.food.rating),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(widget.food.desc),
                  ]),
            ),
          ),
          Consumer<Shop>(
            builder: (context, value, child) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: CustomButton(
                    title: "Add To Cart",
                    onPressed: () {
                      value.calculateTotal();
                      widget.food.quantity = 1;
                      value.addToCart(widget.food);
                      Navigator.pop(context);
                    },
                    bgColor: Colors.black),
              );
            },
          ),
        ],
      ),
    );
  }
}
