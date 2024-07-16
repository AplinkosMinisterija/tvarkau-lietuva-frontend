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
          child: Stack(
            children: [
              ListView(
                padding: const EdgeInsets.all(16),
                shrinkWrap: true,
                children: [
                  const SizedBox(height: 55),
                  Text(
                    'Pasitikrinkite ar aptikote žievėgraužio tipografo apniktas arba šviežiai nuvirtusias egles',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Kaip atpažinti ar medyje įsiveisė žievėgraužis tipografas?',
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
                    'Žievėgraužis dauginasi ir plinta pusamžiuose ir vyresniuose eglynuose bei nuvirtusiose eglėse.',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 12),
                  ImageGallery().buildImages(
                    imageUrls: [
                      'https://res.cloudinary.com/dms8ku4iv/image/upload/q_20:420/v1714134279/medziai.jpg',
                      'https://res.cloudinary.com/dms8ku4iv/image/upload/q_30:420/v1714134279/nuvirtusi-egle.jpg',
                      'https://res.cloudinary.com/dms8ku4iv/image/upload/q_auto:best/v1711572859/lblbzwcw416t2tmiyras.jpg',
                      'https://res.cloudinary.com/dms8ku4iv/image/upload/q_auto:best/v1711572860/bm0u9sclakngjvtwpiup.jpg',
                    ],
                    context: context,
                    width: 300,
                    titlesEnabled: false,
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'Žievėgraužis tipografas yra medžių liemenų kenkėjas — 4-5,5 mm ilgio vabalas. Šis vabalas veisdamasis po eglių žieve nulemia masinį jų žuvimą, todėl yra būtina jo kontrolė.',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 12),
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
                  const SizedBox(height: 50),
                ],
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 5, top: 15),
                  child: IconButton(
                    onPressed: () {
                      context.goNamed("report_category");
                    },
                    icon: const Icon(Icons.arrow_back_rounded),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: AddButton(
                    width: 1600,
                    onTap: onContinue,
                    isMobile: false,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
