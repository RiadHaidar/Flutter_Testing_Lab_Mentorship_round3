
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing_lab/widgets/shopping_cart.dart';

void main() {
  testWidgets('Cart Widget Tests adding iphone once', (tester) async {
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: ShoppingCart(),),));
 await tester.pumpAndSettle();
    var iphoneButton =  find.byKey(Key('iphone_key'));


        await tester.tap(iphoneButton,warnIfMissed: false);

    await tester.pumpAndSettle();
expect(find.textContaining('Subtotal: \$999.99'), findsWidgets);

  });

   testWidgets('Cart Widget Tests adding iphone twice', (tester) async {
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: ShoppingCart(),),));

    var iphoneButton =  find.byKey(Key('iphone_key'));
  expect(iphoneButton, findsOneWidget);


await tester.tapAt(tester.getCenter(iphoneButton));
  await tester.pumpAndSettle(); // Wait for first tap to process
  
  await tester.tap(iphoneButton, warnIfMissed: false);
  await tester.pumpAndSettle(); // Wait for second tap to process


   expect(find.textContaining('Subtotal: \$1999.98'), findsWidgets);

expect(find.textContaining('Total Discount: \$200.00'), findsWidgets);
expect(find.textContaining('Discount: 10%'), findsWidgets);

  });

testWidgets('Cart Widget Tests adding iphone once', (tester) async {
  await tester.pumpWidget(MaterialApp(
    home: Scaffold(
      body: ShoppingCart(),
    ),
  ));
  
  await tester.pumpAndSettle();
  
  var iphoneButton = find.byKey(Key('iphone_key'));
  expect(iphoneButton, findsOneWidget);
  
  await tester.tap(iphoneButton, warnIfMissed: false);
  await tester.pumpAndSettle();
  
  // DEBUG: Print EVERYTHING on screen
  print('=== All widgets with text ===');
  tester.allWidgets.whereType<Text>().forEach((widget) {
    print('Text: "${widget.data}"');
  });
  
  // Try finding just "Subtotal" first
  expect(find.textContaining('Subtotal'), findsWidgets);
});




}
