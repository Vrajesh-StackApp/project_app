import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ListTileWidget extends StatelessWidget {
  String id;
  String author;
  String url;

  ListTileWidget(this.id, this.author, this.url);

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
        padding: EdgeInsets.only(left: 7.5),
        child: ListTile(
          leading: Container(
            height: 180,
            width: 100,
            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
            child: CachedNetworkImage(
                imageUrl: url,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                    ),
                  ),
                ),
                placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error)),
          ),
          title: Text(
            author,
            style: TextStyle(
                fontFamily: 'Roboto slab',
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            id,
            style: TextStyle(
                fontFamily: 'Roboto slab', color: Colors.black, fontSize: 18),
          ),
          horizontalTitleGap: 0.0,
          contentPadding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 10),
        ),
      ),
    );
  }
}
