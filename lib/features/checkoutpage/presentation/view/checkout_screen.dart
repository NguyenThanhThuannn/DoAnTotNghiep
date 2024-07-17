import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../../config/format_number.dart';
import '../../../../config/image.dart';
import '../../../../config/textStyle.dart';
import '../../../../network/end_points.dart';
import '../../../../widgets/payment.dart';
import '../../../homepage/domain/entities/product.dart';
import '../../../homepage/presentation/bloc/home_page_bloc.dart';
import '../../../homepage/presentation/view/home_page_screen.dart';
import '../../../loginregisterpage/data/model/user_model.dart';
import '../../../loginregisterpage/data/services/provider.dart';
import '../../../loginregisterpage/domain/entities/user.dart';
import '../../../loginregisterpage/presentation/bloc/user_bloc.dart';
import '../../../orderpage/data/model/order_response_model.dart';
import '../../../orderpage/domain/entities/order.dart';
import '../../../paymenttype/domain/payment_entity.dart';
import '../../../paymenttype/presentation/bloc/payment_type_bloc.dart';
import '../bloc/shipping_method_bloc.dart';
import 'editaddress_screen.dart';

class CheckOutScreen extends StatefulWidget {
  CheckOutScreen({super.key, required this.lstProInCO});
  List<ProductEntity> lstProInCO = [];

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  Addresses? address;
  String txtCCNH = 'Giao tận nơi';
  String txtPPTT = 'Thanh toán trực tiếp';
  TextEditingController txtNote = TextEditingController();

