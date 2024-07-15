import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

class AddressValidationScreen extends StatelessWidget {
  AddressValidationScreen({super.key});

  final TextEditingController _addressController = TextEditingController();
  Future<bool> validateAddress(final String address) async {
    try {
      // Sử dụng phương thức locationFromAddress để chuyển đổi địa chỉ thành tọa độ
      final List<Location> locations = await locationFromAddress(address);

      // Kiểm tra nếu kết quả không rỗng
      if (locations.isNotEmpty) {
        // Lấy địa chỉ ngược lại từ tọa độ để xác nhận
        final List<Placemark> placemarks = await placemarkFromCoordinates(
          locations.first.latitude,
          locations.first.longitude,
        );

        // Kiểm tra nếu có ít nhất một địa chỉ
        if (placemarks.isNotEmpty) {
          final Placemark placemark = placemarks.first;

          // Kiểm tra nếu địa chỉ nằm trong Việt Nam và khớp với các thành phần địa chỉ cụ thể
          if ((placemark.country == 'Vietnam' ||
                  placemark.country == 'Việt Nam') &&
              placemark.street != null &&
              placemark.locality != null &&
              placemark.administrativeArea != null) {
            // Kiểm tra thêm các thành phần khác như locality, administrativeArea nếu cần
            print(
                'Địa chỉ hợp lệ: ${placemark.street}, ${placemark.locality}, ${placemark.administrativeArea}');
            return true;
          }
        }
      }
    } catch (e) {
      print('Lỗi: $e');
    }
    return false;
  }

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Xác thực địa chỉ'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _addressController,
              decoration: const InputDecoration(
                labelText: 'Địa chỉ nhận hàng',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                final address = _addressController.text;
                final isValid = await validateAddress(address);
                if (isValid) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Địa chỉ hợp lệ')),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Địa chỉ không hợp lệ')),
                  );
                }
              },
              child: const Text('Xác nhận địa chỉ'),
            ),
          ],
        ),
      ),
    );
  }
}
