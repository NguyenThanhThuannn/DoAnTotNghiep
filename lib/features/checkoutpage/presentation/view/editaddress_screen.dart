import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:provider/provider.dart';
import '../../../../config/textStyle.dart';
import '../../../../injection_container.dart';
import '../../../../network/end_points.dart';
import '../../../loginregisterpage/data/model/user_model.dart';
import '../../../loginregisterpage/data/services/provider.dart';
import '../../../loginregisterpage/presentation/bloc/user_bloc.dart';

class EditAddressScreen extends StatefulWidget {
  const EditAddressScreen({super.key});

  @override
  State<EditAddressScreen> createState() => _EditAddressScreenState();
}

class _EditAddressScreenState extends State<EditAddressScreen> {
  Addresses? _selectedAddress;
  void _updateSelectedAddress(final Addresses newAddress) {
    setState(() {
      _selectedAddress = newAddress;
    });
  }
  @override
  void initState() {
    super.initState();
    context.read<UserBloc>().add(GetUserById(Provider.of<UserProvider>(context,listen: false).getUser!.id!));
  }

  TextEditingController addressController = TextEditingController();
  /* List<Address> address = [
    Address(
      location: 'Nhà riêng',
      CT_location: '502 Huỳnh Tấn Phát, P. Bình Thuận, TP HCM',
    ),
    Address(
      location: 'Cơ quan',
      CT_location:
          'Số 10 – 12 Đường số 3, KDC Đại Phúc Green Villas, Bình Hưng, Bình Chánh, TP HCM',
    ),
    Address(location: 'Nhà bạn', CT_location: 'Nguyễn Tất Thành, Q.4, TP HCM'),
    Address(
      location: 'Cơ quan',
      CT_location:
          'Số 11 – 12 Đường số 3, KDC Đại Phúc Green Villas, Bình Hưng, Bình Chánh, TP HCM',
    ),
  ]; */

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Visibility(
          visible: false,
          child: GestureDetector(
            onTap: () => Navigator.of(context).pop(_selectedAddress),
            child: const Icon(Icons.navigate_before_outlined),
          ),
        ),
        title: const Text('Địa chỉ nhận hàng'),
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
          _selectedAddress == null && state.user!.addresses!.isNotEmpty
              ? _selectedAddress = state.user!.addresses!.first
              : null;
          if (state is UserLoaded) {
            final lstAddresses = state.user!.addresses!;
            log(lstAddresses.toString());
            return lstAddresses.isNotEmpty
            ?Column(
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
                        leading: Radio<Addresses>(
                          value: lstAddresses[index],
                          groupValue: _selectedAddress,
                          onChanged: (final value) {
                            _updateSelectedAddress(value!);
                            log(_selectedAddress.toString());
                          },
                        ),
                        trailing: GestureDetector(
                          onTap: () {
                            setState(() {
                              DeleteAddressById(
                                Provider.of<UserProvider>(
                                  context,
                                  listen: false,
                                ).getUser!.id,
                                state.user!.addresses![index].id,
                              ).then(
                                (final value) => context.read<UserBloc>().add(
                                      GetUserById2(
                                        Provider.of<UserProvider>(context,
                                                listen: false,)
                                            .getUser!
                                            .id!,
                                      ),
                                    ),
                              );
                              /* log('Đã clicked $index để xóa!');
                              lstAddresses.removeAt(index);
                              log(lstAddresses.toString()); */
                            });
                          },
                          child: const Icon(Icons.delete),
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
                                                            listen: false,)
                                                        .getUser!
                                                        .id!,
                                                  ),
                                                );
                                            Navigator.of(context).pop();
                                          });
                                        }
                                      },
                                      child: const Text('OK'),
                                    ),
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.of(context).pop(),
                                      child: const Text('Cancel'),
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
            ): Center(
              child: TextButton(
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
                                                              listen: false,)
                                                          .getUser!
                                                          .id!,
                                                    ),
                                                  );
                                              Navigator.of(context).pop();
                                            });
                                          }
                                        },
                                        child: const Text('OK'),
                                      ),
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.of(context).pop(),
                                        child: const Text('Cancel'),
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
                    child: const Text('Thêm địa chỉ mới'),),
            );
          }
          return Container();
        },
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

/* class Address {
  Address({
    required this.location,
    required this.CT_location,
  });
  String location;
  String CT_location;
} */
