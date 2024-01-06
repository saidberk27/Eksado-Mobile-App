import 'package:eksado_main/firebase/firestore/database.dart';
import 'product_model.dart';

class ProductVM {
  Database db = Database();
  Future<List<Product>> getProducts() async {
    List<Product> Products = [];
    var result = await db.getAllDocuments("products");
    for (var element in result) {
      Product product =
          Product.fromJson(element.data() as Map<String, dynamic>);
      Products.add(product);
    }
    return Products;
  }

  Future<void> addProduct(Product Product) async {
    print(Product.toJson());
    await db.createDocument("products", Product.toJson());
  }

  Future<void> updateProduct(Product Product) async {
    await db.updateDocument("products", Product.id!, Product.toJson());
  }

  Future<void> deleteProduct(Product Product) async {
    await db.deleteDocument("products", Product.id!);
  }
}
