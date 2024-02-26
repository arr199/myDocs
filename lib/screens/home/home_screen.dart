import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_docs/providers/search_provider.dart';
import 'package:my_docs/screens/home/widgets/docs_list.dart';
import 'package:my_docs/screens/home/widgets/main_search_bar.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenSize = MediaQuery.of(context).size.width;

    final searchInputController =
        context.watch<SearchProvider>().searchInputController;
    final searchInputFocusNode =
        context.watch<SearchProvider>().searchInputFocusNode;
    final data = context.watch<SearchProvider>().data;
    final filterSearch = context.read<SearchProvider>().filterData;

    final colors = Theme.of(context).colorScheme;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: colors.primary  ,
          title: const Center(
              child: Text(
            'Arr Documentation',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          )),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Expanded(
                child: MainSearchBar(
                    screenSize: screenSize,
                    filterSearch: filterSearch,
                    searchInputFocusNode: searchInputFocusNode,
                    searchInputController: searchInputController),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            if (data.isEmpty)
              const Center(
                child: Text(
                  "No docs found",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            if (data.isNotEmpty) DocsList(data: data),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: colors.background,
          splashColor: Colors.black12,
          onPressed: () {
            context.goNamed('createDocument');
          },
          child: const Icon(Icons.add),
        ));
  }
}
