import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class GridWidget extends StatelessWidget {
  String id;
  String author;
  String url;

  GridWidget(this.id, this.author, this.url);


  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 5,
      shadowColor: Colors.grey,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Container(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CachedNetworkImage(
                height: 100,
                width: 160,
                imageUrl: url,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
              Text(
                author,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Roboto slab',
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                id,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Roboto slab',
                    color: Colors.black,
                    fontSize: 16),
              ),
            ],
          )),
    );
  }
}
