import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
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

  Widget mapLoader(double width) {
    return Padding(
      padding: EdgeInsets.only(top: width * 0.03125),
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: width * 0.4765,
            width: width * 0.84375,
            child: const Opacity(
              opacity: 0.6,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(32)),
                child: GoogleMap(
                    initialCameraPosition: CameraPosition(
                        target: LatLng(55.1736, 23.8948), zoom: 7.0)),
              ),
            ),
          ),
          LoadingAnimationWidget.staggeredDotsWave(
              color: const Color.fromRGBO(28, 63, 58, 1), size: 150),
        ],
      ),
    );
  }
}
