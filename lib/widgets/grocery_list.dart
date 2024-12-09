import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:alistofflutter/bloc/grocery_bloc.dart';
import 'package:alistofflutter/widgets/new_item.dart';

class GroceryList extends StatelessWidget {
  const GroceryList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GroceryBloc, GroceryState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Grocery List'),
          ),
          body: switch (state) {
            GroceryLoading() => const Center(
                child: CircularProgressIndicator(),
              ),
            GroceryLoaded(groceryItems: final items) => ListView.builder(
                itemCount: items.length,
                itemBuilder: (ctx, index) => Dismissible(
                  key: ValueKey(items[index].id),
                  onDismissed: (_) {
                    // Remove item when swiped
                    context.read<GroceryBloc>().add(
                          RemoveGroceryItem(items[index].id),
                        );
                  },
                  child: ListTile(
                    title: Text(items[index].name),
                    leading: Container(
                      width: 24,
                      height: 24,
                      color: items[index].category.color,
                    ),
                    trailing: Text(
                      items[index].quantity.toString(),
                    ),
                  ),
                ),
              ),
            GroceryInitial() => const Center(
                child: Text(
                  'Start adding items to your grocery list!',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            GroceryError(message: final message) => Center(
                child: Text('Error: $message',
                    style: const TextStyle(color: Colors.red)),
              ),
          },
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => const NewItem(),
                ),
              );
            },
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
