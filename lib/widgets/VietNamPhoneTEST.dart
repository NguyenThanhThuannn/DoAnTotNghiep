import 'package:flutter/services.dart';

class VietnamesePhoneNumberFormatter extends TextInputFormatter {
  final List<String> validPrefixes = ['03', '05', '07', '08', '09'];

  @override
  TextEditingValue formatEditUpdate(final TextEditingValue oldValue, final TextEditingValue newValue) {
    final newText = newValue.text.replaceAll(RegExp(r'[^\d]'), '');
    
    if (newText.length > 10) {
      return oldValue;
    }

    if (newText.length >= 2) {
      final String prefix = newText.substring(0, 2);
      if (!validPrefixes.contains(prefix)) {
        return oldValue;
      }
    }

    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
