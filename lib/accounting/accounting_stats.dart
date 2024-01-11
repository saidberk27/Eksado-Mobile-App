import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eksado_main/firebase/firestore/database.dart';
import 'package:flutter/foundation.dart';

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
    if (kDebugMode) {
      print("Total: $total");
    }

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
    if (kDebugMode) {
      print("Total: $total");
    }

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
    if (kDebugMode) {
      print("Total: $total");
    }

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
    if (kDebugMode) {
      print("Total: $total");
    }

    return total.toString();
  }

  Future<int> getDefaultIncomeBudget() async {
    DocumentSnapshot ds =
        await db.readDocument("accountDefaults", "accountDefaultsDocument");
    if (kDebugMode) {
      print("Default Income Budget");
    }
    Map<String, dynamic> data = ds.data() as Map<String, dynamic>;
    int incomeBudget = int.parse(data["incomeBudget"]);

    return incomeBudget;
  }

  Future<int> getDefaultOutcomeBudget() async {
    DocumentSnapshot ds =
        await db.readDocument("accountDefaults", "accountDefaultsDocument");
    if (kDebugMode) {
      print("Default Income Budget");
    }
    Map<String, dynamic> data = ds.data() as Map<String, dynamic>;
    int outcomeBudget = int.parse(data["outcomeBudget"]);

    return outcomeBudget;
  }

  Future<int> getDefaultTaxRate() async {
    DocumentSnapshot ds =
        await db.readDocument("accountDefaults", "accountDefaultsDocument");
    if (kDebugMode) {
      print("Default Income Budget");
    }
    Map<String, dynamic> data = ds.data() as Map<String, dynamic>;
    int taxRate = int.parse(data["taxRate"]);

    return taxRate;
  }

  Future<int> getIncomePercentage() async {
    int incomeBudget = await getDefaultIncomeBudget();
    int totalIncome = int.parse(await getTotalIncomes());

    return (totalIncome / incomeBudget * 100).round();
  }

  Future<int> getOutcomePercentage() async {
    int outcomeBudget = await getDefaultOutcomeBudget();
    int totalOutcome = int.parse(await getTotalOutcomes());

    return (totalOutcome / outcomeBudget * 100).round();
  }

  Future<int> getNetProfit() async {
    int totalIncome = int.parse(await getTotalIncomes());
    int totalOutcome = int.parse(await getTotalOutcomes());

    return totalIncome - totalOutcome;
  }

  Future<String> getNetProfitStr() async {
    int totalIncome = int.parse(await getTotalIncomes());
    int totalOutcome = int.parse(await getTotalOutcomes());

    return (totalIncome - totalOutcome).toString();
  }

  Future<int> getNetProfitMargin() async {
    int netProfit = await getNetProfit();
    int totalIncome = int.parse(await getTotalIncomes());

    return ((netProfit / totalIncome) * 100).round();
  }

  Future<String> getQuickRatio() async {
    int totalDebt = int.parse(await getTotalDebts());
    int netProfit = await getNetProfit();

    return ((netProfit / totalDebt).round()).toString();
  }

  Future<String> getCurrentRatio() async {
    int totalDebt = int.parse(await getTotalDebts());
    int totalRecievables = int.parse(await getTotalReceivables());
    int netProfit = await getNetProfit();

    return (((netProfit + totalRecievables) / totalDebt).round()).toString();
  }
}
