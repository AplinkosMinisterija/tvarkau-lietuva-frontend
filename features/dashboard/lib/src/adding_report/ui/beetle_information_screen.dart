import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BeetleInformationScreen extends StatelessWidget {
  const BeetleInformationScreen({
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
                'Pasitikrinkite, ar aptikote žievėgraužio tipografo apniktus medžius',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),
              Text(
                'Kaip atpažinti ar medyje įsiveisė šis kenkėjas/žievėgraužis tipografas?',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 6),
              Text(
                'Pažeistos eglių medienos žievėje galima pastebėti mažas skylutes, aplink kurias tarsi paberta, smulkių, rusvos spalvos pjuvenų. Tokioje vietoje prapjovus ar nulupus medžio žievę rastume įmantrios formos takus, kuriuos išgraužia vabalai ir jų lervos.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 24),
              Text(
                'Žievėgraužis dauginasi ir plinta pusamžiuose ir vyresniuose eglynuose bei eglių nuvirtusiose eglėse.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 12),
              ImageGallery().buildImages(
                imageUrls: [
                  'https://res.cloudinary.com/dms8ku4iv/image/upload/v1711572859/kvusnlpak8zgoi9bpyga.jpg',
                  'https://res.cloudinary.com/dms8ku4iv/image/upload/v1711572860/ljm7qg9twn1a5ydm9cxb.jpg',
                  'https://res.cloudinary.com/dms8ku4iv/image/upload/v1711572859/lblbzwcw416t2tmiyras.jpg',
                  'https://res.cloudinary.com/dms8ku4iv/image/upload/v1711572860/bm0u9sclakngjvtwpiup.jpg',
                ],
                context: context,
                width: 300,
              ),
              AddButton(width: 1600, onTap: onContinue),
              const SizedBox(height: 24),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text:
                          'Kviečiame susipažinti su šiuo reiškiniu Valstybinės miškų tarnybos parengtame ',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    TextSpan(
                      text: 'pristatyme',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: Colors.blue),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          LaunchUrl().launch(
                              'https://amvmt.lrv.lt/uploads/amvmt/documents/files/MSAS/Patarimai/Zievegrauzis_tipografas_ATMINTINE_VMT_2021.pdf');
                        },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
