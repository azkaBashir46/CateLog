// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ItemModel {
   final int id;
   final num price;
   final String title;
   final String description;
    String? category;
    final String? image;
  ItemModel({
    required this.id,
    required this.price,
    required this.title,
    required this.description,
    this.category,
    this.image,
  });


  ItemModel copyWith({
    int? id,
    num? price,
    String? title,
    String? description,
    String? category,
    String? image,
  }) {
    return ItemModel(
      id: id ?? this.id,
      price: price ?? this.price,
      title: title ?? this.title,
      description: description ?? this.description,
      category: category ?? this.category,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'price': price,
      'title': title,
      'description': description,
      'category': category,
      'image': image,
    };
  }

  factory ItemModel.fromMap(Map<String, dynamic> map) {
    return ItemModel(
      id: map['id'] as int,
      price: map['price'] as num,
      title: map['title'] as String,
      description: map['description'] as String,
      category: map['category'] != null ? map['category'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemModel.fromJson(String source) => ItemModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ItemModel(id: $id, price: $price, title: $title, description: $description, category: $category, image: $image)';
  }

  @override
  bool operator ==(covariant ItemModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.price == price &&
      other.title == title &&
      other.description == description &&
      other.category == category &&
      other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      price.hashCode ^
      title.hashCode ^
      description.hashCode ^
      category.hashCode ^
      image.hashCode;
  }
}
