import 'package:flutter/material.dart';

// An enum (enumeration) in Flutter/Dart is a special data
//type that allows you to define a fixed set of named constants.
//It's useful when you have a variable that can only take one of a predetermined set of values.

enum Categories {
  vegetables,
  fruit,
  meat,
  dairy,
  carbs,
  sweets,
  spices,
  convenience,
  hygiene,
  other,
}

class Category {
  final String title;
  final Color color;
  const Category(this.title, this.color);
}
