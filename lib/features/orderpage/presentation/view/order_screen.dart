import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:dio/dio.dart';
import '../../../../config/format_number.dart';
import '../../../../config/image.dart';
import '../../../../config/textStyle.dart';
import '../../../../network/end_points.dart';
import '../../../homepage/domain/entities/product.dart';
import '../../../homepage/presentation/bloc/home_page_bloc.dart';
import '../../../loginregisterpage/data/services/provider.dart';
import '../../../reviewpage/presentation/view/review_screen.dart';
import '../../data/model/order_response_model.dart';
import '../../domain/entities/order.dart';
import '../bloc/order_bloc.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  void initState() {
    super.initState();
    //context.read<HomePageBloc>().add(GetBestSellings());
    context.read<OrderBloc>().add(
          GetOrders(
            Provider.of<UserProvider>(context, listen: false).getUser!.id!,
          ),
        );
    context.read<OrderBloc>().add(
          GetOrders2(
            Provider.of<UserProvider>(context, listen: false).getUser!.id!,
          ),
        );
  }

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            setState(() {
              Navigator.pop(context);
            });
          },
          child: const Icon(Icons.keyboard_arrow_left_outlined),
        ),
        title: Text(
          'Đơn hàng',
          style: textStylePlusJakartaSansMedium14Height1point5,
        ),
      ),
      body: BlocBuilder<OrderBloc, OrderState>(
        builder: (final context, final state) {
          if (state is OrderLoading) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          if (state is OrderError) {
            return Text(state.error.toString());
          }
          if (state is OrderLoaded) {
            log(state.order!.toString());
            final List<OrderEntity> order = state.order!;
            return order.isNotEmpty
                ? ListView.builder(
                    itemCount: order.length,
                    itemBuilder: (final context, final index) {
                      return OrderItem(order: order[index]);
                    },
                  )
                : const Center(child: Text('Không có lịch sử đơn hàng'));
          }
          return Container();
        },
      ),
    );
  }
}

class OrderItem extends StatefulWidget {
  const OrderItem({
    super.key,
    required this.order,
  });

