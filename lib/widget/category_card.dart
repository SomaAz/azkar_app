import 'package:azkar_app2/constance.dart';
import 'package:azkar_app2/model/categiory_model.dart';
import 'package:azkar_app2/screens/zekr_screen.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModel category;

  const CategoryCard(this.category);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(25),
      onTap: () {
        Navigator.of(context)
            .pushNamed(ZekrScreen.routeName, arguments: category);
      },
      child: Container(
        decoration: BoxDecoration(
          color: primarySwatch.withOpacity(.07),
          borderRadius: BorderRadius.circular(35),
        ),
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Container(
            decoration: BoxDecoration(
              color: primarySwatch,
              borderRadius: BorderRadius.circular(35),
            ),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0xFFE6E5E4).withOpacity(0.5),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Container(
                  padding: EdgeInsets.all(4),
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      category.name,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white.withOpacity(.85),
                        height: 1.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
