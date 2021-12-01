import 'dart:convert';

List<Products> productsFromJson(String str) => List<Products>.from(json.decode(str).map((x) => Products.fromJson(x)));

String productsToJson(List<Products> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Products {
  Products({
    this.name,
    this.photo,
    this.price,
    this.description,
  });

  String? name;
  String? photo;
  String? price;
  String? description;

  factory Products.fromJson(Map<String, dynamic> json) => Products(
    name: json["name"],
    photo: json["photo"],
    price: json["price"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "photo": photo,
    "price": price,
    "description": description,
  };
}