  final OrderEntity order;

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  @override
  Widget build(final BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (final context) =>
                OrderDetailScreen(orderDetail: widget.order),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
        margin: const EdgeInsets.only(bottom: 5),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width / 2,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BlocBuilder<HomePageBloc, HomePageState>(
                  builder: (final context, final state) {
                    final ProductEntity pro = state.products!.firstWhere(
                      (final element) =>
                          element.id ==
                          widget.order.order_lines![0].product_item_id,
                    );
                    return CachedNetworkImage(
                      imageUrl: pro.product_image![0] == 'i'
                          ? '${EndPoints.urlImage}${pro.product_image}'
                          : pro.product_image!,
                      imageBuilder: (final context, final imageProvider) {
                        return Container(
                          width: MediaQuery.of(context).size.width / 5,
                          height: MediaQuery.of(context).size.width / 5,
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
                            width: MediaQuery.of(context).size.width / 5,
                            height: MediaQuery.of(context).size.width / 5,
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.08),
                            ),
                            child: const CupertinoActivityIndicator(),
                          ),
                        );
                      },
                      errorWidget: (final context, final url, final error) {
                        return Container(
                          width: MediaQuery.of(context).size.width / 5,
                          height: MediaQuery.of(context).size.width / 5,
                          color: Colors.black.withOpacity(0.04),
                        );
                      },
                    );
                  },
                ),
                Text('Loại ${widget.order.shipping_methods!.name!}'),
                Text(
                  CurrencyFormatter().formatNumber(widget.order.order_total!),
                ),
              ],
            ),
            const Divider(),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${widget.order.order_lines!.length} Sản phẩm',
                  ),
                  if (widget.order.payment_method_id==1) const Text('ĐÃ THANH TOÁN', style: TextStyle(color: Colors.green),) else const Text('CHƯA THANH TOÁN', style: TextStyle(color: Colors.red),),
                ],
              ),
              
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.order.order_date!),
                if (widget.order.order_status == 1)
                  TextButton(
                    onPressed: () {
                      setState(() {
                        UpdateOrder(widget.order.id!, 4).then(
                          (final value) => context.read<OrderBloc>().add(
                                GetOrders2(
                                  Provider.of<UserProvider>(
                                    context,
                                    listen: false,
                                  ).getUser!.id!,
                                ),
                              ),
                        );
                      });
                    },
                    child: Text(
                      'Hủy đơn',
                      style: GoogleFonts.anybody(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.red,
                      ),
                    ),
                  )
                else if (widget.order.order_status == 2)
                  TextButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStatePropertyAll(
                        Theme.of(context).primaryColor,
                      ),
                    ),
                    onPressed: () {
                      /* UpdateOrder(widget.order.id!, 3).then(
                        (final value) => context.read<OrderBloc>().add(
                              GetOrders2(
                                Provider.of<UserProvider>(
                                  context,
                                  listen: false,
                                ).getUser!.id!,
                              ),
                            ),
                      ); */
                    },
                    child: const Text('Đơn hàng đang được vận chuyển'),
                  )
                else if (widget.order.order_status == 3)
                  TextButton(
                    style: ButtonStyle(
                      shape: const MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                      ),
                      backgroundColor: MaterialStatePropertyAll(
                        Theme.of(context).primaryColor,
                      ),
                      foregroundColor:
                          const MaterialStatePropertyAll(Colors.white),
                    ),
                    onPressed: () {
                      UpdateOrder(widget.order.id!, 5).then(
                        (final value) => context.read<OrderBloc>().add(
                              GetOrders2(
                                Provider.of<UserProvider>(
                                  context,
                                  listen: false,
                                ).getUser!.id!,
                              ),
                            ),
                      );
                    },
                    child: const Text('Đã nhận được hàng'),
                  )
                else if (widget.order.order_status == 4)
                  Container(
                    width: MediaQuery.of(context).size.width / 4,
                    height: MediaQuery.of(context).size.width / 10,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                    ),
                    child: Text(
                      'Đã hủy',
                      style: textStyleAnybodyRegular18W,
                    ),
                  )
                else if (widget.order.order_status == 5)
                  TextButton(
                    style: ButtonStyle(
                      shape: const MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                      ),
                      backgroundColor: MaterialStatePropertyAll(
                        Theme.of(context).primaryColor,
                      ),
                      foregroundColor:
                          const MaterialStatePropertyAll(Colors.white),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (final context) => OrderDetailScreen(
                            orderDetail: widget.order,
                          ),
                        ),
                      );
                    },
                    child: const Text('Đánh giá'),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class OrderDetailScreen extends StatefulWidget {
  OrderDetailScreen({super.key, required this.orderDetail});
  OrderEntity orderDetail;
  @override
  State<OrderDetailScreen> createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {
  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.keyboard_arrow_left_outlined),
        ),
        title: Text(
          'Thông tin đơn hàng mã ${DateFormatter.formatDateString(widget.orderDetail.created_at!)}',
          style: textStylePlusJakartaSansSemiBold14,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              alignment: Alignment.centerLeft,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Phương thức vận chuyển: ',
                      style: textStyleInterBold16,
                    ),
                    TextSpan(
                      text: '${widget.orderDetail.shipping_methods!.name}',
                      style: textStyleInterMedium18,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              padding: const EdgeInsets.all(8),
              alignment: Alignment.centerLeft,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Địa chỉ nhận hàng: ',
                      style: textStyleInterBold16,
                    ),
                    TextSpan(
                      text:
                          '${widget.orderDetail.shipping_addresses!.address_line}',
                      style: textStyleInterMedium18,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.only(left: 5, right: 5),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width /
                  3 *
                  (widget.orderDetail.order_lines!.length),
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: widget.orderDetail.order_lines!.length,
                itemBuilder: (final context, final index) {
                  return ProductItemInOrderDetail(
                    proOrderDetail: widget.orderDetail.order_lines![index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductItemInOrderDetail extends StatelessWidget {
  const ProductItemInOrderDetail({
    super.key,
    required this.proOrderDetail,
  });

  final ProductEntity proOrderDetail;

  @override
  Widget build(final BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          BlocBuilder<HomePageBloc, HomePageState>(
            builder: (final context, final state) {
              final ProductEntity pro = state.products!.firstWhere(
                (final element) => element.id == proOrderDetail.product_item_id,
              );
              return Row(
                children: [
                  CachedNetworkImage(
                    imageUrl: pro.product_image![0] == 'i'
                        ? '${EndPoints.urlImage}${pro.product_image}'
                        : pro.product_image!,
                    imageBuilder: (final context, final imageProvider) {
                      return Container(
                        width: MediaQuery.of(context).size.width / 4,
                        height: MediaQuery.of(context).size.width / 4,
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
                          width: MediaQuery.of(context).size.width / 4,
                          height: MediaQuery.of(context).size.width / 4,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.08),
                          ),
                          child: const CupertinoActivityIndicator(),
                        ),
                      );
                    },
                    errorWidget: (final context, final url, final error) {
                      return Container(
                        width: MediaQuery.of(context).size.width / 4,
                        height: MediaQuery.of(context).size.width / 4,
                        color: Colors.black.withOpacity(0.04),
                      );
                    },
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.width / 4,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            pro.name!,
                            style: textStyleInterRegular16,
                          ),
                          Text('Số lượng ${proOrderDetail.qty}'),
                          Text(
                            CurrencyFormatter()
                                .formatNumber('${proOrderDetail.price}'),
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  BlocBuilder<OrderBloc, OrderState>(
                    builder: (final context, final state) {
                      if (state is OrderLoading) {
                        return const CircularProgressIndicator.adaptive();
                      }
                      final TextEditingController reviewController =
                          TextEditingController();
                      double valueRating = 0.0;
                      return Visibility(
                        visible: state.order!
                                    .where(
                                      (final element) =>
                                          element.id == proOrderDetail.order_id,
                                    )
                                    .first
                                    .order_status ==
                                5
                            ? true
                            : false,
                        child: GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (final BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Đánh giá sản phẩm'),
                                  content: SizedBox(
                                    height:
                                        MediaQuery.of(context).size.width / 5,
                                    child: Column(
                                      children: [
                                        RatingBar.builder(
                                          allowHalfRating: true,
                                          itemSize: 25,
                                          initialRating: valueRating,
                                          itemBuilder:
                                              (final context, final index) =>
                                                  const Icon(
                                            Icons.star,
                                            color: Colors.amberAccent,
                                          ),
                                          onRatingUpdate: (final value) =>
                                              valueRating = value,
                                        ),
                                        TextField(
                                          controller: reviewController,
                                        ),
                                      ],
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      style: ButtonStyle(
                                        foregroundColor:
                                            MaterialStatePropertyAll(
                                          Theme.of(context).primaryColor,
                                        ),
                                      ),
                                      onPressed: () {
                                        log( valueRating.toInt().toString());
                                                log(reviewController.text);
                                                log(pro.id.toString());
                                                log(Provider.of<UserProvider>(context,
                                                    listen: false,)
                                                .getUser!
                                                .id!.toString(),);
                                        UpdateReview(
                                            valueRating.toInt(),
                                            reviewController.text,
                                            pro.id!,
                                            Provider.of<UserProvider>(context,
                                                    listen: false,)
                                                .getUser!
                                                .id!,);
                                                
                                        Navigator.pop(context);
                                      },
                                      child: const Text('ĐÁNH GIÁ'),
                                    ),
                                    TextButton(
                                      style: ButtonStyle(
                                        foregroundColor:
                                            MaterialStatePropertyAll(
                                          Theme.of(context).primaryColor,
                                        ),
                                      ),
                                      onPressed: () =>
                                          Navigator.of(context).pop(),
                                      child: const Text('HỦY'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width / 6,
                            child: Text(
                              'Đánh giá sản phẩm',
                              maxLines: 2,
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

Future<void> UpdateReview(
    final int valueRating, final String comment, final int productID, final int userID,) async {
  try {
    final res = await Dio().put(
      '${EndPoints.baseUrl}${EndPoints.review}/$productID',
      data: {
        'user_id': userID,
        'rating_value': valueRating,
        'comment': comment,
      },
    );
    log(res.data['message']);
    return res.data;
  } on DioException catch (e) {
    Exception(e.message);
  }
  return;
}

Future<void> UpdateOrder(
  final int orderId,
  final int status,
) async {
  try {
    final res = await Dio().put(
      '${EndPoints.baseUrl}${EndPoints.order}/$orderId',
      data: {
        'order_status': status,
      },
    );
    log(res.data['message']);
    return res.data;
  } on DioException catch (e) {
    Exception(e.message);
  }
  return;
}
