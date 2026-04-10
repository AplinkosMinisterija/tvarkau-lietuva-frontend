import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class StatCard extends StatefulWidget {
  final String label;
  final String value;
  final String? subtitle;
  final IconData icon;
  final Color? accentColor;
  final double? changePercent;
  final bool animate;

  const StatCard({
    super.key,
    required this.label,
    required this.value,
    this.subtitle,
    required this.icon,
    this.accentColor,
    this.changePercent,
    this.animate = true,
  });

  @override
  State<StatCard> createState() => _StatCardState();
}

class _StatCardState extends State<StatCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _scaleAnim;
  late Animation<double> _fadeAnim;
  bool _hovered = false;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _scaleAnim =
        Tween<double>(begin: 0.92, end: 1.0).animate(CurvedAnimation(
          parent: _ctrl,
          curve: Curves.easeOutCubic,
        ));
    _fadeAnim = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _ctrl,
      curve: const Interval(0.2, 1.0, curve: Curves.easeOut),
    ));
    if (widget.animate) {
      Future.delayed(const Duration(milliseconds: 100), () {
        if (mounted) _ctrl.forward();
      });
    } else {
      _ctrl.value = 1.0;
    }
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final accent = widget.accentColor ?? AppColors.primary;
    return AnimatedBuilder(
      animation: _ctrl,
      builder: (_, __) => FadeTransition(
        opacity: _fadeAnim,
        child: ScaleTransition(
          scale: _scaleAnim,
          child: MouseRegion(
            onEnter: (_) => setState(() => _hovered = true),
            onExit: (_) => setState(() => _hovered = false),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              decoration: BoxDecoration(
                color: _hovered
                    ? AppColors.surfaceElevated
                    : AppColors.surface,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: _hovered ? accent.withOpacity(0.5) : AppColors.border,
                  width: 1,
                ),
                boxShadow: _hovered
                    ? [BoxShadow(color: accent.withOpacity(0.15), blurRadius: 24, spreadRadius: 0)]
                    : [BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 8, offset: const Offset(0, 2))],
              ),
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: accent.withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(widget.icon, color: accent, size: 18),
                      ),
                      const Spacer(),
                      if (widget.changePercent != null)
                        _ChangeBadge(percent: widget.changePercent!),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    widget.value,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.w700,
                      fontSize: 28,
                      letterSpacing: -0.5,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.label,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColors.textSecondary,
                      fontSize: 12,
                      letterSpacing: 0.3,
                    ),
                  ),
                  if (widget.subtitle != null) ...[
                    const SizedBox(height: 8),
                    Container(
                      height: 1,
                      color: AppColors.border,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      widget.subtitle!,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.textMuted,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ChangeBadge extends StatelessWidget {
  final double percent;
  const _ChangeBadge({required this.percent});

  @override
  Widget build(BuildContext context) {
    final isUp = percent >= 0;
    final color = isUp ? AppColors.primary : AppColors.accentRed;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isUp ? Icons.arrow_upward_rounded : Icons.arrow_downward_rounded,
            size: 11,
            color: color,
          ),
          const SizedBox(width: 2),
          Text(
            '${percent.abs().toStringAsFixed(1)}%',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}

// Generic chart card wrapper
class ChartCard extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget child;
  final Widget? trailing;
  final EdgeInsets padding;

  const ChartCard({
    super.key,
    required this.title,
    this.subtitle,
    required this.child,
    this.trailing,
    this.padding = const EdgeInsets.all(20),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: Deco.card(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: AppColors.textPrimary,
                          )),
                      if (subtitle != null) ...[
                        const SizedBox(height: 2),
                        Text(subtitle!,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                              color: AppColors.textMuted,
                              fontSize: 11,
                            )),
                      ],
                    ],
                  ),
                ),
                if (trailing != null) trailing!,
              ],
            ),
          ),
          const SizedBox(height: 4),
          Padding(padding: padding, child: child),
        ],
      ),
    );
  }
}