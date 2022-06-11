import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
  var locImages = [
    "images/basically.png",
    "images/dont.png",
    "images/wants.png"
  ];
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              color: Colors.blue,
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                    child: SizedBox(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                          width: 300,
                          child: Card(
                              color: Colors.lightBlueAccent.withOpacity(0.7),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40.0)),
                              child: ListTile(
                                trailing: Icon(Icons.arrow_forward_ios),
                                leading: Container(
                                    width: 45,
                                    height: 45,
                                    decoration: BoxDecoration(
                                        color: Colors.lightGreen,
                                        shape: BoxShape.circle),
                                    child: Icon(Icons.car_repair,
                                        color: Colors.black)),
                                title: Text("Delivery to",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                subtitle: Text(
                                    "Sign In/Sign Up to see delivery time"),
                              ))),
                    )),
                  ),
                  Spacer(),
                  Container(
                    color: Colors.blue,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                              color: Colors.white, shape: BoxShape.circle),
                          child: Icon(Icons.search)),
                    ),
                  )
                ],
              ),
            ),
            Container(
              color: Colors.blue,
              height: 140,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CarouselSlider.builder(
                        itemCount: locImages.length,
                        itemBuilder: (context, index, realIndex) {
                          final locImage = locImages[index];

                          return buildImage(locImage, index);
                        },
                        options: CarouselOptions(
                          height: 100,
                          enlargeCenterPage: false,
                          onPageChanged: (index, reason) =>
                              setState(() => activeIndex = index),
                        )),
                    SizedBox(height: 10),
                    buildIndicator(),
                  ],
                ),
              ),
            ),

            /* SingleChildScrollView(
              scrollDirection: Axis.horizontal,
               child: Container(color: Colors.blue,
                 child: Row(children: [
             Container(child: Image.asset("images/basically.png")),
                   Image.asset("images/dont.png"),
                   Image.asset("images/wants.png"),
                 ]),
               ),
            ),*/
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                height: 110,
                decoration: BoxDecoration(color: Colors.blue),
                child: Padding(
                  padding: EdgeInsets.only(top: 6.0, bottom: 4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Choice(image: "grocery.png", name: "Grocery"),
                      Choice(image: "health.png", name: "Health"),
                      Choice(image: "drink.PNG", name: "Drinks"),
                      Choice(image: "snack.PNG", name: "Snacks"),
                      Choice(image: "cleaning.png", name: "Cleaning"),
                      Choice(image: "pets.png", name: "Pets"),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Grocery",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    GestureDetector(
                        onTap: () {},
                        child: Text(
                          "See all",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline),
                        ))
                  ]),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Product(
                      img: "hostes.jpg",
                      nameOfMeal: "Hostess Classic White Bread Sliced 20oz",
                      amount: "20 oz",
                      price: "3.99\$"),
                  Product(
                      img: "jif.png",
                      nameOfMeal: "JIF Creamy Peanut Butter 16oz",
                      amount: "16 oz",
                      price: "4.99\$"),
                  Product(
                      img: "hellman.png",
                      nameOfMeal:
                          "Hellmann's Real Mayonnaise Easy Out Squeeze Bottle 20oz",
                      amount: "20 oz",
                      price: "6.99\$"),
                  Product(
                      img: "ramen.png",
                      nameOfMeal:
                          "Nissin Top Ramen Chicken Flavor Ramen Noodle soup 3oz",
                      amount: "3 oz",
                      price: "1.99\$"),
                  Product(
                      img: "jelly.png",
                      nameOfMeal: "Fruit Gushers Flavor Mixer 4.25oz",
                      amount: "4.25 oz",
                      price: "4.49\$")
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                decoration: BoxDecoration(color: Colors.greenAccent),
                child: Row(
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset("images/home_need.png"),
                          SizedBox(
                              height: 40,
                              child: Align(
                                  alignment: Alignment.topCenter,
                                  child: Text(
                                    "Home Needs",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 23),
                                  ))),
                        ],
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset("images/shopall.png"),
                          SizedBox(
                              height: 40,
                              child: Align(
                                  alignment: Alignment.topCenter,
                                  child: Text(
                                    "Shop All Basically",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 23),
                                  ))),
                        ],
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset("images/drink_snack.png"),
                          SizedBox(
                              height: 40,
                              child: Align(
                                  alignment: Alignment.topCenter,
                                  child: Text(
                                    "Drinks & Snacks",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 23),
                                  ))),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.black,
        items: [
          //Icon(Icons.refresh,color: Colors.black)
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, color: Colors.black),
            label: "Browse",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.refresh, color: Colors.black),
              label: "Buy it Again"),
          BottomNavigationBarItem(
              icon: Icon(Icons.star_border_rounded, color: Colors.black),
              label: "Rewards"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined, color: Colors.black),
              label: "Guest User")
        ],
      ),
    );
  }

  Widget buildImage(String locImage, int index) => Container(
        //margin: EdgeInsets.symmetric(horizontal: 8),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FittedBox(
              child: Image.asset(locImage),
              fit: BoxFit.fill,
            )),
      );
  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: locImages.length,
        effect: ExpandingDotsEffect(
            activeDotColor: Colors.white,
            dotColor: Colors.white30,
            dotWidth: 30,
            dotHeight: 4),
      );
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
      padding: const EdgeInsets.only(right: 5.0, left: 5.0, top: 5, bottom: 5),
      child: SizedBox(
          width: 70,
          height: 100,
          child: Column(
            children: [
              SizedBox(
                height: 60,
                width: 68,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    primary: hasbeenPressed ? Colors.black : Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      hasbeenPressed = !hasbeenPressed;
                    });
                  },
                  child: Image.asset("images/${widget.image}"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  "${widget.name}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                  ),
                ),
              )
            ],
          )),
    );
  }
}

class Product extends StatefulWidget {
  String img;
  String nameOfMeal;
  String price;
  String amount;

  Product(
      {required this.img,
      required this.nameOfMeal,
      required this.amount,
      required this.price});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      height: 270,
      width: 190,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.only(right: 6, left: 6),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                  width: 100,
                  height: 100,
                  child: Image.asset("images/${widget.img}")),
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Align(
                    alignment: Alignment.bottomRight,
                    child: SizedBox(
                        width: 40.0,
                        child: FloatingActionButton(
                          onPressed: () {},
                          child: Icon(
                            Icons.add,
                          ),
                        ))),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${widget.nameOfMeal}",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  Text("${widget.price}", style: TextStyle(fontSize: 11)),
                  Text(" ${widget.amount}",
                      style: TextStyle(fontSize: 10, color: yaziRenk2)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
