import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../config/textStyle.dart';
import '../../../homepage/domain/entities/product.dart';
import '../../../homepage/presentation/bloc/home_page_bloc.dart';
import '../../data/models/category_response_model.dart';
import '../../domain/entities/category.dart';
import 'categoryGridItem_widget.dart';
import 'categoryListItem_widget.dart';
import 'shimmer_widget.dart';

class CategoryProItem extends StatefulWidget {
  CategoryProItem({super.key, required this.cate});
  CategoryEntity cate;

  @override
  State<CategoryProItem> createState() => _CategoryProItemState();
}

class _CategoryProItemState extends State<CategoryProItem> {
  bool isClicked = false;
  bool isAscending = true;
  String _selectedFilter = '';
  List<ProductEntity> lstPro = [];
  List<ProductEntity> lstProCate = [];
  /* @override
  void initState() {
    lstProCate.isEmpty ? lstProCate.addAll(c) : Cate;
    super.initState();
    log(widget.cate.toString());
  } */

  /* void _sortProducts(final bool isAscending, final bool isDescening) {
    setState(() {
      if (isAscending) {
        widget.cate.sort((final a, final b) => a.price.compareTo(b.price));
      } else if (isDescening) {
        widget.cate.sort((final a, final b) => b.price.compareTo(a.price));
      }
    });
  }

  void showFilterOptions(final BuildContext context) {
    final RenderBox button = context.findRenderObject()! as RenderBox;
    final RenderBox overlay =
        Overlay.of(context).context.findRenderObject()! as RenderBox;

    showMenu(
      context: context,
      position: RelativeRect.fromRect(
        Rect.fromPoints(
          button.localToGlobal(
            button.size.topRight(Offset.zero),
            ancestor: overlay,
          ),
          button.localToGlobal(
            button.size.bottomRight(Offset.zero),
            ancestor: overlay,
          ),
        ),
        Offset.zero & overlay.size,
      ),
      color: Colors.grey[200],
      items: [
        PopupMenuItem(
          onTap: () {
            setState(() {
              _sortProducts(true, false);
            });
          },
          value: 'Từ thấp đến cao',
          child: Text('Từ thấp đến cao',style: textStyleInterMedium14,),
        ),
        PopupMenuItem(
          onTap: () {
            setState(() {
              _sortProducts(false, true);
            });
          },
          value: 'Từ cao đến thấp',
          child: Text('Từ cao đến thấp',style: textStyleInterMedium14,),
        ),
      ],
      elevation: 8.0,
    ).then((final selectedValue) {
      if (selectedValue != null) {
        setState(() {
          _selectedFilter = selectedValue;
        });
      }
    });
  } */
  String _selectedSortOption = 'Không';
  bool _isAscending = true;

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocBuilder<HomePageBloc, HomePageState>(
          builder: (final context, final state) {
            if (state is HomePageLoaded) {
              if (_selectedSortOption == 'Không') {
                lstPro=
                  state.products!
                      .where(
                        (final element) =>
                            element.category_id ==
                            widget.cate.parent_category_id,
                      )
                      .toList();
              }
              void selectSortOption(final String option) {
                setState(() {
                  if (_selectedSortOption == option) {
                    _isAscending = !_isAscending;
                  } else {
                    _selectedSortOption = option;
                    _isAscending = true;
                  }
                  //_sortItems();
                  if (_selectedSortOption == 'Sắp xếp từ A-Z') {
                    lstPro.sort(
                      (final a, final b) => _isAscending
                          ? a.name!.compareTo(b.name!)
                          : b.name!.compareTo(a.name!),
                    );
                    log('SX tên: $lstPro');
                  } else if (_selectedSortOption == 'Giá từ thấp đến cao') {
                    lstPro.sort(
                      (final a, final b) => _isAscending
                          ? a.product_item!.price!
                              .compareTo(b.product_item!.price!)
                          : b.product_item!.price!
                              .compareTo(a.product_item!.price!),
                    );
                    log('SX giá: $lstPro');
                  }
                });
              }

              /* void sortItems() {
                if (_selectedSortOption == 'Sắp xếp từ A-Z') {
                  lstPro.sort(
                    (final a, final b) => _isAscending
                        ? a.name!.compareTo(b.name!)
                        : b.name!.compareTo(a.name!),
                  );
                  log('SX tên: $lstPro');
                } else if (_selectedSortOption == 'Giá từ thấp đến cao') {
                  lstPro.sort(
                    (final a, final b) => _isAscending
                        ? a.product_item!.price!
                            .compareTo(b.product_item!.price!)
                        : b.product_item!.price!
                            .compareTo(a.product_item!.price!),
                  );
                  log('SX giá: $lstPro');
                }
              } */

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    alignment: Alignment.bottomRight,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              Navigator.of(context).pop();
                            });
                          },
                          child: const Icon(Icons.keyboard_arrow_left_outlined),
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isClicked = !isClicked;
                                });
                              },
                              child: isClicked
                                  ? const Icon(Icons.view_list_rounded)
                                  : const Icon(Icons.grid_view_outlined),
                            ),
                            PopupMenuButton<String>(
                              icon: const Icon(Icons.filter_list),
                              onSelected: selectSortOption,
                              itemBuilder: (final BuildContext context) {
                                return [
                                  const PopupMenuItem<String>(
                                    value: 'Không',
                                    child: Text('Không'),
                                  ),
                                  PopupMenuItem<String>(
                                    value: 'Sắp xếp từ A-Z',
                                    child: Row(
                                      children: [
                                        Text(
                                          'Sắp xếp từ A-Z',
                                          style: GoogleFonts.inter(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: _selectedSortOption ==
                                                    'Sắp xếp từ A-Z'
                                                ? Theme.of(context).primaryColor
                                                : null,
                                          ),
                                        ),
                                        const Spacer(),
                                        if (_selectedSortOption ==
                                            'Sắp xếp từ A-Z')
                                          Icon(
                                            _isAscending
                                                ? Icons.arrow_upward
                                                : Icons.arrow_downward,
                                            color:
                                                Theme.of(context).primaryColor,
                                          ),
                                      ],
                                    ),
                                  ),
                                  PopupMenuItem<String>(
                                    value: 'Giá từ thấp đến cao',
                                    child: Row(
                                      children: [
                                        Text(
                                          'Giá từ thấp đến cao',
                                          style: GoogleFonts.inter(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: _selectedSortOption ==
                                                    'Giá từ thấp đến cao'
                                                ? Theme.of(context).primaryColor
                                                : null,
                                          ),
                                        ),
                                        const Spacer(),
                                        if (_selectedSortOption ==
                                            'Giá từ thấp đến cao')
                                          Icon(
                                            _isAscending
                                                ? Icons.arrow_upward
                                                : Icons.arrow_downward,
                                            color:
                                                Theme.of(context).primaryColor,
                                          ),
                                      ],
                                    ),
                                  ),
                                ];
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  if (_selectedFilter.isNotEmpty)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 2.2,
                          margin: const EdgeInsets.only(left: 10),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(35),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                _selectedFilter,
                                style: textStyleInterMedium14,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _selectedFilter = '';
                                    //widget.cate = Cate;
                                  });
                                },
                                child: const Icon(Icons.close),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedFilter = '';
                                //widget.cate = Cate;
                              });
                            },
                            child: Text(
                              'Xóa tất cả',
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  else
                    const SizedBox(),
                  if (isClicked)
                    Container(
                      margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height-
                          (lstPro.length * 10),
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          crossAxisCount: 2,
                          childAspectRatio: 0.53,
                        ),
                        itemBuilder: (final context, final index) {
                          return CateGridItem(pro: lstPro[index]);
                        },
                        itemCount: lstPro.length,
                      ),
                    )
                  else
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height -
                          (lstPro.length * 10),
                      child: ListView.builder(
                        itemBuilder: (final context, final index) {
                          return CateListItem(pro: lstPro[index]);
                        },
                        itemCount: lstPro.length,
                      ),
                    ),
                ],
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
