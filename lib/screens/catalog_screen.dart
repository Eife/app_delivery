import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hmelnaya_lavka_app/bloc/turn_food_bloc/bloc/turn_food_bloc.dart';
import 'package:hmelnaya_lavka_app/utils/images.dart';
import 'package:hmelnaya_lavka_app/utils/test_bd.dart';
import 'package:nb_utils/nb_utils.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key});

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DecoratedBox(
          decoration: BoxDecoration(gradient: LinearGradient(colors: [Color.fromARGB(255, 227, 154, 179), Colors.white], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: Container(
            height: 80,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: category.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 4, right: 10, left: 5),
                    child: Column(
                      children: [
                        Container(
                          
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 40,width: 40,
                                child: Image.asset(iconToCatalog[index], fit: BoxFit.fill,)),
                                    
                            
                            ],
                          ),
                        ).onTap(() {
                            BlocProvider.of<TurnFoodBloc>(context).add(OpenTabProductEvent(product: navigationCategory[index]));
                            
                            },),
                        Text(category[index]),
                      ],
                    ),
                    
                  );
                  
                }),
          ),
        ));
  }
}
      
      
      
      
      // CatalogListViewComponent(),
