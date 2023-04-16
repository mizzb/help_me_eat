class Pub {
  String? name;
  String? location;
  String? priceRange;
  String? type;
  String? affordability;
  String? cuisine;
  String? menuType;
  String? menu;
  String? rating;
  String? zomatoLink;

  Pub(
      {this.name,
      this.location,
      this.priceRange,
      this.type,
      this.rating,
      this.menu,
      this.menuType,
      this.cuisine,
      this.zomatoLink,
      this.affordability});

  Pub.fromJson(Map<String, dynamic> json) {
    name = (json['name'] != null) ? json['name'] : null;
    location = (json['location'] != null) ? json['location'] : null;
    priceRange = (json['price_range'] != null) ? json['price_range'] : null;
    type = (json['type'] != null) ? json['type'] : null;
    cuisine = (json['cuisine'] != null) ? json['cuisine'] : null;
    menuType = (json['menu_type'] != null) ? json['menu_type'] : null;
    menu = (json['menu'] != null) ? json['menu'] : null;
    rating = (json['rating'] != null) ? json['rating'].toString() : null;
    affordability =
        (json['affordability'] != null) ? json['affordability'] : null;
    zomatoLink =
        (json['zomato_link'] != null) ? json['zomato_link'].toString() : null;
  }
}
