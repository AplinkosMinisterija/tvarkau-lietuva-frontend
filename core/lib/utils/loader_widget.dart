import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoaderWidget {
  Widget loader() {
    return Container(
      color: const Color.fromRGBO(28, 63, 58, 1),
      child: Center(
        child: LoadingAnimationWidget.staggeredDotsWave(
            color: const Color.fromRGBO(229, 232, 255, 1), size: 150),
      ),
    );
  }

  Widget mapLoader(double width, bool isMobile) {
    return Padding(
      padding: EdgeInsets.only(top: width * 0.03125),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          SizedBox(
            height: isMobile ? width * 1.722 : width * 0.4765,
            width: isMobile ? width * 0.9112 : width * 0.84375,
            child: ClipRRect(
                borderRadius:
                    BorderRadius.all(Radius.circular(isMobile ? 8 : 32)),
                child: Container(
                  color: const Color.fromRGBO(28, 63, 58, 1),
                )),
          ),
          LoadingAnimationWidget.staggeredDotsWave(
              color: const Color.fromRGBO(255, 255, 255, 1), size: 150),
        ],
      ),
    );
  }

  Widget transparentLoader() {
    return Center(
      child: LoadingAnimationWidget.staggeredDotsWave(
          color: const Color.fromRGBO(28, 63, 58, 1), size: 150),
    );
  }
}
