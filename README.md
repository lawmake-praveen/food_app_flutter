# Food App

## Getting Started

I Started this mock project to learn more about the state management concepts in flutter (using provider). But when I completed the project not only I learned provider,
I also learned storing and retriving data using sqflite (sql lite) package.

Let's take a tour in my food app

<p align="left">
  <img src="https://github.com/lawmake-praveen/food_app_flutter/assets/113996180/b1c5c37d-ac85-45c3-86bf-fd86aa1778e7" alt="intro_page" width="350px" />
</p>

At the welcome page there is some wordings and a picture of dosa to welcome the user.



<br/>
<table>
  <tr>
    <td align="center">
      <img src="https://github.com/lawmake-praveen/food_app_flutter/assets/113996180/c2106b2c-3e55-4286-b16e-4317d8361fe6" alt="menu_2" width="300px" />
    </td>
    <td align="center">
      <img src="https://github.com/lawmake-praveen/food_app_flutter/assets/113996180/7d086217-b67d-4211-aec7-bfc6e0a31234" alt="menu_2" width="300px" />
    </td>
  </tr>
</table>

The menu page provides with a container at the top showing a offer details of dosa.
and there is a listview's showing All foods and different varities of food from across india.




<p align="left">
  <img src="https://github.com/lawmake-praveen/food_app_flutter/assets/113996180/b498d15f-584a-4518-aff5-d38ae4fc8e55" alt="Search_Page" width="350px" />
</p>

As you can see in the top picture when the search is on the all foods tab will disappear and results of the keyword you search appear.




<p align="left">
  <img src="https://github.com/lawmake-praveen/food_app_flutter/assets/113996180/bb756307-4e41-45e6-b27d-db3ee793fdd6" alt="food_detail_page" width="350px" />
</p>

the food details page provides the details about the food we selected in the menu page like an image, name, price, rating and a button to add it to cart




<p align="left">
  <img src="https://github.com/lawmake-praveen/food_app_flutter/assets/113996180/20294e47-203a-4de5-b61b-070e7232674d" alt="cart_page" width="350px" />
</p>

when someone press add to cart button in the food details page the food will store in the cart as well as the local db through sqflite. If the food is already in the cart then it will show a msg that says "Item is already in the cart".
You can increase / decrease the quantity and delete all the food using the plus and minus and delete icons. Every actions will reflect in the UI quickly through provider and changeNotifier.
and the information about the food like quantity etc will store in the local db. so when you close and re open the app the cart will be same as when you left the app.
the cart items are in a dissmissable widget so you can swipe it to delete from the cart as well as in the local db.
When press checkout a msg will say "Your Order is Confirmed!".
