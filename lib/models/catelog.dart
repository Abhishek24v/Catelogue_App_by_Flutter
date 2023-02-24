// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CatelogModels {
  static List<Item>? items;

  //get item by ID
  Item getItem(String id) =>
      items!.firstWhere((element) => element.id == id, orElse: null);

  //get item by position
  Item getItemByPos(int pos) => items![pos];
}

class Item {
  final String? id;
  final String? name;
  final String? des;
  final num? price;
  final String? color;
  final String? image;

  Item(this.id, this.name, this.des, this.price, this.color, this.image);

  Item copyWith({
    String? id,
    String? name,
    String? des,
    num? price,
    String? color,
    String? image,
  }) {
    return Item(
      id ?? this.id,
      name ?? this.name,
      des ?? this.des,
      price ?? this.price,
      color ?? this.color,
      image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'des': des,
      'price': price,
      'color': color,
      'image': image,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      map['id'] != null ? map['id'] as String : null,
      map['name'] != null ? map['name'] as String : null,
      map['des'] != null ? map['des'] as String : null,
      map['price'] != null ? map['price'] as num : null,
      map['color'] != null ? map['color'] as String : null,
      map['image'] != null ? map['image'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) =>
      Item.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Item(id: $id, name: $name, des: $des, price: $price, color: $color, image: $image)';
  }

  @override
  bool operator ==(covariant Item other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.des == des &&
        other.price == price &&
        other.color == color &&
        other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        des.hashCode ^
        price.hashCode ^
        color.hashCode ^
        image.hashCode;
  }
}
