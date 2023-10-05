import 'package:flutter/material.dart';
import 'package:flutter_state_provider/components/button.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../modal/shop.dart';
import '../services/sqflite.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  Future confirmDialogForDeletingAll(value) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Empty Cart?'),
          content: const Text('Are you sure you want to delete cart?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
                onPressed: () {
                  value.deleteAll();
                  Navigator.pop(context);
                },
                child: const Text('Delete'))
          ],
        );
      },
    );
  }

  void showOrderConfirm() async {
    await Fluttertoast.showToast(
        msg: "Your Order Confirmed!",
        backgroundColor: Colors.black,
        fontSize: 18,
        gravity: ToastGravity.CENTER,
        textColor: Colors.white,
        timeInSecForIosWeb: 2,
        toastLength: Toast.LENGTH_SHORT);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
      builder: (context, value, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Cart',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
            ),
            backgroundColor: Colors.black,
            actions: [
              IconButton(
                  padding: const EdgeInsets.only(right: 20),
                  iconSize: 28,
                  onPressed: () {
                    confirmDialogForDeletingAll(value);
                  },
                  icon: const Icon(Icons.delete))
            ],
          ),
          body: Container(
              padding: const EdgeInsets.all(10),
              color: Colors.white,
              child: SizedBox(
                height: double.infinity,
                child: Column(
                  children: [
                    value.cart.isEmpty
                        ? Container(
                            height: 400,
                            alignment: Alignment.center,
                            child: const Text(
                              'Your Cart is Empty!',
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.w600),
                            ),
                          )
                        : Expanded(
                            child: ListView.builder(
                                itemCount: value.cart.length,
                                itemBuilder: (context, index) {
                                  final cartItem = value.cart[index];
                                  return Dismissible(
                                    key: Key(cartItem.name),
                                    direction: DismissDirection.startToEnd,
                                    onDismissed: (direction) {
                                      value.removeFromCart(cartItem);
                                      Sqflite.deleteCartFood(cartItem);
                                      value.calculateTotal();
                                    },
                                    background: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.red,
                                      ),
                                      padding: const EdgeInsets.only(left: 20),
                                      alignment: Alignment.centerLeft,
                                      child: const Icon(
                                        Icons.delete,
                                        size: 28,
                                        color: Colors.white,
                                      ),
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: const Color.fromARGB(
                                            255, 232, 232, 232),
                                      ),
                                      padding: const EdgeInsets.all(16),
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  child: Image.asset(
                                                    cartItem.image,
                                                    width: 60,
                                                    height: 60,
                                                    fit: BoxFit.cover,
                                                  )),
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    cartItem.name,
                                                    style: const TextStyle(
                                                        fontSize: 22,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ),
                                                  const SizedBox(
                                                    height: 8,
                                                  ),
                                                  Text(
                                                    "₹ ${cartItem.price}",
                                                    style: const TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              IconButton(
                                                  onPressed: () {
                                                    value.reduceQuantity(
                                                        cartItem);
                                                    value.calculateTotal();
                                                  },
                                                  icon:
                                                      const Icon(Icons.remove)),
                                              SizedBox(
                                                width: 20,
                                                height: 20,
                                                child: Center(
                                                  child: Text(
                                                    "${cartItem.quantity}",
                                                    style: const TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ),
                                              ),
                                              IconButton(
                                                  onPressed: () {
                                                    value.addQuantity(cartItem);
                                                    value.calculateTotal();
                                                  },
                                                  icon: const Icon(Icons.add))
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          ),
                    value.cart.isEmpty
                        ? const Text('')
                        : CustomButton(
                            title: "Check Out (₹ ${value.total})",
                            onPressed: () async {
                              showOrderConfirm();
                            },
                            bgColor: Colors.black)
                  ],
                ),
              )),
        );
      },
    );
  }
}
