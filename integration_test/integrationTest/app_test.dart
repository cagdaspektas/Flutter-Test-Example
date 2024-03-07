import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/app.dart';

void main() {
  group("Application Test", () {
    testWidgets("Add And Remove Favorites Test", (widgetTester) async {
      await widgetTester.pumpWidget(const TestingApp());

      final icons = [
        'icon_0',
        'icon_1',
        'icon_2',
      ];
      for (var element in icons) {
        await widgetTester.tap(find.byKey(Key(element)));
        await widgetTester.pumpAndSettle();
        expect(find.text("Added to favorites."), findsOne);
      }
      await widgetTester.tap(find.text("Favorites"));
      await widgetTester.pumpAndSettle();

      final iconsDelete = [
        'remove_icon_0',
        'remove_icon_1',
        'remove_icon_2',
      ];
      for (var element in iconsDelete) {
        await widgetTester.tap(find.byKey(Key(element)));
        await widgetTester.pumpAndSettle();
      }
      expect(find.byKey(const Key('remove_icon_0')), findsNothing);
    });
  });
}
