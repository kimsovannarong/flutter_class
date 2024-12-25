
import '../models/grocery_category.dart';
import '../models/grocery_item.dart';

final dummyGroceryItems = [
   GroceryItem(
      id: 'a',
      name: 'Milk',
      quantity: 1,
      category: GroceryCategory.dairy),
   GroceryItem(
      id: 'b',
      name: 'Bananas',
      quantity: 5,
      category: GroceryCategory.fruit),
   GroceryItem(
      id: 'c',
      name: 'Beef Steak',
      quantity: 1,
      category: GroceryCategory.meat),
];
