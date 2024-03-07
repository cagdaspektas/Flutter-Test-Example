import 'package:flutter_testing/model/favorites_model.dart';
import 'package:test/test.dart';

void main() {
  group(
    "Test provider class",
    () {
      var favorites = Favorites();

      test("test add fun", () {
        int testData = 35;
        favorites.add(testData);
        expect(favorites.items.contains(testData), true);
      });
      test("test delete fun", () {
        int testData = 45;
        favorites.add(testData);
        expect(favorites.items.contains(testData), true);

        favorites.delete(testData);
        expect(favorites.items.contains(testData), false);
      });
    },
  );
}
