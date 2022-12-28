// class CartModels {
//   List<CartListModels> ?carModels;

//   colors = json['colors'].cast<String>();

// }

class CartListModels {
  String? name;
  int? ownerId;
  List<CartItems>? cartItems;

  CartListModels({this.name, this.ownerId, this.cartItems});

  CartListModels.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    ownerId = json['owner_id'];
    if (json['cart_items'] != null) {
      cartItems = <CartItems>[];
      json['cart_items'].forEach((v) {
        cartItems!.add(new CartItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['owner_id'] = this.ownerId;
    if (this.cartItems != null) {
      data['cart_items'] = this.cartItems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CartItems {
  int? id;
  int? ownerId;
  int? userId;
  int? productId;
  String? productName;
  String? productThumbnailImage;
  String? variation;
  int? price;
  String? currencySymbol;
  int? tax;
  int? shippingCost;
  int? quantity;
  int? lowerLimit;
  int? upperLimit;

  CartItems(
      {this.id,
      this.ownerId,
      this.userId,
      this.productId,
      this.productName,
      this.productThumbnailImage,
      this.variation,
      this.price,
      this.currencySymbol,
      this.tax,
      this.shippingCost,
      this.quantity,
      this.lowerLimit,
      this.upperLimit});

  CartItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ownerId = json['owner_id'];
    userId = json['user_id'];
    productId = json['product_id'];
    productName = json['product_name'];
    productThumbnailImage = json['product_thumbnail_image'];
    variation = json['variation'];
    price = json['price'];
    currencySymbol = json['currency_symbol'];
    tax = json['tax'];
    shippingCost = json['shipping_cost'];
    quantity = json['quantity'];
    lowerLimit = json['lower_limit'];
    upperLimit = json['upper_limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['owner_id'] = this.ownerId;
    data['user_id'] = this.userId;
    data['product_id'] = this.productId;
    data['product_name'] = this.productName;
    data['product_thumbnail_image'] = this.productThumbnailImage;
    data['variation'] = this.variation;
    data['price'] = this.price;
    data['currency_symbol'] = this.currencySymbol;
    data['tax'] = this.tax;
    data['shipping_cost'] = this.shippingCost;
    data['quantity'] = this.quantity;
    data['lower_limit'] = this.lowerLimit;
    data['upper_limit'] = this.upperLimit;
    return data;
  }
}
