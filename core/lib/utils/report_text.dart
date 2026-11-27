/// The report limit uses UTF-16 code units, matching the API's String.length.
/// Spaces, line breaks and both code units of a supplementary character count.
class ReportText {
  static const maxLength = 4000;
  static const hintText =
      '* Pranešimo tekstas gali būti iki 4 000 simbolių, įskaitant tarpus.';
  static const tooLongMessage = 'Sutrumpinkite tekstą iki 4 000 simbolių';
  static const requiredMessage = 'Prašome įvesti pranešimo turinį';

  static bool isTooLong(String value) => value.length > maxLength;

  static String? validate(String? value) {
    if (value == null || value.isEmpty) return requiredMessage;
    return isTooLong(value) ? tooLongMessage : null;
  }

  static String counterText(String value) {
    final count = value.length.toString().replaceAllMapped(
          RegExp(r'\B(?=(\d{3})+(?!\d))'),
          (_) => ' ',
        );
    return '$count / 4 000';
  }
}
