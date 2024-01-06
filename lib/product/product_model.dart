class Product {
  final String productName;
  final String productClass;
  final String roofCovering;
  final String glassOption;
  final String smartHomeOption;
  String? id;

  Product(
      {required this.productName,
      required this.productClass,
      required this.roofCovering,
      required this.glassOption,
      required this.smartHomeOption,
      this.id});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      productName: json['productName'],
      productClass: json['productClass'],
      roofCovering: json['roofCovering'],
      glassOption: json['glassOption'],
      smartHomeOption: json['smartHomeOption'],
      id: json['documentId'],
    );
  }

  Map<String, dynamic> toJson() => {
        'productName': productName,
        'productClass': productClass,
        'roofCovering': roofCovering,
        'glassOption': glassOption,
        'smartHomeOption': smartHomeOption,
      };
}
