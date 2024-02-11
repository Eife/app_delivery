import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hmelnaya_lavka_app/bloc/turn_food_bloc/bloc/turn_food_bloc.dart';
import 'package:hmelnaya_lavka_app/components/find_product_line_component.dart';
import 'package:hmelnaya_lavka_app/components/popular_food_component.dart';
import 'package:hmelnaya_lavka_app/screens/catalog_screen.dart';
import 'package:hmelnaya_lavka_app/utils/widget.dart';
import 'package:nb_utils/nb_utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TurnFoodBloc, TurnFoodState>(builder: (context, state) {
      if (state is TurnFoodInitial || state is OnePopularityProductState) {
        return ListView(
          children: [
            FindProductLineComponent(),
            SizedBox(height: 90, child: CatalogScreen()),
            12.height,
            Text(
              "Популярные товары:",
              style: TextStyle(fontSize: 22),
            ),
            12.height,
            Row(
              children: [8.width, PopularFoodComponent()],
            ),
          ],
        );
      } else if (state is OpenTabProductState) {
        print("2");
        return ListView(children: [
          FindProductLineComponent(),
          SizedBox(height: 90, child: CatalogScreen()),
          12.height,
          GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: state.allProductBasketList.length,
            shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (context, index) {
                return SizedBox(height: 180,width: 140, child: oneProductComponent(context, state.allProductBasketList[index]).paddingOnly(right: 10, left: 10));
              })
        ]);
      } else {
        return Text("asdsa");
      }
    });
  }
}
