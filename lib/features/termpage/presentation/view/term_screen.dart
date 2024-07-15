import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/textStyle.dart';
import '../../../../injection_container.dart';
import '../../domain/entities/term.dart';
import '../bloc/term_page_bloc.dart';

class TermScreen extends StatefulWidget {
  const TermScreen({super.key});

  @override
  State<TermScreen> createState() => _TermScreenState();
}

class _TermScreenState extends State<TermScreen> {
  @override
  Widget build(final BuildContext context) {
    return BlocProvider<TermPageBloc>(
      create: (final context) => sl()..add(GetTerms()),
      child: BlocBuilder<TermPageBloc, TermPageState>(
        builder: (final context, final state) {
          if (state is TermPageLoading) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (state is TermPageError) {
            return Scaffold(
              body: Center(
                child: Text(state.error.toString()),
              ),
            );
          }
          if (state is TermPageLoaded) {
            return Scaffold(
              appBar: AppBar(
                leading: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.keyboard_arrow_left_outlined),
                ),
                title: Text(
                  'Các điều khoản và điều kiện',
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
                        'Điều khoản và điều kiện',
                        style: textStylePlusJakartaSansBold24,
                      ),
                      Text(
                        style: textStylePlusJakartaSansMedium14Height1point5,
                        textAlign: TextAlign.justify,
                        'Các Điều khoản và Điều kiện này ("Điều khoản") chi phối việc bạn sử dụng ứng dụng thương mại điện tử của chúng tôi. Bằng việc truy cập hoặc sử dụng ứng dụng này, bạn đồng ý bị ràng buộc bởi các Điều khoản này. Vui lòng đọc chúng cẩn thận trước khi tiếp tục.',
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height*2,
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.term!.length,
                          itemBuilder: (final context, final index) {
                            return TermItem(
                              title:
                                  '${index + 1}. ${state.term![index].title!}:',
                              item: state.term![index].item!,
                            );
                          },
                        ),
                      ),
                      Text(textAlign: TextAlign.justify,softWrap: true,'Nếu bạn có bất kỳ câu hỏi hoặc thắc mắc nào về các Điều khoản và Điều kiện này, vui lòng liên hệ với bộ phận hỗ trợ khách hàng của chúng tôi. Bằng cách sử dụng ứng dụng này, bạn xác nhận rằng bạn đã đọc, hiểu và đồng ý với các Điều khoản và Điều kiện này.',style: textStylePlusJakartaSansMedium14Height1point5,),
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
class TermItem extends StatelessWidget {
  TermItem({super.key, required this.title, required this.item});
  String title;
  List<TermDataItemEntity> item;

  double calculateListViewHeight() {
    const itemHeight = 50.0; // Chiều cao trung bình của mỗi phần tử ListTile
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