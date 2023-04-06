// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

// To parse this JSON data, do
//
//     final itemModel = itemModelFromJson(jsonString);

// import 'dart:convert';

// List<ItemModel> itemModelFromJson(String str) => List<ItemModel>.from(json.decode(str).map((x) => ItemModel.fromJson(x)));

// String itemModelToJson(List<ItemModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ItemModel {
   final int userId;
   final int id;
   final String title;
    String? body;
  ItemModel({
    required this.userId,
    required this.id,
    required this.title,
     this.body,
  });
    // ItemModel({
    //     required this.userId,
    //     required this.id,
    //     required this.title,
    //      this.body,
    // });
   

    // factory ItemModel.fromJson(Map<String, dynamic> json) => ItemModel(

    //     userId: json["userId"],
    //     id: json["id"],
    //     title: json["title"],
    //     body: json["body"],
    // );

    // Map<String, dynamic> toJson() => {
    //     "userId": userId,
    //     "id": id,
    //     "title": title,
    //     "body": body,
    // };


  ItemModel copyWith({
    int? userId,
    int? id,
    String? title,
    String? body,
  }) {
    return ItemModel(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'id': id,
      'title': title,
      'body': body,
    };
  }

  factory ItemModel.fromMap(Map<String, dynamic> map) {
    return ItemModel(
      userId: map['userId'] as int,
      id: map['id'] as int,
      title: map['title'] as String,
      body: map['body'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemModel.fromJson(String source) => ItemModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ItemModel(userId: $userId, id: $id, title: $title, body: $body)';
  }

  @override
  bool operator ==(covariant ItemModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.userId == userId &&
      other.id == id &&
      other.title == title &&
      other.body == body;
  }

  @override
  int get hashCode {
    return userId.hashCode ^
      id.hashCode ^
      title.hashCode ^
      body.hashCode;
  }
}
