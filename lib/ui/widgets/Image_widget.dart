import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({Key? key, required this.img}) : super(key: key);

  final String img;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: CachedNetworkImage(
        imageUrl: 'http://www.plus-pumba.ru/storage$img',
        placeholder: (context, url) => const Icon(Icons.image_outlined),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
    );
  }
}
