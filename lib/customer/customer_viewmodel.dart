import 'package:eksado_main/firebase/firestore/database.dart';
import 'customer_model.dart';

class CustomerVM {
  Database db = Database();
  final String collectionName = "customers";
  Future<List<Customer>> getCustomers() async {
    List<Customer> customers = [];
    var result = await db.getAllDocuments(collectionName);
    for (var element in result) {
      Customer customer =
          Customer.fromJson(element.data() as Map<String, dynamic>);
      customers.add(customer);
    }
    return customers;
  }

  Future<void> addCustomer(Customer customer) async {
    print(customer.toJson());
    await db.createDocument(collectionName, customer.toJson());
  }

  Future<void> updateCustomer(Customer customer) async {
    await db.updateDocument(collectionName, customer.id!, customer.toJson());
  }

  Future<void> deleteCustomer(Customer customer) async {
    await db.deleteDocument(collectionName, customer.id!);
  }
}
