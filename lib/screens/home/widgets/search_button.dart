import 'package:flutter/material.dart';
import 'package:my_docs/providers/search_provider.dart';
import 'package:provider/provider.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final filterSearch = context.read<SearchProvider>().filterSearch;
    final colors = Theme.of(context).colorScheme;

    return ElevatedButton(
      onPressed: () {
        filterSearch();
      },
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        side: BorderSide(color: colors.primary, width: 3),
        backgroundColor: Colors.transparent,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 22),
      ),
      child: Text(
        "Search",
        style: TextStyle(
          fontWeight: FontWeight.w800,
          color: colors.primary,
        ),
      ),
    );
  }
}
