import 'package:admin/src/widgets/analytics/stat_card.dart';
import 'package:api_client/api_client.dart';
import 'package:core_ui/core_ui.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'analytics_charts.dart';

String _fmtHours(double h) {
  if (h < 24) return '${h.toStringAsFixed(1)}h';
  final d = (h / 24).toStringAsFixed(1);
  return '${d}d';
}

class OverviewSection extends StatelessWidget {
  final ReportCategoryAnalyticsDto data;

  const OverviewSection({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final s = data.summary;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LayoutBuilder(builder: (ctx, constraints) {
          final w = constraints.maxWidth;
          final crossCount = w > 1100
              ? 4
              : w > 700
                  ? 3
                  : 2;
          final childAspect = w > 900 ? 1.8 : 1.6;
          return GridView.count(
            crossAxisCount: crossCount,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 14,
            mainAxisSpacing: 14,
            childAspectRatio: childAspect,
            children: [
              StatCard(
                label: 'Viso pranešimų',
                value: s.totalReports.toString(),
                icon: Icons.assignment_rounded,
                accentColor: AppColors.primary,
                subtitle: 'Paskutinės 30 d: ${s.reportsLast30Days} pranešimai',
                changePercent: s.last30DaysChangePercent?.toDouble(),
              ),
              StatCard(
                label: 'Išspręsta',
                value: s.resolvedReports.toString(),
                icon: Icons.check_circle_rounded,
                accentColor: AppColors.statusResolved,
                subtitle:
                    'Išspręstų kiekis: ${s.resolutionRate.toStringAsFixed(1)}%',
              ),
              StatCard(
                label: 'Tiriama',
                value: s.inInvestigationReports.toString(),
                icon: Icons.search_rounded,
                accentColor: AppColors.statusInvestigating,
                subtitle: 'Gauta: ${s.receivedReports}',
              ),
              StatCard(
                label: 'Vid. sprendimo laikas',
                value: _fmtHours(s.avgResolutionHours.toDouble()),
                icon: Icons.timer_outlined,
                accentColor: AppColors.accentBlue,
                subtitle: 'Paskutinės 7 d: ${s.reportsLast7Days} pranešimai',
              ),
            ],
          );
        }),
        const SizedBox(height: 20),
        LayoutBuilder(builder: (ctx, constraints) {
          final wide = constraints.maxWidth > 800;
          return wide
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 4,
                      child: ChartCard(
                        title: 'Būsenų pasiskirstymas',
                        subtitle: 'Visi pranešimai pagal dabartinę būseną',
                        child: StatusDonutChart(
                            items: data.statusDistribution.toList()),
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      flex: 6,
                      child: ChartCard(
                        title: 'Mėnesinės tendencijos',
                        subtitle:
                            'Pranešimų kiekis ir išspręstas kiekis per mėnesį',
                        trailing: _Legend(),
                        child: MonthlyTrendChart(
                            trends: data.monthlyTrends.toList()),
                      ),
                    ),
                  ],
                )
              : Column(
                  children: [
                    ChartCard(
                      title: 'Būsenų pasiskirstymas',
                      child: StatusDonutChart(
                          items: data.statusDistribution.toList()),
                    ),
                    const SizedBox(height: 14),
                    ChartCard(
                      title: 'Mėnesinės tendencijos',
                      child: MonthlyTrendChart(
                          trends: data.monthlyTrends.toList()),
                    ),
                  ],
                );
        }),
        const SizedBox(height: 14),
        ChartCard(
          title: 'Kategorijų analizė',
          subtitle:
              'Pranešimų kiekis ir vidutinis sprendimo laikas pagal kategoriją',
          child: CategoryBarChart(items: data.categoryBreakdown.toList()),
        ),
      ],
    );
  }
}

class _Legend extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _dot(AppColors.primary, 'Visi'),
        const SizedBox(width: 12),
        _dot(AppColors.accentBlue, 'Išspręsta', dashed: true),
      ],
    );
  }

  Widget _dot(Color color, String label, {bool dashed = false}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        dashed
            ? SizedBox(
                width: 16,
                child: CustomPaint(painter: _DashPainter(color)),
              )
            : Container(
                width: 16,
                height: 2,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(1),
                ),
              ),
        const SizedBox(width: 5),
        Text(label,
            style: const TextStyle(fontSize: 11, color: AppColors.textMuted)),
      ],
    );
  }
}

