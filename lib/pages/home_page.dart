import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
        backgroundColor: Color.fromARGB(200, 235, 235, 235),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.amber,
          title: const Text(
            "Home",
            style: TextStyle(color: Colors.black),
          ),
          actions: const [
            CircleAvatar(
              radius: 20,
              backgroundColor: Color.fromARGB(255, 235, 210, 136),
              child: Icon(
                Icons.search,
                size: 28,
                color: Colors.black,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 9),
              child: CircleAvatar(
                child: Icon(
                  Icons.shopping_cart_outlined,
                  size: 28,
                  color: Colors.black,
                ),
                radius: 20,
                backgroundColor: Color.fromARGB(255, 235, 210, 136),
              ),
            )
          ],
        ),
        drawer: Drawer(),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(
            children: [
              Container(
                height: 160,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          "https://c.neh.tw/thumb/f/720/6497605538283520.jpg")),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.red,
                ),
                child: Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: Container(
                          child: Column(children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 155, bottom: 10),
                              child: Container(
                                height: 45,
                                width: 100,
                                decoration: const BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(60),
                                        bottomLeft: Radius.circular(70))),
                                child: const Center(
                                  child: Text(
                                    "Veg",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.white,
                                        shadows: [
                                          BoxShadow(
                                              color: Colors.green,
                                              blurRadius: 3,
                                              offset: Offset(3, 3))
                                        ]),
                                  ),
                                ),
                              ),
                            ),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "30% Off",
                                    style: TextStyle(
                                        fontSize: 38,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "On all Vegetables Product",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                    ),
                                  ),
                                ]),
                          ]),
                        )),
                    Expanded(
                      child: Container(),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Herbs Sessionings",
                      style: TextStyle(fontSize: 15),
                    ),
                    Text(
                      "View all",
                      style: TextStyle(color: Colors.grey, fontSize: 15),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Container(
                    height: 230,
                    width: 160,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Image.network(user!.photoURL!),
                              )),
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "Fresh Basil",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "50\$/50 Gram",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ))
                        ]),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
