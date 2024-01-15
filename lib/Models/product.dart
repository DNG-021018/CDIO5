import 'dart:convert';

List<Shoes> shoesFromJson(String str) =>
    List<Shoes>.from(json.decode(str).map((x) => Shoes.fromJson(x)));

String shoesToJson(List<Shoes> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Shoes {
  int id;
  String name;
  String img;
  String brandId;
  String bcColor;
  String description;
  int discountId;
  String type;
  int price;
  String dateCreate;
  List<Inventory> inventory;
  List<String> imgs;

  Shoes({
    required this.id,
    required this.name,
    required this.img,
    required this.brandId,
    required this.bcColor,
    required this.description,
    required this.discountId,
    required this.type,
    required this.price,
    required this.dateCreate,
    required this.inventory,
    required this.imgs,
  });

  factory Shoes.fromJson(Map<String, dynamic> json) => Shoes(
        id: json["id"],
        name: json["name"],
        img: json["img"],
        brandId: json["brand_id"],
        bcColor: json["BC_color"],
        description: json["description"],
        discountId: json["discount_id"],
        type: json["type"],
        price: json["price"],
        dateCreate: json["dateCreate"],
        inventory: List<Inventory>.from(
            json["inventory"].map((x) => Inventory.fromJson(x))),
        imgs: List<String>.from(json["imgs"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "img": img,
        "brand_id": brandId,
        "BC_color": bcColor,
        "description": description,
        "discount_id": discountId,
        "type": type,
        "price": price,
        "dateCreate": dateCreate,
        "inventory": List<dynamic>.from(inventory.map((x) => x.toJson())),
        "imgs": List<dynamic>.from(imgs.map((x) => x)),
      };

  static int calculateTotalPrice(List<Shoes> shoesList) {
    int totalPrice = 0;

    for (Shoes shoes in shoesList) {
      totalPrice += shoes.price;
    }

    return totalPrice;
  }
}

List<Inventory> inventoryFromJson(String str) =>
    List<Inventory>.from(json.decode(str).map((x) => Inventory.fromJson(x)));

String inventoryToJson(List<Inventory> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Inventory {
  String size;
  int quantity;

  Inventory({
    required this.size,
    required this.quantity,
  });

  factory Inventory.fromJson(Map<String, dynamic> json) => Inventory(
        size: json["size"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "size": size,
        "quantity": quantity,
      };
}
