class RestaurantModels {
  String? name;
  String? location;
  String? address;
  String? imageUrl;
  String? rating;
  String? mapUrl;
  String? phone;
  List<Menu>? menus;

  RestaurantModels({
    this.name,
    this.location,
    this.address,
    this.imageUrl,
    this.rating,
    this.mapUrl,
    this.phone,
    this.menus,
  });

  factory RestaurantModels.fromJson(Map<String, dynamic> json) =>
      RestaurantModels(
        name: json["name"],
        location: json["location"],
        address: json["address"],
        imageUrl: json["imageUrl"],
        rating: json["rating"],
        mapUrl: json["mapUrl"],
        phone: json["phone"],
        menus: (json["menus"] == null || (json["menus"] as List).isEmpty)
            ? <Menu>[]
            : List<Menu>.from(json["menus"]!.map((x) => Menu.fromJson(x))),
      );
}

class Menu {
  String? menu;
  String? price;
  String? imageUrl;

  Menu({
    this.menu,
    this.price,
    this.imageUrl,
  });

  factory Menu.fromJson(Map<String, dynamic> json) => Menu(
        menu: json["menu"],
        price: json["price"],
        imageUrl: json["imageUrl"],
      );
}
