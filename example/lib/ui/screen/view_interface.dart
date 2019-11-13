import 'package:mvvm_flutter/base_model/base_layer.dart';

///used in <a href="photo_viewmodel.dart">PhotoViewModel.class</a>
abstract class IPhotoView extends IBaseView {
  void onChangeBackground();
  void onLoadImageData();
}
