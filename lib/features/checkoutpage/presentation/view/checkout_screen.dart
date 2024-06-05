import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../config/textStyle.dart';
import 'editaddress_screen.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  String address='';
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
            button.size.topRight(txtCCNH.contains('Giao tận nơi')?const Offset(-20, 260):const Offset(-20, 190)),
            ancestor: overlay,
          ),
          button.localToGlobal(
            button.size.topRight(txtCCNH.contains('Giao tận nơi')?const Offset(-20, 260):const Offset(-20, 190)),
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
            _buildCachThucNhanHang(context),
            if (txtCCNH.contains('Giao tận nơi'))
              _buildDiaChiNhanHang(context)
            else
              const SizedBox(),
            _buildNote(),
            _buildPhuongThucThanhToan(context),
            const Divider(),
            const ProductCard(),
            const Divider(),
            _buildVoucher(context),
          ],
        ),
      ),
      bottomSheet: _buildBottomSheet(context),
    );
  }

  Padding _buildVoucher(final BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 2,
            height: MediaQuery.of(context).size.width / 10,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey),
            ),
            child: const Text('1 Voucher đã được dùng'),
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Tạm tính:',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
              Text(
                '200.000Đ',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).primaryColor,
                ),
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
                'Phí vận chuyển:',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
              Text(
                '60.000Đ',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).primaryColor,
                ),
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
          ),
        ],
      ),
    );
  }

  SizedBox _buildBottomSheet(final BuildContext context) {
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
                  'Tổng tiền:',
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  '230.000Đ',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
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
              'Thanh toán',
              style: textStyleInterSemiBold18W,
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
              child: Text('Note: ${txtNote.text}'),)
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
              if (address.isNotEmpty) AddressCard(address: address,) else const SizedBox(),
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
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (final context) => const EditAddressScreen(),
                    ),
                  );
                  if (result != null) {
                    setState(() {
                       address= result;
                    });
                  }
                },
                child: Text(address.isNotEmpty?'Đổi':'Chọn'),
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
          'Cách thức nhận hàng',
          style: textStyleInterSemiBold16,
        ),
        Container(
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
        ),
      ],
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
  });

  @override
  Widget build(final BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(17.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Thông tin sản phẩm',
            style: textStyleInterSemiBold16,
          ),
          Row(
            children: [
              Container(
                width: 150,
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.black.withOpacity(0.04),
                ),
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
                      'Google Chromecast Audio Black',
                      style: textStyleInterSemiBold14,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    '200.000Đ',
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
                'x1',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AddressCard extends StatelessWidget {
  const AddressCard({super.key, required this.address});
  final String address;

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
                Text(
                  'Nhà riêng',
                  style: textStyleInterSemiBold14,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.8,
                  child: Text(
                    softWrap: true,
                    maxLines: 2,
                    address,
                    style: textStyleInterRegular14,
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
