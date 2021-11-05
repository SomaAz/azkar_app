extension ArabicNumberConverter on int {
  String convertToArabicNumber() {
    String res = '';

    final arabics = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];
    for (String char in toString().split('')) {
      res += arabics[int.parse(char)];
    }

/*   final latins = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']; */
    return res;
  }
}
