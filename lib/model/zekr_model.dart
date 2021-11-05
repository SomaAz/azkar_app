import 'package:azkar_app2/model/categiory_model.dart';

class Zekr {
  final CategoryModel category;
  final String zekr, reference, description;
  final int count;

  Zekr({
    required this.category,
    required this.zekr,
    required this.reference,
    required this.description,
    required this.count,
  });

  Zekr.fromJson(Map<dynamic, dynamic> data)
      : category = CategoryModel(name: data['category']),
        zekr = data['zekr'],
        reference = data['reference'],
        description = data['description'],
        count = data['count'].toString().isEmpty ? 1 : int.parse(data['count']);
}
