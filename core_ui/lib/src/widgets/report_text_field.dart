import 'package:core/utils/report_text.dart';
import 'package:flutter/material.dart';

/// Displays the report limit without truncating pasted or existing report text.
class ReportTextField extends StatefulWidget {
  const ReportTextField({
    super.key,
    this.initialValue,
    this.controller,
    this.onChanged,
    this.style,
    this.maxLines = 10,
    this.decoration = const InputDecoration(border: InputBorder.none),
    this.validateLength = true,
    this.requireText = true,
  }) : assert(initialValue == null || controller == null);

  final String? initialValue;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final TextStyle? style;
  final int maxLines;
  final InputDecoration decoration;
  final bool validateLength;
  final bool requireText;

  @override
  State<ReportTextField> createState() => _ReportTextFieldState();
}

class _ReportTextFieldState extends State<ReportTextField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        widget.controller ?? TextEditingController(text: widget.initialValue);
    _controller.addListener(_onTextChanged);
  }

  @override
  void didUpdateWidget(ReportTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller != widget.controller) {
      final value = _controller.value;
      _controller.removeListener(_onTextChanged);
      if (oldWidget.controller == null) _controller.dispose();
      _controller = widget.controller ?? TextEditingController.fromValue(value);
      _controller.addListener(_onTextChanged);
    }
  }

  void _onTextChanged() => setState(() {});

  @override
  void dispose() {
    _controller.removeListener(_onTextChanged);
    if (widget.controller == null) _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isTooLong = ReportText.isTooLong(_controller.text);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: _controller,
          onChanged: widget.onChanged,
          maxLines: widget.maxLines,
          style: widget.style,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) {
            if (widget.requireText && (value == null || value.isEmpty)) {
              return ReportText.requiredMessage;
            }
            if (widget.validateLength && ReportText.isTooLong(value ?? '')) {
              return ReportText.tooLongMessage;
            }
            return null;
          },
          decoration: widget.decoration.copyWith(
            counterText: ReportText.counterText(_controller.text),
            counterStyle: isTooLong
                ? TextStyle(color: Theme.of(context).colorScheme.error)
                : null,
            errorMaxLines: 3,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 8),
          child: Text(ReportText.hintText, style: TextStyle(fontSize: 12)),
        ),
      ],
    );
  }
}