  void _showNoteDialog(final TextEditingController txtNote) {
    showDialog(
      context: context,
      builder: (final context) {
        return AlertDialog(
          title: Text(txtNote.text.isNotEmpty ? 'Sửa ghi chú' : 'Thêm ghi chú'),
          content: TextField(
            controller: txtNote,
            decoration: const InputDecoration(
              hintText: 'Nhập ghi chú của bạn',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(txtNote.text.isNotEmpty ? 'Lưu' : 'Thêm'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Hủy'),
            ),
          ],
        );
      },
    );
  }

  void showOption1(final BuildContext context) {
    final RenderBox button = context.findRenderObject()! as RenderBox;
    final RenderBox overlay =
        Overlay.of(context).context.findRenderObject()! as RenderBox;
    showMenu(
      context: context,
      position: RelativeRect.fromRect(
        Rect.fromPoints(
          button.localToGlobal(
            button.size.topRight(const Offset(-20, 110)),
            ancestor: overlay,
          ),
          button.localToGlobal(
            button.size.topRight(const Offset(-20, 110)),
            ancestor: overlay,
          ),
        ),
        Offset.zero & overlay.size,
      ),
      color: Theme.of(context).primaryColor,
      items: [
        const PopupMenuItem<String>(
          value: 'Giao tận nơi',
          child: Text('Giao tận nơi'),
        ),
        const PopupMenuItem<String>(
          value: 'Nhận tại cửa hàng',
          child: Text('Nhận tại cửa hàng'),
        ),
      ],
      elevation: 8.0,
    ).then((final selectedValue) {
      if (selectedValue != null) {
        setState(() {
          txtCCNH = selectedValue;
        });
      }
    });
  }

  void showOption2(final BuildContext context) {
    final RenderBox button = context.findRenderObject()! as RenderBox;
    final RenderBox overlay =
        Overlay.of(context).context.findRenderObject()! as RenderBox;
    showMenu(
      context: context,
      position: RelativeRect.fromRect(
        Rect.fromPoints(
          button.localToGlobal(
            button.size.topRight(
              txtCCNH.contains('Giao tận nơi')
                  ? const Offset(-20, 260)
                  : const Offset(-20, 190),
            ),
            ancestor: overlay,
          ),
          button.localToGlobal(
            button.size.topRight(
              txtCCNH.contains('Giao tận nơi')
                  ? const Offset(-20, 260)
                  : const Offset(-20, 190),
            ),
            ancestor: overlay,
          ),
        ),
        Offset.zero & overlay.size,
      ),
      color: Theme.of(context).primaryColor,
      items: [
        const PopupMenuItem<String>(
          value: 'Thanh toán trực tiếp',
          child: Text('Thanh toán trực tiếp'),
        ),
        const PopupMenuItem<String>(
          value: 'Thanh toán trực tuyến',
          child: Text('Thanh toán trực tuyến'),
        ),
      ],
      elevation: 8.0,
    ).then((final selectedValue) {
      if (selectedValue != null) {
        setState(() {
          txtPPTT = selectedValue;
        });
      }
    });
  }

  String? selectedValueShipping = 1.toString();
  String? selectedValuePaymentType = 1.toString();
  late double total;
  @override
  void initState() {
    super.initState();
    /* context.read<UserBloc>().add(
          GetUserById(
            Provider.of<UserProvider>(context, listen: false).getUser!.id!,
          ),
        ); */
    total = 0.0;
  }

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: const Icon(Icons.navigate_before_outlined),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(17, 0, 17, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Shipping Method ',
                    style: textStyleInterSemiBold16,
                  ),
                  BlocBuilder<ShippingMethodBloc, ShippingMethodState>(
                    builder: (final context, final state) {
                      if (state is ShippingMethodLoading) {
                        return const Center(
                          child: CircularProgressIndicator.adaptive(),
                        );
                      }
                      if (state is ShippingMethodError) {
                        return Text(state.error!.toString());
                      }
                      log(state.shipping_method!.toString());
                      final List<DropdownMenuItem<String>> dropdownItems = state
                          .shipping_method!
                          .map((final ShippingMethodEntity item) {
                        return DropdownMenuItem<String>(
                          value: item.id.toString(),
                          child: Text(item.name!),
                        );
                      }).toList();
                      return DropdownButton<String>(
                        value: selectedValueShipping,
                        onChanged: (final String? newValue) {
                          setState(() {
                            selectedValueShipping = newValue;
                          });
                        },
                        items: dropdownItems,
                      );
                    },
                  ),
                ],
              ),
            ),
            //_buildCachThucNhanHang(context),
            if (txtCCNH.contains('Giao tận nơi'))
              _buildDiaChiNhanHang(context)
            else
              const SizedBox(),
            //_buildNote(),
            Padding(
              padding: const EdgeInsets.fromLTRB(17, 0, 17, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 3,
                    child: Text(
                      'Payment Method',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: textStyleInterSemiBold16,
                    ),
                  ),
                  BlocBuilder<PaymentTypeBloc, PaymentTypeState>(
                    builder: (final context, final state) {
                      if (state is PaymentTypeLoading) {
                        return const Center(
                          child: CircularProgressIndicator.adaptive(),
                        );
                      }
                      if (state is PaymentTypeError) {
                        return Text(state.error!.toString());
                      }
                      log(state.paymentType!.toString());
                      final List<DropdownMenuItem<String>> dropdownItems =
                          state.paymentType!.map((final PaymentEntity item) {
                        return DropdownMenuItem<String>(
                          value: item.id.toString(),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width/2,
                            child: Text(item.value!,overflow: TextOverflow.ellipsis,maxLines: 2,),),
                        );
                      }).toList();
                      return DropdownButton<String>(
                        value: selectedValuePaymentType,
                        onChanged: (final String? newValue) {
                          setState(() {
                            selectedValuePaymentType = newValue;
                          });
                        },
                        items: dropdownItems,
                      );
                    },
                  ),
                ],
              ),
            ),
            //_buildPhuongThucThanhToan(context),
            const Divider(),
            ProductCard(
              lstPro: widget.lstProInCO,
            ),
            const Divider(),
            _buildVoucher(context),
          ],
        ),
      ),
      bottomSheet: _buildBottomSheet(context, widget.lstProInCO, total),
    );
  }

  Container _buildVoucher(final BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width / 2,
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'SubTotal:',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
              BlocBuilder<UserBloc, UserState>(
                builder: (final context, final state) {
                  if (state is UserLoading) {
                    return const CircularProgressIndicator.adaptive();
                  }
                  if (state is UserLoaded) {
                    double priceTamTinh = 0.0;
                    for (final i in state.user!.shopping_cart!.items!) {
                      priceTamTinh += double.parse(i.product!.price!) * i.qty!;
                    }
                    return Text(
                      CurrencyFormatter().formatNumber(priceTamTinh.toString()),
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).primaryColor,
                      ),
                    );
                  }
                  return Container();
                },
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Shipping price:',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
              BlocBuilder<ShippingMethodBloc, ShippingMethodState>(
                builder: (final context, final state) {
                  if (state is ShippingMethodLoading) {
                    return Text(
                      '...',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).primaryColor,
                      ),
                    );
                  }
                  if (state is ShippingMethodLoaded) {
                    ShippingMethodEntity shipping;
                    shipping = state.shipping_method!.firstWhere(
                      (final element) =>
                          element.id == int.parse(selectedValueShipping!),
                    );
                    return Text(
                      CurrencyFormatter().formatNumber(shipping.price!),
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).primaryColor,
                      ),
                    );
                  }
                  return Container();
                },
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          /* Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Voucher:',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
              Text(
                '30.000Đ',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            ],
          ), */
        ],
      ),
    );
  }

  SizedBox _buildBottomSheet(
    final BuildContext context,
    final List<ProductEntity> lstPro,
    double total,
  ) {
    int shippingMethod_id = 1;
    return SizedBox(
      height: 120,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(),
          Container(
            margin: const EdgeInsets.only(left: 8, right: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'TotalPrice:',
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ),
                BlocBuilder<ShippingMethodBloc, ShippingMethodState>(
                  builder: (final context, final state) {
                    if (state is ShippingMethodLoading) {
                      total += 0.0;
                      return Container();
                    }
                    shippingMethod_id = state.shipping_method!
                        .firstWhere(
                          (final element) =>
                              element.id == int.parse(selectedValueShipping!),
                        )
                        .id!;
                    total += double.parse(
                      state.shipping_method!
                          .firstWhere(
                            (final element) =>
                                element.id == int.parse(selectedValueShipping!),
                          )
                          .price!,
                    );
                    log('total phí $total');
                    return Container();
                  },
                ),
                BlocBuilder<UserBloc, UserState>(
                  builder: (final context, final state) {
                    if (state is UserLoaded) {
                      for (final i in state.user!.shopping_cart!.items!) {
                        total += double.parse(i.product!.price!) * i.qty!;
                      }
                      return Text(
                        CurrencyFormatter().formatNumber(total.toString()),
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).primaryColor,
                        ),
                      );
                    }
                    return Container();
                  },
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () async {
              if (address != null) {
                if (selectedValuePaymentType == 1.toString()) {
                  if (total.toInt() <= 99999999) {
                    await Payment().makePayment(
                      context,
                      total.toInt().toString(),
                      lstPro,
                      address!.id!,
                      shippingMethod_id,
                      Provider.of<UserProvider>(context, listen: false)
                          .getUser!
                          .id!,
                          int.parse(selectedValuePaymentType!),
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (final BuildContext context) {
                        return AlertDialog(
                          title: const Text('Lưu ý'),
                          content: const Text(
                            'Tổng tiền thanh toán phải nhỏ hơn 99,999,999',
                          ),
                          actions: [
                            TextButton(
                              style: ButtonStyle(
                                foregroundColor: MaterialStatePropertyAll(
                                  Theme.of(context).primaryColor,
                                ),
                              ),
                              onPressed: () => Navigator.of(context).pop(),
                              child: const Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                } else {
                  showDialog(
                    context: context,
                    builder: (final BuildContext context) {
                      return AlertDialog(
                        title: const Text('Thông báo'),
                        content: const Text(
                          'Mua hàng thành công',
                        ),
                        actions: [
                          TextButton(
                            style: ButtonStyle(
                              foregroundColor: MaterialStatePropertyAll(
                                Theme.of(context).primaryColor,
                              ),
                            ),
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                  AddOrder(
                    Provider.of<UserProvider>(context, listen: false)
                        .getUser!
                        .id!,
                    lstPro,
                    address!.id!,
                    shippingMethod_id,
                    total.toInt(),
                    int.parse(selectedValuePaymentType!),
                  ).then((final value) => Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (final context) => const HomePageScreen(),
                        ),
                        (final route) => false,
                      ),);
                }
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    duration: Duration(seconds: 1),
                    showCloseIcon: true,
                    content: Text('Vui lòng chọn địa chỉ nhận hàng'),
                  ),
                );
              }
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 13, 144, 250),
                    Color.fromARGB(255, 201, 224, 244),
                  ],
                ),
              ),
              child: Text(
                'PAYMENT',
                style: textStyleInterSemiBold18W,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row _buildNote() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (txtNote.text.isNotEmpty)
          Container(
            margin: const EdgeInsets.only(left: 15),
            child: Text('Note: ${txtNote.text}'),
          )
        else
          const SizedBox(),
        ElevatedButton.icon(
          style: const ButtonStyle(
            side: MaterialStatePropertyAll(
              BorderSide(color: Colors.grey),
            ),
            backgroundColor: MaterialStatePropertyAll(Colors.transparent),
            shadowColor: MaterialStatePropertyAll(Colors.transparent),
          ),
          icon: const Icon(
            Icons.note_add_outlined,
            color: Colors.grey,
          ),
          onPressed: () {
            _showNoteDialog(txtNote);
          },
          label: Text(
            txtNote.text.isNotEmpty ? 'Sửa ghi chú' : 'Thêm ghi chú',
            style: GoogleFonts.montserrat(
              fontSize: 14,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }

  Padding _buildDiaChiNhanHang(final BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 17, right: 17),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Địa chỉ nhận hàng',
            style: textStyleInterSemiBold16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (address != null)
                AddressCard(
                  address: address!,
                )
              else
                const SizedBox(),
              const SizedBox(
                width: 8,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  fixedSize: const MaterialStatePropertyAll(Size(90, 0)),
                  side: MaterialStatePropertyAll(
                    BorderSide(color: Theme.of(context).primaryColor),
                  ),
                  backgroundColor:
                      const MaterialStatePropertyAll(Colors.transparent),
                  shadowColor:
                      const MaterialStatePropertyAll(Colors.transparent),
                ),
                onPressed: () async {
                  final Addresses result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (final context) => const EditAddressScreen(),
                    ),
                  );
                  setState(() {
                    address = result;
                  });
                },
                child: Text(address != null ? 'Đổi' : 'Chọn'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Padding _buildPhuongThucThanhToan(final BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 17),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 3,
            child: Text(
              softWrap: true,
              maxLines: 2,
              'Phương thức thanh toán',
              style: textStyleInterSemiBold16,
            ),
          ),
          Container(
            width: 170,
            height: 30,
            margin: const EdgeInsets.only(right: 17),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
            ),
            child: GestureDetector(
              onTap: () => showOption2(context),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(txtPPTT),
                  const Icon(Icons.navigate_next_outlined),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row _buildCachThucNhanHang(final BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          'Phương thức vận chuyển',
          style: textStyleInterSemiBold16,
        ),
        BlocBuilder<ShippingMethodBloc, ShippingMethodState>(
          builder: (final context, final state) {
            return Container(
              width: 170,
              height: 30,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
              ),
              child: GestureDetector(
                onTap: () => showOption1(context),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(txtCCNH),
                    const Icon(Icons.navigate_next_outlined),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

class ProductCard extends StatelessWidget {
  ProductCard({
    super.key,
    required this.lstPro,
  });
  List<ProductEntity> lstPro;

  @override
  Widget build(final BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(17.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Product/Products',
            style: textStyleInterSemiBold16,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height:
                MediaQuery.of(context).size.width / 2 + (lstPro.length * 20),
            child: ListView.builder(
              itemBuilder: (final context, final index) {
                return CheckOutProItem(
                  proItem: lstPro[index],
                );
              },
              itemCount: lstPro.length,
            ),
          ),
        ],
      ),
    );
  }
}

class CheckOutProItem extends StatelessWidget {
  CheckOutProItem({
    super.key,
    required this.proItem,
  });
  ProductEntity proItem;

  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<HomePageBloc, HomePageState>(
      builder: (final context, final state) {
        final ProductEntity pro = state.products!.firstWhere(
          (final element) => element.id == proItem.product_item_id,
        );
        return Row(
          children: [
            CachedNetworkImage(
              imageUrl: pro.product_image![0] == 'i'
                  ? '${EndPoints.urlImage}${pro.product_image}'
                  : pro.product_image!,
              imageBuilder: (final context, final imageProvider) {
                return Container(
                  width: MediaQuery.of(context).size.width / 3,
                  height: MediaQuery.of(context).size.width / 2.8,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.contain,
                    ),
                  ),
                );
              },
              progressIndicatorBuilder:
                  (final context, final url, final progress) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 3,
                    height: MediaQuery.of(context).size.width / 2.8,
                    decoration:
                        BoxDecoration(color: Colors.black.withOpacity(0.08)),
                    child: const CupertinoActivityIndicator(),
                  ),
                );
              },
              errorWidget: (final context, final url, final error) {
                return Container(
                  width: MediaQuery.of(context).size.width / 3,
                  height: MediaQuery.of(context).size.width / 2.8,
                  color: Colors.black.withOpacity(0.04),
                );
              },
            ),
            const SizedBox(
              width: 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2 - 30,
                  child: Text(
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    maxLines: 2,
                    pro.name!,
                    style: textStyleInterSemiBold14,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  CurrencyFormatter().formatNumber(proItem.product!.price!),
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              'x ${proItem.qty}',
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
            ),
          ],
        );
      },
    );
  }
}

class AddressCard extends StatelessWidget {
  const AddressCard({super.key, required this.address});
  final Addresses address;

  @override
  Widget build(final BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Icon(
              Icons.location_on_outlined,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.8,
                  child: Text(
                    softWrap: true,
                    maxLines: 2,
                    address.address_line!,
                    style: textStyleInterRegular16,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

Future<OrderResponseModel?> AddOrder(
  final int userId,
  final List<ProductEntity> lstOrderLines,
  final int shipping_address,
  final int shipping_method_id,
  final int total,
  final int payment_id,
) async {
  try {
    // Chuyển đổi lstOrderLines thành List<Map<String, dynamic>> nếu cần
    final List<Map<String, dynamic>> orderLines = lstOrderLines.map((final e) {
      return {
        'id': e.id,
        'product_item_id': e.product_item_id,
        'qty': e.qty,
        'price': e.product!.price,
      };
    }).toList();
    final res = await Dio().post(
      '${EndPoints.baseUrl}order',
      data: {
        'user_id': userId,
        'payment_method_id': payment_id,
        'shipping_address': shipping_address,
        'shipping_method': shipping_method_id,
        'order_status': 1,
        'order_total': total,
        'order_lines': orderLines,
      },
    );
    log('mua thành công');
    final result = OrderResponseModel.fromJson(res.data);
    return result;
  } catch (e) {
    log('Lỗi khi mua sản phẩm: $e');
    return null;
  }
}
