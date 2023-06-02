
import 'dart:convert';

class ProductModel{

  static List<Item> items = [];

  /// get Item by id
  Item getById(int id) => items.firstWhere((element) => element.id==id, orElse: null);

  /// get Item by position
  Item getByPosition(int pos) => items[pos];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String imageUrl;

  /// This is the constructor
  // a05_item(this.id, this.name, this.desc, this.price, this.color, this.imageUrl);    /// simple constructor

  Item ({ required this.id, required this.name, required this.desc, required this.price, required this.color, required this.imageUrl });    /// named constructor


  Item copyWith({ int? id, String? name, String? desc, num? price, String? color, String? imageUrl,}){
    return Item(
      id: id ?? this.id,
      name: name ?? this.name,
      desc: desc ?? this.desc,
      price: price ?? this.price,
      color: color ?? this.color,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Map<String, dynamic> toMap(){
    return {
      'id': id,
      'name': name,
      'desc': desc,
      'price': price,
      'color': color,
      'imageUrl': imageUrl,
    };
  }

  factory Item.fromMap(Map <String,dynamic> map){
    return Item(
      id: map["id"],
      name: map["name"],
      desc: map["desc"],
      price: map["price"],
      color: map["color"],
      imageUrl: map["imageUrl"],
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) => Item.fromMap(json.decode(source));

  @override
  bool operator == (Object o){
    if(identical(this, o)) return true;
    return o is Item && o.id==id && o.name==name && o.desc==desc && o.price==price && o.color==color && o.imageUrl==imageUrl;
  }

  @override
  int get hashCode{
    return id.hashCode ^ name.hashCode ^ desc.hashCode ^ price.hashCode ^ color.hashCode ^ imageUrl.hashCode;
  }

}
