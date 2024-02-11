import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UrgentWarningWidget extends StatelessWidget {
  const UrgentWarningWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromRGBO(250, 204, 62, 1.0),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 0), // Shadow position
          ),
        ],
      ),
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.warning,
              color: Color.fromRGBO(250, 204, 62, 1.0),
              size: 48,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Ar šiuo metu reikalinga pagalba?',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text:
                        'Jeigu Jums ar kitiems žmonėms yra reali grėsmė gyvybei, sveikatai ar saugumui, Jūsų turtui kyla reali grėmsmė (kėsinamasi pagrobti Jūsų automobilį, kėsinamasi sugadinti ar sunaikinti Jūsų turtą), šiuo metu matote vykstančias muštynes, ',
                    style: Theme.of(context).textTheme.bodyMedium,
                    children: <TextSpan>[
                      TextSpan(
                        text: 'skambinkite 112.',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
