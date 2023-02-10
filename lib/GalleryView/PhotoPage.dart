import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cityproperties/CustomColors/MyColors.dart';
import 'package:cityproperties/GalleryView/PhotoPage.dart';
import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path_provider/path_provider.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:share_plus/share_plus.dart';

class PhotoPage extends StatefulWidget {
  final List<String>? imageUrlList;
  const PhotoPage({Key? key,required this.imageUrlList}) : super(key: key
  );

  @override
  State<PhotoPage> createState() => _PhotoPageState();
}

class _PhotoPageState extends State<PhotoPage> {

  File? file;
  bool isLoading = false;
  String downloadFile = '';
  bool exist = false;
  int ind = 0;

  Future downloadImage(String url) async {
    var dir;
    if (Platform.isAndroid) {
      dir = await getExternalStorageDirectory();
    } else {
      dir = await getTemporaryDirectory();
    }
    String fileName = url.substring(url.lastIndexOf('/') + 1);
    print("filename " + fileName);
    String filePath = dir.path + "/" + fileName;
    file = File(filePath);
    if (await file!.exists()) {
      //downloadFile='100%';
      exist = true;
      isLoading=false;
      Share.shareFiles([file!.path], text: 'Contract picture');
      //  OpenFile.open(filePath);
      setState(() {});
    } else {
      Dio dio = Dio();
      isLoading=true;
      setState(() {

      });
      await download(dio, url, filePath).then((value) {
        isLoading=false;
        setState(() {

        });
        Share.shareFiles([file!.path], text: 'Contract picture');
      });
    }
  }

  Future download(Dio dio, String url, String savePath) async {
    try {
      Response response = await dio.get(
        url,
        onReceiveProgress: showDownloadProgress,
        //Received data with List<int>
        options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            }),
      );
      print(response.headers);
      file = File(savePath);
      var raf = file!.openSync(mode: FileMode.write);
      // response.data is List<int> type
      raf.writeFromSync(response.data);
      await raf.close();
      exist = true;
      // OpenFile.open(file!.path);
      setState(() {});
    } catch (e) {
      print(e);
    }
  }

  void showDownloadProgress(received, total) {
    if (total != -1) {
      downloadFile = (received / total * 100).toStringAsFixed(0) + "%";
      setState(() {});
    }
  }


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.close,
                size: 26.sp,
              ),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 8.w),
                child: IconButton(
                    onPressed: () {
                      downloadImage(widget
                          .imageUrlList![ind]);
                    },
                    icon: Icon(
                      Icons.ios_share_outlined,
                      size: 22.sp,
                    )),
              )
            ],
          ),
          body: PhotoViewGallery.builder(
            scrollPhysics:
            const BouncingScrollPhysics(),
            builder: (BuildContext context,
                int index) {
              ind = index;
              return PhotoViewGalleryPageOptions(
                imageProvider:
                CachedNetworkImageProvider(
                  widget.imageUrlList![index],
                ),
                initialScale:
                PhotoViewComputedScale
                    .contained,
              );
            },
            itemCount:
            widget.imageUrlList!.length,
            loadingBuilder: (context, event) =>
                Center(
                  child: SizedBox(
                    width: 20.0,
                    height: 20.0,
                    child:
                    CircularProgressIndicator(
                      value: event == null
                          ? 0
                          : (event.cumulativeBytesLoaded /
                          event
                              .expectedTotalBytes!
                              .toInt()),
                    ),
                  ),
                ),
          ),
        ),
        if(isLoading)
          Container(
            color: Colors.transparent.withOpacity(0.2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircularProgressIndicator(),
                SizedBox(height: 10.h,),
                SizedBox(width: 1.sw,),
                Material(
                  color: Colors.transparent,
                  child: Text(downloadFile,style: TextStyle(
                      fontSize: 16.sp,
                      color: MyColors.colorBGBrown
                  ),),
                )

              ],
            ),
          ),


      ],
    );
  }
}
