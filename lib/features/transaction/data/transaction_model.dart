class TransactionModel {
  String id;
  String name;
  String price;
  String date;
  TransactionModel({
    required this.id,
    required this.name,
    required this.price,
    required this.date,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      date: json['date'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'date': date,
    };
  }
}