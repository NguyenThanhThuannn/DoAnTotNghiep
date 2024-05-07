import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../config/textStyle.dart';
import '../../data/models/category_response_model.dart';
import 'categoryGridItem_widget.dart';
import 'categoryListItem_widget.dart';

class CategoryProItem extends StatefulWidget {
  CategoryProItem({super.key, required this.cate});
  List<CategoryProductModel> cate;

  @override
  State<CategoryProItem> createState() => _CategoryProItemState();
}

class _CategoryProItemState extends State<CategoryProItem> {
  bool isClicked = false;
  bool isAscending = true;
  String _selectedFilter = '';
  List<CategoryProductModel> Cate = [];
  @override
  void initState() {
    Cate.isEmpty ? Cate.addAll(widget.cate) : null;
    super.initState();
  }

  void _sortProducts(final bool isAscending, final bool isDescening) {
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
  }

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
                      IconButton(
                        icon: const Icon(Icons.filter_list),
                        onPressed: () {
                          showFilterOptions(context);
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
                          widget.cate = Cate;
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
                          widget.cate = Cate;
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
                height: MediaQuery.of(context).size.height,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 2,
                    crossAxisCount: 2,
                    childAspectRatio: 0.5,
                  ),
                  itemBuilder: (final context, final index) {
                    return CateGridItem(pro: widget.cate[index]);
                  },
                  itemCount: widget.cate.length,
                ),
              )
            else
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                  itemBuilder: (final context, final index) {
                    return CateListItem(pro: widget.cate[index]);
                  },
                  itemCount: widget.cate.length,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
