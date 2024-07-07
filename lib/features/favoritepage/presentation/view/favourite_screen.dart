import 'dart:developer';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../../../config/image.dart';
import '../../../../network/end_points.dart';
import '../../../homepage/domain/entities/product.dart';
import '../../../loginregisterpage/data/services/provider.dart';
import '../../data/favourite_response_model.dart';
import '../../domain/favourite.dart';
import '../bloc/favourite_bloc.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<FavouriteBloc>().add(
          GetFavourites(
            Provider.of<UserProvider>(context, listen: false).getUser!.id!,
          ),
        );
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
      body: BlocBuilder<FavouriteBloc, FavouriteState>(
        builder: (final context, final state) {
          if (state is FavouriteLoading) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          if (state is FavouriteError) {
            return Text(state.error.toString());
          }
          if (state is FavouriteLoaded) {
            log(state.favourite.toString());
            return SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                itemCount: state.favourite!.length,
                itemBuilder: (final context, final index) {
                    return Visibility(
                    visible: state.favourite![index].is_default!=null&& state.favourite![index].is_default==1?true:false,
                    child: FavouriteItem(favourite: state.favourite![index]),);                },
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}

class FavouriteItem extends StatefulWidget {
  FavouriteItem({super.key, required this.favourite});
  FavouriteEntity favourite;

  @override
  State<FavouriteItem> createState() => _FavouriteItemState();
}

class _FavouriteItemState extends State<FavouriteItem> {
  @override
  Widget build(final BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          if (ImageCheck().isBase64Image(
            widget.favourite.product_id!.product_image!,
          )) Image.memory(
                  ImageCheck().base64ToImage(
                      widget.favourite.product_id!.product_image!,),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width,
                  fit: BoxFit.contain,
                ) else CachedNetworkImage(
                  imageUrl: widget.favourite.product_id!.product_image!,
                  imageBuilder: (final context, final imageProvider) {
                    return Container(
                      width: MediaQuery.of(context).size.width / 3,
                      height: MediaQuery.of(context).size.width / 2,
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
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.08),
                        ),
                        child: const CupertinoActivityIndicator(),
                      ),
                    );
                  },
                  errorWidget: (final context, final url, final error) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width,
                      color: Colors.black.withOpacity(0.04),
                    );
                  },
                ),

          Column(
            children: [
              Text('${widget.favourite.is_default}'),
              Text('${widget.favourite.product_id!.name}'),
            ],
          ),
          GestureDetector(
            onTap: () {
              UpdateFavourite(Provider.of<UserProvider>(context, listen: false).getUser!.id!, widget.favourite.product_id!.id).then((final value) => context.read<FavouriteBloc>().add(
          GetFavourites(
            Provider.of<UserProvider>(context, listen: false).getUser!.id!,
          ),
        ),);
            },
            child: const FaIcon(FontAwesomeIcons.trashCan),),
        ],
      ),
    );
  }
}

Future<FavouriteResponseModel?> UpdateFavourite(
  final int userId,
  final id,
) async {
  try {
    final res = await Dio().put(
      '${EndPoints.baseUrl}${EndPoints.user}/${EndPoints.favourite}/$userId',
      data: {
        'user_id': userId,
        'product_id': id,
      },
    );
    log('Thêm ưa thích thành công');
    final result = FavouriteResponseModel.fromJson(res.data);
    return result;
  } catch (e) {
    log('Lỗi khi thêm ut sản phẩm: $e');
    return null;
  }
}
