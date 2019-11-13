import 'package:mvvm_flutter/base_model/base_model.dart';
import 'package:mvvm_flutter_example/ui/screen/view_interface.dart';

class ColorChangerViewModel extends BaseViewModel implements IPhotoView {
  ColorChangerViewModel() {
    backgroundColor = initColor;
  }

  int initColor = 0xff38c286;
  int backgroundColor;
  String colorName = "Green";

  bool taskLoaded = false;

  static const int ItemRequestThreshold = 15;

  List<String> _items;

  List<String> get items => _items;

  Future<void> doSomeNetworkCall() async {
    showProgressbar();
    return await Future.delayed(Duration(seconds: 3)).then((_) {
      backgroundColor = backgroundColor == initColor ? 0xffc97e2e : initColor;
      colorName = backgroundColor == initColor ? "Green" : "Orange";
      hideProgressbar();
    });
  }

  @override
  void onChangeBackground() async {
    doSomeNetworkCall();
  }

  @override
  void onLoadImageData() {
    return null;
  }
}
