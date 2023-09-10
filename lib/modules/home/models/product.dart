class Product {
  final String imageName;
  final String productName;
  final double productPrice;

  Product({
    required this.imageName,
    required this.productName,
    required this.productPrice,
  });

  static double totalPrice(List<Product> products) {
    double total = 0;
    for (var product in products) {
      total += product.productPrice;
    }
    return total;
  }
}
