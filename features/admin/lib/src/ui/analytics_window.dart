import 'package:core/utils/extensions.dart';
import 'package:api_client/api_client.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import '../common/custom_styles.dart';
import '../widgets/analytics/analytics_sections.dart';
import '../widgets/base_admin_screen.dart';
import '../widgets/custom_text_button.dart';
import 'package:intl/intl.dart';

class AnalyticsWindow extends StatefulWidget {
  final ReportCategoryAnalyticsDto? analytics;
  final VoidCallback onBackPress;
  final Function(
          String dateFrom, String? dateTo, String? status, String? category)
      onLoadAnalytics;

  const AnalyticsWindow({
    this.analytics,
    required this.onBackPress,
    required this.onLoadAnalytics,
    super.key,
  });

  @override
  State<AnalyticsWindow> createState() => _AnalyticsWindowState();
}

class _AnalyticsWindowState extends State<AnalyticsWindow>
    with SingleTickerProviderStateMixin {
  bool isVisible = false;
  String? dateFrom;
  String? dateTo;
  String? status;
  String? category;
  bool isPending = false;

  int _navIndex = 0;
  late AnimationController _contentCtrl;
  late Animation<double> _contentFade;

  DateTime? filterDateFrom;
  DateTime? filterDateTo;
  String? filterCategory;

  final _sections = [
    'Apžvalga',
    'Tendencijos',
    'Apskritys',
    'Efektyvumas ir kokybė',
  ];
  final _sectionSubtitles = [
    'Bendra statistika ir pagrindiniai rodikliai',
    'Laiko eilutės ir mėnesiniai pokyčiai',
    'Pranešimai pagal Lietuvos apskritis',
    'Sprendimo laikai ir efektyvumo rodikliai',
  ];

  @override
  void initState() {
    super.initState();
    _contentCtrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 350));
    _contentFade = CurvedAnimation(parent: _contentCtrl, curve: Curves.easeOut);
    _contentCtrl.forward();
  }

  @override
  void dispose() {
    _contentCtrl.dispose();
    super.dispose();
  }

  void _navigate(int idx) async {
    if (idx == _navIndex) return;
    await _contentCtrl.reverse();
    setState(() => _navIndex = idx);
    _contentCtrl.forward();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final height = MediaQuery.of(context).size.height;
        return BaseAdminScreen(
          child: Center(
            child: Container(
              constraints: BoxConstraints(
                maxWidth: width,
                maxHeight: height,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  42.heightBox,
                  Align(
                    alignment: Alignment.centerLeft,
                    child: CustomTextButton(
                      onPressed: widget.onBackPress,
                      text: 'Grįžti atgal',
                      icon: Icons.arrow_back,
                    ),
                  ),
                  17.heightBox,
                  Row(
                    children: [
                      Text('Statistika', style: CustomStyles.h2),
                    ],
                  ),
                  48.heightBox,
                  Expanded(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: _SelectorRowLayout(
                            fromDateTime: filterDateFrom,
                            toDateTime: filterDateTo,
                            category: filterCategory,
                            pending: isPending,
                            loading: false,
                            setFromDateTime: (DateTime? date) {
                              setState(() {
                                filterDateFrom = date;
                                if (filterDateFrom != null) {
                                  isPending = true;
                                }
                              });
                            },
                            setToDateTime: (DateTime? date) {
                              setState(() {
                                filterDateTo = date;
                              });
                            },
                            setCategory: (String? category) {
                              setState(() {
                                filterCategory = category;
                              });
                            },
                            applyFilter:
                                (DateTime? p1, DateTime? p2, String? p3) {
                              widget.onLoadAnalytics(
                                  _dateFmt.format(filterDateFrom!),
                                  filterDateTo != null
                                      ? _dateFmt.format(filterDateTo!)
                                      : null,
                                  null,
                                  filterCategory);
                            },
                            onClear: () {
                              setState(() {
                                filterDateFrom = null;
                                filterDateTo = null;
                                filterCategory = null;
                                isPending = false;
                              });
                            },
                          ),
                        ),
                        if (widget.analytics != null) ...[
                          _TopBar(
                            title: _sections[_navIndex],
                            subtitle: _sectionSubtitles[_navIndex],
                            analytics: widget.analytics!,
                            selectedIndex: _navIndex,
                            onSelect: (int value) {
                              _navigate(value);
                            },
                          ),
                          Expanded(
                            child: _ContentArea(
                              navIndex: _navIndex,
                              fadeAnim: _contentFade,
                              analytics: widget.analytics!,
                            ),
                          )
                        ]
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _ContentArea extends StatelessWidget {
  final int navIndex;
  final Animation<double> fadeAnim;
  final ReportCategoryAnalyticsDto analytics;

  const _ContentArea({
    required this.navIndex,
    required this.fadeAnim,
    required this.analytics,
  });

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: fadeAnim,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: _buildSection(navIndex, analytics),
      ),
    );
  }

  Widget _buildSection(int idx, ReportCategoryAnalyticsDto data) {
    switch (idx) {
      case 0:
        return OverviewSection(data: data);
      case 1:
        return TrendsSection(data: data);
      case 2:
        return GeographySection(data: data);
      case 3:
        return SlaSection(data: data);
      default:
        return OverviewSection(data: data);
    }
  }
}

class _TopBar extends StatelessWidget {
  final ReportCategoryAnalyticsDto analytics;
  final String title;
  final String subtitle;
  final int selectedIndex;
  final ValueChanged<int> onSelect;

  const _TopBar({
    required this.analytics,
    required this.title,
    required this.subtitle,
    required this.selectedIndex,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: const BoxDecoration(
        color: AppColors.surface,
        border: Border(bottom: BorderSide(color: AppColors.border)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textPrimary,
                          letterSpacing: -0.3,
                        )),
                    Text(subtitle,
                        style: const TextStyle(
                          fontSize: 11,
                          color: AppColors.textMuted,
                        )),
                  ],
                ),
                const Spacer(),
                _GeneratedAtBadge(
                  analytics: analytics,
                ),
              ],
            ),
            Row(
              children: [
                ...[
                  const _NavItem(
                      icon: Icons.dashboard_rounded,
                      label: 'Apžvalga',
                      index: 0),
                  const _NavItem(
                      icon: Icons.bar_chart_rounded,
                      label: 'Tendencijos',
                      index: 1),
                  const _NavItem(
                      icon: Icons.place_rounded, label: 'Apskritys', index: 2),
                  const _NavItem(
                      icon: Icons.speed_rounded,
                      label: 'Efektyvumas',
                      index: 3),
                ].map((item) => _buildNavTile(context, item)),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildNavTile(BuildContext context, _NavItem item) {
    final isSelected = item.index == selectedIndex;
    return GestureDetector(
      onTap: () => onSelect(item.index),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primaryGlow : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: isSelected
                  ? AppColors.primary.withValues(alpha: 0.3)
                  : Colors.transparent,
            ),
          ),
          child: SizedBox(
            width: 130,
            child: Row(
              children: [
                Icon(item.icon,
                    size: 16,
                    color:
                        isSelected ? AppColors.primary : AppColors.textMuted),
                const SizedBox(width: 10),
                Text(item.label,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight:
                          isSelected ? FontWeight.w600 : FontWeight.w400,
                      color: isSelected
                          ? AppColors.primary
                          : AppColors.textSecondary,
                    )),
                if (isSelected) ...[
                  const Spacer(),
                  Container(
                    width: 4,
                    height: 4,
                    decoration: const BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _GeneratedAtBadge extends StatelessWidget {
  final ReportCategoryAnalyticsDto analytics;

  const _GeneratedAtBadge({
    required this.analytics,
  });

  @override
  Widget build(BuildContext context) {
    final ts = DateTime.tryParse(analytics.generatedAt);
    final label = ts != null
        ? '${ts.hour.toString().padLeft(2, '0')}:${ts.minute.toString().padLeft(2, '0')}'
        : '';
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: AppColors.surfaceElevated,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: const BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 6),
          Text('Atnaujinta $label',
              style: const TextStyle(fontSize: 11, color: AppColors.textMuted)),
        ],
      ),
    );
  }
}

class _SelectorRowLayout extends StatelessWidget {
  final DateTime? fromDateTime;
  final DateTime? toDateTime;
  final String? category;
  final bool pending;
  final bool loading;
  final Function(DateTime?) setFromDateTime;
  final Function(DateTime?) setToDateTime;
  final Function(String?) setCategory;
  final Function(DateTime?, DateTime?, String?) applyFilter;
  final VoidCallback onClear;

  const _SelectorRowLayout({
    required this.fromDateTime,
    required this.toDateTime,
    required this.category,
    required this.pending,
    required this.loading,
    required this.setFromDateTime,
    required this.setToDateTime,
    required this.setCategory,
    required this.applyFilter,
    required this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.bg,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            const Icon(Icons.tune_rounded,
                size: 14, color: AppColors.accentBlue),
            const SizedBox(width: 8),
            const Text('Filtrai',
                style: TextStyle(
                    fontSize: 11,
                    color: AppColors.accentBlue,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5)),
            const SizedBox(width: 16),
            _DateChip(
              label: 'Nuo',
              date: fromDateTime,
              onPicked: (d) => setFromDateTime(d),
              onClear: () => setFromDateTime(null),
            ),
            const SizedBox(width: 8),
            const Icon(Icons.arrow_forward_rounded,
                size: 12, color: AppColors.accentBlue),
            const SizedBox(width: 8),
            _DateChip(
              label: 'Iki',
              date: toDateTime,
              onPicked: (d) => setToDateTime(d),
              onClear: () => setToDateTime(null),
            ),
            const SizedBox(width: 12),
            Container(width: 1, height: 20, color: AppColors.border),
            const SizedBox(width: 12),
            _DropdownChip(
              label: 'Kategorija',
              icon: Icons.category_rounded,
              selected: category,
              options: _categories,
              onSelected: (v) => setCategory(v),
              onClear: () => setCategory(null),
            ),
            const SizedBox(width: 30),
            if (fromDateTime != null ||
                toDateTime != null ||
                category != null) ...[
              _ResetButton(onTap: () {
                onClear();
              }),
              const SizedBox(width: 8),
            ],
            _ApplyButton(
              pending: pending,
              loading: loading,
              onTap: () => applyFilter(fromDateTime, toDateTime, category),
            ),
          ],
        ),
      ),
    );
  }
}

