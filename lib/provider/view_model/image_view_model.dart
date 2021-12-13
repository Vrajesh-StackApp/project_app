import 'package:project_app/provider/image_provider.dart';
import 'package:project_app/provider/imagedata.dart';
import 'package:project_app/provider/screen/provider_data_screen.dart';

class ImageViewModel {
  ProviderDataScreenState state;
  ImageProviderAbc provider = ImageProviderAbc();

  ImageViewModel(this.state) {
    this.state = state;
    apiCall();
  }

  apiCall() async {
    await provider.callRegister();
    state.setState(() {});
  }
}
