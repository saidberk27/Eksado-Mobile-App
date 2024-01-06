class Customer {
  String name;
  String surname;
  String email;
  String phoneNumber;
  String company;
  bool isMale;
  String? id;
  Customer(
      {required this.name,
      required this.surname,
      required this.email,
      required this.phoneNumber,
      required this.company,
      required this.isMale,
      this.id});

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      name: json['name'],
      surname: json['surname'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      company: json['company'],
      isMale: json['isMale'],
      id: json[
          'documentId'], // Id sadece veritabanindan okundugunda set edilir.
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'surname': surname,
      'email': email,
      'phoneNumber': phoneNumber,
      'company': company,
      'isMale': isMale, //yerelde kullanilan fonksiyonlar icin id gerekli degil.
    };
  }
}
