import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eksado_main/firebase/firestore/database.dart';

class AccountingStats {
  Database db = Database();
  Future<String> getTotalOutcomes() async {
    int total = 0;

    QuerySnapshot qs = await db.getDocumentsWithFilter(
        collectionName: "accountLogs", field: "accountType", equalTo: "Gider");

    for (var doc in qs.docs) {
      var data = doc.data() as Map<String, dynamic>; // Tip dönüşümü ekledik
      total = total + (data["amount"] as int); // Tip dönüşümü ekledik
    }
    print("Total: $total");

    return total.toString();
  }

  Future<String> getTotalIncomes() async {
    int total = 0;

    QuerySnapshot qs = await db.getDocumentsWithFilter(
        collectionName: "accountLogs", field: "accountType", equalTo: "Gelir");

    for (var doc in qs.docs) {
      var data = doc.data() as Map<String, dynamic>; // Tip dönüşümü ekledik
      total = total + (data["amount"] as int); // Tip dönüşümü ekledik
    }
    print("Total: $total");

    return total.toString();
  }

  Future<String> getTotalDebts() async {
    int total = 0;

    QuerySnapshot qs = await db.getDocumentsWithFilter(
        collectionName: "accountLogs", field: "accountType", equalTo: "Borç");

    for (var doc in qs.docs) {
      var data = doc.data() as Map<String, dynamic>; // Tip dönüşümü ekledik
      total = total + (data["amount"] as int); // Tip dönüşümü ekledik
    }
    print("Total: $total");

    return total.toString();
  }

  Future<String> getTotalReceivables() async {
    int total = 0;

    QuerySnapshot qs = await db.getDocumentsWithFilter(
        collectionName: "accountLogs", field: "accountType", equalTo: "Alacak");

    for (var doc in qs.docs) {
      var data = doc.data() as Map<String, dynamic>; // Tip dönüşümü ekledik
      total = total + (data["amount"] as int); // Tip dönüşümü ekledik
    }
    print("Total: $total");

    return total.toString();
  }
}