class _DashPainter extends CustomPainter {
  final Color color;

  _DashPainter(this.color);

  @override
  void paint(Canvas c, Size s) {
    final p = Paint()
      ..color = color
      ..strokeWidth = 2;
    c.drawLine(const Offset(0, 5), const Offset(5, 5), p);
    c.drawLine(const Offset(8, 5), const Offset(13, 5), p);
  }

  @override
  bool shouldRepaint(_) => false;
}

class TrendsSection extends StatelessWidget {
  final ReportCategoryAnalyticsDto data;

  const TrendsSection({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Trend badges
        ChartCard(
          title: 'Mėnesiniai pokyčiai',
          subtitle: 'Procentinis pokytis lyginant su ankstesniu mėnesiu',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TrendBadgeRow(trends: data.monthlyTrends.toList()),
              const SizedBox(height: 16),
              _TrendTable(trends: data.monthlyTrends.toList()),
            ],
          ),
        ),
        const SizedBox(height: 14),
        ChartCard(
          title: 'Mėnesinis pranešimų grafikas',
          subtitle: 'Detalus vaizdas su sprendimo duomenimis',
          child: MonthlyTrendChart(trends: data.monthlyTrends.toList()),
        ),
      ],
    );
  }
}

class _TrendTable extends StatelessWidget {
  final List<MonthlyTrendItemDto> trends;

  const _TrendTable({required this.trends});

  static const _months = [
    '',
    'Sausis',
    'Vasaris',
    'Kovas',
    'Balandis',
    'Gegužė',
    'Birželis',
    'Liepa',
    'Rugpjūtis',
    'Rugsėjis',
    'Spalis',
    'Lapkritis',
    'Gruodis'
  ];

  Widget _pctCell(double? pct) {
    if (pct == null)
      return const Text('—',
          style: TextStyle(color: AppColors.textMuted, fontSize: 12));
    final isUp = pct >= 0;
    final color = isUp ? AppColors.primary : AppColors.accentRed;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(isUp ? Icons.arrow_upward_rounded : Icons.arrow_downward_rounded,
            size: 10, color: color),
        Text('${pct.abs().toStringAsFixed(1)}%',
            style: TextStyle(
                fontSize: 12, color: color, fontWeight: FontWeight.w600)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Table(
      columnWidths: const {
        0: FlexColumnWidth(2),
        1: FlexColumnWidth(1.2),
        2: FlexColumnWidth(1.2),
        3: FlexColumnWidth(1.5),
        4: FlexColumnWidth(1.5),
      },
      children: [
        TableRow(
          decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: AppColors.border))),
          children:
              ['Mėnuo', 'Viso', 'Išspręsta', 'Pokytis %', 'Sprendimo laikas']
                  .map((h) => Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Text(h,
                            style: const TextStyle(
                                fontSize: 10,
                                color: AppColors.textMuted,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.5)),
                      ))
                  .toList(),
        ),
        ...trends.reversed.take(12).map((t) => TableRow(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 7),
                  child: Text('${_months[t.month.toInt()]} ${t.year}',
                      style: const TextStyle(
                          fontSize: 12, color: AppColors.textSecondary)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 7),
                  child: Text(t.count.toString(),
                      style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.w600)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 7),
                  child: Text(t.resolved.toString(),
                      style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.statusResolved,
                          fontWeight: FontWeight.w600)),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 7),
                    child: _pctCell(t.countChangePercent?.toDouble())),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 7),
                  child: Text(_fmtHours(t.avgResolutionHours.toDouble()),
                      style: const TextStyle(
                          fontSize: 12, color: AppColors.accentBlue)),
                ),
              ],
            )),
      ],
    );
  }
}

class GeographySection extends StatelessWidget {
  final ReportCategoryAnalyticsDto data;

