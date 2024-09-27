import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDropDownMenu extends StatelessWidget {
  final List<String> items;
  final String hintText;
  final void Function(String?) onChanged;
  final String? Function(String?)? validator;

  List<DropdownMenuItem<String>> buildDropdownMenuItems() {
    return items.map((item) {
      return DropdownMenuItem<String>(
        value: item,
        child: Text(item),
      );
    }).toList();
  }

  const CustomDropDownMenu(
      {super.key, required this.items, required this.onChanged, required this.hintText, this.validator});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      onChanged: onChanged,
      hint: Text(hintText),
      items: buildDropdownMenuItems(),
      validator: validator,
    );
  }
}
