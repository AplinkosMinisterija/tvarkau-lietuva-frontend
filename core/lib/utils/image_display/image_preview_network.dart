import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class ImagePreviewNetwork extends StatefulWidget {
  const ImagePreviewNetwork({
    super.key,
    required this.imageUrls,
    required this.activeImageIndex,
  });

  final List<String> imageUrls;
  final int activeImageIndex;

  @override
  State<ImagePreviewNetwork> createState() => _ImagePreviewNetworkState();
}

class _ImagePreviewNetworkState extends State<ImagePreviewNetwork> {
  int activeIndex = 0;
  bool isMobile = true;

  @override
  void initState() {
    activeIndex = widget.activeImageIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if (size.width > 900) {
      isMobile = false;
    }
    return Dialog.fullscreen(
        backgroundColor: Colors.transparent,
        child: Padding(
          padding: EdgeInsets.all(isMobile ? 16 : 24),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                        height: size.height * 0.75,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: AppNetworkImage(
                              url: widget.imageUrls[activeIndex],
                              isThumbnailMode: false,
                            ))),
                    SizedBox(height: size.height * 0.022),
                    SizedBox(
                        width: isMobile
                            ? (widget.imageUrls.length * size.width * 0.1778)
                            : (widget.imageUrls.length * size.width * 0.06),
                        height: 64,
                        child: ListView(
                            scrollDirection: Axis.horizontal,
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              for (var i = 0;
                                  i < widget.imageUrls.length;
                                  i++) ...[
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      activeIndex = i;
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: Container(
                                      height: 64,
                                      width: 64,
                                      decoration: activeIndex == i
                                          ? BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              border: Border.all(
                                                color: Colors.white,
                                                width: 1,
                                              ),
                                            )
                                          : null,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: MouseRegion(
                                          cursor: SystemMouseCursors.zoomIn,
                                          child: AppNetworkImage(
                                            url: widget.imageUrls[i],
                                            fit: BoxFit.cover,
                                            isThumbnailMode: true,
                                          ),

                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ])

                        )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: getGalleryButton(Icons.arrow_back, () {
                  setState(() {
                    if (activeIndex < 1) {
                      activeIndex = widget.imageUrls.length - 1;
                    } else {
                      activeIndex--;
                    }
                  });
                }),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: getGalleryButton(Icons.arrow_forward, () {
                  setState(() {
                    if (activeIndex == widget.imageUrls.length - 1) {
                      activeIndex = 0;
                    } else {
                      activeIndex++;
                    }
                  });
                }),
              ),
              Align(
                alignment: Alignment.topRight,
                child: getGalleryButton(Icons.close, () {
                  Navigator.of(context).pop();
                }),
              ),
            ],
          ),
        ));
  }

  Widget getGalleryButton(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 48,
        width: 48,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Icon(
          icon,
          size: 24,
          color: Colors.black,
        ),
      ),
    );
  }
}
