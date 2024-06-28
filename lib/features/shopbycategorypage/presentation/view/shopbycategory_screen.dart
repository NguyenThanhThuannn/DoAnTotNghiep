import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/textStyle.dart';
import '../../../../injection_container.dart';
import '../../../homepage/domain/entities/product.dart';
import '../../../homepage/presentation/bloc/home_page_bloc.dart';
import '../../data/models/category_response_model.dart';
import '../../domain/entities/category.dart';
import '../bloc/shopbycategory_page_bloc.dart';
import '../widgets/categoryListItem_widget.dart';
import '../widgets/categoryProItem.dart';
import '../widgets/shopbycategoryItem_widget.dart';

class ShopByCategoryScreen extends StatefulWidget {
  const ShopByCategoryScreen({super.key});

  @override
  State<ShopByCategoryScreen> createState() => _ShopByCategoryScreenState();
}

class _ShopByCategoryScreenState extends State<ShopByCategoryScreen> {
  @override
  Widget build(final BuildContext context) {
    return BlocProvider<ShopbycategoryPageBloc>(
      create: (final context) => sl()..add(GetCategories()),
      child: BlocBuilder<ShopbycategoryPageBloc, ShopbycategoryPageState>(
        builder: (final context, final state) {
          if (state is ShopbycategoryPageLoading) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (state is ShopbycategoryPageLError) {
            return Scaffold(
              body: Center(
                child: Text(state.error.toString()),
              ),
            );
          }
          if (state is ShopbycategoryPageLoaded) {
            return Scaffold(
              appBar: AppBar(
                title: Container(
                  margin: const EdgeInsets.only(left: 90),
                  child: Text(
                    'Category',
                    style: textStyleInterSemiBold16,
                  ),
                ),
                leading: GestureDetector(
                  onTap: () {
                    setState(() {
                      Navigator.pop(context);
                    });
                  },
                  child: const Icon(Icons.keyboard_arrow_left_outlined),
                ),
                bottom: const PreferredSize(
                  preferredSize: Size.fromHeight(1.0),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(25, 8, 25, 8),
                    child: Divider(
                      color: Colors.grey,
                      height: 1.0,
                    ),
                  ),
                ),
              ),
              body: SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.only(left: 25),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height -
                      (state.category!.length * 10),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.95,
                    ),
                    itemCount: state.category!.length,
                    itemBuilder: (final context, final index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            log('Đã click ${state.category![index].category_name} id: ${state.category![index].id}');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (final context) => CategoryProItem(
                                  cate: state.category![index],
                                ),
                              ),
                            );
                          });
                        },
                        child: ShopByCategoryItem(
                          cate: state.category![index],
                        ),
                      );
                    },
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

/* class CateWithPro extends StatefulWidget {
  CateWithPro({super.key, required this.cate});
  CategoryEntity cate;
  //List<CategoryItemModel> item;

  @override
  State<CateWithPro> createState() => _CateWithProState();
}

class _CateWithProState extends State<CateWithPro> {
  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          margin: const EdgeInsets.only(left: 90),
          child: Text(
            widget.cate.category_name!,
            style: textStyleInterSemiBold16,
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            setState(() {
              Navigator.of(context).pop();
            });
          },
          child: const Icon(Icons.navigate_before),
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Padding(
            padding: EdgeInsets.fromLTRB(25, 8, 25, 8),
            child: Divider(
              color: Colors.grey,
              height: 1.0,
            ),
          ),
        ),
      ),
      body:
          SingleChildScrollView(child: BlocBuilder<HomePageBloc, HomePageState>(
        builder: (context, state) {
          if (state is HomePageLoaded) {
            List<ProductEntity> lstPro = [];
            lstPro = state.bestSelling!
                .where((element) =>
                    element.category_id == widget.cate.parent_category_id)
                .toList();
            return Container(
              margin: const EdgeInsets.only(left: 25),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.95,
                ),
                itemCount: lstPro.length,
                itemBuilder: (final context, final index) {
                  return GestureDetector(
                      onTap: () {
                        setState(() {
                          log('Đã click ${lstPro[index].name} id: ${lstPro[index].id}');
                          /* Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (final context) =>
                            CategoryProItem(cate: widget.item[index].pro!),
                      ),
                    ); */
                        });
                      },
                      child: CateListItem(pro: lstPro[index]));
                },
              ),
            );
          }
          return Container();
        },
      )),
    );
  }
} */
