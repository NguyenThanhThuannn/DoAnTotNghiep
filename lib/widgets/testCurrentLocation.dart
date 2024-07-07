import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationState();
}

class _LocationState extends State<LocationScreen> {
  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Kiểm tra dịch vụ vị trí đã được bật chưa
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Vị trí không bật. Không thể tiếp tục.
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Quyền bị từ chối. Không thể tiếp tục.
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Quyền bị từ chối vĩnh viễn. Không thể tiếp tục.
      return;
    }

    // Lấy vị trí hiện tại
    final Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,);

    // Chuyển đổi tọa độ thành địa chỉ
    final List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude, position.longitude,
        );

    if (placemarks.isNotEmpty) {
      final Placemark placemark = placemarks.first;
      log(placemark.toString());
      setState(() {
        _locationController.text = [
          placemark.street,
          placemark.locality,
          placemark.subAdministrativeArea,
          placemark.administrativeArea,
          placemark.country,
        ].where((final element) => element != null && element.isNotEmpty).join(', ');
      });
    } else {
      setState(() {
        _locationController.text = 'Không tìm thấy địa chỉ';
      });
    }
  }

  List<Placemark>? placeMark;
  String? vt;
  final TextEditingController _locationController = TextEditingController();
  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _locationController,
            onChanged: (final value) {
            },
          ),
          Text('CurrentLocation: ${placeMark?[0].country}'),
          TextButton(
            onPressed: () {
                _getCurrentLocation();
            },
            child: const Text('Current Location'),
          ),
        ],
      ),
    );
  }
}
