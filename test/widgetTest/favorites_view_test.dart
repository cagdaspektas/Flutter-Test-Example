import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/model/favorites_model.dart';
import 'package:flutter_testing/presentation/favorites_view.dart';
import 'package:provider/provider.dart';

late Favorites favoritesList;

Widget createFavoritesWidget() => ChangeNotifierProvider<Favorites>(
      create: (context) {
        favoritesList = Favorites();
        return favoritesList;
      },
      child: const MaterialApp(
        home: FavoritesView(),
      ),
    );

void add() {
  for (var i = 0; i < 10; i += 2) {
    favoritesList.add(i);
  }
}

void main() {
  group("Favorites Test", () {
    testWidgets("Is Favorite List Empty", (widgetTester) async {
      await widgetTester.pumpWidget(createFavoritesWidget());
      add();
      await widgetTester.pumpAndSettle();
      expect(find.byType(ListView), findsOneWidget);
    });

    testWidgets("Remove Button", (widgetTester) async {
      await widgetTester.pumpWidget(createFavoritesWidget());
      add();
      await widgetTester.pumpAndSettle();
      expect(find.byIcon(Icons.close), findsAny);
    });
    testWidgets("Remove Button Number is ok?", (widgetTester) async {
      await widgetTester.pumpWidget(createFavoritesWidget());
      add();
      await widgetTester.pumpAndSettle();
      var total = widgetTester.widgetList(find.byIcon(Icons.close)).length;
      await widgetTester.tap(find.byIcon(Icons.close).first);
      await widgetTester.pumpAndSettle();
      expect(widgetTester.widgetList(find.byIcon(Icons.close)).length, lessThan(total));
      expect(find.text("Removed from favorites."), findsAny);
    });
  });
}
