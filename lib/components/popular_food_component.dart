import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hmelnaya_lavka_app/bloc/turn_food_bloc/bloc/turn_food_bloc.dart';
import 'package:hmelnaya_lavka_app/models/model.dart';

import 'package:hmelnaya_lavka_app/utils/test_bd.dart';
import 'package:hmelnaya_lavka_app/utils/widget.dart';
import 'package:nb_utils/nb_utils.dart';

class PopularFoodComponent extends StatefulWidget {
  const PopularFoodComponent({super.key});

  @override
  State<PopularFoodComponent> createState() => _PopularFoodComponentState();



}



class _PopularFoodComponentState extends State<PopularFoodComponent> {

    @override
  void initState() {
    print("Popular init");


    BlocProvider.of<TurnFoodBloc>(context).add(OpenPopularityProductEvent(product: "Пиво"));

    
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TurnFoodBloc, TurnFoodState>(builder: (context, state) {

      if (state is TurnFoodBloc) {

        return CircularProgressIndicator();
        
      }
      else if (state is OnePopularityProductState) {
        if (state is OnePopularityProductState)
        {print("Yes");}

        List<BasketItem> itemsInState = state.allProductBasketList;
        
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          SizedBox(height: 190, width: 160, child: oneProductComponent(itemsInState[0])),
          24.width,
          SizedBox(height: 190, width: 160, child: oneProductComponent(itemsInState[1])),
        
        ],);
      } else {
        return Text("Вотафак");
      }
    });
  }
}
