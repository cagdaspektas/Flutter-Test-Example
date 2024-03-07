import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/model/favorites_model.dart';
import 'package:flutter_testing/presentation/home_view.dart';
import 'package:provider/provider.dart';

Widget createHomeScreen() => ChangeNotifierProvider<Favorites>(
      create: (context) => Favorites(),
      child: const MaterialApp(
        home: MainScreen(),
      ),
    );
void main() {
  group("Home Widget Test", () {
    testWidgets('Testing if ListView shows up', (widgetTester) async {
      await widgetTester.pumpWidget(createHomeScreen());
      expect(find.byType(ListView), findsOneWidget);
    });
    testWidgets("", (widgetTester) async {
      await widgetTester.pumpWidget(createHomeScreen());

      expect(find.text("Item 0"), findsOneWidget);
      await widgetTester.fling(find.byType(ListView), const Offset(0, -200), 3000);
      await widgetTester.pumpAndSettle();
      expect(find.text('Item 0'), findsNothing);
    });
    testWidgets('Testing IconButtons', (widgetTester) async {
      await widgetTester.pumpWidget(createHomeScreen());
      expect(find.byIcon(Icons.favorite), findsNothing);
      await widgetTester.tap(find.byIcon(Icons.favorite_border).first);
      await widgetTester.pumpAndSettle(const Duration(seconds: 1));
      expect(find.text('Added to favorites.'), findsOneWidget);
      expect(find.byIcon(Icons.favorite), findsWidgets);
      await widgetTester.tap(find.byIcon(Icons.favorite).first);
      await widgetTester.pumpAndSettle(const Duration(seconds: 1));
      expect(find.text('Removed from favorites.'), findsOneWidget);
      expect(find.byIcon(Icons.favorite), findsNothing);
    });
  });
}
