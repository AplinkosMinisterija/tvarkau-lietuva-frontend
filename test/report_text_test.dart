import 'package:core/utils/report_text.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  for (final length in [3999, 4000, 4001]) {
    test('report text validates the $length character boundary', () {
      final text = 'ą' * length;

      expect(ReportText.validate(text),
          length > 4000 ? ReportText.tooLongMessage : null);
      expect(ReportText.isTooLong(text), length > 4000);
    });
  }

  test('spaces and line breaks count without trimming or changing the text',
      () {
    final text = '${'a' * 3998} \n';

    expect(ReportText.validate(text), isNull);
    expect(ReportText.counterText(text), '4 000 / 4 000');
    expect(ReportText.validate('$text '), ReportText.tooLongMessage);
  });

  test('supplementary and combined characters use the same UTF-16 units as API',
      () {
    final text = '${'ą' * 3996}😀e\u0301';

    expect(ReportText.counterText(text), '4 000 / 4 000');
    expect(ReportText.validate(text), isNull);
    expect(ReportText.validate('$textš'), ReportText.tooLongMessage);
  });

  test('empty report text remains required', () {
    expect(ReportText.validate(null), ReportText.requiredMessage);
    expect(ReportText.validate(''), ReportText.requiredMessage);
  });
}
