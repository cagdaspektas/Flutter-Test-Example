import 'package:flutter/material.dart';
import 'package:flutter_testing/model/favorites_model.dart';
import 'package:provider/provider.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  static String route = "favorites_view";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test App"),
      ),
      body: Consumer<Favorites>(
        builder: (context, value, child) {
          return ListView.builder(
            itemCount: value.items.length,
            padding: const EdgeInsets.symmetric(vertical: 16),
            itemBuilder: (BuildContext context, int index) {
              return FavoritesItem(
                itemNo: value.items[index],
              );
            },
          );
        },
      ),
    );
  }
}

class FavoritesItem extends StatelessWidget {
  const FavoritesItem({
    super.key,
    required this.itemNo,
  });
  final int itemNo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.primaries[itemNo % Colors.primaries.length],
        ),
        title: Text(
          'Item $itemNo',
          key: Key('favorites_text_$itemNo'),
        ),
        trailing: IconButton(
          key: Key('remove_icon_$itemNo'),
          icon: const Icon(Icons.close),
          onPressed: () {
            Provider.of<Favorites>(context, listen: false).delete(itemNo);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Removed from favorites.'),
                duration: Duration(seconds: 1),
              ),
            );
          },
        ),
      ),
    );
  }
}
