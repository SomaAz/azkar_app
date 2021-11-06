import 'package:azkar_app2/azkar_data.dart';
import 'package:azkar_app2/constance.dart';
import 'package:azkar_app2/model/categiory_model.dart';
import 'package:azkar_app2/model/zekr_model.dart';
import 'package:azkar_app2/widget/centered_text.dart';
import 'package:azkar_app2/widget/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share/share.dart';
import '../helper/arabic_number_converter.dart';

class ZekrScreen extends StatefulWidget {
  static String routeName = "/zekr";
  static const String _marra = "مرة", _marrat = "مرات";

  @override
  State<ZekrScreen> createState() => _ZekrScreenState();
}

class _ZekrScreenState extends State<ZekrScreen> {
  Zekr _currentZekr = Zekr(
    category: CategoryModel(name: ""),
    zekr: "",
    reference: "",
    description: "",
    count: 0,
  );
  late final CategoryModel _category;
  final List<Zekr> _azkar = [];
  int _fontSize = 19;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies");
    _category = ModalRoute.of(context)!.settings.arguments as CategoryModel;
    for (dynamic zekr in azkarData) {
      if (zekr['category'] == _category.name) {
        _azkar.add(Zekr.fromJson(zekr));
      }
    }
    _currentZekr = _azkar[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        title: Text(
          _category.name,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          PopupMenuButton(
            itemBuilder: (ctx) => [
              PopupMenuItem(
                onTap: () {
                  if (_fontSize < 25) setState(() => _fontSize++);
                },
                child: ListTile(
                  leading: Icon(Icons.add),
                  title: Text("زيادة حجم الخط"),
                ),
              ),
              PopupMenuItem(
                onTap: () {
                  if (_fontSize > 14) setState(() => _fontSize--);
                },
                child: ListTile(
                  leading: Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Icon(Icons.minimize),
                  ),
                  title: Text("تقليص حجم الخط"),
                ),
              ),
              PopupMenuItem(
                onTap: () {
                  Share.share(
                      "${_currentZekr.zekr}\n\n${_currentZekr.description}\n${_currentZekr.reference}");
                },
                child: ListTile(
                  leading: Icon(Icons.share),
                  title: Text("مشاركة"),
                ),
              ),
              PopupMenuItem(
                onTap: () {
                  Clipboard.setData(
                          ClipboardData(text: _currentZekr.zekr.trim()))
                      .then(
                    (value) => ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("تم النسخ بنجاح"),
                        duration: Duration(seconds: 1),
                      ),
                    ),
                  );
                },
                child: ListTile(
                  leading: Icon(Icons.copy),
                  title: Text("نسخ"),
                ),
              ),
            ],
          ),
        ],
        elevation: 0,
      ),
      body: PageView.builder(
        onPageChanged: (index) => setState(() => _currentZekr = _azkar[index]),
        itemCount: _azkar.length,
        itemBuilder: (ctx, index) => LayoutBuilder(
          builder: (_, constraints) {
            return SingleChildScrollView(
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 2),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Card(
                      elevation: 0,
                      color: primarySwatch.shade50,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 16,
                        ),
                        child: Column(
                          children: [
                            CenteredText(
                              _azkar[index].zekr,
                              fontSize: _fontSize.toDouble(),
                              fontWeight: FontWeight.bold,
                              height: 1.8,
                              fontFamily: "noto",
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (_azkar[index].count >= 2)
                      CustomCard(
                        text:
                            "${_azkar[index].count.convertToArabicNumber()} ${_azkar[index].count < 3 ? _azkar[index].count == 1 ? ZekrScreen._marra : "مرتين" : _azkar[index].count < 11 ? ZekrScreen._marrat : ZekrScreen._marra}",
                        height: 30,
                        // width: 60,
                        fontWeight: FontWeight.normal,
                        color: primarySwatch.shade100,
                        textColor: Colors.black,
                        fontSize: 20,

                        // color: Color(0xffFFF0BE),
                      ),
                    if (_azkar[index].reference.isNotEmpty)
                      CustomCard(
                        text: _azkar[index].reference,
                        height: 30,
                        width: double.infinity,
                        color: primarySwatch.shade100,
                        fontWeight: FontWeight.normal,
                      ),
                    if (_azkar[index].description.isNotEmpty)
                      CustomCard(
                        text: _azkar[index].description,
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: primarySwatch.shade100,
                        textHeight: 1.4,
                      ),
                    SizedBox(height: 20),
                    CenteredText(
                      "صفحة ${(index + 1).convertToArabicNumber()} من ${_azkar.length.convertToArabicNumber()}",
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
