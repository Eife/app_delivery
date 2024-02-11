import 'package:flutter/material.dart';
import 'package:hmelnaya_lavka_app/models/model.dart';
import 'package:hmelnaya_lavka_app/utils/images.dart';
import 'package:hmelnaya_lavka_app/utils/test_bd.dart';
import 'package:nb_utils/nb_utils.dart';

class ProductInfo extends StatefulWidget {
  BasketItem itemProduct;
  String imageProduct;

  ProductInfo(
      {super.key, required this.itemProduct, required this.imageProduct});

  @override
  State<ProductInfo> createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfo> {
  final String _foodDetails =
      "Lorem ipsum, or lipsum as it is sometimes known, is dummy text used...";
  final String _foodReview = "Отзывов еще нет";
  bool addedToBasket = false;

  int _selectButton = 1;

  void selectButton(int buttonNumber) {
    setState(() {
      _selectButton = buttonNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    BasketItem itemProduct = widget.itemProduct;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_arrow_left,
            size: 34,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 300,
            child: Image(
              image: AssetImage(widget.imageProduct),
              fit: BoxFit.cover,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              8.width,
              Text(
                "${itemProduct.name}",
                style: TextStyle(fontSize: 18),
              ),
              44.width,
              Text(
                "Стоимость: ${itemProduct.price} руб.",
                style: TextStyle(fontSize: 18),
              ),
              8.width
            ],
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () {
                      int count = usersBasket[widget.itemProduct]!; //Убрать "!"
                      if (usersBasket[widget.itemProduct] == 1) {
                        addedToBasket = false;
                        usersBasket.remove(widget.itemProduct);
                      } else {
                        usersBasket[widget.itemProduct] = count - 1;
                      }
                      setState(() {
                        if (addedToBasket) {
                          usersBasketImage[widget.itemProduct] =
                              widget.imageProduct;
                        } else {
                          usersBasketImage.remove(widget.itemProduct);
                        }
                      });
                    },
                    icon: Icon(Icons.remove)),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: addedToBasket
                            ? MaterialStatePropertyAll(Colors.green)
                            : MaterialStatePropertyAll(Colors.red)),
                    onPressed: () {
                      addedToBasket
                          ? addedToBasket = false
                          : addedToBasket = true;
                      usersBasket[widget.itemProduct] = 1;
                      setState(() {
                        if (addedToBasket) {
                          usersBasketImage[widget.itemProduct] =
                              widget.imageProduct;
                        } else {
                          usersBasketImage.remove(widget.itemProduct);
                        }
                      });
                    },
                    child: Text(
                      addedToBasket
                          ? "Добавлено! Количество: ${usersBasket[widget.itemProduct]}"
                          : "Добавить в корзину",
                      style: TextStyle(color: Colors.white),
                    )),
                IconButton(
                    onPressed: () {
                      if (addedToBasket == false) {
                        addedToBasket = true;
                        usersBasket[widget.itemProduct] = 1;
                        setState(() {
                          if (addedToBasket) {
                            usersBasketImage[widget.itemProduct] =
                                widget.imageProduct;
                          } else {
                            usersBasketImage.remove(widget.itemProduct);
                          }
                        });
                      } else {
                        int count =
                            usersBasket[widget.itemProduct]!; //Убрать "!"
                        usersBasket[widget.itemProduct] = count + 1;
                        setState(() {});
                      }
                    },
                    icon: Icon(Icons.plus_one)),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                  onPressed: () {
                    selectButton(1);
                  },
                  child: Text(
                    "Описание",
                    style: TextStyle(
                      color: _selectButton == 1 ? Colors.red : Colors.grey,
                    ),
                  )),
              12.width,
              TextButton(
                  onPressed: () {
                    selectButton(2);
                  },
                  child: Text(
                    "Отзывы",
                    style: TextStyle(
                        color: _selectButton == 2 ? Colors.red : Colors.grey),
                  )),
            ],
          ),
          Center(
            child: _selectButton == 1
                ? Text(
                    _foodDetails,
                    style: TextStyle(fontSize: 16),
                  )
                : Text(
                    _foodReview,
                    style: TextStyle(fontSize: 16),
                  ),
          ).paddingAll(8),
        ],
      ),
    );
  }
}
