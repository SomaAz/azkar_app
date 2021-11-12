extension ArabicHarakatRemover on String {
  String withOutHarakat() {
    final List harakat = ['ِ', 'ُ', 'ٓ', 'ٰ', 'ْ', 'ٌ', 'ٍ', 'ً', 'ّ', 'َ'];
    return replaceAll(harakat[0], "")
        .replaceAll(harakat[1], "")
        .replaceAll(harakat[2], "")
        .replaceAll(harakat[3], "")
        .replaceAll(harakat[4], "")
        .replaceAll(harakat[5], "")
        .replaceAll(harakat[6], "")
        .replaceAll(harakat[7], "")
        .replaceAll(harakat[8], "")
        .replaceAll(harakat[9], "");
  }
}
