import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import '../features/loginregisterpage/data/model/user_model.dart';
import '../features/loginregisterpage/data/services/provider.dart';
import '../features/loginregisterpage/presentation/bloc/user_bloc.dart';
import '../network/end_points.dart';

class AddressesUserScreen extends StatefulWidget {
  const AddressesUserScreen({super.key});

  @override
  State<AddressesUserScreen> createState() => _EditAddressScreenState();
}

class _EditAddressScreenState extends State<AddressesUserScreen> {
  TextEditingController addressController = TextEditingController();
  /* Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the 
    // App to enable the location services.
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale 
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      return Future.error('Location permissions are denied');
    }
  }
  
  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately. 
    return Future.error(
      'Location permissions are permanently denied, we cannot request permissions.',);
  } 

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  return await Geolocator.getCurrentPosition();
} */
  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: const Icon(Icons.navigate_before_outlined),
        ),
        title: const Text('Địa chỉ của tôi'),
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (final context, final state) {
          if (state is UserError) {
            return Center(
              child: Text(state.error!.toString()),
            );
          }
          if (state is UserLoading) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          if (state is UserLoaded) {
            final lstAddresses = state.user!.addresses!;
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height /
                        10 *
                        lstAddresses.length,
                    child: ListView.builder(
                      itemCount: lstAddresses.length,
                      itemBuilder: (final context, final index) {
                        return ListTile(
                          title: Text(lstAddresses[index].id.toString()),
                          subtitle: Text(lstAddresses[index].address_line!),
                          trailing: GestureDetector(
                            onTap: () {
                              setState(() {
                                addressController.text =
                                    lstAddresses[index].address_line!;
                                showDialog(
                                  context: context,
                                  builder: (final context) {
                                    return AlertDialog.adaptive(
                                      content: SizedBox(
                                        height:
                                            MediaQuery.of(context).size.width / 3,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            TextField(
                                              controller: addressController,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                TextButton(
                                                  onPressed: () {
                                                    DeleteAddressById(
                                                      Provider.of<UserProvider>(
                                                        context,
                                                        listen: false,
                                                      ).getUser!.id,
                                                      state.user!
                                                          .addresses![index].id,
                                                    ).then((final value) {
                                                      context
                                                          .read<UserBloc>()
                                                          .add(
                                                            GetUserById2(
                                                              Provider.of<
                                                                  UserProvider>(
                                                                context,
                                                                listen: false,
                                                              ).getUser!.id!,
                                                            ),
                                                          );
                                                      Navigator.of(context).pop();
                                                    });
                                                  },
                                                  child: const Text('Xóa'),
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    if (addressController
                                                        .text.isNotEmpty) {
                                                      UpdateAddressById(
                                                        Provider.of<UserProvider>(
                                                          context,
                                                          listen: false,
                                                        ).getUser!.id,
                                                        state.user!
                                                            .addresses![index].id,
                                                        addressController.text,
                                                      ).then((final value) {
                                                        context
                                                            .read<UserBloc>()
                                                            .add(
                                                              GetUserById2(
                                                                Provider.of<
                                                                    UserProvider>(
                                                                  context,
                                                                  listen: false,
                                                                ).getUser!.id!,
                                                              ),
                                                            );
                                                        Navigator.of(context)
                                                            .pop();
                                                      });
                                                    }
                                                  },
                                                  child: const Text('Sửa'),
                                                ),
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.of(context).pop(),
                                                  child: const Text('Hủy'),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              });
                            },
                            child: const Icon(Icons.edit),
                          ),
                        );
                      },
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (final context) {
                          return AlertDialog.adaptive(
                            content: SizedBox(
                              height: MediaQuery.of(context).size.width / 3,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Thêm địa chỉ mới:'),
                                  TextField(
                                    controller: addressController,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      //TextButton(onPressed: () => _determinePosition, child: const Text('Vị trí hiện tại')),
                                      TextButton(
                                        onPressed: () {
                                          if (addressController.text.isNotEmpty) {
                                            AddAddress(
                                              Provider.of<UserProvider>(
                                                context,
                                                listen: false,
                                              ).getUser!.id!,
                                              addressController.text,
                                            )!
                                                .then((final value) {
                                              context.read<UserBloc>().add(
                                                    GetUserById2(
                                                      Provider.of<UserProvider>(
                                                        context,
                                                        listen: false,
                                                      ).getUser!.id!,
                                                    ),
                                                  );
                                              Navigator.of(context).pop();
                                            });
                                          }
                                        },
                                        child: const Text('Thêm'),
                                      ),
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.of(context).pop(),
                                        child: const Text('Hủy'),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: const Text('Thêm địa chỉ mới'),
                  ),
                ],
              ),
            );
          }
          return Container();
        },
      ),

    );
  }
}

Future<Map<String, dynamic>>? AddAddress(
  final int userID,
  final String address,
) async {
  try {
    final res = await Dio().post(
      '${EndPoints.baseUrl}${EndPoints.user}/address/$userID',
      data: {
        'address': address,
      },
    );
    return res.data;
  } on DioException catch (e) {
    throw Exception(e.message);
  }
}

Future<Map<String, dynamic>> UpdateAddressById(
  final userId,
  final adddressId,
  final String address,
) async {
  try {
    final res = await Dio().put(
      '${EndPoints.baseUrl}${EndPoints.user}/address/$userId/$adddressId',
      data: {
        'address': address,
      },
    );
    return res.data;
  } on DioException catch (e) {
    throw Exception(e.message);
  }
}

Future<void> DeleteAddressById(final userId, final adddressId) async {
  try {
    final res = await Dio().delete(
      '${EndPoints.baseUrl}${EndPoints.user}/address/$userId',
      data: {
        'address_id': adddressId,
      },
    );
    return res.data['message'];
  } on DioException catch (e) {
    throw Exception(e.message);
  }
}
