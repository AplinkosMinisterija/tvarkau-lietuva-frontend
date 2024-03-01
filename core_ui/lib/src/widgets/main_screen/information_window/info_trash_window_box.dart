import 'package:flutter/material.dart';

class InfoTrashWindowBox extends StatelessWidget {
  const InfoTrashWindowBox({
    super.key,
    required this.title,
    required this.imageUrls,
    required this.status,
    required this.date,
    required this.onTap,
    required this.reportId,
  });

  final String title;
  final List<String>? imageUrls;
  final String status;
  final String date;
  final VoidCallback onTap;
  final String reportId;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 328,
      height: 211,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          getTopInformationRow(),
          getMiddleInformationRow(),
          const SizedBox(height: 16),
          getMoreInformationButton(),
        ],
      ),
    );
  }

  Widget getMoreInformationButton() {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color.fromRGBO(241, 244, 243, 1)),
        child: const Center(
          child: Text(
            'Plačiau',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(57, 97, 84, 1)),
          ),
        ),
      ),
    );
  }

  Widget getMiddleInformationRow() {
    return Column(
      children: [
        const Align(
          alignment: Alignment.topLeft,
          child: Text(
            'Pranešimas:',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color.fromRGBO(0, 0, 0, 0.72),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            title,
            maxLines: 2,
            textAlign: TextAlign.left,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color.fromRGBO(0, 0, 0, 1)),
          ),
        )
      ],
    );
  }

  Widget getTopInformationRow() {
    int strLength = 8 - reportId.length;
    String str = '0' * strLength;
    return SizedBox(
      height: 45,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 24,
                width: 184,
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    '#TLP-A$str${reportId.toUpperCase()}',
                    textAlign: TextAlign.left,
                    style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                  ),
                ),
              ),
              Text(
                getFormattedDate(date),
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(0, 0, 0, 0.72)),
              ),
            ],
          ),
          getStatusWidget(status), //status
        ],
      ),
    );
  }

  String getFormattedDate(String unformattedDate) {
    DateTime formattedDate =
        DateTime.parse(unformattedDate).add(const Duration(hours: 3));
    String day = formattedDate.toString().substring(0, 10);
    String hour = formattedDate.toString().substring(11, 16);
    return '$day $hour';
  }

  Widget getStatusWidget(String status) {
    if (status == 'gautas') {
      return Container(
        height: 28,
        width: 64,
        decoration: getStatusBoxDecoration(
          const Color.fromRGBO(237, 12, 12, 1),
          const Color.fromRGBO(253, 225, 225, 1),
        ),
        child: Center(
          child: Text(
            'Gauta',
            style: getStatusBoxTextStyle(
              const Color.fromRGBO(237, 12, 12, 1),
            ),
          ),
        ),
      );
    } else if (status == 'tiriamas') {
      return Container(
        height: 28,
        width: 74,
        decoration: getStatusBoxDecoration(
          const Color.fromRGBO(255, 119, 0, 1),
          const Color.fromRGBO(255, 238, 224, 1),
        ),
        child: Center(
          child: Text(
            'Tiriama',
            style: getStatusBoxTextStyle(
              const Color.fromRGBO(255, 119, 0, 1),
            ),
          ),
        ),
      );
    } else if (status == 'išspręsta') {
      return Container(
        height: 28,
        width: 80,
        decoration: getStatusBoxDecoration(
          const Color.fromRGBO(0, 174, 6, 1),
          const Color.fromRGBO(224, 245, 224, 1),
        ),
        child: Center(
          child: Text(
            'Išspręsta',
            style: getStatusBoxTextStyle(
              const Color.fromRGBO(0, 174, 6, 1),
            ),
          ),
        ),
      );
    } else if (status == 'nepasitvirtino') {
      return Container(
        height: 28,
        width: 100,
        decoration: getStatusBoxDecoration(
          const Color.fromRGBO(100, 100, 100, 1.0),
          const Color.fromRGBO(220, 220, 220, 1.0),
        ),
        child: Center(
          child: Text(
            'Nepasitvirtino',
            style: getStatusBoxTextStyle(
              const Color.fromRGBO(100, 100, 100, 1.0),
            ),
          ),
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  BoxDecoration getStatusBoxDecoration(Color borderColor, Color fillColor) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      border: Border.all(
        width: 1,
        color: borderColor,
      ),
      color: fillColor,
    );
  }

  TextStyle getStatusBoxTextStyle(Color textColor) {
    return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: textColor,
    );
  }
}
