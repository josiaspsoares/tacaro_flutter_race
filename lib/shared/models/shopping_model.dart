import 'dart:convert';

class ShoppingModel {
  final String id;
  final String name;
  final String date;
  final double price;
  
  ShoppingModel({
    required this.id,
    required this.name,
    required this.date,
    required this.price,
  });

  ShoppingModel copyWith({
    String? id,
    String? name,
    String? date,
    double? price,
  }) {
    return ShoppingModel(
      id: id ?? this.id,
      name: name ?? this.name,
      date: date ?? this.date,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'date': date,
      'price': price,
    };
  }

  factory ShoppingModel.fromMap(Map<String, dynamic> map) {
    return ShoppingModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      date: map['date'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ShoppingModel.fromJson(String source) => ShoppingModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ShoppingModel(id: $id, name: $name, date: $date, price: $price)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ShoppingModel &&
      other.id == id &&
      other.name == name &&
      other.date == date &&
      other.price == price;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      date.hashCode ^
      price.hashCode;
  }
}
