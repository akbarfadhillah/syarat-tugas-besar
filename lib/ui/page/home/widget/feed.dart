import 'dart:math';

import 'package:appsi/model/data/photo_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../controller/image/collection_controller.dart';
import '../../../../controller/photo_controller.dart';
import '../../../../data/image/image.dart';
import '../../../../view/photo_card.dart';
import 'feed_card.dart';

class FeedWidget extends StatefulWidget {
  final bool isCollection;
  const FeedWidget({
    Key? key,
    this.isCollection = false,
  }) : super(key: key);

  @override
  State<FeedWidget> createState() => _FeedWidgetState();
}

class _FeedWidgetState extends State<FeedWidget> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final controller = Provider.of<PhotoController>(
        context,
        listen: false,
      );
      controller.fetchData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PhotoController>(builder: (context, value, child) {
      return RefreshIndicator(
        onRefresh: () async {
          return Provider.of<PhotoController>(
            context,
            listen: false,
          ).fetchData(page: Random().nextInt(10));
        },
        child: ListView.builder(
          itemCount: value.photos.length,
          itemBuilder: (context, index) {
            Photo photo = value.photos[index];
            return PhotoCard(photo: photo);
          },
        ),
      );
    });
  }

  // int _itemCount(CollectionController value) {
  //   if (widget.isCollection) {
  //     return value.myCollection.length;
  //   } else {
  //     return value.myImages.length;
  //   }
  // }
}
