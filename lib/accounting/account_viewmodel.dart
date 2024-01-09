import 'package:eksado_main/accounting/account_defaults_model.dart';
import 'package:eksado_main/firebase/firestore/database.dart';
import 'account_log_model.dart';

class AccountLogVM {
  Database db = Database();
  final String collectionName = "accountLogs";
  Future<List<AccountLog>> getAccountLogs() async {
    List<AccountLog> AccountLogs = [];
    var result = await db.getAllDocuments(collectionName);
    for (var element in result) {
      AccountLog product =
          AccountLog.fromJson(element.data() as Map<String, dynamic>);
      AccountLogs.add(product);
    }
    return AccountLogs;
  }

  Future<void> addAccountLog(AccountLog AccountLog) async {
    print(AccountLog.toJson());
    await db.createDocument(collectionName, AccountLog.toJson());
  }

  Future<void> updateAccountLog(AccountLog AccountLog) async {
    await db.updateDocument(
        collectionName, AccountLog.id!, AccountLog.toJson());
  }

  Future<void> deleteAccountLog(AccountLog AccountLog) async {
    await db.deleteDocument(collectionName, AccountLog.id!);
  }

  Future<AccountDefaultsModel> getAccountDefaults() async {
    var result =
        await db.readDocument("accountDefaults", "accountDefaultsDocument");
    AccountDefaultsModel accountDefaultsModel = AccountDefaultsModel(
        incomeBudget: result['incomeBudget'],
        outcomeBudget: result['outcomeBudget'],
        taxRate: result['taxRate']);
    return accountDefaultsModel;
  }

  Future<void> updateAccountDefault(
      AccountDefaultsModel accountDefaultsModel) async {
    await db.updateDocument("accountDefaults", "accountDefaultsDocument",
        accountDefaultsModel.toJson());
  }
}
