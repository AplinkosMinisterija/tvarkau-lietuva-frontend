import 'package:core/utils/report_text.dart';
import 'package:core_ui/src/widgets/report_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  for (final width in [320.0, 1200.0]) {
    testWidgets('report field validates pasted text at width $width',
        (tester) async {
      await tester.binding.setSurfaceSize(Size(width, 900));
      addTearDown(() => tester.binding.setSurfaceSize(null));
      final formKey = GlobalKey<FormState>();
      final controller = TextEditingController();
      addTearDown(controller.dispose);

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: ReportTextField(controller: controller, maxLines: 5),
            ),
          ),
        ),
      ));

      expect(find.text(ReportText.hintText), findsOneWidget);
      expect(find.text('0 / 4 000'), findsOneWidget);

      for (final length in [3999, 4000, 4001]) {
        final text = 'ž' * length;
        await tester.enterText(find.byType(TextFormField), text);
        await tester.pump();

        expect(controller.text, text, reason: 'Text must never be truncated');
        expect(formKey.currentState!.validate(), length <= 4000);
        await tester.pump();
        expect(find.text(ReportText.counterText(text)), findsOneWidget);
        expect(find.text(ReportText.tooLongMessage),
            length > 4000 ? findsOneWidget : findsNothing);
        expect(find.text(ReportText.hintText), findsOneWidget);
        expect(tester.takeException(), isNull);
      }

      await tester.enterText(find.byType(TextFormField), 'a' * 4000);
      await tester.pump();
      expect(formKey.currentState!.validate(), isTrue);
      expect(find.text(ReportText.tooLongMessage), findsNothing);
    });
  }

  testWidgets('counter includes both UTF-16 units of emoji', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(body: ReportTextField(initialValue: 'ą 😀\n')),
    ));

    expect(find.text('5 / 4 000'), findsOneWidget);
  });

  testWidgets('editing other fields preserves an existing long report',
      (tester) async {
    final original = 'ą' * 5171;
    final formKey = GlobalKey<FormState>();
    var otherField = false;
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: StatefulBuilder(builder: (context, setState) {
          return Form(
            key: formKey,
            child: Column(children: [
              ReportTextField(
                initialValue: original,
                maxLines: 5,
                validateLength: false,
              ),
              Checkbox(
                value: otherField,
                onChanged: (value) => setState(() => otherField = value!),
              ),
            ]),
          );
        }),
      ),
    ));

    await tester.tap(find.byType(Checkbox));
    await tester.pump();

    expect(formKey.currentState!.validate(), isTrue);
    expect(
        tester.widget<EditableText>(find.byType(EditableText)).controller.text,
        original);
    expect(find.text('5 171 / 4 000'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
