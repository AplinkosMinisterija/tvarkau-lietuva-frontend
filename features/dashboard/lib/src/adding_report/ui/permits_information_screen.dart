import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PermitsInformationScreen extends StatelessWidget {
  const PermitsInformationScreen({
    required this.onContinue,
    super.key,
  });

  final VoidCallback onContinue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(250, 242, 234, 1),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: ListView(
            padding: const EdgeInsets.all(16),
            shrinkWrap: true,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: () {
                    context.goNamed("report_category");
                  },
                  icon: const Icon(Icons.arrow_back_rounded),
                ),
              ),
              Text(
                'Pasitikrinkite ar aptiktas pažeidimas kirtimuose yra teisingas',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              AddButton(width: 1600, onTap: onContinue),
            ],
          ),
        ),
      ),
    );
  }
}
