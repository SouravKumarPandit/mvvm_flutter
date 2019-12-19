import 'package:flutter/material.dart';
import 'package:mvvm_flutter/base_view/base_state.dart';
import 'package:mvvm_flutter_example/ui/viewmodel/live_data_example.dart';

class ObserverTestApp extends StatefulWidget {
  @override
  _ObserverTestAppState createState() => _ObserverTestAppState();
}

class _ObserverTestAppState
    extends BaseState<ObserverViewModel, ObserverTestApp> {
  @override
  void initViewModel() {
    viewModel = ObserverViewModel();
//    in case if you want call back current widget state set viewmodel to null and update manually
//    this kind of situation required when need to navigate to other screen
//    viewModel.incrementedValue.listener(null, changedValue);

    viewModel.incrementedValue.listener(viewModel, changedValue);
  }

  @override
  List<Widget> reuseChildren() {
    return [];
  }

  @override
  Widget stateWidgetBuilder(
      BuildContext context, ChildrenHolder childrenHolder) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 15,
          ),
          Text(
            "${viewModel.incrementedValue.value}",
            style: TextStyle(
                fontSize: sizeConfig.textMultiplier * 5, color: Colors.black),
          ),
          MaterialButton(
            color: Colors.red,
            child: Text(
              "Block small area",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              viewModel.doSomeNetworkCall();
            },
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }

  void changedValue(int value) {
//    this.newValue=value;
  }
}
