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
                  const SizedBox(height: 55),
                  Text(
                    'Kaip atpažinti kirtimo pažeidimus',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  ReadMoreText(
                    'Prieš informuodami apie pažeidimą, pasitikrinkite, ar žemėlapyje nėra pažymėtas kirtimo plotas. Paspaudus ant jo, matysite detalią kirtimo leidimo informaciją. \n \n'
                    'Jei matote neatitikimus tarp nurodytos informacijos ir realaus vaizdo, informuokite mus kitame žingsnyje. \n \n'
                    'Šiuo metu skaitmenizuojame pranešimus, todėl kurį laiką bus matomi ne visi leidimai. Gali būti, jog nors žemėlapyje leidimas neatvaizduotas, tačiau leidimas jūsų žymimoje vietoje yra išduotas. Tokiu atveju, ši informacija įvertinus pranešimą bus pateikta skiltyje “AAD atsakymas” ir nepasitvirtinęs pranešimas bus pažymėtas pilkai \n \n'
                    'Atkreipiame dėmesį, kad kirtimo leidimai valstybiniuose miškuose neprivalomi: \n \n'
                    '1. Vykdant elektros oro linijų, inžinerinių tinklų, komunikacijų ir kelių apsaugos zonose pavojų keliančių medžių kirtimus \n'
                    '2. Kai neplynaisiais miško kirtimais kertami invaziniai medžiai ir krūmai \n'
                    '3. Kai avariniais atvejais kertami pavojų keliantys medžiai \n \n'
                    'Tuo tarpu, privačiuose miškuose kirtimo leidimai neprivalomi: \n \n'
                    '4. Jaunuolynų ugdymo kirtimams (iki 20 metų medynuose) \n'
                    '5. Atrankiniams sanitariniams kirtimams, kai iškertami sausuoliai ar vėjavartos \n'
                    '6. Kirtimams, skirtiems ribinėms linijoms prakirsti (iki 1,5 metro į savo miško valdos pusę) \n',
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
                    'Žemiau nurodyti kirtimų pavyzdžiai:',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  ImageGallery().buildImages(
                    imageUrls: [
                      'https://res.cloudinary.com/dms8ku4iv/image/upload/v1723138501/po_pirmojo_etapo_x9wyoq.jpg',
                      'https://res.cloudinary.com/dms8ku4iv/image/upload/v1723138501/po_antrojo_etapo_rlkjnr.jpg',
                      'https://res.cloudinary.com/dms8ku4iv/image/upload/v1723138501/retinimas_kpvtmo.jpg',
                      'https://res.cloudinary.com/dms8ku4iv/image/upload/v1723138501/plynas_yxpzpr.jpg',
                    ],
                    context: context,
                    width: 300,
                    titlesEnabled: true,
                    isDownloadEnabled: false,
                    titles: [
                      'Atvejiniai kirtimai po pirmojo kirtimų etapo',
                      'Atvejiniai kirtimai po antrojo kirtimų etapo',
                      'Retinimo arba einamieji kirtimai',
                      'Plynieji kirtimai'
                    ],
                  ),
                  const SizedBox(height: 30),
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
