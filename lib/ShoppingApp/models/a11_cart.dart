
import 'package:fortunearrt_demo_app/ShoppingApp/core/a13_store.dart';
import 'package:fortunearrt_demo_app/ShoppingApp/models/a05_item.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel{

  /// product fields
  ProductModel? _product;    /// _ makes it private
  /// collection of Ids
  final List<int> _itemIds = [];

  ProductModel? get product => _product;       /// getter method because it _product was private

  set product(ProductModel? newProduct) {      /// set method
    assert(newProduct != null);
    _product = newProduct;
  }

  /// Get items in the cart
  List<Item> get items => _itemIds.map((id) => _product!.getById(id)).toList();

  /// get total price
  num get totalPrice => items.fold(0, (total, current) => total + current.price);

}


class AddMutation extends VxMutation <MyStore>{

  final Item item;

  AddMutation(this.item);

  @override
  perform() {
    store!.cart._itemIds.add(item.id);
  }
}


class RemoveMutation extends VxMutation <MyStore>{

  final Item item;

  RemoveMutation(this.item);

  @override
  perform() {
    store!.cart._itemIds.remove(item.id);
  }
}
