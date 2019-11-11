import 'package:flutter/material.dart';

class LoadingProgressWidget extends StatelessWidget {
  final Widget child;
  final ValueChanged<bool> progressListener;
  final bool showIndicator;
  final bool touchEnable;

  LoadingProgressWidget(
      {this.progressListener,
      @required this.showIndicator,
      @required this.child,
      this.touchEnable = true});

  @override
  Widget build(BuildContext context) {
    List<Widget> stackWidgets = [];
    stackWidgets.add(child);
    if (showIndicator) {
      stackWidgets.add(getBlockingUi(context));
      stackWidgets.add(progressBar(context));
    }

    return Stack(
        overflow: Overflow.visible,
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: stackWidgets);
  }

  Widget progressBar(BuildContext context) {
    return Positioned(
      width: 50,
      height: 50,
      child: buildProgressBarContainer(context),
    );
  }

  Widget buildProgressBarContainer(BuildContext context) {
    return Card(
        shape: CircleBorder(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircularProgressIndicator(),
        ));
  }

  Widget getBlockingUi(BuildContext context) {
    return AbsorbPointer(
        absorbing: touchEnable,
        child: Container(
          color: Colors.black.withAlpha(50),
        ));
  }
}
