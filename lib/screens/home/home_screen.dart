import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_docs/providers/search_provider.dart';
import 'package:my_docs/screens/home/widgets/docs_list.dart';
import 'package:my_docs/screens/home/widgets/main_search_bar.dart';
import 'package:my_docs/shared/widgets/app_bar.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenSize = MediaQuery.of(context).size.width;

    final searchInputController =
        context.watch<SearchProvider>().searchInputController;
    final searchInputFocusNode =
        context.watch<SearchProvider>().searchInputFocusNode;
    final data = context.watch<SearchProvider>().data;
    final filterSearch = context.read<SearchProvider>().filterSearch;
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
        appBar: const MainAppBar(home: true),
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
            // HERO WIDGET

            if (data.isEmpty) ...[
              const SizedBox(
                height: 50,
              ),
              Center(
                child: Text(
                  "Oops, no documents found !",
                  style: TextStyle(
                    fontSize: 30,
                    color: colors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ] else ...[
              DocsList(data: data),
            ]
          ],
        ),
        floatingActionButton: Tooltip(
          message: 'Create a new document',
          verticalOffset: 30,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: colors.primary, width: 1),
          ),
          textStyle: TextStyle(
            color: colors.primary,
            fontWeight: FontWeight.bold,
          ),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 18),
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: colors.primary,
                    width: 3,
                  ),
                  borderRadius: BorderRadius.circular(4)),
            ),
            onPressed: () {
              context.goNamed('createDocument');
            },
            child: Icon(
              size: 30,
              Icons.add,
              color: colors.primary,
            ),
          ),
        ));
  }
}
