import 'package:core_ui/src/widgets/admin/admin_edit_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gallery_image_viewer/gallery_image_viewer.dart';
import 'package:domain/domain.dart';
import 'package:http/http.dart' as http;

class AdminTrashWindowBox extends StatelessWidget {
  AdminTrashWindowBox({
    super.key,
    required this.title,
    required this.imageUrls,
    required this.status,
    required this.screenWidth,
    required this.onUpdate,
    required this.report,
  });

  final String title;
  final double screenWidth;
  final List<String>? imageUrls;
  final String status;
  final ReportModel report;
  final Function(ReportModel, List<http.MultipartFile>) onUpdate;

  final List<ImageProvider> _imageProviders = [];

  @override
  Widget build(BuildContext context) {
    if (imageUrls!.isNotEmpty) {
      for (var element in imageUrls!) {
        _imageProviders.add(Image.network(element).image);
      }
    }

    return Container(
      margin: imageUrls!.isNotEmpty ? null : const EdgeInsets.only(top: 50),
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            'PRANEŠIMO TURINYS',
            style: GoogleFonts.raleway(
                fontWeight: FontWeight.w600,
                fontSize: 12,
                color: const Color.fromRGBO(10, 51, 40, 0.4)),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.raleway(
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 12),
          imageUrls!.isNotEmpty
              ? Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: GalleryImageView(
                    listImage: _imageProviders,
                    width: 200,
                    height: 100,
                    shortImage: true,
                    imageDecoration:
                        BoxDecoration(border: Border.all(color: Colors.white)),
                    galleryType: 2,
                  ))
              : const SizedBox.shrink(),
          const SizedBox(height: 12),
          const Divider(
            height: 1,
            color: Color.fromRGBO(10, 51, 40, 0.1),
          ),
          const SizedBox(height: 12),
          Container(
            height: 30,
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 4,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: const Color.fromRGBO(10, 51, 40, 0.08),
            ),
            child: Center(
              child: Text(
                status.toUpperCase(),
                style: GoogleFonts.raleway(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Center(
            child: AdminEditButton(
              type: 'report',
              width: screenWidth,
              onPressed: () {
                Navigator.of(context).pop();
              },
              onUpdate: (updatedModel, officerFiles) {
                onUpdate(updatedModel, officerFiles);
              },
              report: report,
            ),
          ),
        ],
      ),
    );
  }
}
