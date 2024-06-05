import 'dart:developer';
import 'package:flutter/material.dart';

import '../../../../config/textStyle.dart';

class EditAddressScreen extends StatefulWidget {
  const EditAddressScreen({super.key});

  @override
  State<EditAddressScreen> createState() => _EditAddressScreenState();
}

class _EditAddressScreenState extends State<EditAddressScreen> {
  String _selectedAddress = '502 Huỳnh Tấn Phát, P. Bình Thuận, TP HCM';
  void _updateSelectedAddress(final String newAddress) {
    setState(() {
      _selectedAddress = newAddress;
    });
  }

  List<Address> address = [
    Address(
        location: 'Nhà riêng',
        CT_location: '502 Huỳnh Tấn Phát, P. Bình Thuận, TP HCM',),
    Address(
        location: 'Cơ quan',
        CT_location:
            'Số 10 – 12 Đường số 3, KDC Đại Phúc Green Villas, Bình Hưng, Bình Chánh, TP HCM',),
    Address(location: 'Nhà bạn', CT_location: 'Nguyễn Tất Thành, Q.4, TP HCM'),
    Address(
        location: 'Cơ quan',
        CT_location:
            'Số 11 – 12 Đường số 3, KDC Đại Phúc Green Villas, Bình Hưng, Bình Chánh, TP HCM',),
  ];

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: const Icon(Icons.navigate_before_outlined),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 10*address.length,
            child: ListView.builder(
              itemCount: address.length,
              itemBuilder: (final context, final index) {
                return ListTile(
                  title: Text(address[index].location),
                  subtitle: Text(address[index].CT_location),
                  leading: Radio<String>(
                    value: address[index].CT_location,
                    groupValue: _selectedAddress,
                    onChanged: (final value) {
                      _updateSelectedAddress(value!);
                      log(_selectedAddress);
                    },
                  ),
                );
              },
            ),
          ),
          TextButton(
            onPressed: () {
              // Add functionality to add a new address here
            },
            child: const Text('Thêm địa chỉ mới'),
          ),
        ],
      ),
      bottomSheet: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 60,
        child: TextButton(
          onPressed: () {
            Navigator.of(context).pop(_selectedAddress);
          },
          child: const Text('Xác nhận'),
        ),
      ),
    );
  }
}

class Address {
  Address({
    required this.location,
    required this.CT_location,
  });
  String location;
  String CT_location;
}
