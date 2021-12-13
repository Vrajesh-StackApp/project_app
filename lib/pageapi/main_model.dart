class MainModelList {
  List<MainModel> imageDataList;

  MainModelList(this.imageDataList);

  factory MainModelList.fromJson(List<dynamic> parsedJson) {
    List<MainModel> mainModelList =
        parsedJson.map((key) => MainModel.fromJson(key)).toList();

    return MainModelList(
      mainModelList,
    );
  }
}

class MainModel {
  String id;
  String author;
  int width;
  int height;
  String url;
  String downloadUrl;

  MainModel({
    this.id,
    this.author,
    this.width,
    this.height,
    this.url,
    this.downloadUrl,
  });

  factory MainModel.fromJson(Map<String, dynamic> json) => MainModel(
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
