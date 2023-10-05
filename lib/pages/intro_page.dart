import 'package:flutter/material.dart';
import 'package:flutter_state_provider/components/button.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  navigateBottomBar() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'Spicy Craft',
                      style:
                          TextStyle(fontSize: 36, fontWeight: FontWeight.w600),
                    )),
                Image.asset('assets/images/intro_food.jpg'),
                const Column(children: [
                  Text('THE TASTE OF INDIAN FOOD',textAlign: TextAlign.center, style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),),
                  SizedBox(height: 40,),
                  Text(
                    'Your search for the Spicy food ends here!',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 20,),
                  Text(
                    "Explore India's diverse menu, a curated selection of thousands of exquisite dishes, crafted exclusively for you.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ]),
                CustomButton(
                  title: 'Get Started',
                  onPressed: () => {
                    Navigator.pushReplacementNamed(context, './menu')
                  },
                  bgColor: Colors.black,
                ),
              ]),
        ),
      ),
    );
  }
}
