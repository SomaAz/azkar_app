import 'package:azkar_app2/azkar_data.dart';
import 'package:azkar_app2/constance.dart';
import 'package:azkar_app2/model/categiory_model.dart';
import 'package:azkar_app2/screens/deep_search_screen.dart';
import 'package:azkar_app2/widget/app_drawer.dart';
import 'package:azkar_app2/widget/category_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AzkarScreen extends StatefulWidget {
  @override
  State<AzkarScreen> createState() => _AzkarScreenState();
}

class _AzkarScreenState extends State<AzkarScreen> {
  final List<CategoryModel> _categories = [];

  List<CategoryModel> _searchCategories = [];

  @override
  void initState() {
    super.initState();
    for (dynamic zekr in azkarData) {
      if (!_categories.map((e) => e.name).contains(zekr["category"])) {
        _categories.add(CategoryModel(name: zekr["category"]));
      }
    }
    _searchCategories = _categories;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primarySwatch.shade50,
      appBar: AppBar(
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        title: Text(
          "أذكاري",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: Colors.white,
            child: TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: "بحث",
                border: InputBorder.none,
              ),
              onChanged: (val) {
                List<CategoryModel> searchedCategories = [];
                for (var category in _categories) {
                  if (category.name.contains(val)) {
                    searchedCategories.add(category);
                  }
                }
                setState(() {
                  _searchCategories = searchedCategories;
                });
              },
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 2 / 2.7,
              ),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              itemCount: _searchCategories.length,
              itemBuilder: (BuildContext context, int index) {
                return CategoryCard(_searchCategories[index]);
              },
            ),
          ),
        ],
      ),
      drawer: AppDrawer(),
    );
  }
}

//ع
