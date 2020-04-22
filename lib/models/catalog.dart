import 'package:flutter/material.dart';

class CatalogModel {
  static const _itemNames = [
    'Code Smell',
    'Control flow',
    'Interpreter',
    'Recursion',
    'Sprint',
    'Heisenbug',
    'Spaghetti',
    'Hydra Code',
    'Off-By-One',
    'Scope',
    'Callback',
    'Automata',
    'Bit Shift',
    'Currying',
  ];

  Item getById(int id) => Item(id, _itemNames[id % _itemNames.length]);

  Item getByPosition(int position) {
    return getById(position);
  }
}

class Item {
  final int id;
  final String name;
  final Color color;
  final int price = 42;

  Item(this.id, this.name) : color = Colors.primaries[id % Colors.primaries.length];

  int get hashCode => id;

  bool operator ==(Object other) => other is Item && other.id == id;
}