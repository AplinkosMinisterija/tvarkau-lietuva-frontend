import 'package:flutter/material.dart';
import '../common/custom_colors.dart';

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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _BuildButton(
            isActive: !isMapView,
            onPressed: () {
              onIsMapViewChange(false);
            },
            icon: Icons.bar_chart,
          ),
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
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: isActive ? const Color(0xffff6a3d) : CustomColors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon),
      ),
    );
  }
}
