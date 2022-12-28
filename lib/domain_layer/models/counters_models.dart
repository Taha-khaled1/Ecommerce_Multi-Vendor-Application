class CountersModels {
  int? cartItemCount;
  int? wishlistItemCount;
  int? orderCount;

  CountersModels({this.cartItemCount, this.wishlistItemCount, this.orderCount});

  CountersModels.fromJson(Map<String, dynamic> json) {
    cartItemCount = json['cart_item_count'];
    wishlistItemCount = json['wishlist_item_count'];
    orderCount = json['order_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cart_item_count'] = this.cartItemCount;
    data['wishlist_item_count'] = this.wishlistItemCount;
    data['order_count'] = this.orderCount;
    return data;
  }
}
