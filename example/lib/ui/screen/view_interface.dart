import 'package:mvvm_flutter/base_interface/base_layer.dart';

///used in <a href="photo_viewmodel.dart">PhotoViewModel.class</a>
abstract class IPhotoView extends IBaseView {
  void onChangeBackground();
  void onLoadImageData();
}
