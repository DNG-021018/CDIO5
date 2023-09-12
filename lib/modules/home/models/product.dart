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
