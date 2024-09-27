import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {

  final String text;
  const PrimaryButton({super.key, required this.text});


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 10),
          backgroundColor: Theme.of(context).colorScheme.surface,
          foregroundColor: Theme.of(context).colorScheme.primary,
          shape: BeveledRectangleBorder(
            side: BorderSide(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ),
        onPressed: () {},
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
