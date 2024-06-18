class CurrencyFormatter {
  // Phương thức định dạng số
  String formatNumber(String number) {
    // Chuyển đổi chuỗi thành số
    double numberAsDouble = double.tryParse(number) ?? 0.0;

    // Chuyển đổi số thành chuỗi và tách phần nguyên và phần thập phân
    List<String> parts = numberAsDouble.toStringAsFixed(0).split('.');
    String integerPart = parts[0];
  
    // Đảo ngược chuỗi phần nguyên để dễ thêm dấu phẩy
    String reversedIntegerPart = integerPart.split('').reversed.join();
  
    // Thêm dấu phẩy vào mỗi 3 chữ số
    String formattedReversedIntegerPart = '';
    for (int i = 0; i < reversedIntegerPart.length; i++) {
      formattedReversedIntegerPart += reversedIntegerPart[i];
      if ((i + 1) % 3 == 0 && i + 1 != reversedIntegerPart.length) {
        formattedReversedIntegerPart += ',';
      }
    }
  
    // Đảo ngược lại chuỗi đã định dạng
    String formattedIntegerPart = formattedReversedIntegerPart.split('').reversed.join();
  
    // Kết hợp phần nguyên đã định dạng với ký hiệu tiền tệ 'Đ'
    return '$formattedIntegerPartĐ';
  }
}
