import 'package:flutter/material.dart';

import 'details.dart';
import 'generated/assets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List categories = [
      {"iconName": Icons.woman, "title": "Woman"},
      {"iconName": Icons.man, "title": "Men"},
      {"iconName": Icons.card_giftcard, "title": "Gifts"},
      {"iconName": Icons.shop, "title": "Shop"},
      {"iconName": Icons.sell, "title": "Sell"},
    ];

    List items = [
      {
        "image": Assets.imagesImage1,
        "title": "Hoodies",
        "subtitle": "Description 1",
        "price": " 250\$"
      },
      {
        "image": Assets.imagesImage2,
        "title": "Jacket",
        "subtitle": "Description 2",
        "price": " 350\$"
      },
      {
        "image": Assets.imagesPants,
        "title": "Pants",
        "subtitle": "Description 3",
        "price": " 200\$"
      },
      {
        "image": Assets.imagesShosw,
        "title": "Shoes",
        "subtitle": "Description 4",
        "price": " 150\$"
      },
    ];
    return Container(
      padding: const EdgeInsets.all(20),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    hintText: "Search",
                    border: InputBorder.none,
                    fillColor: Colors.grey[150],
                    filled: true,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Icon(
                  Icons.menu,
                  size: 40,
                ),
              )
            ],
          ),
          Container(height: 30),
          const Text(
            "Categories",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Container(height: 20),
          SizedBox(
            height: 100,
            child: ListView.builder(
                itemCount: categories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, i) {
                  return Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[150],
                              borderRadius: BorderRadius.circular(130)),
                          color: Colors.grey[150],
                          padding: const EdgeInsets.all(10),
                          child: Icon(categories[i]['iconName'], size: 40),
                        ),
                        Text(
                          categories[i]['title'],
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black87),
                        )
                      ],
                    ),
                  );
                }),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: const Text(
              "best Selling",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          GridView.builder(
            itemCount: items.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 230,
              childAspectRatio: 1.8,
            ),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                          ItemsDetails(productData: items[index]),
                    ),
                  );
                },
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 2.5,
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(items[index]['image']),
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          height: 150,
                          width: 300,
                        ),
                        Text(
                          items[index]['title'],
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          items[index]['subtitle'],
                          style:
                              const TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                        Text(items[index]['price'],
                            style: const TextStyle(
                                fontSize: 14,
                                color: Colors.orange,
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
