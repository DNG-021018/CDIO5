class Product {
  final String imageName;
  final List<String> imageChild;
  final String productName;
  final double productPrice;
  final List<String> productSize;

  Product({
    required this.imageName,
    required this.productName,
    required this.productPrice,
    required this.productSize,
    required this.imageChild,
  });

  static double totalPrice(List<Product> products) {
    double total = 0;
    for (var product in products) {
      total += product.productPrice;
    }
    return total;
  }
}

// class Product {
//   int? id;
//   String? clientId;
//   int? status;
//   String? description;
//   String? address;
//   String? dateOrder;
//   int? amount;
//   int? isPay;
//   List<DetailsProduct>? products;

//   Product({
//     this.id,
//     this.clientId,
//     this.status,
//     this.description,
//     this.address,
//     this.dateOrder,
//     this.amount,
//     this.isPay,
//     this.products,
//   });

//   Product.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     clientId = json['client_id'];
//     status = json['status'];
//     description = json['description'];
//     address = json['address'];
//     dateOrder = json['date_order'];
//     amount = json['amount'];
//     isPay = json['isPay'];
//     if (json['products'] != null) {
//       products = <DetailsProduct>[];
//       json['products'].forEach((v) {
//         products!.add(DetailsProduct.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['client_id'] = clientId;
//     data['status'] = status;
//     data['description'] = description;
//     data['address'] = address;
//     data['date_order'] = dateOrder;
//     data['amount'] = amount;
//     data['isPay'] = isPay;
//     if (products != null) {
//       data['products'] = products!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }


// }

// class DetailsProduct {
//   int? id;
//   String? name;
//   String? img;
//   String? brandId;
//   String? bCColor;
//   String? description;
//   int? discountId;
//   String? type;
//   int? price;
//   String? dateCreate;
//   List<Inventory>? inventory;
//   List<String>? imgs;
//   int? detailOrderId;
//   String? size;
//   int? quantity;
//   int? rating;

//   DetailsProduct({
//     this.id,
//     this.name,
//     this.img,
//     this.brandId,
//     this.bCColor,
//     this.description,
//     this.discountId,
//     this.type,
//     this.price,
//     this.dateCreate,
//     this.inventory,
//     this.imgs,
//     this.detailOrderId,
//     this.size,
//     this.quantity,
//     this.rating,
//   });

//   DetailsProduct.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     img = json['img'];
//     brandId = json['brand_id'];
//     bCColor = json['BC_color'];
//     description = json['description'];
//     discountId = json['discount_id'];
//     type = json['type'];
//     price = json['price'];
//     dateCreate = json['dateCreate'];
//     if (json['inventory'] != null) {
//       inventory = <Inventory>[];
//       json['inventory'].forEach((v) {
//         inventory!.add(Inventory.fromJson(v));
//       });
//     }
//     imgs = json['imgs'].cast<String>();
//     detailOrderId = json['detail_order_id'];
//     size = json['size'];
//     quantity = json['quantity'];
//     rating = json['rating'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['name'] = name;
//     data['img'] = img;
//     data['brand_id'] = brandId;
//     data['BC_color'] = bCColor;
//     data['description'] = description;
//     data['discount_id'] = discountId;
//     data['type'] = type;
//     data['price'] = price;
//     data['dateCreate'] = dateCreate;
//     if (inventory != null) {
//       data['inventory'] = inventory!.map((v) => v.toJson()).toList();
//     }
//     data['imgs'] = imgs;
//     data['detail_order_id'] = detailOrderId;
//     data['size'] = size;
//     data['quantity'] = quantity;
//     data['rating'] = rating;
//     return data;
//   }

//     static int totalPrice(List<DetailsProduct> products) {
//     int total = 0;
//     for (var product in products) {
//       total += product.price!;
//     }
//     return total;
//   }
// }

// class Inventory {
//   String? size;
//   int? quantity;

//   Inventory({this.size, this.quantity});

//   Inventory.fromJson(Map<String, dynamic> json) {
//     size = json['size'];
//     quantity = json['quantity'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['size'] = size;
//     data['quantity'] = quantity;
//     return data;
//   }
// }
