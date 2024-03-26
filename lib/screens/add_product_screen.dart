import 'package:flutter/material.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> _educationalQualification = [
      'Pass Out',
      'Graduate',
      'Post Graduate',
      'Diploma',
      'No Padhai, only Systumm!'
    ];

    List<DropdownMenuEntry<String>> buildDropdownMenuItems() {
      return _educationalQualification.map((String item) {
        return DropdownMenuEntry<String>(
          value: item,
          label: item,
        );
      }).toList();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Product'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10),
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Add new product'),
              TextField(
                decoration: InputDecoration(
                    label: Text('Product Name'),
                    hintText: 'Enter your product here'),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(
                    label: Text('Product Description'),
                    hintText: 'Enter your product description'),
                maxLines: 4,
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(
                    label: Text('Image URL'), hintText: 'Enter your image url'),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(
                    label: Text('Product Price'),
                    hintText: 'Enter your product price'),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  DropdownMenu(
                    inputDecorationTheme: const InputDecorationTheme(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.orange,
                        ),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.green,
                        ),
                      ),
                    ),
                    dropdownMenuEntries: buildDropdownMenuItems(),
                  ),
                  DropdownMenu(
                    inputDecorationTheme: const InputDecorationTheme(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.orange,
                        ),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.green,
                        ),
                      ),
                    ),
                    dropdownMenuEntries: buildDropdownMenuItems(),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text('Offer Product?'),
              DropdownMenu(dropdownMenuEntries: buildDropdownMenuItems()),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigoAccent,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {},
                  child: Text('Add Product')),
            ],
          ),
        ),
      ),
    );
  }
}