class _Option {
  final String value;
  final String label;
  final String? emoji;

  const _Option(this.value, this.label, [this.emoji]);
}

const _categories = [
  _Option('trash', 'Atliekos', '🗑️'),
  _Option('forest', 'Miškas', '🌲'),
  _Option('beetle', 'Žievėgraužis', '🪲'),
  _Option('permits', 'Leidimai', '📋'),
  _Option('misc', 'Kita', '📌'),
];

class _DateChip extends StatefulWidget {
  final String label;
  final DateTime? date;
  final ValueChanged<DateTime?> onPicked;
  final VoidCallback onClear;

  const _DateChip({
    required this.label,
    required this.date,
    required this.onPicked,
    required this.onClear,
  });

  @override
  State<_DateChip> createState() => _DateChipState();
}

class _DateChipState extends State<_DateChip>
    with SingleTickerProviderStateMixin {
  bool _hovered = false;
  late AnimationController _ctrl;
  late Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 120));
    _scale = Tween(begin: 1.0, end: 0.94)
        .animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOut));
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  bool get _active => widget.date != null;

  Future<void> _pick() async {
    _ctrl.forward().then((_) => _ctrl.reverse());
    final picked = await showDatePicker(
      context: context,
      initialDate: widget.date ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now().add(const Duration(days: 1)),
      builder: (ctx, child) => _themedPicker(ctx, child),
    );
    if (picked != null) widget.onPicked(picked);
  }

  @override
  Widget build(BuildContext context) {
    final color = _active ? AppColors.accentBlue : AppColors.textMuted;
    final label = _active ? _dateFmt.format(widget.date!) : widget.label;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: _pick,
        child: ScaleTransition(
          scale: _scale,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            height: 34,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: _active
                  ? AppColors.accentBlue.withValues(alpha: 0.1)
                  : _hovered
                      ? AppColors.surfaceElevated
                      : AppColors.surfaceElevated.withValues(alpha: 0.6),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: _active
                    ? AppColors.accentBlue.withValues(alpha: 0.4)
                    : _hovered
                        ? AppColors.borderLight
                        : AppColors.border,
                width: 1,
              ),
              boxShadow: _active
                  ? [
                      BoxShadow(
                        color: AppColors.accentBlue.withValues(alpha: 0.15),
                        blurRadius: 8,
                      )
                    ]
                  : null,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.calendar_today_rounded, size: 12, color: color),
                const SizedBox(width: 6),
                Text(label,
                    style: TextStyle(
                      fontSize: 12,
                      color: _active
                          ? AppColors.accentBlue
                          : AppColors.textSecondary,
                      fontWeight: _active ? FontWeight.w600 : FontWeight.w400,
                    )),
                if (_active) ...[
                  const SizedBox(width: 6),
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: widget.onClear,
                    child: const Icon(Icons.close_rounded,
                        size: 12, color: AppColors.accentBlue),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _themedPicker(BuildContext context, Widget? child) {
    return Theme(
      data: ThemeData.dark().copyWith(
        colorScheme: const ColorScheme.dark(
          primary: AppColors.primary,
          onPrimary: Colors.black,
          surface: AppColors.surfaceElevated,
          onSurface: AppColors.textPrimary,
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(foregroundColor: AppColors.primary),
        ),
        dialogTheme: const DialogThemeData(backgroundColor: AppColors.surface),
      ),
      child: child!,
    );
  }
}

