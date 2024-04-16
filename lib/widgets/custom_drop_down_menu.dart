import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDropDownMenu extends StatelessWidget {
  final List<String> items;
  final String hintText;
  final void Function(String?)? onSelected;

  List<DropdownMenuEntry<String>> buildDropdownMenuItems() {
    return items.map((String item) {
      return DropdownMenuEntry<String>(
        value: item,
        label: item,
      );
    }).toList();
  }

  const CustomDropDownMenu(
      {super.key,
      required this.items,
      this.onSelected,
      required this.hintText});

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      inputDecorationTheme: InputDecorationTheme(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: context.theme.colorScheme.primary,
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: context.theme.colorScheme.primary,
          ),
        ),
      ),
      dropdownMenuEntries: buildDropdownMenuItems(),
      onSelected: onSelected,
      hintText: hintText,
    );
  }
}
