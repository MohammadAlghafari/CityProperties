import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cityproperties/CustomColors/MyColors.dart';
import 'package:cityproperties/GalleryView/PhotoPage.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path_provider/path_provider.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:share_plus/share_plus.dart';

class GalleryView extends StatefulWidget {
  final List<String>? imageUrlList;
  final String? imageUrl;

  const GalleryView({Key? key, this.imageUrl, this.imageUrlList})
      : super(key: key);

  @override
  State<GalleryView> createState() => _GalleryViewState();
}

class _GalleryViewState extends State<GalleryView> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.liteWhite,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            size: 22.sp,
          ),
        ),
      ),
      body: SafeArea(
        child: widget.imageUrlList != null
            ? Padding(
                padding: const EdgeInsets.all(10),
                child: GridView.builder(
                    itemCount: widget.imageUrlList!.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10.w,
                        mainAxisSpacing: 10.w),
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) {
                                    return PhotoPage(
                                      imageUrlList: widget.imageUrlList,
                                    );
                                  },
                                  fullscreenDialog: true));
                        },
                        child: Hero(
                            tag: "photo$index",
                            child: CachedNetworkImage(
                              fit: BoxFit.fill,
                              imageUrl: widget.imageUrlList![index],
                              placeholder: (context, url) => const Center(
                                  child: CupertinoActivityIndicator()),
                              errorWidget: (context, url, error) => Icon(
                                Icons.error,
                                size: 22.w,
                              ),
                            )),
                      );
                    }),
              )
            : PhotoView(
                imageProvider: CachedNetworkImageProvider(widget.imageUrl!),
                errorBuilder: (context, url, error) => Center(
                    child: Icon(
                  Icons.error,
                  size: 42.w,
                )),
                backgroundDecoration:
                    const BoxDecoration(color: MyColors.colorBlack),
              ),
      ),
    );
  }
}
