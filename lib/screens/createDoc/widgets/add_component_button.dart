import 'package:flutter/material.dart';

class AddComponentButton extends StatelessWidget {
  const AddComponentButton({
    super.key,
    required this.colors,
  });

  final ColorScheme colors;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          side: BorderSide(color: colors.primary, width: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20)),
      onPressed: () {
        Scaffold.of(context).openEndDrawer();
      },
      child: const Row(
        children: [
          Text(
            "Add",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          Icon(Icons.add),
        ],
      ),
    );
  }
}
