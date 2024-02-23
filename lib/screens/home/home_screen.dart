import 'package:flutter/material.dart';
import 'package:my_docs/providers/search_provider.dart';
import 'package:my_docs/screens/home/widgets/docs_list.dart';
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

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        splashColor: Colors.black12,
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Expanded(
              child: Container(
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
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Search docs by tag or name',
                            contentPadding: EdgeInsets.only(left: 20.0),
                            suffixIcon: Icon(
                              Icons.search,
                              color: Colors.black,
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
                        child: Container(
                            width: 100,
                            child: const Center(
                                child: Text(
                              "Search",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ))),
                      ),
                    )
                  ],
                ),
              ),
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
    );
  }
}
