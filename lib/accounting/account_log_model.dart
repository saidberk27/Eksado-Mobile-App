class AccountLog {
  String accountType;
  double amount;
  String date;
  String description;
  String? id;
  AccountLog({
    required this.accountType,
    required this.amount,
    required this.date,
    required this.description,
    this.id,
  });

  factory AccountLog.fromJson(Map<String, dynamic> json) {
    return AccountLog(
      accountType: json['accountType'],
      amount: json['amount'],
      date: json['date'],
      description: json['description'],
      id: json['documentId'],
    );
  }

  Map<String, dynamic> toJson() => {
        'accountType': accountType,
        'amount': amount,
        'date': date,
        'description': description,
      };
}
