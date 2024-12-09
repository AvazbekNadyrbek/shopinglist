part of 'grocery_bloc.dart';

@immutable
sealed class GroceryEvent {
  const GroceryEvent();
}

// Event to load grocery items
final class LoadGroceryItems extends GroceryEvent {}

// Event to add a new item

final class AddGroceryItem extends GroceryEvent {
  final GroceryItem item;

  const AddGroceryItem(this.item);
}

// Remove an item

final class RemoveGroceryItem extends GroceryEvent {
  final String id;

  const RemoveGroceryItem(this.id);
}
