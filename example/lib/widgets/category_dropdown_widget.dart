import 'package:fake_store_package/domain/utils/category_enum.dart';
import 'package:flutter/material.dart';

class CategoryDropdownWidget extends StatelessWidget {
  final Category? selectedCategory;
  final ValueChanged<Category?> onChanged;

  const CategoryDropdownWidget({
    super.key,
    required this.selectedCategory,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.grey),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<Category>(
          value: selectedCategory,
          icon: const Icon(Icons.arrow_drop_down),
          iconSize: 24,
          elevation: 16,
          style: const TextStyle(color: Colors.black, fontSize: 16),
          onChanged: onChanged,
          items: Category.values
              .map<DropdownMenuItem<Category>>((Category category) {
            return DropdownMenuItem<Category>(
              value: category,
              child: Text(category.displayName),
            );
          }).toList(),
          hint: const Text("Seleccionar Categoría"),
        ),
      ),
    );
  }
}
