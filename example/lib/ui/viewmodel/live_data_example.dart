import 'package:mvvm_flutter/base_model/livedata_observer.dart';
import 'package:mvvm_flutter/base_model/base_model.dart';

class ObserverViewModel extends BaseViewModel {
//  int incrementedValue=0;
  LiveData<int> incrementedValue;

  ObserverViewModel() {
    incrementedValue = LiveData<int>(value: 0);
    incrementedValue.listener(this, changedValue);
  }

  Future<void> doSomeNetworkCall() async {
    showProgressbar();
    return await Future.delayed(Duration(seconds: 1)).then((_) {
      incrementedValue.emitValue(incrementedValue.value + 1);
      hideProgressbar();
    });
  }

  void changedValue(int value) {}
}