class Restaurant {
  String? name;
  String? cuisine;
  String? priceRange;
  String? location;
  String? rating;
  String? type;
  String? affordability;
  String? menuType;
  String? menu;
  String? zomatoLink;

  Restaurant(
      {this.name,
      this.cuisine,
      this.priceRange,
      this.location,
      this.rating,
      this.type,
      this.affordability,
      this.menuType,
      this.zomatoLink,
      this.menu});

  Restaurant.fromJson(Map<String, dynamic> json) {
    name = (json['name'] != null) ? json['name'] : null;
    cuisine = (json['cuisine'] != null) ? json['cuisine'] : null;
    priceRange = (json['price_range'] != null) ? json['price_range'] : null;
    location = (json['location'] != null) ? json['location'] : null;
    rating = (json['rating'] != null) ? json['rating'].toString() : null;
    affordability = (json['affordability'] != null)
        ? json['affordability'].toString()
        : null;
    menuType =
        (json['menu_type'] != null) ? json['menu_type'].toString() : null;
    menu = (json['menu'] != null) ? json['menu'].toString() : null;
    zomatoLink =
        (json['zomato_link'] != null) ? json['zomato_link'].toString() : null;
  }
}
