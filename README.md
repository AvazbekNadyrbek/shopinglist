# Flutter Grocery List App

A Flutter application built for learning and practicing the BLoC (Business Logic Component) pattern. This project demonstrates how to implement state management in Flutter using the BLoC pattern.

## Features

- Add grocery items with name, quantity, and category
- Remove items using swipe-to-delete gesture
- Display items with category color indicators
- Clean and intuitive user interface
- State management using BLoC pattern

## Technologies & Patterns Used

- **Flutter**: UI framework for building natively compiled applications
- **BLoC Pattern**: State management solution
  - Event handling
  - State transitions
  - Pattern matching for state handling
- **flutter_bloc**: Implementation of the BLoC pattern
- **Equatable**: For value equality comparisons
- **Material Design**: Modern UI components and theming

## Project Structure

```
lib/
├── bloc/
│   ├── grocery_bloc.dart
│   ├── grocery_event.dart
│   └── grocery_state.dart
├── data/
│   ├── categories.dart
│   └── dummy_items.dart
├── models/
│   └── grocery_item.dart
├── widgets/
│   ├── grocery_list.dart
│   └── new_item.dart
└── main.dart
```

## State Management

The app uses the BLoC pattern with the following components:

- **States**:
  - `GroceryInitial`: Initial state with welcome message
  - `GroceryLoading`: Loading state
  - `GroceryLoaded`: Success state with list of items
  - `GroceryError`: Error state with message

- **Events**:
  - `LoadGroceryItems`: Trigger loading of items
  - `AddGroceryItem`: Add new item to the list
  - `RemoveGroceryItem`: Remove item from the list

## UI Features

- Dark theme with Material 3 design
- Swipe-to-delete functionality
- Color-coded categories
- Quantity display
- Loading indicators
- Error handling

## Learning Outcomes

This project demonstrates:
- Implementation of BLoC pattern in Flutter
- State management best practices
- UI/UX design patterns
- Event handling and state transitions
- Pattern matching in Dart
- Widget composition and reuse

## Getting Started

1. Clone the repository
2. Ensure Flutter is installed and set up
3. Run `flutter pub get` to install dependencies
4. Run `flutter run` to start the app

## Dependencies

```yaml
dependencies:
  flutter_bloc: ^8.1.3
  equatable: ^2.0.5
  bloc: ^8.1.4
  meta: ^1.15.0
