import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/article.dart';
import '../bloc/blog_page_bloc.dart';

class BlogScreen extends StatelessWidget {
  const BlogScreen({super.key});

  @override
  Widget build(final BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: const Icon(Icons.navigate_before_outlined),
        ),
      ),
      body: BlocBuilder<BlogPageBloc, BlogPageState>(
        builder: (final context, final state) {
          if (state is BlogPageLoading) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }
          if (state is BlogPageError) {
            return Text(state.error.toString());
          }
          if (state is BlogPageLoaded) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    SizedBox(
                      width: size.width,
                      height: size.height,
                      child: ListView.builder(
                        itemCount: state.article!.length,
                        itemBuilder: (final context, final index) {
                          return BlogItem(article: state.article![index]);
                        },
                      ),
                    ),
                  ],
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

class BlogItem extends StatelessWidget {
  BlogItem({super.key, required this.article});
  ArticleEntity article;
  @override
  Widget build(final BuildContext context) {
    return Container(
      child: Column(
        children: [
          CachedNetworkImage(
            imageUrl: article.urlToImage!,
            progressIndicatorBuilder:
                (final context, final url, final downloadProgress) => Padding(
              padding: const EdgeInsetsDirectional.only(end: 14),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  width: MediaQuery.of(context).size.width / 3,
                  height: double.maxFinite,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.08),
                  ),
                  child: const CupertinoActivityIndicator(),
                ),
              ),
            ),
            errorWidget: (final context, final url, final error) => Padding(
              padding: const EdgeInsetsDirectional.only(end: 14),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  width: MediaQuery.of(context).size.width / 3,
                  height: double.maxFinite,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.08),
                  ),
                  child: const Icon(Icons.error),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 7),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  article.title ?? '',
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontFamily: 'Butler',
                    fontWeight: FontWeight.w900,
                    fontSize: 18,
                    color: Colors.black87,
                  ),
                ),

                // Description
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    article.description ?? '',
                    maxLines: 2,
                  ),
                ),

                // Datetime
                Row(
                  children: [
                    const Icon(Icons.timeline_outlined, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      article.publishedAt!,
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
