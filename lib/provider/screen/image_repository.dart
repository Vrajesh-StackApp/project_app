import 'package:project_app/provider/imagedata.dart';
import 'package:project_app/provider/services/base_services.dart';
import 'package:project_app/provider/services/image_data_service.dart';

class ImageRepository {
  BaseServices _baseServices = ImageDataService();

  Future fetchImageList() async {
    var response = await _baseServices.getResponse();
    NewImageData imageList = NewImageData.fromJson(response);

    print(imageList.imageDataList[0].author);

    return imageList.imageDataList;
  }
}
