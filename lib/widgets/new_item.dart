import 'package:alistofflutter/bloc/grocery_bloc.dart';
import 'package:alistofflutter/data/categories.dart';
import 'package:alistofflutter/models/category.dart';
import 'package:alistofflutter/models/grocery_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewItem extends StatefulWidget {
  const NewItem({super.key});

  @override
  State<NewItem> createState() => _NewItemState();
}

class _NewItemState extends State<NewItem> {
  final _formKey = GlobalKey<FormState>();
  var _enteredName = '';
  var _enteredQuantity = 1;
  var _selectedCategory = categories[Categories.vegetables]!;

  void _saveItem() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Add new item using bloc
      context.read<GroceryBloc>().add(
            AddGroceryItem(
              GroceryItem(
                id: DateTime.now().toString(),
                name: _enteredName,
                quantity: _enteredQuantity,
                category: _selectedCategory,
              ),
            ),
          );
      Navigator.of(context).pop();
    }
  }

  void _resetItem() {
    _formKey.currentState!.reset();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a new item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  maxLength: 50,
                  decoration: const InputDecoration(
                    label: Text('Name'),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    if (value.trim().length <= 1) {
                      return 'Please enter at least 2 characters';
                    } else if (value.trim().length > 50) {
                      return 'Please enter no more than 50 characters';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _enteredName = value!;
                  },
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          label: Text('Quantity'),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          if (int.tryParse(value) == null) {
                            return 'Please enter a number';
                          }
                          if (value.trim().length <= 0) {
                            return 'Please enter a number greater than 0';
                          } else if (value.trim().length > 50) {
                            return 'Please enter no more than 50 characters';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                        initialValue: _enteredQuantity.toString(),
                        onSaved: (value) {
                          _enteredQuantity = int.parse(value!);
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: DropdownButtonFormField(
                          value: _selectedCategory,
                          dropdownColor: Colors.black,
                          items: [
                            for (final category in categories.entries)
                              DropdownMenuItem(
                                value: category.value,
                                child: Row(
                                  children: [
                                    Container(
                                        width: 16,
                                        height: 16,
                                        color: category.value.color),
                                    const SizedBox(width: 6),
                                    Text(category.value.title),
                                  ],
                                ),
                              )
                          ],
                          onChanged: (value) {
                            setState(() {
                              _selectedCategory = value!;
                            });
                          }),
                    )
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: _resetItem,
                      child: const Text('Reset Items'),
                    ),
                    ElevatedButton(
                      onPressed: _saveItem,
                      child: const Text('Add Item'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
