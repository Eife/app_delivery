import 'package:flutter/material.dart';

import 'package:hmelnaya_lavka_app/components/basket_screen_component.dart';

import 'package:hmelnaya_lavka_app/models/model.dart';
import 'package:hmelnaya_lavka_app/utils/test_bd.dart';
import 'package:nb_utils/nb_utils.dart';

class BasketScreen extends StatefulWidget {
  const BasketScreen({super.key});

  @override
  State<BasketScreen> createState() => _BasketScreenState();
}

class _BasketScreenState extends State<BasketScreen> {
  List<BasketItem> listBasketItem = usersBasket.keys.toList();
  int totalCount = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 228, 228, 228),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 228, 228, 228),
        title: Text(
          "Выбранные товары :",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            usersBasket.isEmpty
                ? Text("Корзина пуста")
                : ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: usersBasket.length,
                    itemBuilder: (context, index) {
                      return BasketScreenComponent(
                          onDelete: () => onDelete(listBasketItem[index]),
                          itemProduct: listBasketItem[index]);
                    }),
            TextFormField(
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: "Введите ваш промокод:",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ).paddingAll(8),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(30)),
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: listBasketItem.length + 1,
                itemBuilder: (context, index) {
                  if (listBasketItem.length == 0) {

                    return (Container());
                  } else if (index < listBasketItem.length) {

                    totalCount = totalCount + (listBasketItem[index].price * usersBasket[listBasketItem[index]]!);
                    
                    return SizedBox(
                      height: 30,
                      child: ListTile(
                        trailing: Text((listBasketItem[index].price * usersBasket[listBasketItem[index]]!).toString()),
                        title: Text(
                          listBasketItem[index].name,
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    );
                  } else {
                    print("else");
                    return ListTile(
                        title: Text(
                          "Общая сумма: ",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        trailing: Text(
                          "${totalCount}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ));
                  }
                },
              ).paddingAll(2),
            ).paddingAll(8)
          ],
        ),
      ),
    );
  }

  void onDelete(BasketItem deleteItem) {
    setState(() {
      usersBasket.remove(deleteItem);
      usersBasketImage.remove(deleteItem);
      listBasketItem.remove(deleteItem);
    });
  }
}
