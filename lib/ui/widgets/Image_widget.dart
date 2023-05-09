// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  ImageWidget({Key? key, required this.img, this.fit}) : super(key: key);

  final String img;
  BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: CachedNetworkImage(
        fit: fit,
        imageUrl: 'http://www.plus-pumba.ru/storage$img',
        placeholder: (context, url) => const Icon(Icons.image_outlined),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
    );
  }
}
