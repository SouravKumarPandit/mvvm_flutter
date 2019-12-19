import 'package:flutter/material.dart';
import 'package:mvvm_flutter/base_view/base_state.dart';
import 'package:mvvm_flutter_example/ui/screen/livedata_view.dart';
import 'package:mvvm_flutter_example/ui/viewmodel/photo_viewmodel.dart';

class ColorChangerView extends StatefulWidget {
  @override
  _ColorChangerViewState createState() => _ColorChangerViewState();
}

class _ColorChangerViewState
    extends BaseState<ColorChangerViewModel, ColorChangerView> {
  @override
  Widget build(BuildContext context) {
    return super.build(context);
  }

  @override
  void initViewModel() {
    viewModel = ColorChangerViewModel();
//    model.doSomeNetworkCall(); //you can call do network call here also
  }

  @override
  Widget stateWidgetBuilder(
      BuildContext context, ChildrenHolder childrenHolder) {
    return Scaffold(
      appBar: AppBar(
        title: childrenHolder.children[5] ?? Text("Photo"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: InkWell(
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
                        "BLOCKING WHOLE VIEW }",
                        style: TextStyle(
                            fontSize: 1.5 * sizeConfig.textMultiplier),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(flex: 1, child: ObserverTestApp()),
        ],
      ),
    );
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
