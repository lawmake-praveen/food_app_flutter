import 'package:flutter/material.dart';
import 'package:flutter_state_provider/services/sqflite.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Food {
  String name;
  String image;
  String desc;
  int price;
  String rating;
  int quantity;

  Food({
    required this.name,
    required this.image,
    required this.desc,
    required this.price,
    required this.rating,
    required this.quantity,
  });
  factory Food.fromMap(Map<String, dynamic> map) {
    return Food(
      name: map['name'],
      image: map['image'],
      desc: map['desc'],
      price: map['price'],
      rating: map['rating'],
      quantity: map['quantity'],
    );
  }
}

class Shop extends ChangeNotifier {
  List<Food> _cart = [];
  Shop() {
    initializeCart();
  }

  Future<void> initializeCart() async {
    final savedFoods = await Sqflite.getCartFood();
    _cart = savedFoods.map((data) => Food.fromMap(data)).toList();
    notifyListeners();
  }

  int total = 0;

  final List<dynamic> _southIndian = [
    Food(
      name: 'Briyani',
      image: "assets/images/briyani.jpg",
      desc:
          "Biryani is a fragrant and flavorful rice dish made with long-grain basmati rice, aromatic spices, and either tender pieces of meat or a variety of vegetables. It's cooked in a manner called 'dum', which involves sealing the pot to trap the steam and create a beautifully layered, aromatic rice dish",
      price: 150,
      rating: "4.9",
      quantity: 10,
    ),
    Food(
      name: 'Butter Chicken',
      image: "assets/images/butter_chicken.jpg",
      desc:
          "Butter chicken, also known as 'Murgh Makhani,' is a creamy and rich tomato-based curry with succulent pieces of chicken. The sauce is made with butter, cream, and a blend of spices, resulting in a velvety texture and a mild, slightly sweet flavor.",
      price: 150,
      rating: "4.0",
      quantity: 10,
    ),
    Food(
      name: "Idli",
      image: "assets/images/idli.jpg",
      desc:
          "Idli is a steamed rice cake made from the same fermented batter as dosa. It's soft, spongy, and often enjoyed with coconut chutney and sambar.",
      price: 15,
      rating: "4.5",
      quantity: 10,
    ),
    Food(
      name: "Dosa",
      image: "assets/images/dosa.jpg",
      desc:
          "Dosa is a thin and crispy rice crepe served with various fillings or chutneys. It's a staple breakfast dish in South India.",
      price: 70,
      rating: "4.9",
      quantity: 10,
    ),
    Food(
      name: "Uttapam",
      image: "assets/images/uttappam.jpg",
      desc:
          "Uttapam is a thick rice pancake topped with various ingredients like onions, tomatoes, and chilies, creating a savory and satisfying meal.",
      price: 67,
      rating: "4.3",
      quantity: 10,
    ),
    Food(
      name: "Pongal",
      image: "assets/images/pongal.jpg",
      desc:
          "Pongal is a comforting rice and lentil porridge that's traditionally made during festivals and special occasions.",
      price: 50,
      rating: "4.3",
      quantity: 10,
    ),
    Food(
      name: "Fish Curry",
      image: "assets/images/fish_curry.jpg",
      desc:
          "Fish Curry is a spicy and tangy curry made with fish and a blend of spices, offering a burst of flavors in every bite",
      price: 44,
      rating: "4.3",
      quantity: 10,
    )
  ];

  final List<dynamic> _northIndian = [
    Food(
      name: "Chola Butture",
      image: "assets/images/chola_butture.jpg",
      desc:
          "Chole bhature is a classic North Indian dish consisting of spicy chickpea curry (chole) served with deep-fried bread called bhature. It's a flavorful and hearty meal.",
      price: 120,
      rating: "4.5",
      quantity: 10,
    ),
    Food(
      name: "Paneer Tikka",
      image: "assets/images/panneer_tikka.jpg",
      desc:
          "Paneer Tikka is a vegetarian delight, featuring marinated and grilled cottage cheese that's bursting with flavors and served with mint chutney.",
      price: 100,
      rating: "4.4",
      quantity: 10,
    ),
    Food(
      name: "Aloo Paratha",
      image: "assets/images/aloo_paratha.jpg",
      desc:
          "Aloo Paratha is a stuffed potato flatbread that's crispy on the outside and filled with a spiced potato mixture, making it a popular choice for breakfast or lunch.",
      price: 50,
      rating: "4.3",
      quantity: 10,
    )
  ];

