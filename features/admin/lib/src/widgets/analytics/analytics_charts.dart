import 'package:api_client/api_client.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class StatusDonutChart extends StatefulWidget {
  final List<StatusDistributionItemDto> items;

  const StatusDonutChart({super.key, required this.items});

  @override
  State<StatusDonutChart> createState() => _StatusDonutChartState();
}

class _StatusDonutChartState extends State<StatusDonutChart>
    with SingleTickerProviderStateMixin {
  int _touched = -1;
  late AnimationController _ctrl;
  late Animation<double> _anim;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 900));
    _anim = CurvedAnimation(parent: _ctrl, curve: Curves.easeOutCubic);
    Future.delayed(const Duration(milliseconds: 200), () {
      if (mounted) _ctrl.forward();
    });
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  String _label(String s) {
    switch (s) {
      case 'išspręsta':
        return 'Išspręsta';
      case 'gautas':
        return 'Gauta';
      case 'tiriamas':
        return 'Tiriama';
      case 'nepasitvirtino':
        return 'Nepasitvirtino';
      default:
        return s;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _anim,
      builder: (_, __) {
        return Row(
          children: [
            Expanded(
              flex: 3,
              child: SizedBox(
                height: 220,
                child: PieChart(
                  PieChartData(
                    startDegreeOffset: -90,
                    sectionsSpace: 3,
                    centerSpaceRadius: 58,
                    pieTouchData: PieTouchData(
                      touchCallback: (event, resp) {
                        setState(() {
                          _touched =
                              (resp?.touchedSection?.touchedSectionIndex ?? -1);
                        });
                      },
                    ),
                    sections: List.generate(widget.items.length, (i) {
                      final item = widget.items[i];
                      final isTouched = i == _touched;
                      final color = AppColors.statusColor(item.status);
                      return PieChartSectionData(
                        value: item.count.toDouble() * _anim.value,
                        color: isTouched ? color : color.withOpacity(0.85),
                        radius: isTouched ? 56 : 48,
                        showTitle: false,
                        badgeWidget: isTouched
                            ? _Badge(
                                pct: item.percentage.toDouble(), color: color)
                            : null,
                        badgePositionPercentageOffset: 1.4,
                      );
                    }),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: widget.items.map((item) {
                  final color = AppColors.statusColor(item.status);
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      children: [
                        Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                                color: color, shape: BoxShape.circle)),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(_label(item.status),
                                  style: const TextStyle(
                                      fontSize: 12,
                                      color: AppColors.textSecondary)),
                              Text(
                                  '${item.count}  ·  ${item.percentage.toStringAsFixed(1)}%',
                                  style: const TextStyle(
                                      fontSize: 11,
                                      color: AppColors.textMuted)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _Badge extends StatelessWidget {
  final double pct;
  final Color color;

  const _Badge({required this.pct, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.5)),
      ),
      child: Text('${pct.toStringAsFixed(1)}%',
          style: TextStyle(
              fontSize: 11, fontWeight: FontWeight.w700, color: color)),
    );
  }
}

class MonthlyTrendChart extends StatefulWidget {
  final List<MonthlyTrendItemDto> trends;

  const MonthlyTrendChart({super.key, required this.trends});

  @override
  State<MonthlyTrendChart> createState() => _MonthlyTrendChartState();
}

class _MonthlyTrendChartState extends State<MonthlyTrendChart>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _anim;
  int? _hovered;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1200));
    _anim = CurvedAnimation(parent: _ctrl, curve: Curves.easeOutCubic);
    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted) _ctrl.forward();
    });
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  static const _monthAbbr = [
    '',
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];

  @override
  Widget build(BuildContext context) {
    final maxY = widget.trends.isEmpty
        ? 500.0
        : widget.trends
                .map((t) => t.count)
                .reduce((a, b) => a > b ? a : b)
                .toDouble() *
            1.2;

    return AnimatedBuilder(
      animation: _anim,
      builder: (_, __) {
        final progress = _anim.value;
        final spots = widget.trends
            .asMap()
            .entries
            .map((e) =>
                FlSpot(e.key.toDouble(), e.value.count.toDouble() * progress))
            .toList();
        final resolvedSpots = widget.trends
            .asMap()
            .entries
            .map((e) => FlSpot(
                e.key.toDouble(), e.value.resolved.toDouble() * progress))
            .toList();

        return SizedBox(
          height: 240,
          child: LineChart(
            LineChartData(
              minY: 0,
              maxY: maxY,
              gridData: FlGridData(
                show: true,
                drawVerticalLine: false,
                horizontalInterval: maxY / 4,
                getDrawingHorizontalLine: (_) => const FlLine(
                  color: AppColors.border,
                  strokeWidth: 1,
                  dashArray: [4, 6],
                ),
              ),
              borderData: FlBorderData(show: false),
              titlesData: FlTitlesData(
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 38,
                    interval: maxY / 4,
                    getTitlesWidget: (v, _) => Text(
                      v.toInt().toString(),
                      style: const TextStyle(
                          fontSize: 10, color: AppColors.textMuted),
                    ),
                  ),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    interval: 1,
                    getTitlesWidget: (v, _) {
                      final idx = v.toInt();
                      if (idx < 0 || idx >= widget.trends.length)
                        return const SizedBox();
                      return Padding(
                        padding: const EdgeInsets.only(top: 6),
                        child: Text(
                          _monthAbbr[widget.trends[idx].month.toInt()],
                          style: const TextStyle(
                              fontSize: 10, color: AppColors.textMuted),
                        ),
                      );
                    },
                  ),
                ),
                topTitles:
                    const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                rightTitles:
                    const AxisTitles(sideTitles: SideTitles(showTitles: false)),
              ),
              lineTouchData: LineTouchData(
                touchTooltipData: LineTouchTooltipData(
                  getTooltipColor: (_) => AppColors.surfaceElevated,
                  tooltipBorderRadius: BorderRadius.circular(10),
                  getTooltipItems: (spots) {
                    return spots.map((s) {
                      final isResolved = s.barIndex == 1;
                      return LineTooltipItem(
                        '${isResolved ? "Resolved" : "Total"}: ${s.y.toInt()}',
                        TextStyle(
                          color: isResolved
                              ? AppColors.accentBlue
                              : AppColors.primary,
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      );
                    }).toList();
                  },
                ),
              ),
              lineBarsData: [
                // Total reports line
                LineChartBarData(
                  spots: spots,
                  isCurved: true,
                  curveSmoothness: 0.35,
                  color: AppColors.primary,
                  barWidth: 2.5,
                  isStrokeCapRound: true,
                  dotData: const FlDotData(show: false),
                  belowBarData: BarAreaData(
                    show: true,
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColors.primary.withOpacity(0.20),
                        AppColors.primary.withOpacity(0.00),
                      ],
                    ),
                  ),
                ),
                // Resolved line
                LineChartBarData(
                  spots: resolvedSpots,
                  isCurved: true,
                  curveSmoothness: 0.35,
                  color: AppColors.accentBlue,
                  barWidth: 2,
                  isStrokeCapRound: true,
                  dashArray: [5, 4],
                  dotData: const FlDotData(show: false),
                  belowBarData: BarAreaData(show: false),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class CategoryBarChart extends StatefulWidget {
  final List<CategoryBreakdownItemDto> items;

  const CategoryBarChart({super.key, required this.items});

  @override
  State<CategoryBarChart> createState() => _CategoryBarChartState();
}

class _CategoryBarChartState extends State<CategoryBarChart>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _anim;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 900));
    _anim = CurvedAnimation(parent: _ctrl, curve: Curves.easeOutBack);
    Future.delayed(const Duration(milliseconds: 400), () {
      if (mounted) _ctrl.forward();
    });
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  String _catLabel(String c) {
    switch (c) {
      case 'trash':
        return 'Atliekos';
      case 'forest':
        return 'Miškas';
      case 'beetle':
        return 'Žievėgraužis';
      case 'permits':
        return 'Leidimai';
      case 'misc':
        return 'Kita';
      default:
        return c;
    }
  }

  @override
  Widget build(BuildContext context) {
    final maxY = widget.items.isEmpty
        ? 2000.0
        : widget.items
                .map((i) => i.count)
                .reduce((a, b) => a > b ? a : b)
                .toDouble() *
            1.25;

    return AnimatedBuilder(
      animation: _anim,
      builder: (_, __) {
        return SizedBox(
          height: 220,
          child: BarChart(
            BarChartData(
              maxY: maxY,
              gridData: FlGridData(
                show: true,
                drawVerticalLine: false,
                horizontalInterval: maxY / 4,
                getDrawingHorizontalLine: (_) => const FlLine(
                  color: AppColors.border,
                  strokeWidth: 1,
                  dashArray: [4, 6],
                ),
              ),
              borderData: FlBorderData(show: false),
              barTouchData: BarTouchData(
                touchTooltipData: BarTouchTooltipData(
                  getTooltipColor: (_) => AppColors.surfaceElevated,
                  tooltipBorderRadius: BorderRadius.circular(10),
                  getTooltipItem: (group, groupIdx, rod, rodIdx) {
                    final item = widget.items[group.x];
                    return BarTooltipItem(
                      '${_catLabel(item.category)}\n${item.count} pranešimų\n${item.avgResolutionHours.toStringAsFixed(1)}h vid.',
                      const TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 11,
                          height: 1.6),
                    );
                  },
                ),
              ),
              titlesData: FlTitlesData(
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (v, _) {
                      final idx = v.toInt();
                      if (idx < 0 || idx >= widget.items.length)
                        return const SizedBox();
                      return Padding(
                        padding: const EdgeInsets.only(top: 6),
                        child: Text(_catLabel(widget.items[idx].category),
                            style: const TextStyle(
                                fontSize: 10, color: AppColors.textMuted)),
                      );
                    },
                  ),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 38,
                    interval: maxY / 4,
                    getTitlesWidget: (v, _) => Text(v.toInt().toString(),
                        style: const TextStyle(
                            fontSize: 10, color: AppColors.textMuted)),
                  ),
                ),
                topTitles:
                    const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                rightTitles:
                    const AxisTitles(sideTitles: SideTitles(showTitles: false)),
              ),
              barGroups: List.generate(widget.items.length, (i) {
                final item = widget.items[i];
                final color = AppColors.categoryColor(item.category);
                return BarChartGroupData(
                  x: i,
                  barRods: [
                    BarChartRodData(
                      toY: item.count.toDouble() * _anim.value,
                      color: color,
                      width: 32,
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(6)),
                      backDrawRodData: BackgroundBarChartRodData(
                        show: true,
                        toY: maxY,
                        color: AppColors.border.withOpacity(0.3),
                      ),
                    ),
                  ],
                );
              }),
            ),
          ),
        );
      },
    );
  }
}

