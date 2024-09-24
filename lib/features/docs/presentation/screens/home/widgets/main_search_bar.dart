import 'package:flutter/material.dart';
import 'package:my_docs/features/docs/presentation/screens/home/widgets/search_button.dart';

class MainSearchBar extends StatelessWidget {
  const MainSearchBar({
    super.key,
    required this.screenSize,
    required this.filterSearch,
    required this.searchInputFocusNode,
    required this.searchInputController,
  });

  final double screenSize;
  final Future<void> Function() filterSearch;
  final FocusNode searchInputFocusNode;
  final TextEditingController searchInputController;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return SizedBox(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            constraints: const BoxConstraints(maxWidth: 600),
            width: screenSize * 0.8,
            alignment: Alignment.center,
            child: TextField(
              onSubmitted: (value) {
                filterSearch();
                searchInputFocusNode.requestFocus();
              },
              onChanged: (value) {},
              focusNode: searchInputFocusNode,
              controller: searchInputController,
              style:
                  TextStyle(color: colors.primary, fontWeight: FontWeight.w700),
              decoration: InputDecoration(
                  focusColor: colors.primary,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: colors.primary.withOpacity(.7), width: 3)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: colors.primary, width: 3)),
                  labelStyle: TextStyle(
                    color: colors.primary.withOpacity(.7),
                    fontWeight: FontWeight.w900,
                  ),
                  labelText: 'Search docs by tag or name',
                  contentPadding: const EdgeInsets.only(left: 20.0),
                  suffixIcon: Icon(
                    Icons.search,
                    color: colors.primary,
                    size: 20.0,
                  )),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: BoxBorder.lerp(
                Border.all(color: Colors.black87),
                Border.all(color: Colors.black87),
                0.5,
              ),
            ),
            child: const SearchButton(),
          )
        ],
      ),
    );
  }
}
