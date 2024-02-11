import 'package:flutter/material.dart';
import 'package:hmelnaya_lavka_app/models/model.dart';
import 'package:hmelnaya_lavka_app/utils/test_bd.dart';
import 'package:nb_utils/nb_utils.dart';

class BasketScreenComponent extends StatefulWidget {
  BasketItem itemProduct;
  final VoidCallback onDelete;

  BasketScreenComponent(
      {super.key, required this.itemProduct, required this.onDelete});

  @override
  State<BasketScreenComponent> createState() => _BasketScreenComponentState();
}

class _BasketScreenComponentState extends State<BasketScreenComponent> {
  @override
  Widget build(BuildContext context) {
    String price = widget.itemProduct.price.toString();
    bool addedToBasket = true;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
          border: Border.all(
              width: 1, color: const Color.fromARGB(255, 222, 184, 128)),
          borderRadius: BorderRadius.circular(20)),
      height: 92,
      child: Row(
        children: [
          Column(children: [
            SizedBox(
              height: 90, width: 140,
              child: ClipRRect(
                borderRadius: BorderRadius.all(radiusCircular(20)),
                child: Image(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    usersBasketImage[widget.itemProduct]!,
                  ),
                ),
              ), //Опять без проверки на null!
            ),
          ]),
          14.width,
          Column(
            children: [
              Container(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 120,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          6.height,
                          Text(
                            widget.itemProduct.name,
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "$price Руб.",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                              onPressed: () {
                                widget.onDelete();
                              },
                              icon: Icon(
                                Icons.restore_from_trash,
                                size: 30,
                              )),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 40,
                child: Row(children: [
                  IconButton(
                      onPressed: () {
                        int count =
                            usersBasket[widget.itemProduct]!; //Убрать "!"
                        if (usersBasket[widget.itemProduct] == 1) {
                          // addedToBasket = false;
                          // usersBasket.remove(widget.itemProduct);
                        } else {
                          usersBasket[widget.itemProduct] = count - 1;
                        }
                        setState(() {});
                      },
                      icon: Icon(
                        Icons.remove,
                        size: 20,
                      )),
                  SizedBox(
                    height: 20,
                    width: 80,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: addedToBasket
                                ? MaterialStatePropertyAll(Colors.green)
                                : MaterialStatePropertyAll(Colors.red)),
                        onPressed: () {
                          // addedToBasket
                          //     ? addedToBasket = false
                          //     : addedToBasket = true;
                          // usersBasket[widget.itemProduct] = 1;
                          // setState(() {});
                        },
                        child: Text(
                          addedToBasket
                              ? "${usersBasket[widget.itemProduct]}"
                              : "Добавить в корзину",
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        )),
                  ),
                  IconButton(
                      onPressed: () {
                        if (addedToBasket == false) {
                          addedToBasket = true;
                          usersBasket[widget.itemProduct] = 1;
                          setState(() {});
                        } else {
                          int count =
                              usersBasket[widget.itemProduct]!; //Убрать "!"
                          usersBasket[widget.itemProduct] = count + 1;
                          setState(() {});
                        }
                      },
                      icon: Icon(
                        Icons.plus_one,
                        size: 20,
                      )),
                ]),
              )
            ],
          )
        ],
      ),
    ).paddingAll(6);
  }
}
