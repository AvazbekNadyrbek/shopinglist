part of 'grocery_bloc.dart';

@immutable
sealed class GroceryState {
  const GroceryState();
}

// Initial state
final class GroceryInitial extends GroceryState {}

// Loading state
final class GroceryLoading extends GroceryState {}

// Success state with list of items
class GroceryLoaded extends GroceryState {
  final List<GroceryItem> groceryItems;

  const GroceryLoaded({required this.groceryItems});

  List<Object> get props => [groceryItems];
}

// Error state
final class GroceryError extends GroceryState {
  final String message;

  const GroceryError({required this.message});
}
