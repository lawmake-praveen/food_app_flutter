import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class Sqflite {
  static Future<Database> initDatabase() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, "food_app_cart.db");
    return await openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute(
          '''CREATE TABLE food_cart_list (id INTEGER PRIMARY KEY, name VARCHAR(30), image TEXT, desc TEXT, price INTEGER, rating VARCHAR(8), quantity INTEGER)''');
    });
  }

  static Future<void> saveCartFood(data) async {
    final db = await initDatabase();

    final foodName = data.name;
    final foodImagePath = data.image;
    final foodDescription = data.desc;
    final foodPrice = data.price;
    final foodRating = data.rating;
    final foodQuantity = data.quantity;

    final food = {
      "name": foodName,
      "image": foodImagePath,
      "desc": foodDescription,
      "price": foodPrice,
      "rating": foodRating,
      "quantity": foodQuantity,
    };

    await db.insert('food_cart_list', food);
  }

  static Future<List> getCartFood() async {
    final db = await initDatabase();
    var savedData = await db.rawQuery("SELECT * FROM food_cart_list");
    return savedData;
  }

  static Future<void> addQuantity(foodname) async {
    final db = await initDatabase();
    await db.rawUpdate(
        'UPDATE food_cart_list SET quantity = quantity + 1 WHERE name = ?',
        [foodname]);
  }

  static Future<void> reduceQuantity(foodname) async {
    final db = await initDatabase();
    await db.rawUpdate(
        'UPDATE food_cart_list SET quantity = quantity - 1 WHERE name = ?',
        [foodname]);
  }

  static Future<void> deleteCartFood(food) async {
    final db = await initDatabase();
    await db
        .delete('food_cart_list', where: 'name = ?', whereArgs: [food.name]);
  }

  static Future<void> deleteAllFromCart() async {
    final db = await initDatabase();
    await db.delete('food_cart_list');
  }
}
