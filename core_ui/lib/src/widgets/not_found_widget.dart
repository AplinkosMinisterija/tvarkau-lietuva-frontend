import 'package:flutter/material.dart';

import '../../core_ui.dart';

class NotFoundWidget extends StatelessWidget {
  final Function? onPressed;
  final String? errorText;
  final String? descriptionText;

  const NotFoundWidget({
    super.key,
    this.onPressed,
    this.errorText,
    this.descriptionText,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: const Color.fromRGBO(232, 232, 232, 1.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Spacer(),
          Container(
            padding: const EdgeInsets.only(top: 35),
            child: Column(
              children: <Widget>[
                const Icon(
                  Icons.playlist_remove,
                  size: 50,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 80,
                  ),
                  child: Text(
                    'Pranešimas nerastas. Jis gali būti nerodomas, nes:',
                    style: AppTextTheme.ploni22regular.copyWith(
                      color: AppTheme.defaultTextColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 18,
                    horizontal: 80,
                  ),
                  child: Text(
                    '1. Pranešime galėjo būti atskleisti asmens duomenys\n2. Dėl pranešime aprašytos situacijos vyksta tyrimas ir pranešimo paviešinimas galėtų pakenkti tyrimo eigai\n3. Pranešimas dubliavo informaciją apie jau anksčiau pateiktą pranešimą toje vietoje',
                    style: AppTextTheme.ploni16medium.copyWith(
                      color: AppTheme.defaultTextColor,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 18,
                    horizontal: 80,
                  ),
                  child: Text(
                    'Visais atvejais pranešimuose pateiktą informaciją vertiname ir jei reikia siekiame pašalinti žalą aplinkai, užkardyti neteisėtą veiką ir patraukti pažeidėjus atsakomybėn.',
                    style: AppTextTheme.ploni16medium.copyWith(
                      color: AppTheme.defaultTextColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: AppButton(
              text: 'Grįžti į pagrindinį puslapį',
              backgroundColor: AppTheme.buttonDarkBgColor,
              onPressed: () {
                if (onPressed != null) {
                  onPressed!();
                }
              },
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
