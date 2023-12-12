import 'package:flutter/material.dart';
import '../common/custom_colors.dart';
import '../common/extensions.dart';

class UpdatedAdminViewTypeSwitch extends StatelessWidget {
  const UpdatedAdminViewTypeSwitch({
    super.key,
    required this.isMapView,
    required this.onIsMapViewChange,
  });

  final bool isMapView;
  final ValueChanged<bool> onIsMapViewChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CustomColors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      padding: const EdgeInsets.all(4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _BuildButton(
            isActive: !isMapView,
            onPressed: () {
              onIsMapViewChange(false);
            },
            icon: Icons.table_chart_outlined,
          ),
          4.widthBox,
          _BuildButton(
            isActive: isMapView,
            onPressed: () {
              onIsMapViewChange(true);
            },
            icon: Icons.map,
          ),
        ],
      ),
    );
  }
}

class _BuildButton extends StatelessWidget {
  const _BuildButton({
    required this.onPressed,
    required this.isActive,
    required this.icon,
  });
  final VoidCallback onPressed;
  final bool isActive;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isActive ? const Color(0xffff6a3d) : CustomColors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          borderRadius: BorderRadius.circular(4),
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Icon(
              icon,
              size: 24,
              color: isActive ? CustomColors.white : CustomColors.black,
            ),
          ),
        ),
      ),
    );
  }
}