  const GeographySection({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      final wide = constraints.maxWidth > 800;
      return Column(
        children: [
          wide
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 5,
                      child: ChartCard(
                        title: 'Pranešimai pagal apskritis',
                        subtitle: 'Regionai pagal pranešimų skaičių',
                        child: RegionChart(
                            items: data.geographicBreakdown.toList()),
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      flex: 4,
                      child: ChartCard(
                        title: 'Geografinis pasiskirstymas',
                        subtitle: 'Procentinės dalys',
                        child: _RegionPieChart(
                            items: data.geographicBreakdown.toList()),
                      ),
                    ),
                  ],
                )
              : Column(
                  children: [
                    ChartCard(
                      title: 'Pranešimai pagal apskritis',
                      child:
                          RegionChart(items: data.geographicBreakdown.toList()),
                    ),
                    const SizedBox(height: 14),
                    ChartCard(
                      title: 'Geografinis pasiskirstymas',
                      child: _RegionPieChart(
                          items: data.geographicBreakdown.toList()),
                    ),
                  ],
                ),
          const SizedBox(height: 14),
          ChartCard(
            title: 'Regionų statistika',
            subtitle:
                'Pranešimų skaičius, dalis procentais ir vidutinis sprendimo laikas',
            child: _RegionTable(items: data.geographicBreakdown.toList()),
          ),
        ],
      );
    });
  }
}

class _RegionPieChart extends StatelessWidget {
  final List<RegionBreakdownItemDto> items;

  const _RegionPieChart({required this.items});

  @override
  Widget build(BuildContext context) {
    final top = items.take(6).toList();
    final otherCount = items.skip(6).fold(0, (a, b) => a + b.count.toInt());
    final total = items.fold(0, (a, b) => a + b.count.toInt());

    return SizedBox(
      height: 220,
      child: PieChart(
        PieChartData(
          startDegreeOffset: -90,
          sectionsSpace: 2,
          centerSpaceRadius: 50,
          sections: [
            ...List.generate(top.length, (i) {
              final item = top[i];
              final color = AppColors.chartColors[i];
              return PieChartSectionData(
                value: item.count.toDouble(),
                color: color,
                radius: 44,
                showTitle: item.percentage > 8,
                title: '${item.percentage.toStringAsFixed(0)}%',
                titleStyle: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              );
            }),
            if (otherCount > 0)
              PieChartSectionData(
                value: otherCount.toDouble(),
                color: AppColors.textMuted.withOpacity(0.4),
                radius: 44,
                showTitle: false,
              ),
          ],
        ),
      ),
    );
  }
}

class _RegionTable extends StatelessWidget {
  final List<RegionBreakdownItemDto> items;

