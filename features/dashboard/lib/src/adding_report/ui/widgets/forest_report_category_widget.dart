import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ReportCategorySelector extends StatelessWidget {
  const ReportCategorySelector({
    super.key,
    required this.onTap,
    required this.title,
    required this.description,
    required this.iconName,
  });

  final VoidCallback onTap;
  final String title;
  final String description;
  final String iconName;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      clipBehavior: Clip.hardEdge,
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Theme.of(context).colorScheme.outline,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child: ListTile(
        title: Text(title),
        subtitle: Text(description),
        leading: getIcon(iconName, 24),
        onTap: onTap,
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }

  SvgPicture getIcon(String iconName, double size) {
    return SvgPicture.asset(
      'assets/svg/$iconName.svg',
      height: size,
      width: size,
      color: const Color.fromRGBO(70, 166, 0, 1.0),
    );
  }
}
