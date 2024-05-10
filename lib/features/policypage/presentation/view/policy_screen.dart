import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/textStyle.dart';
import '../../../../injection_container.dart';
import '../../domain/entities/policy.dart';
import '../bloc/policy_screen_bloc.dart';

class PolicyScreen extends StatefulWidget {
  const PolicyScreen({super.key});

  @override
  State<PolicyScreen> createState() => _PolicyScreenState();
}

class _PolicyScreenState extends State<PolicyScreen> {
  List<ItemEntity> policy = [];

  @override
  Widget build(final BuildContext context) {
    return BlocProvider<PolicyScreenBloc>(
      create: (final context) => sl()..add(GetPolicies()),
      child: BlocBuilder<PolicyScreenBloc, PolicyScreenState>(
        builder: (final context, final state) {
          if (state is PolicyScreenLoading) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (state is PolicyScreenError) {
            return Scaffold(
              body: Center(
                child: Text(state.error.toString()),
              ),
            );
          }
          if (state is PolicyScreenLoaded) {
            return Scaffold(
              appBar: AppBar(
                leading: GestureDetector(
                  onTap: () {},
                  child: const Icon(Icons.keyboard_arrow_left_outlined),
                ),
                title: Text(
                  'Chính sách bảo mật',
                  style: textStylePlusJakartaSansMedium14,
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Chính sách của chúng tôi',
                        style: textStylePlusJakartaSansBold24,
                      ),
                      Text(
                        style: textStylePlusJakartaSansMedium14Height1point5,
                        textAlign: TextAlign.justify,
                        'Chúng tôi cam kết bảo vệ quyền riêng tư và bảo mật thông tin cá nhân của người dùng. Chính sách quyền riêng tư này nêu rõ cách chúng tôi thu thập, sử dụng, tiết lộ và bảo vệ thông tin thu được thông qua ứng dụng thương mại điện tử của chúng tôi. Bằng cách sử dụng ứng dụng, bạn đồng ý với các thông lệ được mô tả trong chính sách này.',
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height*1.5,
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.policy!.length,
                          itemBuilder: (final context, final index) {
                            return PolicyItem(
                              title:
                                  '${index + 1}. ${state.policy![index].title!}:',
                              item: state.policy![index].item!,
                            );
                          },
                        ),
                      ),
                      Text(textAlign: TextAlign.justify,softWrap: true,'Nếu bạn có bất kỳ câu hỏi hoặc thắc mắc nào về Chính sách quyền riêng tư của chúng tôi, vui lòng liên hệ với bộ phận hỗ trợ khách hàng của chúng tôi. Bằng việc sử dụng ứng dụng này, bạn thừa nhận rằng bạn đã đọc và hiểu Chính sách quyền riêng tư này cũng như đồng ý với các điều khoản và điều kiện của nó.',style: textStylePlusJakartaSansMedium14Height1point5,),
                    ],
                  ),
                ),
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}

class PolicyItem extends StatelessWidget {
  PolicyItem({super.key, required this.title, required this.item});
  String title;
  List<ItemEntity> item;

  double calculateListViewHeight() {
    const itemHeight = 60.0; // Chiều cao trung bình của mỗi phần tử ListTile
    final itemCount = item.length;
    final totalHeight = itemHeight * itemCount;
    const paddingHeight = 16.0; // Thêm padding cho các phần tử
    return totalHeight + paddingHeight + 30;
  }

  @override
  Widget build(final BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: textStylePlusJakartaSansMedium14Height1point5,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: calculateListViewHeight(),
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: item.length,
            itemBuilder: (final context, final index) {
              return Text(
                '${item[index].title}',
                style: textStylePlusJakartaSansMedium14Height1point5,
                textAlign: TextAlign.justify,
              );
            },
          ),
        ),
      ],
    );
  }
}