  const _RegionTable({required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: items.map((item) {
        final idx = items.indexOf(item);
        final color = AppColors.chartColors[idx % AppColors.chartColors.length];
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: const BoxDecoration(
            border:
                Border(bottom: BorderSide(color: AppColors.border, width: 0.5)),
          ),
          child: Row(
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(color: color, shape: BoxShape.circle),
              ),
              const SizedBox(width: 10),
              Expanded(
                flex: 3,
                child: Text(item.region.replaceAll(' apskritis', ' aps.'),
                    style: const TextStyle(
                        fontSize: 12, color: AppColors.textSecondary)),
              ),
              Expanded(
                flex: 1,
                child: Text('${item.count}',
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w600)),
              ),
              Expanded(
                flex: 1,
                child: Text('${item.percentage.toStringAsFixed(1)}%',
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                        fontSize: 12, color: AppColors.textMuted)),
              ),
              Expanded(
                flex: 1,
                child: Text(_fmtHours(item.avgResolutionHours.toDouble()),
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                        fontSize: 12, color: AppColors.accentBlue)),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}

class SlaSection extends StatelessWidget {
  final ReportCategoryAnalyticsDto data;

  const SlaSection({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final perf = data.resolutionPerformance;

    return Column(
      children: [
        LayoutBuilder(builder: (ctx, constraints) {
          final crossCount = constraints.maxWidth > 800 ? 4 : 2;
          return GridView.count(
            crossAxisCount: crossCount,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 14,
            mainAxisSpacing: 14,
            childAspectRatio: 1.7,
            children: [
              StatCard(
                label: 'Vid. sprendimo laikas',
                value: _fmtHours(perf.avgResolutionHours.toDouble()),
                icon: Icons.av_timer_rounded,
                accentColor: AppColors.primary,
                animate: true,
              ),
              StatCard(
                label: 'Mediana',
                value: _fmtHours(perf.medianResolutionHours.toDouble()),
                icon: Icons.timeline_rounded,
                accentColor: AppColors.accentBlue,
                animate: true,
              ),
              StatCard(
                label: 'Min. laikas',
                value: _fmtHours(perf.minResolutionHours.toDouble()),
                icon: Icons.flash_on_rounded,
                accentColor: AppColors.primary,
                animate: true,
              ),
              StatCard(
                label: 'Max. laikas',
                value: _fmtHours(perf.maxResolutionHours.toDouble()),
                icon: Icons.hourglass_bottom_rounded,
                accentColor: AppColors.accentRed,
                animate: true,
              ),
            ],
          );
        }),
        const SizedBox(height: 14),
        LayoutBuilder(builder: (ctx, constraints) {
          final wide = constraints.maxWidth > 800;
          return wide
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ChartCard(
                        title: 'Sprendimo greitis',
                        subtitle:
                            'Išspręstų pranešimų pasiskirstymas pagal laiką',
                        child: SlaChart(sla: perf.sla),
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: ChartCard(
                        title: 'Suvestinė',
                        subtitle: 'Išspręstų pranešimų terminų grupės',
                        child: _SlaStats(
                            sla: perf.sla, total: perf.resolvedCount.toInt()),
                      ),
                    ),
                  ],
                )
              : Column(
                  children: [
                    ChartCard(
                      title: 'Sprendimo greitis',
                      child: SlaChart(sla: perf.sla),
                    ),
                    const SizedBox(height: 14),
                    ChartCard(
                      title: 'Suvestinė',
                      child: _SlaStats(
                          sla: perf.sla, total: perf.resolvedCount.toInt()),
                    ),
                  ],
                );
        }),
      ],
    );
  }
}

class _SlaStats extends StatelessWidget {
  final SlaPerformanceDto sla;
  final int total;

  const _SlaStats({required this.sla, required this.total});

  Widget _row(String label, int count, double pct, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          const SizedBox(width: 10),
          Expanded(
              child: Text(label,
                  style: const TextStyle(
                      fontSize: 12, color: AppColors.textSecondary))),
          Text('$count',
              style: const TextStyle(
                  fontSize: 12,
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w600)),
          const SizedBox(width: 8),
          SizedBox(
            width: 44,
            child: Text('${pct.toStringAsFixed(1)}%',
                textAlign: TextAlign.right,
                style: TextStyle(
                    fontSize: 12, color: color, fontWeight: FontWeight.w600)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _row('< 24 valandų', sla.within24h.toInt(),
            sla.within24hPercent.toDouble(), AppColors.primary),
        const Divider(color: AppColors.border, height: 1),
        _row('24–72 valandos', sla.within72h.toInt(),
            sla.within72hPercent.toDouble(), AppColors.accentBlue),
        const Divider(color: AppColors.border, height: 1),
        _row('3–7 dienos', sla.within7d.toInt(), sla.within7dPercent.toDouble(),
            AppColors.accent),
        const Divider(color: AppColors.border, height: 1),
        _row('7–30 dienų', sla.within30d.toInt(),
            sla.within30dPercent.toDouble(), AppColors.accentPurple),
        const Divider(color: AppColors.border, height: 1),
        _row('> 30 dienų', sla.over30d.toInt(),
            total > 0 ? sla.over30d / total * 100 : 0, AppColors.accentRed),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.primaryGlow,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              const Icon(Icons.check_circle_outline,
                  size: 14, color: AppColors.primary),
              const SizedBox(width: 8),
              Expanded(
                child: Text('Viso išspręsta: $total pranešimų',
                    style: const TextStyle(
                        fontSize: 11, color: AppColors.primary)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
