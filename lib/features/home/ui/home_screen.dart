import 'package:flutter/material.dart';

import 'package:musickeando/features/app/ui/theme/app_theme.dart';
import 'package:musickeando/features/app/provider/providers.dart';
import 'package:musickeando/features/home/ui/search_delegate.dart';
import 'package:musickeando/features/home/ui/widgets/widgets.dart';
import 'package:musickeando/features/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context);
    final searchProvider = Provider.of<SearchProvider>(context);

    return Scaffold(
        body: Stack(
      children: [
        const Background(),
        const CustomAppBar(),
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: Form(
              key: searchProvider.search,
              child: Column(
                children: [
                  SizedBox(height: size.size.height * 0.35),
                  TextFormField(
                    textAlign: TextAlign.left,
                    textCapitalization: TextCapitalization.sentences,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.search,
                    validator: (value) => searchProvider.isValidSearch(value),
                    onSaved: (newValue) {
                      searchProvider.wordSearch = newValue!;
                    },
                    decoration: InputDecoration(
                        hintText: 'Busca por Artista o Album',
                        hintStyle: context.bodyMedium,
                        suffixIcon:
                            const Icon(Icons.search, color: Colors.grey)),
                  ),
                  const SizedBox(height: 60),
                  ElevatedButton(
                      onPressed: () =>
                          showSearch(context: context, delegate: DataSearch()),
                      child: Text('BUSCAR', style: context.bodySmall))
                ],
              )),
        ),
      ],
    ));
  }

  // search(SearchProvider searchProvider, context, size) async {
  //   final searchService = Provider.of<SearchService>(context, listen: false);
  //   if (!searchProvider.search.currentState!.validate()) return null;
  //   searchProvider.isLoading = true;
  //   searchProvider.search.currentState!.save();
  //   final res = await searchService.searchAll(searchProvider.wordSearch);
  //   return res;
  // }

  Container textFieldBackgroundTop() {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment(0.4, 1.0),
          colors: <Color>[
            Color(0xFFeb386f),
            Color(0xFFe4397f),
            Color(0xFFdd398d),
            Color(0xFFd63a9a),
            Color(0xFFcf3aa5),
            Color(0xFFc83aaf),
            Color(0xFFc03ab7),
            Color(0xFFb53ab9),
            Color(0xFFa23ab2),
            Color(0xFF9039ab),
            Color(0xFF7f39a4),
            Color(0xFF70389d)
          ],
          tileMode: TileMode.mirror,
        ),
      ),
    );
  }
}
