part of 'turn_food_bloc.dart';

@immutable
sealed class TurnFoodState {}

final class TurnFoodInitial extends TurnFoodState {

}

final class FindProductState extends TurnFoodState {}

final class TurnOneProductState extends TurnFoodState {
  BasketItem item;
  TurnOneProductState({required this.item});
}

final class OnePopularityProductState extends TurnFoodState {
  List<BasketItem> allProductBasketList = [];

  OnePopularityProductState({required this.allProductBasketList});

}
final class OpenTabProductState extends TurnFoodState {
  List<BasketItem> allProductBasketList = [];

  OpenTabProductState({required this.allProductBasketList});

}


final class UserAddedToBasketState extends TurnFoodState {
  User userAddedProductToBasket;

  UserAddedToBasketState({required this.userAddedProductToBasket});

}

final class InitAllProductInDatabaseState extends TurnFoodState {
  List<BasketItem> allBasketItem; 

  InitAllProductInDatabaseState({required this.allBasketItem});

}