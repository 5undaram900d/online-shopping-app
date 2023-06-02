
import 'package:flutter/material.dart';
import 'package:fortunearrt_demo_app/ShoppingApp/models/a05_item.dart';

class ItemWidget extends StatelessWidget {

  final Item item;

  const ItemWidget({Key? key, required this.item}) : assert(key == null), super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: (){
          debugPrint("${item.name} pressed");
        },
        leading: Image.network(item.imageUrl.toString()),
        title: Text(item.name.toString()),
        subtitle: Text(item.desc.toString()),
        trailing: Text("\$${item.price.toString()}",textScaleFactor: 1.5, style: const TextStyle(color: Colors.pink, fontWeight: FontWeight.bold),),
      ),
    );
  }
}
