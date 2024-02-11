import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hmelnaya_lavka_app/bloc/turn_food_bloc/bloc/turn_food_bloc.dart';
import 'package:hmelnaya_lavka_app/models/model.dart';

 


class FindProductComponent extends StatefulWidget {
  const FindProductComponent({super.key});

  @override
  State<FindProductComponent> createState() => _FindProductComponentState();
}

class _FindProductComponentState extends State<FindProductComponent> {
  TextEditingController controller = TextEditingController();
  List<BasketItem> allProduct = [];
  List<BasketItem> filteredProduct = [];

  @override
  void initState() {
    BlocProvider.of<TurnFoodBloc>(context).add(InitAllProductInDatabaseEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.keyboard_arrow_left),
          onPressed: () { 
          BlocProvider.of<TurnFoodBloc>(context).add(OpenPopularityProductEvent(product: "Пиво"));
          Navigator.of(context).pop();}
        ),
      ),
      body: Container(
        child: Column(children: [
          SizedBox(height: 18),
          TextFormField(
            onChanged: filterProduct,
            controller: controller,
            style: TextStyle(fontSize: 20),
            decoration: InputDecoration(
              hintText: "Поиск товаров",
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(),
            ),
          ),
          Expanded(
            child: BlocConsumer<TurnFoodBloc, TurnFoodState>(
              listener: (context, state) {
                if (state is InitAllProductInDatabaseState) {
                  setState(() {
                    allProduct = state.allBasketItem;
                    filteredProduct = allProduct;
                  });
                }
              },
              builder: (context, state) {
                if (state is InitAllProductInDatabaseState) {
                  return ListView.builder(
                    itemCount: filteredProduct.length < 20 ? filteredProduct.length : 20,
                    itemBuilder: (context, index) {
                      return ListTile(title: Text(filteredProduct[index].name));
                    },
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ]),
      ),
    );
  }

  void filterProduct(String enteredKeyword) {
    List<BasketItem> result;
    if (enteredKeyword.isEmpty) {
      result = allProduct;
    } else {
      result = allProduct.where((element) =>
        element.name.toLowerCase().contains(enteredKeyword.toLowerCase())).toList();
    }

    setState(() => filteredProduct = result);
  }
}