  final List<dynamic> _westIndian = [
    Food(
      name: "Pav Bhaji",
      image: "assets/images/pav_bhaji.jpg",
      desc:
          "Vada Pav is a popular street food consisting of a spicy potato fritter served in a bun, making it a flavorful and satisfying snack.",
      price: 20,
      rating: "5.0",
      quantity: 10,
    ),
    Food(
      name: "Vada Pav",
      image: "assets/images/vada_pav.jpg",
      desc:
          "Pav Bhaji is a delectable dish featuring spicy vegetable curry served with buttered rolls, offering a perfect blend of flavors and textures.",
      price: 30,
      rating: "4.5",
      quantity: 10,
    ),
    Food(
      name: "Dhokla",
      image: "assets/images/dhokla.jpg",
      desc:
          "Dhokla is a creamy black lentil curry cooked with a blend of spices, butter, and cream, delivering a rich and comforting taste.",
      price: 50,
      rating: "3.9",
      quantity: 10,
    ),
    Food(
      name: "Misal Pav",
      image: "assets/images/missav_pav.jpg",
      desc:
          "Misal Pav is a spicy sprout curry served with bread, creating a hearty and flavorful meal with a kick of spice.",
      price: 60,
      rating: "4.3",
      quantity: 10,
    )
  ];

  final List<dynamic> _eastIndian = [
    Food(
      name: "Aloo Posto",
      image: "assets/images/aloo_posto.jpg",
      desc:
          "Aloo Posto is a Bengali dish featuring potatoes cooked in a poppy seed paste, offering a unique and nutty flavor.",
      price: 60,
      rating: "4.7",
      quantity: 10,
    ),
    Food(
      name: "Rosogolla",
      image: "assets/images/rasagolla.jpg",
      desc:
          "Rosogolla is a spongy and sweet dessert made from soft cheese balls soaked in sugar syrup.",
      price: 77,
      rating: "4.9",
      quantity: 10,
    ),
    Food(
      name: "Machhar Jhol",
      image: "assets/images/machher_jhol.jpg",
      desc:
          "Machher Jhol is a Bengali fish curry known for its light and flavorful broth, often accompanied by rice.",
      price: 49,
      rating: "3.4",
      quantity: 10,
    ),
  ];

  List<Food> get cart => _cart;
  List<dynamic> get southIndian => _southIndian;
  List<dynamic> get northIndian => _northIndian;
  List<dynamic> get westIndian => _westIndian;
  List<dynamic> get eastIndian => _eastIndian;
  List<Food> get allFood =>
      [..._northIndian, ..._southIndian, ..._westIndian, ..._eastIndian];

  void addToCart(Food food) {
    bool alreadyExists = _cart.any((element) => element.name == food.name);
    if (!alreadyExists) {
      Sqflite.saveCartFood(food);

      _cart.add(food);
      showOrderItemStatus("Item Added to Cart.");
      calculateTotal();
      notifyListeners();
    } else {
      showOrderItemStatus("Item already Exists in Cart!");
    }
  }

  void removeFromCart(food) {
    _cart.remove(food);
    notifyListeners();
  }

  void addQuantity(food) {
    food.quantity++;
    Sqflite.addQuantity(food.name);
    notifyListeners();
  }

  void reduceQuantity(food) {
    if (food.quantity > 1) {
      Sqflite.reduceQuantity(food.name);
      food.quantity--;
      notifyListeners();
    }
  }

  void deleteAll() {
    _cart = [];
    Sqflite.deleteAllFromCart();
    notifyListeners();
  }

  void calculateTotal() {
    total = 0;
    for (var element in _cart) {
      total += element.price * element.quantity;
    }
    notifyListeners();
  }

  List<dynamic> filteredList = [];

  void searchItems(String query) {
    filteredList.clear();

    for (var element in northIndian) {
      var containedItem =
          element.name.toLowerCase().contains(query.toLowerCase());
      if (containedItem) {
        filteredList.add(element);
      }
    }
    for (var element in southIndian) {
      var containedItem =
          element.name.toLowerCase().contains(query.toLowerCase());
      if (containedItem) {
        filteredList.add(element);
      }
    }

    for (var element in westIndian) {
      var containedItem =
          element.name.toLowerCase().contains(query.toLowerCase());
      if (containedItem) {
        filteredList.add(element);
      }
    }
    for (var element in eastIndian) {
      var containedItem =
          element.name.toLowerCase().contains(query.toLowerCase());
      if (containedItem) {
        filteredList.add(element);
      }
    }
    notifyListeners();
  }

  void showOrderItemStatus(String msg) async {
    await Fluttertoast.showToast(
        msg: msg,
        backgroundColor: Colors.black,
        fontSize: 18,
        gravity: ToastGravity.BOTTOM,
        textColor: Colors.white,
        timeInSecForIosWeb: 2,
        toastLength: Toast.LENGTH_SHORT);
  }
}
