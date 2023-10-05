import 'package:flutter/material.dart';
import 'package:flutter_state_provider/pages/food_details.dart';

class CustomListView extends StatefulWidget {
  const CustomListView({super.key, required this.foods});

  final List foods;

  @override
  State<CustomListView> createState() => _CustomListViewState();
}

class _CustomListViewState extends State<CustomListView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.foods.length,
        itemBuilder: (BuildContext context, index) {
          var food = widget.foods[index];
          return GestureDetector(
            onTap: () => {
              FocusScope.of(context).unfocus(),
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FoodDetails(food: food)))
            },
            child: Container(
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              padding: const EdgeInsets.all(14),
              margin: const EdgeInsets.only(right: 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        food.image,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      food.name,
                      style:
                          const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                size: 18,
                                color: Color.fromARGB(255, 189, 170, 0),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                "${food.rating}",
                                style: const TextStyle(fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          Text(
                            "₹ ${food.price}",
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    )
                  ]),
            ),
          );
        },
      ),
    );
  }
}
