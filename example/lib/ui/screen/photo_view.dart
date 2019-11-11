import 'package:flutter/material.dart';
import 'package:mvvm_flutter/base_ui/base_state.dart';
import 'package:mvvm_flutter_example/ui/viewmodel/photo_viewmodel.dart';

class PhotoView extends StatefulWidget {
  @override
  _PhotoViewState createState() => _PhotoViewState();
}

class _PhotoViewState extends BaseState<PhotoViewModel, PhotoView> {
  @override
  Widget build(BuildContext context) {
    return super.build(context);
  }

  @override
  void initViewModel() {
    viewModel = PhotoViewModel();
//    model.doSomeNetworkCall();
  }

  @override
  Widget stateWidgetBuilder(
      BuildContext context, ChildrenHolder childrenHolder) {
    return Scaffold(
        appBar: AppBar(
          title: childrenHolder.children[5] ?? Text("Photo"),
        ),
        body: InkWell(
          onTap: viewModel.onChangeBackground,
          child: AnimatedContainer(
            duration: Duration(
              milliseconds: 300,
            ),
            color: Color(viewModel.backgroundColor),
            child: Center(
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Background color :${viewModel.colorName}",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
          ),
        ));
  }

  @override
  List<Widget> reuseChildren() {
    return [
      Text("Hello 1"),
      Text("Hello 2"),
      Text("Hello 3"),
      Text("Hello 4"),
      Text("Hello 5"),
      Text("Hello 6"),
    ];
  }
}
