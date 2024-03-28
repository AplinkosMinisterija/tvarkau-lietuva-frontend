import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
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
                'Pasitikrinkite ar tikrai aptikote žievėgraužį tipografą',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),
              Text(
                'Žievėgraužis tipogrãfas (Ips typographus), straubliukų (Curculionidae) šeimos vabalas. Paplitęs Europoje ir Sibire. Kūnas 4–5,5 mm ilgio, ritiniškas, tamsiai rudas, blizgantis, apaugęs plaukeliais. Antsparniai su taškų eilėmis. Kiekvieno karučio (įdubimas antsparnių gale) šone 4 danteliai. Antrasis dantelis nuo apačios yra didžiausias ir platėjantis į viršūnę.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 24),
              Text(
                'Pažeistos medienos žievėje galima pastebėti mažas skylutes, aplink kurias tarsi paberta smulkių, rusvos spalvos pjuvenų. Tokioje vietoje prapjovus ar nulupus medžio žievę rastume įmantrios formos takus, kuriuos išgraužia vabalai ir jų lervos.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 24),
              Text(
                'Medžiai, kurie pažeisti žievėgraužio tipografo:',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),
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
            ],
          ),
        ),
      ),
    );
  }
}