class _DropdownChip extends StatefulWidget {
  final String label;
  final IconData icon;
  final String? selected;
  final List<_Option> options;
  final ValueChanged<String?> onSelected;
  final VoidCallback onClear;

  const _DropdownChip({
    required this.label,
    required this.icon,
    required this.selected,
    required this.options,
    required this.onSelected,
    required this.onClear,
  });

  @override
  State<_DropdownChip> createState() => _DropdownChipState();
}

class _DropdownChipState extends State<_DropdownChip>
    with SingleTickerProviderStateMixin {
  bool _hovered = false;
  late AnimationController _ctrl;
  late Animation<double> _scale;
  OverlayEntry? _overlay;
  final _key = GlobalKey();

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 120));
    _scale = Tween(begin: 1.0, end: 0.94)
        .animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOut));
  }

  @override
  void dispose() {
    _removeOverlay();
    _ctrl.dispose();
    super.dispose();
  }

  bool get _active => widget.selected != null;

  String get _displayLabel {
    if (!_active) return widget.label;
    final opt =
        widget.options.where((o) => o.value == widget.selected).firstOrNull;
    return opt != null
        ? '${opt.emoji ?? ''} ${opt.label}'.trim()
        : widget.label;
  }

  void _removeOverlay() {
    _overlay?.remove();
    _overlay = null;
  }

  void _toggleMenu() {
    _ctrl.forward().then((_) => _ctrl.reverse());
    if (_overlay != null) {
      _removeOverlay();
      return;
    }

    final box = _key.currentContext?.findRenderObject() as RenderBox?;
    if (box == null) return;
    final pos = box.localToGlobal(Offset.zero);
    final size = box.size;

    _overlay = OverlayEntry(builder: (_) {
      return Stack(
        children: [
          // Dismiss tap target
          Positioned.fill(
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: _removeOverlay,
            ),
          ),
          // Menu
          Positioned(
            left: pos.dx,
            top: pos.dy + size.height + 6,
            child: _DropdownMenu(
              options: widget.options,
              selected: widget.selected,
              onSelected: (v) {
                widget.onSelected(v);
                _removeOverlay();
              },
            ),
          ),
        ],
      );
    });
    Overlay.of(context).insert(_overlay!);
  }

  Color get _accentColor => AppColors.accentPurple;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        key: _key,
        onTap: _toggleMenu,
        child: ScaleTransition(
          scale: _scale,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            height: 34,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: _active
                  ? _accentColor.withValues(alpha: 0.1)
                  : _hovered
                      ? AppColors.surfaceElevated
                      : AppColors.surfaceElevated.withValues(alpha: 0.6),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: _active
                    ? _accentColor.withValues(alpha: 0.4)
                    : _hovered
                        ? AppColors.borderLight
                        : AppColors.border,
              ),
              boxShadow: _active
                  ? [
                      BoxShadow(
                        color: _accentColor.withValues(alpha: 0.15),
                        blurRadius: 8,
                      )
                    ]
                  : null,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(widget.icon,
                    size: 12,
                    color: _active ? _accentColor : AppColors.textMuted),
                const SizedBox(width: 6),
                Text(_displayLabel,
                    style: TextStyle(
                      fontSize: 12,
                      color: _active ? _accentColor : AppColors.textSecondary,
                      fontWeight: _active ? FontWeight.w600 : FontWeight.w400,
                    )),
                const SizedBox(width: 4),
                if (_active)
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      widget.onClear();
                      _removeOverlay();
                    },
                    child: Icon(Icons.close_rounded,
                        size: 12, color: _accentColor),
                  )
                else
                  const Icon(Icons.keyboard_arrow_down_rounded,
                      size: 14, color: AppColors.textMuted),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

