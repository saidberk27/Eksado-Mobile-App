class AccountDefaultsModel {
  final String incomeBudget;
  final String outcomeBudget;
  final String taxRate;

  AccountDefaultsModel({
    required this.incomeBudget,
    required this.outcomeBudget,
    required this.taxRate,
  });

  factory AccountDefaultsModel.fromJson(Map<String, dynamic> json) {
    return AccountDefaultsModel(
      incomeBudget: json['incomeBudget'],
      outcomeBudget: json['outcomeBudget'],
      taxRate: json['taxRate'],
    );
  }

  Map<String, dynamic> toJson() => {
        'incomeBudget': incomeBudget,
        'outcomeBudget': outcomeBudget,
        'taxRate': taxRate,
      };
}
