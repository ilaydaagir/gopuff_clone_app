import 'package:e_commerce_app/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Padding(
        padding: const EdgeInsets.only(top: 40.0, right: 20.0, left: 20.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Menu",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 36),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: SizedBox(
                    child: Image.asset("images/account.png"),
                    height: 50,
                    width: 50,
                  ),
                )
              ],
            ),
            TextField(
                decoration: InputDecoration(
                    icon: Icon(Icons.search_rounded), hintText: 'Search')),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Choice(image: "pizza_resim.png", name: "Pizza"),
                  Choice(image: "pasta.png", name: "Pasta"),
                  Choice(image: "dishes.png", name: "Dishes"),
                  Choice(image: "salad.png", name: "Salad"),
                  Choice(image: "pizza_resim.png", name: "Pizza"),
                  Choice(image: "pasta.png", name: "Pasta"),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Product(
                      img: "beef.png",
                      nameOfMeal: "Garlic Beef",
                      price: 18,
                      explanation: "beef meef"),
                  Product(
                      img: "pesto.png",
                      nameOfMeal: "Pesto Pasta",
                      price: 15,
                      explanation: "beef meef"),
                  Product(
                      img: "pizza_resim.png",
                      nameOfMeal: "Beef Pizza",
                      price: 16,
                      explanation: "beef meef"),
                  Product(
                      img: "rice.png",
                      nameOfMeal: "Vegetable rice",
                      price: 14,
                      explanation: "beef meef"),
                  Product(
                      img: "rice.png",
                      nameOfMeal: "Vegetable rice",
                      price: 14,
                      explanation: "beef meef")
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.black,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border,color: Colors.black), label: "Favs"),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications_active_outlined,color: Colors.black), label: "Alert"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart,color: Colors.black), label: "Shop")
        ],
      ),
    );
  }
}

class Choice extends StatefulWidget {
  String image;
  String name;

  Choice({required this.image, required this.name});

  @override
  State<Choice> createState() => _ChoiceState();
}

class _ChoiceState extends State<Choice> {
  bool hasbeenPressed = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
          width: 80,
          height: 100,
          child: Column(
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: hasbeenPressed ? Colors.black : Colors.white),
                  onPressed: () {
                    setState(() {
                      hasbeenPressed = !hasbeenPressed;
                    });
                  },
                  child: SizedBox(
                      height: 70,
                      width: 70,
                      child: Image.asset("images/${widget.image}"))),
              Spacer(),
              Text(
                "${widget.name}",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    color: yaziRenk2),
              )
            ],
          )),
    );
  }
}

class Product extends StatefulWidget {
  String img;
  String nameOfMeal;
  String explanation;
  double price;

  Product(
      {required this.img,
      required this.nameOfMeal,
      required this.price,
      required this.explanation});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        height: 300,
        width: 190,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                    width: 100,
                    height: 100,
                    child: Image.asset("images/${widget.img}")),
                Text("${widget.nameOfMeal}",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
                Text("${widget.explanation}",
                    style: TextStyle(color: yaziRenk2, fontSize: 18)),
                Padding(
                  padding:
                      const EdgeInsets.only(right: 16.0, left: 16.0, top: 10.0),
                  child: Row(
                    children: [
                      Text(" \$ ${widget.price}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25)),
                      Spacer(),
                      Icon(Icons.star)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
