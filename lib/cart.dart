import 'package:mobx/mobx.dart';

// Include generated file
part 'cart.g.dart';

// This is the class used by rest of your codebase
//class Counter = _Counter with _$Counter;
class Cart = _Cart with _$Cart;

// The store-class
abstract class _Cart with Store {
  @observable
//  List<Map> cart;
  var cart = List();
  @action
  void addToCart(Map product) {
    cart.add(product);
  }
}