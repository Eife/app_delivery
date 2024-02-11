import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hmelnaya_lavka_app/bloc/turn_food_bloc/bloc/turn_food_bloc.dart';
import 'package:hmelnaya_lavka_app/components/find_product_component.dart';
import 'package:nb_utils/nb_utils.dart';

class FindProductLineComponent extends StatefulWidget {

  const FindProductLineComponent({super.key});

  @override
  State<FindProductLineComponent> createState() =>
      _FindProductLineComponentState();
}

class _FindProductLineComponentState extends State<FindProductLineComponent> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: SizedBox(
            height: 80,
            child: TextFormField(
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  prefixIconColor: Colors.red,
                  labelText: "Что вы хотите сегодня?",
                  border: OutlineInputBorder(borderSide: BorderSide(width: 2))),
              controller: controller,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder:(context) => FindProductComponent()));
              },
            ).paddingOnly(right: 10, left: 10, bottom: 10, top: 10),
          ),
        ),
      ],
    );
  }
}
