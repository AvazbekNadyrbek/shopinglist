import 'package:alistofflutter/data/dummy_items.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:alistofflutter/models/grocery_item.dart';

part 'grocery_state.dart';
part 'grocery_event.dart';

class GroceryBloc extends Bloc<GroceryEvent, GroceryState> {
  // Store our grocery items
  final List<GroceryItem> _groceryItems = [];

  GroceryBloc() : super(GroceryInitial()) {
    // Handle loading items
    on<LoadGroceryItems>(_onLoadGroceryItems);

    // Handle adding items
    on<AddGroceryItem>(_onAddGroceryItem);

    // Handle removing items
    on<RemoveGroceryItem>(_onRemoveGroceryItem);
  }

  // Load items handler
  Future<void> _onLoadGroceryItems(
    LoadGroceryItems event,
    Emitter<GroceryState> emit,
  ) async {
    emit(GroceryLoading());
    try {
      if (_groceryItems.isEmpty) {
        emit(GroceryInitial());
      } else {
        emit(GroceryLoaded(groceryItems: _groceryItems));
      }
    } catch (e) {
      emit(GroceryError(message: 'Failed to load items: $e'));
    }
  }

  // Add item handler
  Future<void> _onAddGroceryItem(
    AddGroceryItem event,
    Emitter<GroceryState> emit,
  ) async {
    emit(GroceryLoading());
    try {
      _groceryItems.add(event.item);
      emit(GroceryLoaded(groceryItems: _groceryItems));
    } catch (e) {
      emit(GroceryError(message: 'Failed to add item: $e'));
    }
  }

  // Remove item handler
  Future<void> _onRemoveGroceryItem(
    RemoveGroceryItem event,
    Emitter<GroceryState> emit,
  ) async {
    emit(GroceryLoading());
    try {
      _groceryItems.removeWhere((item) => item.id == event.id);
      if (_groceryItems.isEmpty) {
        emit(GroceryInitial());
      } else {
        emit(GroceryLoaded(groceryItems: _groceryItems));
      }
    } catch (e) {
      emit(GroceryError(message: 'Failed to remove item: $e'));
    }
  }
}
