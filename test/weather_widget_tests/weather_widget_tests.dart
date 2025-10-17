
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing_lab/widgets/weather_display.dart';

void main(){


   testWidgets('Clicking Refresh', (tester) async {
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: WeatherDisplay()),));
    await tester.pumpAndSettle();

    Finder refreshButton=   find.byType(ElevatedButton);
     
     expect(refreshButton, findsOneWidget);

   await  tester.tap(refreshButton);

       await tester.pumpAndSettle();

Finder defaultText =    find.text('Sunny');

expect(find.text('Sunny'), findsOneWidget) ;


        });
}