class SlaChart extends StatefulWidget {
  final SlaPerformanceDto sla;

  const SlaChart({super.key, required this.sla});

  @override
  State<SlaChart> createState() => _SlaChartState();
}

class _SlaChartState extends State<SlaChart>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _anim;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    _anim = CurvedAnimation(parent: _ctrl, curve: Curves.easeOutCubic);
    Future.delayed(const Duration(milliseconds: 600), () {
      if (mounted) _ctrl.forward();
    });
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final items = [
      _SlaItem('< 24 valandų', widget.sla.within24hPercent.toDouble(),
          AppColors.primary, widget.sla.within24h.toInt()),
      _SlaItem('< 72 valandų', widget.sla.within72hPercent.toDouble(),
          AppColors.accentBlue, widget.sla.within72h.toInt()),
      _SlaItem('< 7 dienų', widget.sla.within7dPercent.toDouble(),
          AppColors.accent, widget.sla.within7d.toInt()),
      _SlaItem('< 30 dienų', widget.sla.within30dPercent.toDouble(),
          AppColors.accentPurple, widget.sla.within30d.toInt()),
      _SlaItem('> 30 dienų', widget.sla.over30d.toDouble(),
          AppColors.accentPurple, widget.sla.over30d.toInt()),
    ];

    return AnimatedBuilder(
      animation: _anim,
      builder: (_, __) {
        return Column(
          children: items.map((item) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(item.label,
                            style: const TextStyle(
                                fontSize: 12, color: AppColors.textSecondary)),
                      ),
                      Text('${item.count}',
                          style: const TextStyle(
                              fontSize: 12,
                              color: AppColors.textMuted,
                              fontWeight: FontWeight.w600)),
                      const SizedBox(width: 6),
                      Text('${item.percent.toStringAsFixed(1)}%',
                          style: TextStyle(
                              fontSize: 12,
                              color: item.color,
                              fontWeight: FontWeight.w700)),
                    ],
                  ),
                  const SizedBox(height: 6),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Stack(
                      children: [
                        Container(height: 6, color: AppColors.border),
                        FractionallySizedBox(
                          widthFactor:
                              (item.percent / 100).clamp(0, 1) * _anim.value,
                          child: Container(
                            height: 6,
                            decoration: BoxDecoration(
                              color: item.color,
                              boxShadow: [
                                BoxShadow(
                                    color: item.color.withOpacity(0.4),
                                    blurRadius: 6)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        );
      },
    );
  }
}

class _SlaItem {
  final String label;
  final double percent;
  final Color color;
  final int count;

  const _SlaItem(this.label, this.percent, this.color, this.count);
}

class RegionChart extends StatefulWidget {
  final List<RegionBreakdownItemDto> items;

  const RegionChart({super.key, required this.items});

  @override
  State<RegionChart> createState() => _RegionChartState();
}

class _RegionChartState extends State<RegionChart>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _anim;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    _anim = CurvedAnimation(parent: _ctrl, curve: Curves.easeOutCubic);
    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted) _ctrl.forward();
    });
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  String _short(String name) => name.replaceAll(' apskritis', '');

  @override
  Widget build(BuildContext context) {
    final top = widget.items.take(8).toList();
    final maxCount = top.isEmpty ? 1 : top.first.count;

    return AnimatedBuilder(
      animation: _anim,
      builder: (_, __) {
        return Column(
          children: List.generate(top.length, (i) {
            final item = top[i];
            final color =
                AppColors.chartColors[i % AppColors.chartColors.length];
            final frac = (item.count / maxCount).clamp(0.0, 1.0) * _anim.value;
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                children: [
                  SizedBox(
                    width: 130,
                    child: Text(_short(item.region),
                        style: const TextStyle(
                            fontSize: 11, color: AppColors.textSecondary),
                        overflow: TextOverflow.ellipsis),
                  ),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: Stack(
                        children: [
                          Container(height: 8, color: AppColors.border),
                          FractionallySizedBox(
                            widthFactor: frac,
                            child: Container(
                              height: 8,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [color, color.withOpacity(0.6)],
                                ),
                                boxShadow: [
                                  BoxShadow(
                                      color: color.withOpacity(0.3),
                                      blurRadius: 4)
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  SizedBox(
                    width: 44,
                    child: Text('${item.count}',
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                            fontSize: 11,
                            color: AppColors.textMuted,
                            fontWeight: FontWeight.w600)),
                  ),
                ],
              ),
            );
          }),
        );
      },
    );
  }
}

