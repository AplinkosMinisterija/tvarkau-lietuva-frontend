import 'package:flutter/cupertino.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoaderWidget {
  Widget loader() {
    return Container(
      color: const Color.fromRGBO(57, 97, 84, 1),
      child: Center(
        child: LoadingAnimationWidget.staggeredDotsWave(
            color: const Color.fromRGBO(229, 232, 255, 1), size: 150),
      ),
    );
  }
}
