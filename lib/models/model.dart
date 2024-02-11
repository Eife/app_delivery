class User {
  String name;
  String email;
  String numberPhone;
  String password;
  List<BasketItem> basketList= [];

  User({required this.name, required this.email, required this.numberPhone, required this.password, required this.basketList});


}

class BasketItem {
  final int id;
  final String name;
  final int price;
  final bool like;
  final double rating;

  BasketItem({required this.id, required this.name, required this.price, required this.like, required this.rating});



    Map<String, dynamic> toJson() { 
    return {
        'id': id,
        'name': name,
        'price': price,
        'like': like,
        'rating': rating,
    };
  }
  factory BasketItem.fromJson(Map<String, dynamic> json) {
      return BasketItem(
        id: json['id'] ?? 1,
        name: json['name'] ?? "",
        price: json['price'] ?? 333,
        like: json['like'] ?? true,
        rating: (json['rating'] is int) ? (json["rating"] as int).toDouble() : json["rating"],
      );
  }
  
}




class Basket {
  final List<BasketItem> _items = [];

  void addItem(BasketItem item) {
    _items.add(item);
  }

  void removeItem(String itemId) {
    _items.removeWhere((item) => item.id == itemId);
  }

  double getTotalPrice() {
    return _items.fold(0, (total, current) => total + current.price);
  }



  List<BasketItem> get items => List.unmodifiable(_items);
}
