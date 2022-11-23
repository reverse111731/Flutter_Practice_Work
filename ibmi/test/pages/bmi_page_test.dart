import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ibmi/pages/bmi_page.dart';

void main() {
  testWidgets(
      'Given weightInfoCard When user click + button Then weight increment by 5',
      (tester) async {
    //Arrange
    await tester.pumpWidget(
      const MaterialApp(
        home: BmiPage(),
      ),
    );
    var weightIncrementButton = find.byKey(
      const Key('weight_plus'),
    );
    //Act
    for (int i = 0; i < 5; i++) {
      await tester.tap(weightIncrementButton);
      await tester.pump();
    }
    //Assert
    var text = find.text('165');
    expect(text, findsOneWidget);
  });
  testWidgets(
      'Given weightInfoCard When user click - button Then weight decrement by 5',
      (tester) async {
    //Arrange
    await tester.pumpWidget(
      const MaterialApp(
        home: BmiPage(),
      ),
    );
    var weightDecrementButton = find.byKey(
      const Key('weight_minus'),
    );
    //Act
    for (int i = 0; i < 5; i++) {
      await tester.tap(weightDecrementButton);
      await tester.pump();
    }
    //Assert
    var text = find.text('155');
    expect(text, findsOneWidget);
  });
}
