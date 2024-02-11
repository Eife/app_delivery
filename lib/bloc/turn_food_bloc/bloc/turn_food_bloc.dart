import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:hmelnaya_lavka_app/models/model.dart';
import 'package:hmelnaya_lavka_app/utils/test_bd.dart';
import 'package:meta/meta.dart';


part 'turn_food_event.dart';
part 'turn_food_state.dart';
late final mModal;

class TurnFoodBloc extends Bloc<TurnFoodEvent, TurnFoodState> {
  TurnFoodBloc() : super(TurnFoodInitial()) {
    final databaseRef = FirebaseDatabase.instance.ref();
    on<TurnFoodEvent>((event, emit) {

      
    });
    on<FindOneProductCategoryEvent>(((event, emit) async {
      print("Firbase find one product");
      await FirebaseFirestore.instance.collection("${event.product}").get().then((querySnapshot) {
        print("1111");
        querySnapshot.docs.forEach((element) {
          BasketItem model = BasketItem.fromJson(element.data() as Map<String,dynamic>);
          emit(TurnOneProductState(item: model));
          print("Emit YEP");
        });
      });

    }));
    on<OpenPopularityProductEvent>((event, emit) async {
      print("Firebase Open Popularity Product");
      try {
        final querySnapshot = await FirebaseFirestore.instance.collection("${event.product}").get();
        List<BasketItem> items = querySnapshot.docs.map((e) => BasketItem.fromJson(e.data() as Map<String, dynamic>)).toList();
        emit(OnePopularityProductState(allProductBasketList: items));
      } catch (e) {
        print("Error: $e");
        emit(OnePopularityProductState(allProductBasketList: []));
      };

    });
      on<OpenTabProductEvent>((event, emit) async {
      print("Firebase Find All Product");
      try {
        final querySnapshot = await FirebaseFirestore.instance.collection("${event.product}").get();
        List<BasketItem> items = querySnapshot.docs.map((e) => BasketItem.fromJson(e.data() as Map<String, dynamic>)).toList();
        emit(OpenTabProductState(allProductBasketList: items));
      } catch (e) {
        print("Error: $e");
        emit(OpenTabProductState(allProductBasketList: []));
      };

    });

      on<InitAllProductInDatabaseEvent>((event, emit) async {
       print("Find all document in Firebase");
       List<BasketItem> allDocument = [];

       try {
        for (String collectionName in navigationCategory) {
          var collection = FirebaseFirestore.instance.collection(collectionName);
          var snapshot = await collection.get();
          for (var document in snapshot.docs) {
            allDocument.add(BasketItem.fromJson(document.data() as Map<String, dynamic>));
            
          }
          emit(InitAllProductInDatabaseState(allBasketItem: allDocument));
        }


       } catch (e) {print(e);}

      });





    // on<UserAddedToBasketEvent>((event, emit) async {
    //   print("User add to basket");
    //   try {
    //     final QuerySnapshot = await
    //   } catch (e) {};

    // } );

  }
}
