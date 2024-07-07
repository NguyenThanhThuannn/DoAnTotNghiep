import 'dart:convert';
import 'dart:typed_data';

class ImageCheck {
  bool isBase64Image(final String base64String) {
    final RegExp base64Pattern = RegExp(
      r'^data:image\/(png|jpg|jpeg);base64,[a-zA-Z0-9+/]+={0,2}$',
      caseSensitive: false,
    );
    return base64Pattern.hasMatch(base64String);
  }

  Uint8List base64ToImage(final String base64String) {
    final String base64Data = base64String.split(',').last;
    return base64Decode(base64Data);
  }

  String base64ToImageString(final String base64String) {
  final String base64Data = base64String.split(',').last;
  Uint8List bytes = base64Decode(base64Data);
  return String.fromCharCodes(bytes);
}
}