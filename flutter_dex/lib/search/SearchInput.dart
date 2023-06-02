import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../utils/dexfonts.dart';
import '../utils/search.dart';
import '../detail/pkmView.dart';

final DataSearch dataSearch = DataSearch();

class SearchInput extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Image.asset('assets/images/dexlogo.png'),
            SizedBox(
              height: 20,
            ),
            Theme(
              data: ThemeData(
                primaryColor: AppColors.text,
                hintColor: AppColors.text,
                inputDecorationTheme: InputDecorationTheme(
                  filled: true,
                  fillColor: AppColors.second,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.text),
                  ),
                ),
              ),
              child: Form(
                key: _formKey,
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _textEditingController,
                        style: DexFont(fontSize: 16.0).normal(),
                        decoration: InputDecoration(
                          labelText: 'Search your Pokemon by name',
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: ElevatedButton(
                        onPressed: () async {
                          String searchQuery = _textEditingController.text;
                          await dataSearch.loadPokemon(searchQuery);
                          final dynamic jsonObject =
                              dataSearch.tableStateNotifier.value;
                          if (jsonObject[0] != []) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DexDetailPage(
                                  jsonObject: jsonObject[0],
                                ),
                              ),
                            );
                          } else {
                            final snackBar = SnackBar(
                              content: Text('${searchQuery} Not Found'),
                              behavior: SnackBarBehavior.floating,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        },
                        child: Icon(Icons.search),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(15),
                          minimumSize: Size(60, 60),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
