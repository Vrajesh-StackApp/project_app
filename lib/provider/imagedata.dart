class NewImageData {
  List<ImageData> imageDataList;

  NewImageData(this.imageDataList);

  factory NewImageData.fromJson(List<dynamic> parsedJson) {
    List<ImageData> imageList =
        parsedJson.map((key) => ImageData.fromJson(key)).toList();

    return NewImageData(
      imageList,
    );
  }
}

class ImageData {
  ImageData({
    this.id,
    this.author,
    this.width,
    this.height,
    this.url,
    this.downloadUrl,
  });

  String id;
  String author;
  int width;
  int height;
  String url;
  String downloadUrl;

  factory ImageData.fromJson(Map<String, dynamic> json) => ImageData(
        id: json["id"],
        author: json["author"],
        width: json["width"],
        height: json["height"],
        url: json["url"],
        downloadUrl: json["download_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "author": author,
        "width": width,
        "height": height,
        "url": url,
        "download_url": downloadUrl,
      };
}
