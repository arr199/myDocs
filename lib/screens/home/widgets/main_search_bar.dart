import 'package:flutter/material.dart';

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
              style: TextStyle(color: colors.primary),
              decoration: InputDecoration(
                  focusColor: colors.primary,
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: colors.primary.withOpacity(.7))),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: colors.primary)),
                  labelStyle: TextStyle(
                    color: colors.primary.withOpacity(.7),
                    fontWeight: FontWeight.w900,
                  ),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: colors.primary)),
                  labelText: 'Search docs by tag or name',
                  contentPadding: EdgeInsets.only(left: 20.0),
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
            child: InkWell(
              onTap: () {
                filterSearch();
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                child: Text(
                  "Search",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
