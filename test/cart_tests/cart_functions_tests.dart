

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing_lab/helpers/cart_calculator.dart';

void main(){

  
   test('testing add function with correct length', (){
    List<CartItem> items=[];

    CartCalculator.addItem(items, '1', 'Apple iPhone', 999.99,discount: 0.1);
        CartCalculator.addItem(items, '1', 'Apple iPhone', 999.99,discount: 0.1);

    expect(items.length, 1);
   });
  
   test('testing add function with wrong length', (){
    List<CartItem> items=[];

    CartCalculator.addItem(items, '1', 'Apple iPhone', 999.99,discount: 0.1);
        CartCalculator.addItem(items, '2', 'Samsung Galaxy', 899.99, discount: 0.15);

    expect(items.length, 1);
   });



 test('testing add function with correct total and discount ', (){
  List<CartItem> items=[];

    CartCalculator.addItem(items, '1', 'Apple iPhone', 999.99,discount: 0.1);
    CartCalculator.addItem(items, '1', 'Apple iPhone', 999.99,discount: 0.1);
      var total =CartCalculator.calculateTotalAmount(items);
      var discount =CartCalculator.calculateTotalDiscount(items);
      var subtotal = CartCalculator.calculateSubtotal(items);
        expect(total, 1799.982);
        expect(discount, 199.99800000000002);
        expect(subtotal, 1999.98);
   });

test('testing add, remove functions with correct total and discount', () {
  List<CartItem> items=[];

  CartCalculator.addItem(items, '1', 'Apple iPhone', 999.99, discount: 0.1);
  CartCalculator.addItem(items, '1', 'Apple iPhone', 999.99, discount: 0.1);
  CartCalculator.addItem(items, '2', 'Samsung Galaxy', 899.99, discount: 0.15);
  CartCalculator.addItem(items, '2', 'Samsung Galaxy', 899.99, discount: 0.15);
  CartCalculator.addItem(items, '2', 'Samsung Galaxy', 899.99, discount: 0.15);
  CartCalculator.removeItem(items, '2');

  var total = CartCalculator.calculateTotalAmount(items);
  var discount = CartCalculator.calculateTotalDiscount(items);
  var subtotal = CartCalculator.calculateSubtotal(items);
  
  expect(total.toStringAsFixed(2), '1799.98');
  expect(discount.toStringAsFixed(2), '200.00');
  expect(subtotal.toStringAsFixed(2), '1999.98');
});






test('Empty Cart Test', () {
  List<CartItem> items=[];

    var total = CartCalculator.calculateTotalAmount(items);
    var totalItems= CartCalculator.calculateTotalItems(items);
  var discount = CartCalculator.calculateTotalDiscount(items);
  var subtotal = CartCalculator.calculateSubtotal(items);


   expect(total.toStringAsFixed(2), '0.00');
  expect(discount.toStringAsFixed(2), '0.00');
  expect(subtotal.toStringAsFixed(2), '0.00');
  
  expect(totalItems,0);

});




test('100% Discount Test', () {
  List<CartItem> items=[];
    CartCalculator.addItem(items, '1', 'Apple iPhone', 999.99, discount: 1.0);
    CartCalculator.addItem(items, '2', 'Samsung Galaxy', 899.99, discount: 1.0);
    var total = CartCalculator.calculateTotalAmount(items);
    var totalItems= CartCalculator.calculateTotalItems(items);
  var discount = CartCalculator.calculateTotalDiscount(items);
  var subtotal = CartCalculator.calculateSubtotal(items);
  expect(subtotal.toStringAsFixed(2), '1899.98');
  expect(discount.toStringAsFixed(2), '1899.98');
  expect(total.toStringAsFixed(2), '0.00');
  expect(totalItems, 2);
});



test('Correct Quantity Test', () {
  List<CartItem> items=[];
  // im adding 2 iphones
    CartCalculator.addItem(items, '1', 'Apple iPhone', 999.99, discount: 1.0);
   CartCalculator.addItem(items, '1', 'Apple iPhone', 999.99, discount: 1.0);
    //getting total should be 2
    var totalItems= CartCalculator.calculateTotalItems(items);
      expect(totalItems, 2);
    // updatiing with -5 (if the user clicked reduce button 5 times)
    CartCalculator.updateQuantity(items,'1',-5);
      totalItems = CartCalculator.calculateTotalItems(items);  
  // it should not go beyond 0
  expect(totalItems, 0);
});



}
