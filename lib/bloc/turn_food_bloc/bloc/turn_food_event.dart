part of 'turn_food_bloc.dart';

@immutable
sealed class TurnFoodEvent {}

class FindPopularProduct extends TurnFoodEvent {}

class FindProductToTap extends TurnFoodEvent {}

class FindOneProductCategoryEvent extends TurnFoodEvent {
  String product;

  FindOneProductCategoryEvent({required this.product});

}
class OpenPopularityProductEvent extends TurnFoodEvent {
  String product;

  OpenPopularityProductEvent({required this.product});

}
class OpenTabProductEvent extends TurnFoodEvent {
  String product;

  OpenTabProductEvent({required this.product});

}

class AddProductToBasketEvent extends TurnFoodEvent {
  String product;

  AddProductToBasketEvent({required this.product});
}
class DeleteProductToBasketEvent extends TurnFoodEvent {
  String product;

  DeleteProductToBasketEvent({required this.product});
}

class UserAddedToBasketEvent extends TurnFoodEvent {
  User userAddedProductToBasket;
  UserAddedToBasketEvent({required this.userAddedProductToBasket});

}

