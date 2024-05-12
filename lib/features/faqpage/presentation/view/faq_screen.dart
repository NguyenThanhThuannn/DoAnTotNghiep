import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../config/textStyle.dart';
import '../../../../injection_container.dart';
import '../../domain/entities/faq.dart';
import '../bloc/faq_page_bloc.dart';

class FAQScreen extends StatefulWidget {
  const FAQScreen({super.key});

  @override
  State<FAQScreen> createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  @override
  Widget build(final BuildContext context) {
    return BlocProvider<FaqPageBloc>(
      create: (final context) => sl()..add(GetFAQs()),
      child: BlocBuilder<FaqPageBloc, FaqPageState>(
        builder: (final context, final state) {
          if (state is FaqPageLoading) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (state is FaqPageError) {
            return Scaffold(
              body: Center(
                child: Text(state.error.toString()),
              ),
            );
          }
          if (state is FaqPageLoaded) {
            return Scaffold(
              appBar: AppBar(
                leading: GestureDetector(
                  onTap: () {},
                  child: const Icon(Icons.keyboard_arrow_left_outlined),
                ),
                title: Text(
                  'FAQs',
                  style: textStylePlusJakartaSansMedium14,
                ),
                bottom:  PreferredSize(
                  preferredSize: const Size.fromHeight(1.0),
                  child: Divider(
                    color: Colors.grey[300],
                    height: 1.0,
                  ),
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height - 50,
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: state.faq!.length,
                          itemBuilder: (final context, final index) {
                            return FAQItem(
                              faq: state.faq![index],
                            );
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Nếu có bất kỳ thắc mắc nào, bạn có thể ',
                            style: textStylePlusJakartaSansRegular12,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                log('Clicked liên hệ');
                              });
                            },
                            child: Text(
                              'liên hệ',
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                          Text(
                            ' với chúng tôi',
                            style: textStylePlusJakartaSansRegular12,
                          ),
                        ],
                      ),
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

class FAQItem extends StatelessWidget {
  FAQItem({super.key, required this.faq});
  FAQItemEntity faq;

  @override
  Widget build(final BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '- ${faq.title!}',
          style: textStylePlusJakartaSansMedium14,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
          child: Text(
            faq.description!,
            textAlign: TextAlign.justify,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.grey[-150],
            ),
          ),
        ),
      ],
    );
  }
}
