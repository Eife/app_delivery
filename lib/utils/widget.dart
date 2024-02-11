import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hmelnaya_lavka_app/models/model.dart';
import 'package:hmelnaya_lavka_app/screens/product_info_screen.dart';
import 'package:hmelnaya_lavka_app/utils/images.dart';
import 'package:nb_utils/nb_utils.dart';

Widget oneProductComponent(BuildContext context ,BasketItem items) {
  Random _randomImage = Random();
  int _randomNumber = _randomImage.nextInt(7);
  IconData favor = items.like ? Icons.favorite : Icons.favorite_outline;
  print(items.name);
  return GestureDetector(
    onTap: () {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductInfo(itemProduct: items, imageProduct: food_random[_randomNumber])));
    },
    child: Container(
      decoration: BoxDecoration(
          border: Border.all(width: 0), borderRadius: BorderRadius.circular(10)),
      height: 120,
      width: 160,
      child: Center(
        child: SizedBox(
          child: Stack(children: [
            Positioned(left: 5, bottom: 35, child: Text(items.name)),
            Positioned(
              top: 0, 
                child: ClipRRect(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                    child: SizedBox(
                        width: 160,
                        height: 120,
                        child: Image.asset(
                          food_random[_randomNumber],
                          fit: BoxFit.cover,
                        )))),
            Positioned(right: 15, top: 5, child: Icon(Icons.favorite)),
            Positioned(
              bottom: 15, left: 5,
              child: RatingBar.builder(
                itemSize: 14,
                  itemCount: 5,
                  initialRating: items.rating.toDouble(),
                  itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.red,
                      ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  }),
            ),
            Positioned(bottom: 12,right: 5, child: Text("${items.price} Pуб", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),))
          ]),
        ),
      ),
    ),
  );
}
