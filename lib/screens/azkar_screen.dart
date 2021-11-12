import 'package:azkar_app2/azkar_data.dart';
import 'package:azkar_app2/model/categiory_model.dart';
import 'package:azkar_app2/screens/zekr_screen.dart';
import 'package:azkar_app2/widget/app_drawer.dart';
import 'package:azkar_app2/widget/category_card.dart';
import 'package:flutter/material.dart';

class AzkarScreen extends StatefulWidget {
  @override
  State<AzkarScreen> createState() => _AzkarScreenState();
}

class _AzkarScreenState extends State<AzkarScreen> {
  final List<CategoryModel> _categories = [];

  List<CategoryModel> _searchCategories = [];

  // bool _isSearching = false;
  @override
  void initState() {
    super.initState();
    for (dynamic zekr in azkarData) {
      if (!_categories.map((e) => e.name).contains(zekr["category"])) {
        if (zekr["category"] != "أذكار الصباح" &&
            zekr["category"] != "أذكار المساء") {
          _categories.add(CategoryModel(name: zekr["category"]));
        }
      }
    }
    _searchCategories = _categories;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        title: Text(
          "أذكاري",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        // actions: [
        //   IconButton(
        //     onPressed: () {
        //       setState(() {
        //         _isSearching = !_isSearching;
        //       });
        //     },
        //     icon: Icon(_isSearching ? Icons.cancel : Icons.search),
        //   )
        // ],
      ),
      // Container(
      //   decoration: BoxDecoration(
      //     image: DecorationImage(
      //       image: AssetImage(
      //         "assets/images/azkar_bg.png",
      //       ),
      //       fit: BoxFit.fill,
      //     ),
      //   ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/images/azkar_bg.png",
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
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
                  print(_categories.length);
                },
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 10),
                  child: Column(
                    children: [
                      InkWell(
                        borderRadius: BorderRadius.circular(30),
                        onTap: () {
                          Navigator.of(context).pushNamed(ZekrScreen.routeName,
                              arguments: CategoryModel(name: "أذكار الصباح"));
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(35),
                          child: Image.asset("assets/images/azkar_sabah.png"),
                        ),
                      ),
                      SizedBox(height: 20),
                      InkWell(
                        borderRadius: BorderRadius.circular(30),
                        onTap: () {
                          Navigator.of(context).pushNamed(ZekrScreen.routeName,
                              arguments: CategoryModel(name: "أذكار المساء"));
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(35),
                          child: Image.asset("assets/images/azkar_masa.png"),
                        ),
                      ),
                      SizedBox(height: 20),
                      GridView.builder(
                        padding: EdgeInsets.all(0),
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: 1,
                        ),
                        itemCount: _searchCategories.length,
                        itemBuilder: (BuildContext context, int index) {
                          return CategoryCard(_searchCategories[index]);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      drawer: AppDrawer(),
    );
  }
}

//أ
