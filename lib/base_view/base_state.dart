import 'package:flutter/material.dart';
import 'package:mvvm_flutter/base_model/base_model.dart';
import 'package:mvvm_flutter/base_view/progress_bar_widget.dart';
import 'package:provider/provider.dart';

abstract class BaseState<M extends BaseViewModel, T extends StatefulWidget>
    extends State<T> {
  M viewModel;

  @override
  void initState() {
    super.initState();
    initViewModel();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<M>(
      create: (context) => viewModel,
      child: Consumer<M>(
        builder: loadingProgressBuilder,
        child: ChildrenHolder(reuseChildren()),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    viewModel.dispose();
  }

  Widget loadingProgressBuilder(
      BuildContext context, M baseModel, Widget childrenHolder) {
    return LoadingProgressWidget(
      showIndicator: viewModel.busy,
      child: stateWidgetBuilder(context, childrenHolder),
    );
  }

  ///abstraction layer very important
  void initViewModel();
  List<Widget> reuseChildren();
  Widget stateWidgetBuilder(
      BuildContext context, ChildrenHolder childrenHolder);
}

/// <h2>Get <strong> expensive </strong>child list here and reuse it in builder method</h28>
class ChildrenHolder extends Widget {
  final List<Widget> children;

  ChildrenHolder(this.children);

  @override
  Element createElement() {
    return null;
  }
}
