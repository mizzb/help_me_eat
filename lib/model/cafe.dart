class Cafe {
  String? name;
  String? location;
  String? priceRange;
  String? menuType;
  String? menu;
  String? cuisine;
  bool? kidsFriendly;
  String? rating;
  String? zomatoLink;

  Cafe(
      {this.name,
      this.location,
      this.priceRange,
      this.menuType,
      this.menu,
      this.cuisine,
      this.rating,
      this.zomatoLink,
      this.kidsFriendly});

  Cafe.fromJson(Map<String, dynamic> json) {
    name = (json['name'] != null) ? json['name'] : null;
    location = (json['location'] != null) ? json['location'] : null;
    priceRange = (json['price_range'] != null) ? json['price_range'] : null;
    cuisine = (json['cuisine'] != null) ? json['cuisine'] : null;
    menuType = (json['menu_type'] != null) ? json['menu_type'] : null;
    menuType = (json['menu'] != null) ? json['menu'] : null;
    kidsFriendly =
        (json['kids_friendly'] != null) ? json['kids_friendly'] : null;
    rating = (json['rating'] != null) ? json['rating'].toString() : null;
    zomatoLink =
        (json['zomato_link'] != null) ? json['zomato_link'].toString() : null;
  }
}
