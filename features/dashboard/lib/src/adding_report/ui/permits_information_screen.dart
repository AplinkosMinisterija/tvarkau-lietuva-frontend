import 'package:core/utils/image_display/image_display.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:readmore/readmore.dart';

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
          child: Stack(
            children: [
              ListView(
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
                    'Kaip atpažinti kirtimo pažeidimus',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  ReadMoreText(
                    'Pranešimo lange žemėlapyje matysite plotines figūras (poligonus) žyminčias leidimus kirsti mišką, o ant jų paspaudę galėsite detaliau sužinoti kokio tipo kirtimui leidimas yra išduotas, leidimo galiojimo datą bei kitą naudingą informaciją. Taip galėsite priimti informuotą sprendimą ir pranešti, jei pvz. matote įvykdytą plyną kirtimą, nors leidimas toje vietoje išduotas neplynajam kirtimui.\nŠiuo metu skaitmenizuojame pranešimus, todėl kurį laiką bus matomi ne visi leidimai, todėl gali būti, jog nors žemėlapyje neatvaizduotas, tačiau leidimas jūsų žymimoje vietoje yra išduotas. Tokiu atveju, ši informacija įvertinus pranešimą bus pateikta skiltyje “AAD atsakymas” ir nepasitvirtinęs pranešimas bus pažymėtas pilkai\nVisi kirtimų leidimai bus matomi Tvarkau Lietuvą ne vėliau kaip 2025 m. liepos mėn.\nValstybiniuose miškuose kirtimo leidimai neprivalomi:\n1. Vykdant elektros oro linijų, inžinerinių tinklų, komunikacijų ir kelių apsaugos zonose pavojų keliančių medžių kirtimus\n2. Kai neplynaisiais miško kirtimais kertami invaziniai medžiai ir krūmai\n3. Kai avariniais atvejais kertami pavojų keliantys medžiai',
                    trimMode: TrimMode.Length,
                    trimLines: 5,
                    style: Theme.of(context).textTheme.bodyMedium,
                    colorClickableText: Colors.black,
                    trimCollapsedText: 'Skaityti daugiau',
                    trimExpandedText: 'Suskleisti',
                    lessStyle: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                    moreStyle: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Kirtimo rūšių iliustracijos:',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
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
                    titlesEnabled: true,
                    titles: [
                      'Jaunuolynų ugdymas',
                      'Atrankiniai arba atrankiniai sanitariniai kirtimai',
                      'Retinimo ir einamieji kirtimai',
                      'Plynas arba plynas sanitarinis kirtimas'
                    ],
                  ),
                  const SizedBox(height: 30),
                ],
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
