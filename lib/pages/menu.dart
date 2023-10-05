import 'package:flutter/material.dart';
import 'package:flutter_state_provider/pages/food_details.dart';
import 'package:provider/provider.dart';
import '../components//custom_listview.dart';
import '../modal/shop.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(builder: (context, value, child) {
      return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Spicy Craft',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  value.calculateTotal();
                  FocusScope.of(context).unfocus();
                  Navigator.pushNamed(context, './cart');
                },
                icon: const Icon(Icons.fastfood_outlined),
                iconSize: 30,
              ),
            ],
            backgroundColor: Colors.black,
          ),
          body: SingleChildScrollView(
            child: ColoredBox(
              color: const Color.fromARGB(255, 255, 238, 238),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.black,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            const Text(
                              'Offer UpTo 50%',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                FocusScope.of(context).unfocus();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => FoodDetails(
                                              food: Food(
                                                name: "Dosa",
                                                image: "assets/images/dosa.jpg",
                                                desc:
                                                    "Dosa is a thin and crispy rice crepe served with various fillings or chutneys. It's a staple breakfast dish in South India.",
                                                price: 70,
                                                rating: "4.9",
                                                quantity: 10,
                                              ),
                                            )));
                              },
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.white),
                                  padding: MaterialStateProperty.all(
                                      const EdgeInsets.all(20)),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30)))),
                              child: const Text(
                                'Redeem Now',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset('assets/images/dosa.jpg',
                                width: 100))
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    child: TextField(
                        onChanged: (query) => value.searchItems(query),
                        controller: _searchController,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                            focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            suffixIcon: const Icon(Icons.search),
                            hintText: 'Search Your Favourite',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)))),
                  ),
                  _searchController.text.isEmpty
                      ? Column(
                          children: [
                            Container(
                                margin: const EdgeInsets.only(bottom: 10, top: 10),
                                alignment: Alignment.centerLeft,
                                child: const Text('All Foods',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 22))),
                            CustomListView(foods: value.allFood)
                          ],
                        )
                      : Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 10, top: 10),
                              alignment: Alignment.centerLeft,
                              child: value.filteredList.isNotEmpty
                                  ? Text(
                                      "Search Results for '${_searchController.text}'",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 22))
                                  : Text(
                                      "No Results for '${_searchController.text}'",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 22)),
                            ),
                            value.filteredList.isNotEmpty
                                ? CustomListView(foods: value.filteredList)
                                : const Text('')
                          ],
                        ),
                  Container(
                      margin: const EdgeInsets.only(bottom: 10, top: 10),
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        "South Indian",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 22),
                      )),
                  CustomListView(foods: value.southIndian),
                  Container(
                      margin: const EdgeInsets.only(bottom: 10, top: 30),
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        "North Indian",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 22),
                      )),
                  CustomListView(foods: value.northIndian),
                  Container(
                      margin: const EdgeInsets.only(bottom: 10, top: 30),
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        "West Indian",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 22),
                      )),
                  CustomListView(foods: value.westIndian),
                  Container(
                      margin: const EdgeInsets.only(bottom: 10, top: 30),
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        "East Indian",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 22),
                      )),
                  CustomListView(foods: value.eastIndian),
                ]),
              ),
            ),
          ),
        ),
      );
    });
  }
}
