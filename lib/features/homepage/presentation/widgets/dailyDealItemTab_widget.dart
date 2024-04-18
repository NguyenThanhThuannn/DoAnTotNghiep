import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemTab extends StatelessWidget {
  const ItemTab({super.key, required this.name, required this.isSelected});
  final String name;
  final bool isSelected;

  @override
  Widget build(final BuildContext context) {
    return Text(
      name,
      style: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: isSelected ? Colors.red : Colors.grey,
      ),
    );
  }
}