class TrendBadgeRow extends StatelessWidget {
  final List<MonthlyTrendItemDto> trends;

  const TrendBadgeRow({super.key, required this.trends});

  @override
  Widget build(BuildContext context) {
    final recent =
        trends.where((t) => t.countChangePercent != null).take(6).toList();
    if (recent.isEmpty) return const SizedBox();

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: recent.map((t) {
        final pct = t.countChangePercent!;
        final isUp = pct >= 0;
        final color = isUp ? AppColors.primary : AppColors.accentRed;
        const months = [
          '',
          'Sau',
          'Vas',
          'Kov',
          'Bal',
          'Geg',
          'Bir',
          'Lie',
          'Rugp',
          'Rugs',
          'Spa',
          'Lap',
          'Gru'
        ];
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: color.withOpacity(0.2)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(months[t.month.toInt()],
                  style: const TextStyle(
                      fontSize: 11, color: AppColors.textSecondary)),
              const SizedBox(width: 4),
              Icon(isUp ? Icons.trending_up : Icons.trending_down,
                  size: 12, color: color),
              const SizedBox(width: 2),
              Text('${pct.abs().toStringAsFixed(1)}%',
                  style: TextStyle(
                      fontSize: 11, fontWeight: FontWeight.w700, color: color)),
            ],
          ),
        );
      }).toList(),
    );
  }
}
