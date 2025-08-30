class MenuItemModel {
  final int? itemId;
  final String? itemName;
  final String? itemDescription;
  final double? itemPrice;
  final String? restaurantName;
  final int? restaurantId;
  final String? imageUrl;

  int count;
  bool isFavorite;

  MenuItemModel({
    this.itemId,
    this.itemName,
    this.itemDescription,
    this.itemPrice,
    this.restaurantName,
    this.restaurantId,
    this.imageUrl,
    this.count = 0,
    this.isFavorite = false,
  });

  Map<String, dynamic> toJson() {
    return {
      'itemID': itemId,
      'itemName': itemName,
      'itemDescription': itemDescription,
      'itemPrice': itemPrice,
      'restaurantName': restaurantName,
      'restaurantID': restaurantId,
      'imageUrl': imageUrl,
    };
  }

  factory MenuItemModel.fromJson(Map<String, dynamic> json) {
    return MenuItemModel(
      itemId: json['itemID'],
      itemName: json['itemName'],
      itemDescription: json['itemDescription'],
      itemPrice: json['itemPrice'],
      restaurantName: json['restaurantName'],
      restaurantId: json['restaurantID'],
      imageUrl: json['imageUrl'],
    );
  }
}