final _dateFmt = DateFormat('yyyy-MM-dd');

// class FilterState {
//   final DateTime? dateFrom;
//   final DateTime? dateTo;
//   final String? category;
//   final String? status;
//
//   const FilterState({
//     this.dateFrom,
//     this.dateTo,
//     this.category,
//     this.status,
//   });
//
//   static const _sentinel = Object();
//
//   FilterState copyWith({
//     Object? dateFrom = _sentinel,
//     Object? dateTo = _sentinel,
//     Object? category = _sentinel,
//     Object? status = _sentinel,
//   }) {
//     return FilterState(
//       dateFrom: dateFrom == _sentinel ? this.dateFrom : dateFrom as DateTime?,
//       dateTo: dateTo == _sentinel ? this.dateTo : dateTo as DateTime?,
//       category: category == _sentinel ? this.category : category as String?,
//       status: status == _sentinel ? this.status : status as String?,
//     );
//   }
//
//   bool get hasAnyFilter =>
//       dateFrom != null || dateTo != null || category != null || status != null;
//
//   int get activeFilterCount {
//     int c = 0;
//     if (dateFrom != null) c++;
//     if (dateTo != null) c++;
//     if (category != null) c++;
//     if (status != null) c++;
//     return c;
//   }
//
//   @override
//   bool operator ==(Object other) {
//     if (other is! FilterState) return false;
//     return dateFrom == other.dateFrom &&
//         dateTo == other.dateTo &&
//         category == other.category &&
//         status == other.status;
//   }
//
//   @override
//   int get hashCode => Object.hash(dateFrom, dateTo, category, status);
// }

