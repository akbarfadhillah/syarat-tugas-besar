import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/photo_controller.dart';
import '../model/data/photo_list.dart';
import 'photo_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Consumer<PhotoController>(builder: (context, value, child) {
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
      }),
    );
  }
}
