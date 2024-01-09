import 'package:eksado_main/firebase/firestore/database.dart';

class AccountingStats {
  Database db = Database();
  Future<String> getTotalOutcomes() async {
    db.getDocumentsWithFilter(
        collectionName: "accountLogs", field: "accountType", equalTo: "Gider");
    return "0";
  }

  Future<String> getTotalIncomes() async {
    return "0";
  }

  Future<String> getTotalDebts() async {
    return "0";
  }

  Future<String> getTotalReceivables() async {
    return "0";
  }
}