class _NavItem {
  final IconData icon;
  final String label;
  final int index;

  const _NavItem(
      {required this.icon, required this.label, required this.index});
}

class _ResetButton extends StatefulWidget {
  final VoidCallback onTap;

  const _ResetButton({required this.onTap});

  @override
  State<_ResetButton> createState() => _ResetButtonState();
}

class _ResetButtonState extends State<_ResetButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 160),
          height: 34,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: _hovered
                ? AppColors.accentRed.withValues(alpha: 0.1)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: _hovered
                  ? AppColors.accentRed.withValues(alpha: 0.3)
                  : AppColors.border,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.close_rounded,
                  size: 12,
                  color: _hovered ? AppColors.accentRed : AppColors.textMuted),
              const SizedBox(width: 5),
              Text('Išvalyti',
                  style: TextStyle(
                    fontSize: 12,
                    color: _hovered ? AppColors.accentRed : AppColors.textMuted,
                    fontWeight: FontWeight.w500,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class _ApplyButton extends StatefulWidget {
  final bool pending;
  final bool loading;
  final VoidCallback onTap;

  const _ApplyButton({
    required this.pending,
    required this.loading,
    required this.onTap,
  });

  @override
  State<_ApplyButton> createState() => _ApplyButtonState();
}

class _ApplyButtonState extends State<_ApplyButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _pulseCtrl;

  @override
  void initState() {
    super.initState();
    _pulseCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
      lowerBound: 0.5,
      upperBound: 1.0,
    );
  }

  @override
  void didUpdateWidget(_ApplyButton old) {
    super.didUpdateWidget(old);
    if (widget.pending && !old.pending) {
      _pulseCtrl.repeat(reverse: true);
    } else if (!widget.pending && old.pending) {
      _pulseCtrl.stop();
      _pulseCtrl.value = 1.0;
    }
  }

  @override
  void dispose() {
    _pulseCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final active = widget.pending && !widget.loading;

    return MouseRegion(
      cursor: active ? SystemMouseCursors.click : SystemMouseCursors.basic,
      child: GestureDetector(
        onTap: active ? widget.onTap : null,
        child: AnimatedBuilder(
          animation: _pulseCtrl,
          builder: (_, child) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: 34,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                gradient: active
                    ? LinearGradient(
                        colors: [
                          AppColors.titanWhite.withValues(alpha: 0.2),
                          AppColors.primary.withValues(alpha: 0.8),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      )
                    : null,
                color: active ? null : AppColors.surfaceElevated,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: active
                      ? AppColors.primary.withValues(alpha: 0.6)
                      : AppColors.border,
                ),
                boxShadow: active
                    ? [
                        BoxShadow(
                          color: AppColors.primary
                              .withValues(alpha: 0.25 * _pulseCtrl.value),
                          blurRadius: 16 * _pulseCtrl.value,
                          spreadRadius: 0,
                        ),
                      ]
                    : null,
              ),
              child: child,
            );
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.loading) ...[
                SizedBox(
                  width: 12,
                  height: 12,
                  child: CircularProgressIndicator(
                    strokeWidth: 1.5,
                    color: widget.pending ? Colors.black : AppColors.textMuted,
                  ),
                ),
                const SizedBox(width: 8),
              ] else ...[
                Icon(
                  Icons.play_arrow_rounded,
                  size: 14,
                  color: active ? Colors.white60 : AppColors.textMuted,
                ),
                const SizedBox(width: 6),
              ],
              Text(
                widget.loading ? 'Kraunama...' : 'Taikyti filtrus',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: active ? Colors.white60 : AppColors.textMuted,
                  letterSpacing: 0.2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DropdownMenu extends StatefulWidget {
  final List<_Option> options;
  final String? selected;
  final ValueChanged<String?> onSelected;

  const _DropdownMenu({
    required this.options,
    required this.selected,
    required this.onSelected,
  });

  @override
  State<_DropdownMenu> createState() => _DropdownMenuState();
}

class _DropdownMenuState extends State<_DropdownMenu>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _fade;
  late Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 180));
    _fade = CurvedAnimation(parent: _ctrl, curve: Curves.easeOut);
    _slide = Tween<Offset>(
      begin: const Offset(0, -0.04),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOut));
    _ctrl.forward();
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fade,
      child: SlideTransition(
        position: _slide,
        child: Material(
          color: Colors.transparent,
          child: Container(
            width: 190,
            decoration: BoxDecoration(
              color: AppColors.surfaceElevated,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.borderLight),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.4),
                  blurRadius: 24,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            clipBehavior: Clip.antiAlias,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 6),
                ...widget.options.map((opt) => _MenuItem(
                      option: opt,
                      isSelected: opt.value == widget.selected,
                      onTap: () => widget.onSelected(opt.value),
                    )),
                const SizedBox(height: 6),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _MenuItem extends StatefulWidget {
  final _Option option;
  final bool isSelected;
  final VoidCallback onTap;

  const _MenuItem({
    required this.option,
    required this.isSelected,
    required this.onTap,
  });

  @override
  State<_MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<_MenuItem> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 120),
          margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 9),
          decoration: BoxDecoration(
            color: widget.isSelected
                ? AppColors.accentPurple.withValues(alpha: 0.12)
                : _hovered
                    ? AppColors.border.withValues(alpha: 0.5)
                    : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              if (widget.option.emoji != null) ...[
                Text(widget.option.emoji!,
                    style: const TextStyle(fontSize: 14)),
                const SizedBox(width: 8),
              ],
              Expanded(
                child: Text(widget.option.label,
                    style: TextStyle(
                      fontSize: 13,
                      color: widget.isSelected
                          ? AppColors.accentPurple
                          : AppColors.textSecondary,
                      fontWeight:
                          widget.isSelected ? FontWeight.w600 : FontWeight.w400,
                    )),
              ),
              if (widget.isSelected)
                const Icon(Icons.check_rounded,
                    size: 14, color: AppColors.accentPurple),
            ],
          ),
        ),
      ),
    );
  }
}
