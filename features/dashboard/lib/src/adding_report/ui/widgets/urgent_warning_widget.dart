import 'package:flutter/material.dart';

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
                    'Ar šiuo metu reikalinga skubi pagalba?',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text:
                        'Jeigu šiuo metu matote daromą pažeidimą, yra reali grėsmė gyvybei, sveikatai ar saugumui, kėsinamasi sugadinti ar sunaikinti turtą - ',
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
